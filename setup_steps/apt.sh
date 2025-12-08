add_apt_source() {
  if [ -f $1 ]; then
    echo "skipping $1: already exists"
  else
    echo $2 | sudo tee -a $1
  fi
}

sudo apt-get update
sudo apt-get install -y apt-transport-https curl
sudo apt-get install -y ca-certificates curl gnupg

sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update

sudo aptitude install -y \
  automake \
  autotools-dev \
  build-essential \
  cmake \
  containerd.io \
  docker-buildx-plugin \
  docker-ce \
  docker-ce-cli \
  docker-compose-plugin \
  fd-find \
  ripgrep \
  git-flow \
  gnupg2 \
  gnupg-agent \
  htop \
  libevent-dev \
  libcurl4-gnutls-dev \
  libncurses5-dev \
  libpq-dev \
  libssl-dev \
  libtool-bin \
  libxt-dev \
  make \
  npm \
  pgcli \
  python3-dev \
  python3-pip \
  safe-rm \
  software-properties-common \
  sshfs \
  tig \
  tmate \
  tmux \
  tree \
  urlview \
  xclip \
  zsh
