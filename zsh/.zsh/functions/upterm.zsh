pair() {
  upterm session current --admin-socket ~/.upterm/*.sock | grep 'SSH Session' | tr -s ' ' | cut -d' ' -f3,4 | xclip -selection clipboard
  echo "Copied upterm SSH address to clipboard"
}

killpair() {
  ps aux | grep upterm | cut -d' ' -f6 | xargs -L 1 kill -9
}
