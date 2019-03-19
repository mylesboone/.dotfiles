export DOTFILES=$HOME/.dotfiles

export VISUAL=nvim
export EDITOR=$VISUAL

export FILTHY_SHOW_EXIT_CODE=1

# enable colored output from ls, etc
export CLICOLOR=1

# fzf to use ag
export FZF_DEFAULT_COMMAND='ag -g "" --hidden --ignore .git'
export FZF_COMPLETION_TRIGGER=',,'

[[ -f ~/.zshenv.local ]] && source ~/.zshenv.local ]]
