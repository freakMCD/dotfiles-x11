
source "${XDG_CONFIG_HOME:-$HOME/.config}/lf/lf-shell"
source "$HOME/.local/share/linuxfedora"

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

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

export TERMINAL='rxvt-unicode'
export EDITOR='nvim'
export VISUAL='nvim'
export MANPAGER='nvim +Man!'
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export TEXMFVAR="$XDG_CACHE_HOME/texlive/texmf-var"
export HISTFILE="$XDG_STATE_HOME/bash/history"
export LESSHISTFILE='-'

export PS1='\[\e[0;3;90m\][\[\e[0;3;31m\]\u \[\e[0;1;95m\]\W\[\e[0;3;90m\]] \[\e[0m\]'

mem() { 
    ps -eo rss,pid,euser,args:100 --sort %mem | grep -v grep | grep -i $@ | awk '{printf $1/1024 "MB"; $1=""; print }'
}

### FZF ###
if [ -x "$(command -v fzf)" ]; then
	source /usr/share/fzf/shell/key-bindings.bash
	source /etc/bash_completion.d/fzf
	fdExclude="-E ".cache" -E "repo.git" -E "webengine" -E ".local" -E "[sS]team*" -E "*wine*" -E "dosdevices" -E "drive_c""
	export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow $fdExclude"
	export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
	export FZF_ALT_C_COMMAND="fd --type d --hidden --follow $fdExclude" 
	export FZF_DEFAULT_OPTS='--height 60% --reverse'
	
	fmpc() {
	  local song_position
	  song_position=$(mpc -f "%position%) %artist% - %title%" playlist | \
	    fzf-tmux --query="$1" --reverse --select-1 --exit-0 | \
	    sed -n 's/^\([0-9]\+\)).*/\1/p') || return 1
	  [ -n "$song_position" ] && mpc -q play $song_position
	}
	
	# nvim ** 
	_fzf_compgen_path() {
        $FZF_DEFAULT_COMMAND . "$1"
	}
	# cd **
	_fzf_compgen_dir() {
		$FZF_ALT_C_COMMAND . "$1"
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
fi

