# Prototyping with Rails

This repo is intended as a basic proof-of-concept of how to leverage [Ruby on Rails](https://rubyonrails.org/) for quick prototyping.

## Getting started with Rails

Rails is a full-stack framework and using it feels quite different from development in the Node.js world. Providing a _Getting started_ here would be out of scope, so please refer to the [official Getting started guide](https://guides.rubyonrails.org/getting_started.html) or the overview of [all Rails guides](https://guides.rubyonrails.org/index.html).

## What does this repo cover?

The intention of this repo is to compare how workflows commonly used in our Node.js development can be translated into the Rails world. The topics that will be covered are the following:

- **Development tooling**: How to setup VSCode for a good development environment.
- **Testing**: Rails has solid testing pre-configured.
- **Renovate bot**: For keeping dependencies up to date.
- **CI**: Rails can be run in GitHub Actions easily.
- **Styling**: TailwindCSS can be configured with just one command.
- **Deployment**: How to create a Docker image and deploy it.

Apart from the more meta-view on development, this repo covers a common use case:

> A map-based app provides information about localities. New localities can be created, existing ones updated or deleted and the list of localities is presented as a map view.

## What is not covered?

Many things. Rails is complex and this guide is merely a basic proof-of-concept. Some things that are not covered are:

- authentication / authorization (see e.g. [Devise](https://github.com/heartcombo/devise) and [CanCanCan](https://github.com/CanCanCommunity/cancancan))
- ...

## Development tooling

### Linting with Rubocop

Rubocop is a linter for Ruby files and is configured with this project. See the `./.rubocop.yml` for the current configuration.

Rubocop can be executed with

```bash
bundle exec rubocop --parallel
```

and auto-corrects issues with

```bash
bundle exec rubocop --parallel -A
```

> <mark>TODO:</mark> How to format on save?

### Gem security

Running `bundle exec bundle audit --update` will make use of `bundler-audit` and `ruby_audit` and will scan gems and configuration for security issues.

### App security

Running `bundle exec brakeman -q -w2` will perform a security audit of the application using `brakeman`.
