install_node() {
  cd ~/src
  curl -sL https://deb.nodesource.com/setup_22.x | sudo -E bash -
  sudo apt-get install -y nodejs
}

install_node
