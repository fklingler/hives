# Hives

This is a small demo project in Ruby on Rails and Vue.js, where users can register hives and display the list of all hives registered.

## Ruby on Rails API

The Ruby on Rails application has been configured in API mode, and provides a simple CRUD API for the "hives" resource.

In production it also serves the Vue.js frontend statically, that is built in the `/public` folder.

## Vue.js Frontend

Setup using Vite in the `app/frontend` folder, the Vue.js application handles the frontend and makes calls to the API using the native Fetch API.

A simple event emitter using [mitt](https://github.com/developit/mitt) has been setup to allow simple communication between components.

## Execution

In order to run the project in development, first install dependencies:

- `bundle install`
- `cd app/frontend && npm install`

Then, to execute the servers, you need to run:

- `bin/rails s` runs the API server
- `cd app/frontend && npm run dev` runs the frontend dev server

## Tests

Ruby on Rails tests can be run using `bin/rails test`

## Deployment

The Vue.js app is automatically built in the `/public` folder when executing the `assets:precompile` rake task.
This rake task is automatically executed when deploying to a service like Scalingo.

## Development

Commits follow the [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/) naming convention