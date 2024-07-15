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
  browser-tools: circleci/browser-tools@1.4.8
  node-tools: circleci/node@5.2.0

jobs:
  test:
    parallelism: 2
    resource_class: medium
    docker:
      - image: cimg/ruby:3.3.1-node
      - image: postgres:16.1
        environment:
          POSTGRES_USER: ubuntu
          POSTGRES_DB: circleci_test
          POSTGRES_PASSWORD: ""
          POSTGRES_HOST_AUTH_METHOD: trust
      # Use circleci/browser-tools instead
      #- image: browserless/chrome:1.59-chrome-stable
      #  environment:
      #    PORT: 3000
      #    CONNECTION_TIMEOUT: 600000
    environment:
      BUNDLE_JOBS: '3'
      BUNDLE_RETRY: '3'
      DATABASE_URL: "postgres://ubuntu@localhost:5432/circleci_test"
      RAILS_ENV: test
      CI: true
      # Override chrome browser path for system test and Puppeteer
      BROWSER_PATH: /usr/bin/google-chrome-stable
      PUPPETEER_SKIP_DOWNLOAD: true
    steps:
      - checkout
      - browser-tools/install-chrome
      # ARM issue: https://github.com/CircleCI-Public/browser-tools-orb/pull/73
      #- run:
      #    command: |
      #      export SUDO="sudo"
      #      wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | $SUDO apt-key add -
      #      echo "Installing Chrome for ARM64"
      #      $SUDO sh -c 'echo "deb [arch=arm64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
      #      $SUDO apt-get update
      #      DEBIAN_FRONTEND=noninteractive $SUDO apt-get install -y google-chrome-stable
      #      echo "test/verify installation"
      #      google-chrome-stable --version | grep "stable" >/dev/null 2>&1;
      #    name: Install chrome
      - ruby/install-deps
      - node-tools/install-packages:
          pkg-manager: yarn
      - run:
          command: dockerize -wait tcp://localhost:5432 -timeout 1m
          name: Wait for DB
      # Skip since chrome is ready from browser-tools/install-chrome
      #- run:
      #    command: dockerize -wait http://localhost:3000 -timeout 1m
      #    name: Wait for Chrome
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

