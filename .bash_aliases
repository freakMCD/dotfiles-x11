alias bashrc="nvim ~/.bashrc && source ~/.bashrc"
alias aliasrc="nvim ~/.bash_aliases && source ~/.bashrc"
alias update-grub="sudo grub2-mkconfig -o /boot/grub2/grub.cfg"
alias playlist="mpv --shuffle --save-position-on-quit=no https://www.youtube.com/playlist?list=PL4CmunqMOJjLhWvgQUXWvewHEOoPAVAkt & exit"
alias animdl="animdl stream"


# Custom dnf alias
alias install="sudo dnf install"
alias search="sudo dnf search"
alias update="sudo dnf update"
alias remove="sudo dnf remove"
alias mp3="yt-dlp -f 'ba' -x --audio-format mp3"


function ttv () {
    nohup streamlink --title '{author} - {title} - {category}' -a '"--title=${{media-title}}"'  twitch.tv/"$@" > /dev/null 2>&1 & exit
}

function vod () {
		nohup streamlink --player-passthrough=hls "$@" > /dev/null 2>&1 & exit
}
