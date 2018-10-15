FROM ruby:2.5.1
ARG GEM_VERSION=190
WORKDIR /tmp/github-pages
RUN bundler init && bundler add github-pages --group "jekyll_plugins" --version "${GEM_VERSION}"
WORKDIR /app
