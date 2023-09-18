alias bashrc="nvim ~/.bashrc && source ~/.bashrc"
alias aliasrc="nvim ~/.bash_aliases && source ~/.bashrc"
alias wget='wget --hsts-file="$XDG_CACHE_HOME/wget-hsts"'

alias mp3dl="yt-dlp --extract-audio --audio-format mp3"
alias playlist="mpv --shuffle --save-position-on-quit=no https://www.youtube.com/playlist?list=PL4CmunqMOJjLhWvgQUXWvewHEOoPAVAkt & exit"
alias pywal='wal --saturate 0.5 -i ~/.config/wallpaper --iterative -n -o "~/.config/dunst/wal_dunst.sh"'

alias rclone="rclone -P"
alias neomutt="st -n neomutt -g 80x25+297+1 -e neomutt &exit"
alias newsraft="st -n newsraft -g 80x25+297+1 -e newsraft &exit"

# gpg aliases
alias gpg-list="gpg --list-secret-keys --keyid-format LONG"
alias gpg-backup="gpg -o private.gpg --export-options backup --export-secret-keys"
alias gpg-restore="gpg --import-options restore --import private.gpg"

# Custom dnf alias
alias install="sudo dnf install"
alias search="sudo dnf search"
alias update="sudo dnf upgrade --refresh --exclude=kernel* --exclude=texlive* --exclude=libreoffice*"
#alias update-mesa"sudo dnf update --enablerepo=updates-testing,rpmfusion-free-updates-testing mesa*"
alias upgrade="sudo dnf upgrade --refresh --exclude=texlive* --exclude=libreoffice* "
alias remove="sudo dnf remove"
alias update-grub="sudo grub2-mkconfig -o /boot/grub2/grub.cfg"

function whatrequires () {
    sudo dnf history "$@"| egrep -w 'install|upgrade'
}

function dict () {
    curl -s 'dict://dict.org/d:'"$@"'' | nvim +Man!
}

function anime() {
    if [ $2 = 'last' ]; then
        animdl stream "$1" -s $2
    else
        animdl stream "$1" -r $2 
    fi
}

function ttv () {
    streamlink --twitch-ttvlol --twitch-proxy-playlist=https://eu.luminous.dev,https://as.luminous.dev --title '{author} - {title} - {category}' twitch.tv/$@ --player-args '--loop-playlist' >/dev/null 2>&1 &exit
}

fkill() {
  local pid
  pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

  if [ "x$pid" != "x" ]
  then
    echo $pid | xargs kill -${1:-9}
  fi
}
