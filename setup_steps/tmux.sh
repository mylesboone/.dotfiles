if [ -d ~/src/tmux-3.4 ]; then
  echo "skipping install tmux: already installed"
else
  cd ~/src
  wget https://github.com/tmux/tmux/releases/download/3.4/tmux-3.4.tar.gz
  tar xvzf tmux-3.4.tar.gz
  cd tmux-3.4
  ./configure && make && sudo make install
  cd ~
fi

if [ -d ~/.tmux/plugins/tmux-fingers ]; then
  echo "skipping tmux-fingers: already installed"
else
  git clone --recursive https://github.com/Morantron/tmux-fingers ~/.tmux/plugins/tmux-fingers
fi
echo ""
