function opentmux() {
  if [ "$TMUX" = "" ]; then
    tmux ls
    echo ""
    echo "Enter a session number, press q to not launch tmux, p for new pair session, or n for a new session"
    read "response?[#/n/p/q] "
    case $response in
      [qQ])
        return 1
        ;;
      [pP])
        vared -p "Enter a session number, n for a new session " -c session_name

        if [ "$session_name" = "n" ]; then
          upterm host --force-command 'tmux attach -t pair-programming' -- tmux new -t pair-programming
        else
          upterm host --force-command "tmux attach -t $session_name" -- tmux attach -t $session_name
        fi
        ;;
      *)
        tmux attach -t $response || tmux new
        ;;
    esac
  fi
}
