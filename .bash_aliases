alias bashrc="nvim ~/.bashrc && source ~/.bashrc"
alias aliasrc="nvim ~/.bash_aliases && source ~/.bashrc"
alias update-grub="sudo grub2-mkconfig -o /boot/grub2/grub.cfg"
alias playlist="mpv --shuffle --save-position-on-quit=no https://www.youtube.com/playlist?list=PL4CmunqMOJjLhWvgQUXWvewHEOoPAVAkt & exit"

alias anime="animdl stream"
alias mp3dl="yt-dlp --extract-audio --audio-format mp3"

alias yadm-add-deleted="yadm status | grep deleted | awk -F ':' '{print $2}' | xargs yadm add"
alias git-apply="git apply --reject --whitespace=fix"

alias wget='wget --hsts-file="$XDG_CACHE_HOME/wget-hsts"'
alias pywal='wal --saturate 0.5 -i ~/.config/wallpaper --iterative -n -o "~/.config/dunst/wal_dunst.sh"'

# gpg aliases
alias gpg-list="gpg --list-secret-keys --keyid-format LONG"
alias gpg-backup="gpg -o private.gpg --export-options backup --export-secret-keys"
alias gpg-restore="gpg --import-options restore --import private.gpg"

# Custom dnf alias
alias install="sudo dnf install"
alias search="sudo dnf search"
alias update="sudo dnf upgrade --exclude=kernel*"
alias upgrade="sudo dnf upgrade"
alias remove="sudo dnf remove"

function whatrequires () {
    sudo dnf history "$@"| egrep -w 'install|upgrade'
}

function ttv () {
    streamlink --title '{author} - {title} - {category}' twitch.tv/"$@" >/dev/null 2>&1 & exit
}

function vod () {
    streamlink --player-passthrough=hls "$@" >/dev/null 2>&1 & exit
}

function dict () {
    curl -s 'dict://dict.org/d:'"$@"'' | nvim +Man!
}




