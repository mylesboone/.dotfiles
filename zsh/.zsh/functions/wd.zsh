WD_DIRS_LOCATION=~/.dirs

function wd() {
  if [[ $# == 0 ]]; then
    if [ -f $WD_DIRS_LOCATION ]; then
      files=$(cat $WD_DIRS_LOCATION | sed 's/#.*//g' | sed '/^\s*$/d' | sort | uniq)
      if [ "$TMUX" = "" ]; then
        destination=$(echo $files | fzf | sed 's/^.*: //' )
      else
        destination=$(echo $files | $(fzf-prog) | sed 's/^.*: //' )
      fi

      if [[ $destination != '' ]]; then
        cd $destination
      fi
    else
      touch $WD_DIRS_LOCATION
      echo "Created $WD_DIRS_LOCATION"
    fi
  fi
}

function wda() {
  echo $@: $(pwd) >> $WD_DIRS_LOCATION
}
