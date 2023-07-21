# A POC of system test on Circle-CI of ruby version 2.7.5

# Local development

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
# .circleci/config.yml
version: 2.1

# Orbs are reusable packages of CircleCI configuration that you may share across projects, enabling you to create encapsulated, parameterized commands, jobs, and executors that can be used across multiple projects.
# See: https://circleci.com/docs/orb-intro/
orbs:
  ruby: circleci/ruby@2.0.1
  browser-tools: circleci/browser-tools@1.4.3

jobs:
  test:
    docker:
      - image: cimg/ruby:2.7.5-browsers
      - image: cimg/postgres:14.8
        environment:
          POSTGRES_USER: ubuntu
          POSTGRES_DB: circleci_test
          POSTGRES_PASSWORD: ""
    executor: ruby/default
    environment:
      BUNDLE_JOBS: '3'
      BUNDLE_RETRY: '3'
      DATABASE_URL: "postgres://ubuntu@localhost:5432/circleci_test"
      RAILS_ENV: test
      CI: true
    steps:
      - checkout
      - browser-tools/install-chrome
      - ruby/install-deps
      - run:
          command: dockerize -wait tcp://localhost:5432 -timeout 1m
          name: Wait for DB
      - run:
          command: bundle exec rails db:schema:load --trace
          name: Database setup
      - run:
          command: bundle exec rake test:all
          name: Run all tests

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