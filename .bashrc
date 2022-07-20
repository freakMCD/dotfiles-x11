# .bashrc

if [ -e $HOME/.bash_aliases ]; then
    source $HOME/.bash_aliases
fi

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc
export EDITOR='nvim'
export VISUAL='nvim'
export TERM='rxvt-unicode'
xrdb ~/.Xresources
(cat ~/.cache/wal/sequences &)

export PS1='\[\e[0;3;90m\][\[\e[0;3;31m\]\u \[\e[0;1;95m\]\W\[\e[0;3;90m\]] \[\e[0m\]'

