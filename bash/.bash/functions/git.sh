ap() {
  if [ "$TMUX" = "" ]; then
    git add -p $(git status -s | awk '{ print $2 }' | fzf -m --preview 'git diff --color=always {}')
  else
    git add -p $(git status -s | awk '{ print $2 }' | fzf-tmux -m --preview 'git diff --color=always {}')
  fi
}

cm() {
  if [[ $# > 0 ]]; then
    git commit -m $@
  else
    git commit -v
  fi
}

co() {
  if [[ $# > 0 ]]; then
    git co $@
  else
    if [ "$TMUX" = "" ]; then
      git co $(git status -s | awk '{ print $2 }' | fzf -m --preview 'git diff --color=always {}')
    else
      git co $(git status -s | awk '{ print $2 }' | fzf-tmux -m --preview 'git diff --color=always {}')
    fi
  fi
}

a() {
  if [ "$TMUX" = "" ]; then
    git add $(git status -s | awk '{ print $2 }' | fzf -m)
  else
    git add $(git status -s | awk '{ print $2 }' | fzf-tmux -m)
  fi
}

