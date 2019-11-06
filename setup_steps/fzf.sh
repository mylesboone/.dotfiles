if [ -d ~/.fzf ]; then
  echo "skipping fzf: already installed"
else
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install --key-bindings --completion --no-update-rc
fi
echo ""

if [ -d ~/src/ripgrep ]; then
  echo "skipping install ripgrep: already installed"
else
  cd ~/src
  mkdir ripgrep
  cd ripgrep
  curl -LO https://github.com/BurntSushi/ripgrep/releases/download/11.0.2/ripgrep_11.0.2_amd64.deb
  sudo dpkg -i ripgrep_11.0.2_amd64.deb
fi
echo ""
