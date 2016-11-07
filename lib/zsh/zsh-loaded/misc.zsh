# Bash style backward-kill-word. See http://stackoverflow.com/a/1438523/976880
autoload -U select-word-style
select-word-style bash

if [[ "$(uname)" = "Darwin" ]]; then
  function delete-app-files(){
    file_regex=$1

    SAVEIFS=$IFS
    IFS=$(echo -en "\n\b")

    search_in=(
    "$HOME/Library/Caches"
    "$HOME/Library/Application Support"
    "/Library/Caches"
    "/Library/Application Support"
    )
    files=()
    for directory in "${search_in[@]}"
    do
      echo "Searching - $directory"
      files+=(`sudo find $directory -type f -name $file_regex`)
    done

    echo ""
    echo ""
    echo "File matches: "

    for file in "${files[@]}"
    do
      echo " -- $file"
    done

    echo ""
    echo "Found ${#files[@]} files/folders"
    if [ ! ${#files[@]} -eq 0 ]; then
      echo "Delete these files/folders permanently?: y/n "
      read should_delete;
      if [ "$should_delete" == "y" ]; then
        for file in "${files[@]}"
        do
          echo "Deleting - $file"
          sudo rm -rf $file
        done
      fi
    fi

    IFS=$SAVEIFS
  }
fi
