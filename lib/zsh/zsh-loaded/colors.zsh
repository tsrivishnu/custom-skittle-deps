# ls colors
autoload colors; colors;
export TERM=xterm-256color
export CLICOLOR=1
export LSCOLORS='Gxfxcxdxbxegedabagacad'

# Enable ls colors
ls --color -d . &>/dev/null 2>&1 && alias ls='ls --color=tty' || alias ls='ls -G'

