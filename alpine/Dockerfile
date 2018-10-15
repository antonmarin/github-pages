FROM ruby:2.5.1-alpine
ARG GEM_VERSION=190
WORKDIR /tmp/github-pages

WORKDIR /app
EXPOSE 4000
CMD ["jekyll", "serve", "-H", "0.0.0.0", "-P", "4000"]