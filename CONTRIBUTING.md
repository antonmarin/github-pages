# Contributing guide

## Code

/alpine - alpine based images

/debian - debian based images

We use [go-task/task](https://github.com/go-task/task) as task runner, so visit [docs](https://taskfile.org)

## Build

[Autobuild](https://docs.docker.com/docker-hub/builds/) is set up.

## Test

`task test GEM_VERSION=123`

## Release

Use `task release GEM_VERSION=123`. 
It tests building, and replaces GEM_VERSION in Dockerfiles

Every push in master releases `latest*` images.
Every `[0-9]+` tag releases `[tag]*` images.

## Deploy

[Docker Hub](https://hub.docker.com/r/antonmarin/github-pages/)
