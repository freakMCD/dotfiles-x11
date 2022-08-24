alias bashrc="nvim ~/.bashrc && source ~/.bashrc"
alias aliasrc="nvim ~/.bash_aliases && source ~/.bashrc"
alias trans="trans --shell -brief"
alias cambrinary="cambrinary -w "
alias mpv="flatpak run io.mpv.Mpv"
alias vod="streamlink --player-passthrough=hls"
alias crawl="crawl-tiles & exit"

# Custom dnf alias
alias install="sudo dnf install"
alias search="sudo dnf search"
alias update="sudo dnf update"


function stream () {
    nohup streamlink twitch.tv/"$@" > /dev/null 2>&1 & exit
}
