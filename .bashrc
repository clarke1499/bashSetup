#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -f ~/.bash_aliases ]; then
	source ~/.bash_aliases
fi
alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
[ -n "$XTERM_VERSION" ] && transset-df --id "$WINDOWID" > /dev/null
