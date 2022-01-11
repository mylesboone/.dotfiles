unsetopt nomatch
setopt extendedglob
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt share_history
setopt inc_append_history
setopt extended_history

#use colors
source ~/.zsh/base16-gruvbox-dark-hard.sh
# makes color constants available
autoload -U colors
colors

#load custom functions
for function in ~/.zsh/functions/*; do
  source $function
done

autoload -z edit-command-line
zle -N edit-command-line
bindkey -v
bindkey jj vi-cmd-mode
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^R" history-incremental-search-backward
bindkey "^v" edit-command-line

fpath=(~/.zsh/filthy $fpath)

autoload -U promptinit && promptinit
autoload -Uz compinit && compinit

prompt filthy

# syntax highlighting
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[[ -f ~/.aliases ]] && source ~/.aliases
[[ -f ~/.zshrc.local ]] &&  source ~/.zshrc.local
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[ -f /usr/local/share/chruby/chruby.sh ] && source /usr/local/share/chruby/chruby.sh
[ -f /usr/local/share/chruby/chruby.sh ] && chruby ruby-2.7.3

opentmux

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
