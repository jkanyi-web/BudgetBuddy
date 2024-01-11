#!/bin/bash

bundle install

# Replace with your custom build commands for production assets
rake assets:precompile

# Generate the Rails environment specific config files
rails db:environment:create
