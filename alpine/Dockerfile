FROM ruby:2.5.1-alpine
ARG GEM_VERSION=192
LABEL org.label-schema.vcs-url="https://github.com/antonmarin/github-pages"
WORKDIR /tmp/github-pages
RUN apk add --no-cache --virtual .build_deps \
        build-base \
        make=4.2.1-r0 && \
    apk add --no-cache \
        git=2.15.2-r0 && \
    bundler init && \
    bundler add github-pages --group "jekyll_plugins" --version "${GEM_VERSION}" && \
    apk del .build_deps
COPY entrypoint.sh /usr/local/bin/entrypoint
CMD ["entrypoint"]

WORKDIR /app
EXPOSE 4000
