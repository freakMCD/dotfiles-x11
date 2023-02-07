# dotfiles

## What's in it?

* **WM**: i3
* **Terminal**: URxvt
* **Notifications**: Dunst
* **Launcher**: fzf
* **File Manager**: Ranger (TUI) | Thunar (GUI)
* **Text Editor**: Neovim
* **Colors and theme management** using pywal
* **Music player** with ncmpcpp + mpd + mpc
* **For screenshots**: maim + xclip + xdotool
* **PDF Reader**: Zathura
* **RSS Reader**: Newsboat
* **Email Client**: Neomutt
* Basic dotfiles :
    - i3 config file
    - .bashrc
    - .Xresources
    - .xinitrc

* Scripts >> ~/bin/
    - download part of url video with ffmpeg
    - list dnf packages with fzf
    - interfaz for `pass` with fzf
    - list twitch onlineperformance channels with fzf
    - translate-shell

## System Config
```bash
#Replace line in /etc/systemd/journald.conf
SystemMaxUse=50M

#Replace line in /etc/systemd/logind.conf 
HandlePowerKey=ignore

#Replace line in /etc/default/grub
GRUB_CMDLINE_LINUX="rhgb quiet radeon.cik_support=0 amdgpu.cik_support=1"

#Add line in /usr/etc/npmrc
cache=~/.cache/npm
```

## Guide Installation (after Fedora Everything minimal install)
Don't Install weak deps
```bash
#Add lines in /etc/dnf/dnf.conf
install_weak_deps=false 
max_parallel_downloads=10 
```
Packages to install starting with Xorg, i3wm, notifications and terminal
```
sudo dnf install @base-x i3 i3status dmenu rxvt-unicode dunst
" rpmfusion-free-release rpmfusion-nonfree-release 
" @multimedia @printing
" fd-find fzf git pass maim xev xclip xprop xdotool
" mpd mpc mpv neovim newsboat neomutt qutebrowser ranger yt-dlp zathura zathura-pdf-mupdf
" google-noto-cjk-fonts latexmk pavucontrol thunar weechat 
```
Wanted but not on Fedora repos: `yadm`, `pywal`, `animdl` 
**Dependencies**: nodejs, python3-pip, python3-devel, gcc. <!-- gcc probably is not necessary -->

## NOTES
```bash
#To save git credentials
git config --global credential.helper "store --file ~/.local/share/git-credentials"
```
* systemctl --user enable mpd.service
* Run 'PlugUpdate' for neovim
* For LaTex install `TexLive`
* deleting .wine folder can fix a problem with Leagueoflegends install
* You maybe need this packages: `cyrus-sasl-plain` <!-- neomutt package|send email -->

### yadm 

**To choose commits to delete since an specified commit**
```bash
#Replace <commit> with the commit from where you want to rebase    
yadm rebase -i <commit>~1

#To rebase the branch
yadm push origin HEAD --force
```

**To commit all changes**

    yadm add -u

**For files you will never edit (E.g. "LICENSE")**

    yadm update-index --assume-unchanged <filepath>
    
### nmcli

    nmcli dev status
    nmcli dev disconnect <device>
    nmcli dev connect <device>

