export VISUAL=nvim
export EDITOR=$VISUAL

typeset -U path
path=(~/.dotfiles/bin ~/go/bin /usr/local/go/bin $path)

source /usr/local/share/chruby/chruby.sh
chruby ruby-3.4.1
source ~/.zsh/functions/chruby_auto.sh
