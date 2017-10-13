function finished() {
  CARD=$(git rev-parse --abbrev-ref HEAD | sed 's:.*/::' | sed 's/-.*//')
  wf --finish-card --card $CARD
}
