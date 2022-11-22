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
- systemctl --user enable mpd.service
- Don't forget to run 'PlugUpdate' for neovim

## Personal Guide Installation

- sudo dnf install rxvt-unicode dunst neovim ranger ncmpcpp mpd mpc zathura zathura-pdf-poppler yt-dlp maim xclip xdotool ffmpeg unrar xprop git
- Search on internet about: yadm, pywal, animdl
- dependencies, nodejs, python3-pip. 
- For other dependencies/app search on internet 'appname fedora repo'
- flatpak apps: Discord, mpv
- UMS (Universal Media Server)

