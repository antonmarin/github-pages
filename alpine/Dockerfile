FROM ruby:2.5.1-alpine
ARG GEM_VERSION=192
WORKDIR /tmp/github-pages
RUN apk add --no-cache --virtual .build_deps \
    build-base \
    make=4.2.1-r0 && \
    bundler init && \
    bundler add github-pages --group "jekyll_plugins" --version "${GEM_VERSION}" && \
    apk del .build_deps

WORKDIR /app
EXPOSE 4000
CMD ["jekyll", "serve", "-H", "0.0.0.0", "-P", "4000"]
