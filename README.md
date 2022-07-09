# dotfiles

## What's in it?

- WM: i3
- Compositor: picom 
- Terminal: URxvt
- Notifications: Dunst
- Launcher: Dmenu
- Status bar: i3 status with Nerd Fonts
- File Manager: Ranger
- Text Editor: Neovim
- Colors and theme management using pywal
- Music player with ncmpcpp + mpd + mpc
- For screenshots: maim + xclip + xdotool
- PDF editor: Zathura
- Basic dotfiles :
    - i3 config file
    - .bashrc
    - .Xresources

##IMPORTANT
- Edit /etc/systemd/logind.conf 'HandlePowerKey=ignore'
- Install rpmfusion fedora, link: https://download1.rpmfusion.org/free/fedora/
- Disabled 'nm-applet' from autostart

## Notes
- Wallpapers can be found in '.config/wallpaper'.
- Font are 'Objetive' & 'JetBrainsMono Nerd Font'

## Personal Guide Installation

- sudo dnf install picom rxvt-unicode dunst neovim ranger ncmpcpp mpd mpc zathura zathura-pdf-poppler translate-shell yt-dlp maim xclip xdotool ffmpeg unrar xprop rclone git
- Search on internet about: yadm, pywal
- dependencies, nodejs, python. 
- For other dependencies/app search on internet 'appname fedora repo'
- flatpak apps: Discord mpv
