# Chat MSN Clone

A simple chat application built with [Ruby on Rails](https://rubyonrails.org/).

## Prerequisites

- Ruby 3.2.2
- [Bundler](https://bundler.io/)
- [PostgreSQL](https://www.postgresql.org/) running locally

## Local setup

The project provides a setup script to configure your development environment.
Run it after cloning the repository:

```bash
bin/setup
```

The script installs required gems and runs `bin/rails db:prepare` to create and
migrate the database. It also clears logs and restarts the application.

## Database preparation

If you need to prepare the database manually, execute:

```bash
bin/rails db:prepare
```

This command creates the database (if needed) and applies any migrations.

## Running the server

Start the application with:

```bash
bin/rails server
```

Visit `http://localhost:3000` once the server is running.

## Running tests

Execute the test suite with:

```bash
bin/rails test
```

The tests use Minitest and run against the `test` database.
