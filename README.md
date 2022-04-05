# Prototyping with Rails

This repo is intended as a basic proof-of-concept of how to leverage [Ruby on Rails](https://rubyonrails.org/) for quick prototyping.

## Getting started with Rails

Rails is a full-stack framework and using it feels quite different from development in the Node.js world. Providing a _Getting started_ here would be out of scope, so please refer to the [official Getting started guide](https://guides.rubyonrails.org/getting_started.html) or the overview of [all Rails guides](https://guides.rubyonrails.org/index.html).

## What does this repo cover?

The intention of this repo is to compare how workflows commonly used in our Node.js development can be translated into the Rails world. The topics that will be covered are the following:

- **Development tooling**: How to setup [VSCode](https://code.visualstudio.com/) for a good development environment.
- **Testing**: Rails has solid testing pre-configured.
- **Renovate bot**: For keeping dependencies up to date.
- **CI**: Rails can be run in GitHub Actions easily.
- **Styling**: TailwindCSS can be configured with just one command.
- **Deployment**: To Fly.io.

Apart from the more meta-view on development, this repo covers a common use case:

> A map-based app provides information about localities. New localities can be created, existing ones updated or deleted and the list of localities is presented as a map view.

## What is not covered?

Many things. Rails is complex and this guide is merely a basic proof-of-concept. Some things that are not covered are:

- deployment

## Development tooling

### Extensions

Add the extensions listed in `.vscode/extensions.json` for a better development experience.

### Syntax highliting

Add the following associations to your `settings.json`:

```json
"files.associations": {
    "*.erb": "erb",
    "*.html.erb": "erb"
  },
```

This will give you a nice syntax highliting, however you won't be able to auto-format these files as HTML anymore (see next section).

### Code formatting

> This section assumes that you use the [VSCode editor](https://code.visualstudio.com/).

#### Ruby files

Ruby files (`.rb`) can be nicely auto-formatted with Prettier and its plugin for Ruby (defined in `package.json`).

You will need to add the following to your `settings.json`:

```json
"[ruby]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode",
    "editor.formatOnSave": true
  },
```

### ERB files

Embedded Ruby files (`.erb` or `.html.erb`) are, as of writing, notoriously hard to auto-format. There exist some VSCode extensions and plugins for Prettier, however none have achieved satisfying results for me so far.

### Linting with Rubocop

Rubocop is a linter for Ruby files and is configured with this project. See the `./.rubocop.yml` for the current configuration.

Rubocop can be executed with

```bash
bundle exec rubocop --parallel
```

and auto-corrects issues with

```bash
bundle exec rubocop -A
```

### Gem security

Running `bundle exec bundle audit --update` will make use of `bundler-audit` and `ruby_audit` and will scan gems and configuration for security issues.

### App security

Running `bundle exec brakeman -q -w2` will perform a security audit of the application using `brakeman`.

### TailwindCSS

Tailwind can be configured for Rails by simply passing `--css tailwind` to the app generator, e.g.

```bash
rails generate my-app --css tailwind
```

When using VSCode you might need to tweak your settings, so that Tailwind Intellisense picks up the often used `class: 'your classes'` or `class: "your classes"`. As of writing you can add the following to your `settings.json`:

```json
"tailwindCSS.experimental.classRegex": [
    "class:\\s*\"|'([^\"]*)\"|'"
  ]
```

The regex will pick up both of the aforementioned ways of adding classes. Adjust the regex or add new patterns to the array if needed.


## CI with GitHub Actions

Rails can be run in GitHub Actions. This repo contains a `.github/workflows/rails.yml` file which sets up a PostgreSQL database, runs the tests, and lints changes using `rubocop` and `bundler-audit`.

## Deployment

Rails can be deployed to several cloud platforms such as [Heroku](https://devcenter.heroku.com/articles/getting-started-with-rails7) and [Render](https://render.com/docs/deploy-rails) or [to your own server](https://gorails.com/deploy/ubuntu/20.04).

In this example, the app is deployed to Fly.io which (as of writing) has a free tier for apps and PostgreSQL databases. Follow [the deployment guide here](https://fly.io/docs/getting-started/rails/). The most important pieces are the `fly.toml` and the `Dockerfile`. Both have been created with the `flyctl launch` command.
