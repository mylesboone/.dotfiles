edit_credentials() { docker_or_local "apt-get install -y neovim && EDITOR=nvim bundle exec rails credentials:edit --environment=$@" }


bundle() { docker_or_local "bundle $@" }
go() { docker_or_local "go $@" }
vue() { docker_or_local "vue $@" }
yarn() { docker_or_local "yarn $@" }

z() {
  if [ ! -f docker-compose.yml ]; then
    cd ~/dev/prizepicks/prizepicks-devenv
  fi

  lazydocker -f docker-compose.yml
}
