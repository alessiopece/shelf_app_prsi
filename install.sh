#!bin/bash
bundle install
bundle exec rake db:migrate
bundle exec rake db:seed
rails server
