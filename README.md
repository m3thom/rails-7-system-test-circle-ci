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