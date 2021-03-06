# github-pages images

[![dockeri.co](http://dockeri.co/image/antonmarin/github-pages)](https://hub.docker.com/r/antonmarin/github-pages/)

[![GitHub issues](https://img.shields.io/github/issues/antonmarin/github-pages.svg "GitHub issues")](https://github.com/antonmarin/github-pages) [![GitHub stars](https://img.shields.io/github/stars/antonmarin/github-pages.svg "GitHub stars")](https://github.com/antonmarin/github-pages)

Simple images to run github-pages locally

To use just run `docker run --rm -v $PWD:/app -p 4000:4000 antonmarin/github-pages` 
or you can get `jekyll --help` by `docker run --rm -v $PWD:/app -p 4000:4000 antonmarin/github-pages --help`

Image creates some required files if you don't have them: 

`Gemfile` with
```
source 'https://rubygems.org'
gem 'github-pages', group: :jekyll_plugins
```

`.gitignore` with
```
.sass-cache/
_site/
Gemfile
Gemfile.lock
```

`Gemfile` required only locally, so you can add it to your `.gitignore` manually if you already have one

Delete `Gemfile.lock` when you upgrade image version to avoid conflicts

More info about github-pages you can find [here](https://help.github.com/categories/customizing-github-pages/)

## Image variants

### `latest`

[![MicroBadger Size (tag)](https://img.shields.io/microbadger/image-size/antonmarin/github-pages/latest.svg?style=flat)](https://hub.docker.com/r/antonmarin/github-pages/)

Image based on debian, builds on master

### `latest-alpine`

[![MicroBadger Size (tag)](https://img.shields.io/microbadger/image-size/antonmarin/github-pages/latest-alpine.svg?style=flat)](https://hub.docker.com/r/antonmarin/github-pages/)

Image based on alpine, builds on master

### `<version>`

[![](https://images.microbadger.com/badges/version/antonmarin/github-pages:203.svg)](https://microbadger.com/images/antonmarin/github-pages:203) [![MicroBadger Size (tag)](https://img.shields.io/microbadger/image-size/antonmarin/github-pages/203.svg?style=flat)](https://hub.docker.com/r/antonmarin/github-pages/)

Image based on debian, builds on release

### `<version>-alpine`

[![](https://images.microbadger.com/badges/version/antonmarin/github-pages:203-alpine.svg)](https://microbadger.com/images/antonmarin/github-pages:203-alpine) [![MicroBadger Size (tag)](https://img.shields.io/microbadger/image-size/antonmarin/github-pages/203-alpine.svg?style=flat)](https://hub.docker.com/r/antonmarin/github-pages/)

Image based on alpine, builds on release
 
