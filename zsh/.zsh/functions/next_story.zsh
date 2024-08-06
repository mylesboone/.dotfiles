function next_story() {
  ppwf --work-issue --issue $(ppwf --list-issues | fzf | awk '{print $1;}')
}
