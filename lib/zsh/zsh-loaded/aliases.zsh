# Aliases
alias l='ls -lAh'
alias rm._='find . -name "._?*" -exec rm {} \;'
alias grep='grep --color=auto'
alias weather='curl http://wttr\.in/Munich'
alias "c"='clear'

# RubyOnRails
alias "rdmt"="RAILS_ENV=test rake db:migrate"
alias "rdm"="rake db:migrate; rdmt"
alias "rdrt"="RAILS_ENV=test rake db:rollback"
alias "rdr"="rake db:rollback; rdrt"
alias "rs"="BUNDLE_GEMFILE=Gemfile.local bundle exec rails server"
alias "rc"="BUNDLE_GEMFILE=Gemfile.local bundle exec rails console"
alias "rspec"="BUNDLE_GEMFILE=Gemfile.local bundle exec rspec"

#TMUX
alias tmn='tmux new -s '
alias tma='tmux attach-session -t '
alias tmls='tmux list-sessions'

# GIT aliases
alias gcl='git clone'
alias ga='git add'
alias gall='git add .'
alias g='git'
alias get='git'
alias gst='git status'
alias gs='git status'
alias gss='git status -s'
alias gl='git pull'
alias gp='git push'
alias gpo='git push origin'
alias gph='git push heroku master'
alias gdv='git diff -w "$@" | vim -R -'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gce='git commit --allow-empty-message -m ""'
alias gcb='git add . && git commit --allow-empty-message -m ""'
alias gci='git commit --interactive'
alias gb='git branch'
alias gba='git branch -a'
alias gcount='git shortlog -sn'
alias gcp='git cherry-pick'
alias gco='git checkout'
alias gexport='git archive --format zip --output'
alias gdel='git branch -d'
alias gmu='git fetch origin -v; git fetch upstream -v; git merge upstream/master'
alias gll='git log --graph --pretty=oneline --abbrev-commit'

## https://gist.github.com/590895
## via http://notes.envato.com/developers/rebasing-merge-commits-in-git/
function git_current_branch() {
  git symbolic-ref HEAD 2> /dev/null | sed -e 's/refs\/heads\///'
}

alias grb='git rebase -p'
alias gup='git fetch origin && grb origin/$(git_current_branch)'
alias gpthis='git push origin HEAD:$(git_current_branch)'
alias gm='git merge --no-ff'
alias gsync='git fetch origin && git rebase -p origin/$(git_current_branch) && git push origin HEAD:$(git_current_branch)'

case $OSTYPE in
  linux*)
    alias gd='git diff | vim -R -'
    ;;
  darwin*)
    alias gd='git diff | vim -R -'
    ;;
  darwin*)
    alias gd='git diff'
    ;;
esac

## To search and replace using ag: https://gist.github.com/hlissner/db74d23fc00bed81ff62#gistcomment-2578541
function agr { ag -0 -l "$1" | AGR_FROM="$1" AGR_TO="$2" xargs -r0 perl -pi -e 's/$ENV{AGR_FROM}/$ENV{AGR_TO}/g'; }
