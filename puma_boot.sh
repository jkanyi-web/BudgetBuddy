#!/bin/bash
# puma_boot.sh

# Delete server.pid if it exists
if [ -f /rails/tmp/pids/server.pid ]; then
  rm /rails/tmp/pids/server.pid
fi

# Prepare database and start Rails server
# Comment out the db:prepare line
# bundle exec rake db:prepare

# Start Puma, not the default Rails server
bundle exec puma -C config/puma.rb
