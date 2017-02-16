#!/bin/sh

yes y | gem uninstall dpl
yes y | gem uninstall gems
gem install gems -v 0.8.3
gem install dpl -v 1.8.27
dpl --provider=rubygems --api-key=$RUBY_GEMS_API_KEY --gemspec=./whatmask.gemspec
