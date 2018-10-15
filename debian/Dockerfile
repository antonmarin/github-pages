FROM ruby:2.5.1
WORKDIR /tmp/github-pages
ARG GEM_VERSION=192
RUN bundler init && bundler add github-pages --group "jekyll_plugins" --version "${GEM_VERSION}"
WORKDIR /app
