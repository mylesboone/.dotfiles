function next_story() {
  ppwf --work-issue --issue $(ppwf --list-issues | $(fzf_prog) | awk '{print $1;}')
}
