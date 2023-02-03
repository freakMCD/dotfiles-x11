# dotfiles

## What's in it?

- WM: i3
- Terminal: URxvt
- Notifications: Dunst
- Launcher: fzf
- Status bar: i3 status with Nerd Fonts
- File Manager: Ranger (TUI) | Thunar (GUI)
- Text Editor: Neovim
- Colors and theme management using pywal
- Music player with ncmpcpp + mpd + mpc
- For screenshots: maim + xclip + xdotool
- PDF editor: Zathura
- RSS Reader: Newsboat
- Email Client: Neomutt
- Basic dotfiles :
		- i3 config file
		- .bashrc
		- .Xresources
		- .xinitrc

- Scripts: 
		- download part of video with ffmpeg
		- dnf with fzf
		- fzf integration with pass
        - fzf integration with twitch

## IMPORTANT

- Add "install_weak_deps=false" "fastestmirror=True" "max_parallel_downloads=10" into /etc/dnf/dnf.conf
- Edit /etc/systemd/logind.conf 'HandlePowerKey=ignore'
- Install rpmfusion fedora, link: https://download1.rpmfusion.org/free/fedora/

## Personal Guide Installation (after Fedora Everything minimal install)

- sudo dnf install xorg-x11-server-Xorg xorg-x11-xinit xorg-x11-drv-libinput mesa-dri-drivers
- " @base-x 
- " i3 i3status dmenu rxvt-unicode dunst
- " @multimedia @printing
- " google-noto-cjk-fonts  (asian fonts)
- " fd-find fzf git pass maim xev xclip xprop xdotool  
- " qutebrowser neovim ranger mpd mpc zathura zathura-pdf-mupdf yt-dlp mpv latexmk newsboat pavucontrol weechat
- " thunar
- Search on internet about: yadm, pywal, animdl
  dependencies, nodejs, python3-pip, python3-devel, gcc. <!-- gcc probably is not necessary -->
- " neomutt cyrus-sasl-plain <!-- cyrus.. is for authentication when sending emails -->

## Notes
- Font are 'Objective' & 'JetBrainsMono Nerd Font'
- systemctl --user enable mpd.service <!-- to run mpd at start -->
- Don't forget to run 'PlugUpdate' for neovim
- To save git credentials: 
	git config --global credential.helper "store --file ~/.local/share/git-credentials"
- deleting .wine folder can fix a problem with Leagueoflegends install
- For LaTex install TexLive

### yadm 
- To choose what commits to delete since <commit>
	yadm rebase -i <commit>~1 			<!-- to choose -->
	yadm push origin HEAD --force 	<!-- to rebase -->
- Miscellaneous
	yadm add -u 										<!-- to commit all changed files ->

### nmcli
- nmcli dev status
- nmcli dev disconnect <device>
- nmcli dev connect <device>

