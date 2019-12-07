#!/usr/bin/env sh
if [ ! -f .gitignore ]; then
    cat << EOF > .gitignore
.sass-cache/
_site/
Gemfile
Gemfile.lock
EOF
fi
if [ ! -f Gemfile ]; then
    cat << EOF > Gemfile
source 'https://rubygems.org'
group :jekyll_plugins do
    gem 'github-pages', "= ${GEM_VERSION}"
    gem 'jekyll-paginate'
    gem 'jekyll-sitemap'
    gem 'jekyll-gist'
    gem 'jekyll-feed'
    gem 'jemoji'
    gem 'jekyll-include-cache'
end
EOF
fi
bundle install
jekyll "$@"