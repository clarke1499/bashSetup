#
# ~/.bashrc
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return
color_prompt=yes
if [ -f ~/.bash_aliases ]; then
	source ~/.bash_aliases
fi
alias ls='ls --color=auto'
PS1='\e[1;32m\u \e[1;34m\W > \\$\[$(tput sgr0)\] \e[m'
[ -n "$XTERM_VERSION" ] && transset-df --id "$WINDOWID" > /dev/null
