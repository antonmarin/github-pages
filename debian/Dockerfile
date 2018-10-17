FROM ruby:2.5.1
ARG GEM_VERSION=192
LABEL org.label-schema.vcs-url="https://github.com/antonmarin/github-pages"
WORKDIR /tmp/github-pages
RUN bundler init && bundler add github-pages --group "jekyll_plugins" --version "${GEM_VERSION}"
COPY entrypoint.sh /usr/local/bin/entrypoint
CMD ["entrypoint"]

WORKDIR /app
EXPOSE 4000
