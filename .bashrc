LFSHELL=$XDG_CONFIG_HOME/lf/lf-shell
     if [ -f "$LFSHELL" ]; then
         source "$LFSHELL"
     fi

if [ -e $HOME/.bash_aliases ]; then
    source $HOME/.bash_aliases
fi

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:$HOME/bin/lib:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$HOME/bin/lib:$PATH"
fi
export PATH

set -a
source ~/.local/share/linuxfedora
BROWSER="qutebrowser"
XDG_CONFIG_HOME="$HOME/.config"
XDG_CACHE_HOME="$HOME/.cache"
XDG_DATA_HOME="$HOME/.local/share"
XDG_STATE_HOME="$HOME/.local/state"

TERMINAL='rxvt-unicode'
EDITOR='nvim'
VISUAL='nvim'
MANPAGER='nvim +Man!'
GNUPGHOME="$XDG_DATA_HOME/gnupg"
TEXMFVAR="$XDG_CACHE_HOME/texlive/texmf-var"
HISTFILE="$XDG_STATE_HOME/bash/history"
LESSHISTFILE='-'
PS1='\[\e[0;3;90m\][\[\e[0;3;31m\]\u \[\e[0;1;95m\]\W\[\e[0;3;90m\]] \[\e[0m\]'
set +a

mem() { 
    ps -eo rss,pid,euser,args:100 --sort %mem | grep -v grep | grep -i $@ | awk '{printf $1/1024 "MB"; $1=""; print }'
}

### FZF ###
if [ -x "$(command -v fzf)" ]; then
	source /usr/share/fzf/shell/key-bindings.bash
	source /usr/share/fzf/shell/completion.bash
    fdExclude="-E '{*[Cc]ache,*.git,z:,.local,.wine}'"

    export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow $fdExclude"
	export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
	export FZF_ALT_C_COMMAND="fd --type d --hidden --follow $fdExclude"
	export FZF_DEFAULT_OPTS="--height 60% --reverse"
	
	# nvim ** 
	_fzf_compgen_path() {
        eval $FZF_DEFAULT_COMMAND . "$1"
	}
	# cd **
	_fzf_compgen_dir() {
        eval $FZF_ALT_C_COMMAND . "$1";
    }
	
	# fe [FUZZY PATTERN] - Open the selected file with the default editor
	#   - Bypass fuzzy finder if there's only one match (--select-1)
	#   - Exit if there's no match (--exit-0)
	fe() {
	  IFS=$'\n' files=($(fzf --query="$1" --multi --select-1 --exit-0))
	  [[ -n "$files" ]] && $EDITOR "${files[@]}"
	}

	fman() {
	    man -k . | fzf --prompt='Man> ' | awk '{print $1}' | xargs -r man
	}

    fmpc() {
	  local song_position
	  song_position=$(mpc -f "%position%) %artist% - %title%" playlist | \
	    fzf --query="$1" --reverse --select-1 --exit-0 | \
	    sed -n 's/^\([0-9]\+\)).*/\1/p') || return 1
	  [ -n "$song_position" ] && mpc -q play $song_position
	}
fi

