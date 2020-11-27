FROM ruby:2.6.6-alpine3.11
ARG GEM_VERSION=204
ENV GEM_VERSION=${GEM_VERSION}
LABEL org.label-schema.vcs-url="https://github.com/antonmarin/github-pages"
WORKDIR /tmp/github-pages
RUN apk add --no-cache --virtual .build_deps \
        build-base=~0.5-r1 \
        g++=~9.3.0-r0 \
        libc-dev=~0.7.2-r0 \
        make=~4.2.1-r2 && \
    apk add --no-cache \
        git=~2.24.3-r0 && \
    bundler init && \
    bundler add github-pages --group "jekyll_plugins" --version "${GEM_VERSION}" && \
    apk del .build_deps
COPY entrypoint.sh /usr/local/bin/entrypoint
ENTRYPOINT ["entrypoint"]
CMD ["serve", "-H", "0.0.0.0", "-P", "4000"]

WORKDIR /app
EXPOSE 4000
