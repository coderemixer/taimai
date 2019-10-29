#!/bin/bash

bundle exec rake db:migrate
rerun --dir app 'bundle exec rake run:prod'
