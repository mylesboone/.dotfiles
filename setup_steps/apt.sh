add_apt_source() {
  if [ -f $1 ]; then
    echo "skipping $1: already exists"
  else
    echo $2 | sudo tee -a $1
  fi
}

sudo apt-get update
sudo apt-get install -y apt-transport-https curl

curl -sSL https://dist.crystal-lang.org/apt/setup.sh | sudo bash

add_apt_source "/etc/apt/sources.list.d/enpass.list" "deb http://repo.sinew.in/ stable main"
curl -fsSL https://dl.sinew.in/keys/enpass-linux.key | sudo apt-key add -
add_apt_source "/etc/apt/sources.list.d/docker.list" "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
curl -sSL https://dist.crystal-lang.org/apt/setup.sh | sudo bash
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo apt-get update

sudo apt-get install -y \
  automake \
  autotools-dev \
  awscli \
  build-essential \
  ca-certificates \
  cmake \
  containerd.io \
  enpass \
  exuberant-ctags \
  fzf \
  git-flow \
  gnupg2 \
  gnupg-agent \
  htop \
  libappindicator1 \
  libevent-dev \
  libcurl4-gnutls-dev \
  libimlib2-dev \
  libncurses5-dev \
  libpq-dev \
  libssl-dev \
  libtool-bin \
  libxt-dev \
  make \
  neovim \
  npm \
  pgcli \
  python3-dev \
  python3-pip \
  safe-rm \
  software-properties-common \
  sshfs \
  tig \
  tmux \
  tree \
  urlview \
  xclip \
  zsh
