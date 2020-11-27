#!/usr/bin/env sh
set -eux

testTheme() {
  themeName=$1
  echo "Testing ${themeName} theme..."
  rm -rf tests/_site Gemfile*
  entrypoint build -s "tests/$themeName" -d "tests/_site"
}

testTheme "architect"
testTheme "cayman"
testTheme "minimal-mistakes"
