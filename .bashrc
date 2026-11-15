#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
# pS1='[\u@\h \W]\$ '
export PATH="$HOME/.local/bin:$PATH"
# export PS1='\[\033[1;34m\]\w\[\033[0m\] > '
# export PS1='\[\033[1;31m\]\w > \[\033[0m\]'
export PS1='\[\033[38;5;1m\]\w > \[\033[0m\]'

# launch yazi with y and when quitting yazi remain in the same folder
function yz() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd" ;clear
	fi
	rm -f -- "$tmp"
}

# hx to lunch helix
alias hx='helix'


# zathura as the default pdf reader
xdg-mime default org.pwmt.zathura.desktop application/pdf
 
