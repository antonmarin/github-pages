# github-pages images

[![dockeri.co](http://dockeri.co/image/antonmarin/github-pages)](https://hub.docker.com/r/antonmarin/github-pages/)

[![GitHub issues](https://img.shields.io/github/issues/antonmarin/github-pages.svg "GitHub issues")](https://github.com/nodejs/docker-node)
[![GitHub stars](https://img.shields.io/github/stars/antonmarin/github-pages.svg "GitHub stars")](https://github.com/nodejs/docker-node)

Simple images to run github-pages locally

To use just run `docker run --rm -v $PWD:/app -p 4000:4000 antonmarin/github-pages`

More info about starting github-pages locally you can find [here](https://help.github.com/articles/setting-up-your-github-pages-site-locally-with-jekyll/)

## Image variants

### `latest`

![MicroBadger Size (tag)](https://img.shields.io/microbadger/image-size/antonmarin/github-pages/latest.svg)

Image based on debian, builds on master

### `latest-alpine`

![MicroBadger Size (tag)](https://img.shields.io/microbadger/image-size/antonmarin/github-pages/latest-alpine.svg)

Image based on alpine, builds on master

### `<version>`

Image based on debian, builds on release

### `<version>-alpine`

Image based on alpine, builds on release
 
