# Contributing guide

## Code

/alpine - alpine based images

/debian - debian based images

We use [go-task/task](https://github.com/go-task/task) as task runner, so visit [docs](https://taskfile.org)

## Build

`task`

## Test

`task`

## Release

Use `task release GEM_VERSION=123`. 

## Deploy

[Docker Hub](https://hub.docker.com/r/antonmarin/github-pages/)

[Autobuild](https://docs.docker.com/docker-hub/builds/) is set up.

Every push in master = `latest*` images.
Every `[0-9]+` tag = `[tag]*` images.
