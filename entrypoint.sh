#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /app/tmp/pids/server.pid

if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi
rake db:migrate
rake db:seed

rails system_settings:load RAILS_ENV=development

exec "$@"