alias bashrc="nvim ~/.bashrc && source ~/.bashrc"
alias aliasrc="nvim ~/.bash_aliases && source ~/.bashrc"
alias update-grub="sudo grub2-mkconfig -o /boot/grub2/grub.cfg"
alias playlist="mpv --shuffle --no-sub-visibility --save-position-on-quit=no https://www.youtube.com/playlist?list=PL4CmunqMOJjLhWvgQUXWvewHEOoPAVAkt & exit"

alias animst="animdl stream"
alias mp3="yt-dlp -f 'ba' -x --audio-format mp3"

alias recordscreen="ffmpeg -f pulse -i alsa_output.pci-0000_00_1b.0.analog-stereo.monitor -ac 2 -vaapi_device /dev/dri/renderD128 -f x11grab -video_size 1920x1080 -i :0 -vf 'hwupload,scale_vaapi=format=nv12' -c:v h264_vaapi -qp 24 -strftime 1 ~/Pictures/Recordings/$(date +"%Y-%m-%d_%H-%M-%S").mp4"

alias gpg-list="gpg --list-secret-keys --keyid-format LONG"
alias gpg-backup="gpg -o private.gpg --export-options backup --export-secret-keys"
alias gpg-restore="gpg --import-options restore --import private.gpg"


# Custom dnf alias
alias install="sudo dnf install"
alias search="sudo dnf search"
alias update="sudo dnf update"
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




