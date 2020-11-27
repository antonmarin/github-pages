FROM ruby:2.6.6-stretch
ARG GEM_VERSION=204
ENV GEM_VERSION=${GEM_VERSION}
ENV LC_ALL="en_US.UTF-8"
LABEL org.label-schema.vcs-url="https://github.com/antonmarin/github-pages"
RUN apt-get update && apt-get install -y \
      locales=2.24-11+deb9u4 \
      && rm -rf /var/lib/apt/lists/* \
      && echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
      && locale-gen en_US.UTF-8
WORKDIR /tmp/github-pages
RUN bundler init && bundler add github-pages --group "jekyll_plugins" --version "${GEM_VERSION}"
COPY entrypoint.sh /usr/local/bin/entrypoint
ENTRYPOINT ["entrypoint"]
CMD ["serve", "-H", "0.0.0.0", "-P", "4000"]

WORKDIR /app
EXPOSE 4000
