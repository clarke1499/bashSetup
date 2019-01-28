#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

PATH=$PATH:~/bin:~/transactionSummary:~/.gem/ruby/2.5.0/bin
TERMINAL=xterm
LESS="-R -x2"
EDITOR=vim
MANPAGER="/bin/bash -c \"col -b | vim -c 'set ft=man ts=8 nomod nolist nonu noma cc=0' -c 'nnoremap <Space> <C-f>' -c ':IndentLinesToggle' -\""

export MANPAGER
export PATH
export TERMINAL
export LESS
export EDITOR

case $(tty) in
  /dev/tty1) startx
esac
