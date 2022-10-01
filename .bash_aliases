alias bashrc="nvim ~/.bashrc && source ~/.bashrc"
alias aliasrc="nvim ~/.bash_aliases && source ~/.bashrc"
alias trans="trans --shell -brief"
alias cambrinary="cambrinary -w "
alias mpv="flatpak run io.mpv.Mpv"

# Custom dnf alias
alias install="sudo dnf install"
alias search="sudo dnf search"
alias update="sudo dnf update"
alias remove="sudo dnf remove"


function stream () {
    nohup streamlink --title '{author} - {title} - {category}' -a '"--title=${{media-title}}"'  twitch.tv/"$@" > /dev/null 2>&1 & exit
}

function vod () {
		nohup streamlink --player-passthrough=hls "$@" > /dev/null 2>&1 & exit
}
