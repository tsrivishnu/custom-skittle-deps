# Find merge commit that introduced given commit ($1) into branch ($2, default is master)
function git-find-merge() {
  commit=$1
  if [ -z "$2" ]; then
    branch="master"
  else
    branch=$2
  fi

  perl -ne 'print if ($seen{$_} .= @ARGV) =~ /10$/' <(git rev-list --ancestry-path $commit..$branch) <(git rev-list --first-parent $commit..$branch) | tail -n 1
}
