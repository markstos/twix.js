#!/bin/bash

cd source/twix.js
git pull
cd ../..

bundle exec middleman build
cd build
git add .
git commit -am "build"
git push -f origin gh-pages
