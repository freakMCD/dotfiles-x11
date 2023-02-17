# dotfiles

## What's in it?

* **WM**: dwm
* **Terminal**: URxvt
* **Notifications**: Dunst
* **Launcher**: fzf
* **File Manager**: Ranger (TUI) | Thunar (GUI)
* **Text Editor**: Neovim
* **Music player** with ncmpcpp + mpd + mpc
* **Image Viewer** : Feh
* **PDF Reader**: Zathura
* **RSS Reader**: Newsboat
* **Email Client**: Neomutt
* **Themes on the fly** using pywal
* **Screenshots**: maim + xclip + xdotool
* **Basic dotfiles** :
    - i3 config file
    - .bashrc & .bash_profile
    - .Xresources
    - .xinitrc

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

1. Don't Install weak deps
```bash
#Add lines in /etc/dnf/dnf.conf
install_weak_deps=false 
max_parallel_downloads=10 
```
2. Install essential packages
```bash
sudo dnf install @base-x dmenu rxvt-unicode dunst git qutebrowser libXft-devel libX11-devel

## Run this first to save git credentials ##
git config --global credential.helper "store --file ~/.local/share/git-credentials"

# Install yadm
mkdir -p ~/.local/bin
curl -fLo ~/.local/bin/yadm https://github.com/TheLocehiliosan/yadm/raw/master/yadm && chmod a+x ~/.local/bin/yadm
yadm clone https://github.com/freakMCD/dotfiles.git 
```
3. Run 'yadm bootstrap' to install the rest

## Notes

- Deleting .wine folder can fix a problem with leagueoflegends install

### yadm

**To choose commits to delete since an specified commit**
```bash
#Replace <commit> with the commit from where you want to rebase    
yadm rebase -i <commit>~1

#To rebase the branch
yadm push origin head --force
```

**To commit all changes**

    yadm add -u

**For files you will never edit (e.g. "LICENSE")**

    yadm update-index --assume-unchanged <filepath>
    
### nmcli

    nmcli dev status
    nmcli dev disconnect <device>
    nmcli dev connect <device>

