# Following: https://stackoverflow.com/a/41054093/976880
# This is to ensure GPG asks for password in the terminal when using via SSH.
# Not sure, if this effects MacOS usage
export GPG_TTY=$(tty)
