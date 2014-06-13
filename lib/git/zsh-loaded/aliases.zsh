# Clean up merged remote branches
# https://blog.splice.com/cleaning-git-branches/
gitpurge = "git checkout master && git remote update --prune | git branch --remote --merged | grep --invert-match master | sed -e 's/origin\//:/' | xargs git push origin"
