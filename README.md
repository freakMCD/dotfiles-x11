# dotfiles

## What's in it?

* **WM**: dwm
* **Terminal**: st
* **Notifications**: Dunst
* **Launcher**: fzf
* **File Manager**: lf
* **Text Editor**: Neovim
* **Music player** with ncmpcpp + mpd + mpc
* **Image Viewer** : feh
* **PDF Reader**: Zathura
* **RSS Reader**: Newsraft
* **Email Client**: Neomutt + Isync + msmtp
* **Theme** : gruvbox
* **Screenshots**: maim + xclip + xdotool
* **Basic dotfiles** :
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
#Fix Risk of Rain 2 slow load
GRUB_CMDLINE_LINUX="rhgb quiet clocksource=tsc tsc=reliable"
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
sudo dnf install @base-x dmenu dunst git libXft-devel libX11-devel qutebrowser

## Run this first to save git credentials ##
git config --global credential.helper "store --file ~/.local/share/git-credentials"

# Install yadm
mkdir -p ~/.local/bin
curl -fLo ~/.local/bin/yadm https://github.com/TheLocehiliosan/yadm/raw/master/yadm && chmod a+x ~/.local/bin/yadm
yadm clone https://github.com/freakMCD/dotfiles.git 
```
3. Run 'yadm bootstrap' to install the rest

## Notes

**To change Drive permissions to username**

    sudo chown -v username:username /media/username/disk-name

### git and yadm examples

    git remote set-url --push origin https://github.com/freakMCD/<reponame>.git

**To commit all changes**

    yadm add -u

**For files you will never edit (e.g. "LICENSE")**

    yadm update-index --assume-unchanged <filepath>

**When you have local repo but lost refs from remote repo**

    yadm init
    yadm remote add origin <url>
    yadm fetch
    yadm reset origin/master

### pass

    PASSWORD_STORE_GPG_OPTS='--pinentry-mode=loopback --passphrase <passphrase>'
    
### nmcli

    nmcli dev status
    nmcli dev connect/disconnect <device>

### Newsraft Build - Instructions

    git clone https://codeberg.org/grisha/newsraft.git
    dnf install scdoc gumbo-parser-devel yajl-devel expat-devel ncurses-devel sqlite-devel curl-devel


