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
gem 'github-pages', group: :jekyll_plugins
EOF
fi
bundle install
jekyll serve -H 0.0.0.0 -P 4000