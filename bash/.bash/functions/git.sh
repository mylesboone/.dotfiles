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

set_base_branch() {
  if git rev-parse -q --verify develop; then
    BASE_BRANCH="develop"
  else
    BASE_BRANCH="master"
  fi
}

ir() {
  if [[ $# > 0 ]]; then
    git rebase -i $@
  else
    set_base_branch
    git rebase -i $BASE_BRANCH
  fi
}

br() {
  if [[ $# == 0 ]]; then
    set_base_branch

    branches=$(git branch)
    if [ "$TMUX" = "" ]; then
      target=$(echo $branches | awk '{$1=$1};1' | fzf --preview 'git short-log $BASE_BRANCH..{} | head')
    else
      target=$(echo $branches | awk '{$1=$1};1' | fzf-tmux --preview 'git short-log $BASE_BRANCH..{} | head')
    fi

    if [[ $target != '' ]]; then
      git checkout $(echo $target)
    fi
  fi
}

cfu() {
  set_base_branch
  if [ "$TMUX" = "" ]; then
    target=$(git log --pretty=oneline $BASE_BRANCH.. | fzf --preview "echo {} | cut -f 1 -d' ' | xargs -I SHA git show --color=always --pretty=fuller --stat SHA" | awk '{ print $1 }')
  else
    target=$(git log --pretty=oneline $BASE_BRANCH.. | fzf-tmux --preview "echo {} | cut -f 1 -d' ' | xargs -I SHA git show --color=always --pretty=fuller --stat SHA" | awk '{ print $1 }')
  fi

  if [[ $target != '' ]]; then
    git commit --fixup $(echo $target)
  fi
}
