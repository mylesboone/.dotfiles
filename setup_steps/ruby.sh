install_ruby() {
  if [ -d ~/.rubies/ruby-$1 ]; then
    echo "skipping install ruby $1: already installed"
  else
    ruby-install ruby-$1
    source /usr/local/share/chruby/chruby.sh
    chruby $1
    gem install bundler
    gem install neovim
    gem install ruby-lsp
    gem install ruby-lsp-rails
  fi
  echo ""
}

install_chruby() {
  if ! [ -f /usr/local/share/chruby/chruby.sh ]; then
    cd ~/src
    wget -O chruby-0.3.9.tar.gz https://github.com/postmodern/chruby/archive/v0.3.9.tar.gz
    tar -xzvf chruby-0.3.9.tar.gz
    cd chruby-0.3.9/
    sudo make install
    cd -
  else
    echo "skipping install chruby: already installed"
  fi
}

install_ruby_install() {
  if ! [ "$(command -v ruby-install)" ]; then
    cd ~/src
    wget -O ruby-install-0.8.5.tar.gz https://github.com/postmodern/ruby-install/archive/v0.8.5.tar.gz
    tar -xzvf ruby-install-0.8.5.tar.gz
    cd ruby-install-0.8.5/
    sudo make install
    cd -
  else
    echo "skipping install ruby-install: already installed"
  fi
}

install_chruby
install_ruby_install
install_ruby "3.4.1"
