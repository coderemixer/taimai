#!/bin/bash

bundle exec rake db:migrate
rerun 'bundle exec rake run:prod'
