#!/bin/bash

[[ -f "Gemfile" ]] && bundle install --path=vendor/bundle
[[ -f "yarn.lock" ]] && yarn install

sudo service postgresql start
sudo service redis-server start

# Create PostgreSQL users and databases
sudo su postgres -c "createuser --superuser vscode"

# Setup the rails DB if in a Rails app.
[[ -x "bin/rails" ]] && bin/rails db:setup
[[ -x "bin/rails" ]] && bin/rails stats

exit 0