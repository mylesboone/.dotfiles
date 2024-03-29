ya() { docker_or_local "yarn $@" }

be() { docker_or_local "bundle exec $@" }
bu() { docker_or_local "bundle update $@" }
bi() { docker_or_local "bundle install $@" }

clean_testdb() { docker_or_local "bundle exec rake db:reset RAILS_ENV=test" }
pclean_testdb() { docker_or_local "bundle exec rake parallel:drop[$RSPEC_CORES] parallel:setup[$RSPEC_CORES] RAILS_ENV=test" }

ber() { docker_or_local "bundle exec rails $@" }
bes() { docker_or_local "RAILS_ENV=test bundle exec rspec $@" }
bep() { docker_or_local "bundle exec rake parallel:spec[$RSPEC_CORES] RAILS_ENV=test" }

mi() { docker_or_local "bundle exec rake db:migrate RAILS_ENV=development" }
mit() { docker_or_local "bundle exec rake db:migrate RAILS_ENV=test" }
pmit() { docker_or_local "bundle exec rake parallel:migrate[$RSPEC_CORES]" }

dwork() { docker_or_local "bundle exec rake resque:work QUEUE=*" }
dschedule() { docker_or_local "bundle exec rake resque:scheduler" }

rl() { docker_or_local "bundle exec rails routes" | rg $1 }

edit_credentials() { docker_or_local "apt-get install -y neovim && EDITOR=nvim bundle exec rails credentials:edit --environment=$@" }
