docker_or_local() {
  if [[ -f docker-compose.yml ]]; then
    eval "docker-compose run --rm --no-deps -e SKIP_SIMPLECOV=true web $@"
  else
    eval "SKIP_SIMPLECOV=true $@"
  fi
}

rl() {
  docker_or_local "bundle exec rails routes" | ag $1
}

be() {
  docker_or_local "bundle exec $@"
}
bu() {
  docker_or_local "bundle update $@"
}
bi() {
  docker_or_local "bundle install $@"
}

clean_devdb() {
  docker_or_local "bundle exec rake db:drop db:setup"
}
clean_testdb() {
  docker_or_local "bundle exec rake db:drop db:setup"
}
pclean_testdb() {
  docker_or_local "bundle exec rake parallel:drop[8] parallel:setup[8]"
}

ber() {
  docker_or_local "bundle exec rails $@"
}
bes() {
  docker_or_local "bundle exec rspec $@"
}
bep() {
  docker_or_local "bundle exec rake parallel:spec[8]"
}

mi() {
  docker_or_local "bundle exec rake db:migrate"
}
mit() {
  docker_or_local "bundle exec rake db:migrate"
}
pmit() {
  docker_or_local "bundle exec rake parallel:migrate[8]"
}
