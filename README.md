# A POC of system test on Circle-CI of ruby version 3.3.1

# Local development

## Prerequisite

- ruby 3.3.1
- bundle 2.5.11

## setup

```bash
rails db:create
rails db:migrate
```

# Testing

```bash
bundle rake test:all
```

Headless browser mode
```bash
CI=0 bundle rake test:all
```

# High light files

```yml
version: 2.1
# Orbs are reusable packages of CircleCI configuration that you may share across projects, enabling you to create encapsulated, parameterized commands, jobs, and executors that can be used across multiple projects.
# See: https://circleci.com/docs/orb-intro/
orbs:
  ruby: circleci/ruby@2.1.3
  # Can switch back to use this orb if this issue is solved? https://github.com/CircleCI-Public/browser-tools-orb/pull/73
  #browser-tools: circleci/browser-tools@1.4.8
  node-tools: circleci/node@5.2.0

jobs:
  test:
    parallelism: 2
    resource_class: arm.medium
    docker:
      - image: cimg/ruby:3.3.1-node
      - image: arm64v8/postgres
        environment:
          POSTGRES_USER: ubuntu
          POSTGRES_DB: circleci_test
          POSTGRES_PASSWORD: ""
          POSTGRES_HOST_AUTH_METHOD: trust
    environment:
      BUNDLE_JOBS: '3'
      BUNDLE_RETRY: '3'
      DATABASE_URL: "postgres://ubuntu@localhost:5432/circleci_test"
      RAILS_ENV: test
      CI: true
      # We will install chrome for ARM manually using playwright
      PUPPETEER_SKIP_DOWNLOAD: true
      # Tell grover to use this installed chrome path by playwright instead.
      # This is the same path from the "Install Chrome" step.
      BROWSER_PATH: /home/circleci/.cache/ms-playwright/chromium-1124/chrome-linux/chrome
    steps:
      - checkout
      - ruby/install-deps
      - node-tools/install-packages:
          pkg-manager: yarn
      - run:
          command: |
            yarn playwright install chromium --with-deps
            # Verify installation
            /home/circleci/.cache/ms-playwright/chromium-1124/chrome-linux/chrome --version
          name: Install Chrome
      - run:
          command: dockerize -wait tcp://localhost:5432 -timeout 1m
          name: Wait for DB
      - run:
          command: bundle exec rails db:test:prepare --trace
          name: Database setup
      - run:
          command: |
            circleci tests glob "test/**/*_test.rb" | circleci tests run --command="xargs bundle exec rake test:all" --verbose --split-by=timings
          name: Run all tests
      - store_test_results:
          path: test/reports
      - store_artifacts:
          path: test/reports/screenshots
          destination: screenshots

# Orchestrate jobs using workflows
# See: https://circleci.com/docs/configuration-reference/#workflows
workflows:
  build_and_test:
    jobs:
      - test
```

```ruby
# test/application_system_test_case.rb
require 'test_helper'

ENV["CAPYBARA_ARTIFACTS"] = Rails.root.join("test/reports").to_s

# 'capybara' and 'capybara/cuprite' need to be defined for EvilSystems to work properly.
require 'capybara'
require 'capybara/cuprite'

require 'evil_systems'

EvilSystems.initial_setup task: "assets:precompile",
                          silent: true,
                          driver_options: {
                              window_size: [1400, 1400],
                              timeout: 250,
                          }

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :evil_cuprite

  include EvilSystems::Helpers
end
```
