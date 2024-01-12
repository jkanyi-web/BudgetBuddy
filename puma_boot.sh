#!/bin/bash
# puma_boot.sh

# Delete server.pid if it exists
if [ -f /rails/tmp/pids/server.pid ]; then
  rm /rails/tmp/pids/server.pid
fi

# Prepare database and start Rails server
bundle exec rake db:prepare
bundle exec rails server -b 0.0.0.0 -p ${PORT:-3000}
