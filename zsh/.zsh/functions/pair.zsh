pair() {
  if [ "$TMUX" = "" ]; then
    upterm host --force-command 'tmux attach -t pair-programming' --github-user scottleeroberts --github-user kthibodeaux --github-user dms449 -- tmux new -t pair-programming
  else
    if ! upterm session current; then
      session=$(tmux display-message -p '#S')
      upterm host --force-command "tmux attach -t $session" --github-user scottleeroberts --github-user kthibodeaux --github-user dms449
    fi
    upterm session current | grep 'SSH Session' | tr -s ' ' | cut -d' ' -f3,4 | xclip -selection clipboard
    echo "Copied address to clipboard"
  fi
}

killpair() {
  ps aux | grep upterm | cut -d' ' -f6 | xargs -L 1 kill -9
}
