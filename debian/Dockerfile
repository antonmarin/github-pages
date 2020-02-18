FROM ruby:2.5.1
ARG GEM_VERSION=204
ENV GEM_VERSION=${GEM_VERSION}
LABEL org.label-schema.vcs-url="https://github.com/antonmarin/github-pages"
WORKDIR /tmp/github-pages
RUN bundler init && bundler add github-pages --group "jekyll_plugins" --version "${GEM_VERSION}"
COPY entrypoint.sh /usr/local/bin/entrypoint
ENTRYPOINT ["entrypoint"]
CMD ["serve", "-H", "0.0.0.0", "-P", "4000"]

WORKDIR /app
EXPOSE 4000
