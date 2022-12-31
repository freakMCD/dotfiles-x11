# dotfiles

## What's in it?

- WM: i3
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
- RSS Reader: Newsboat
- Basic dotfiles :
    - i3 config file
    - .bashrc
    - .Xresources
		- .xinitrc

## IMPORTANT

- Add "install_weak_deps=false" into /etc/dnf/dnf.conf
- Edit /etc/systemd/logind.conf 'HandlePowerKey=ignore'
- Install rpmfusion fedora, link: https://download1.rpmfusion.org/free/fedora/

## Personal Guide Installation (after Fedora Everything minimal install)

- sudo dnf install xorg-x11-server-Xorg xorg-x11-xinit xorg-x11-drv-libinput mesa-dri-drivers
- " @base-x 
- " i3 i3status dmenu rxvt-unicode dunst
- " @multimedia @printing
- " google-noto-cjk-fonts  (asian fonts)
- " fd fd-find fzf git pass maim xev xclip xprop xdotool  
- " qutebrowser neovim ranger mpd mpc zathura zathura-pdf-poppler yt-dlp mpv latexmk newsboat pavucontrol
- Search on internet about: yadm, pywal, animdl
  dependencies, nodejs, python3-pip, python3-devel, gcc. 
- For other dependencies/app search on internet 'appname fedora repo'
- UMS (Universal Media Server)

## Notes
- Wallpapers can be found in '.config/wallpaper'.
- Font are 'Objetive' & 'JetBrainsMono Nerd Font'
- systemctl --user enable mpd.service
- Don't forget to run 'PlugUpdate' for neovim
- To save git credentials: 
	git config --global credential.helper "store --file ~/.local/share/git-credentials"
- deleting .wine folder can fix a problem with Leagueoflegends install


