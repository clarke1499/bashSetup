#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

PATH=$PATH:~/bin:~/transactionSummary
TERMINAL=xterm
LESS="-x2"

export PATH
export TERMINAL
export LESS

case $(tty) in
/dev/tty1) startx
esac
