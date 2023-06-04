# dotfiles

## What's in it?

* **WM**: dwm
* **Terminal**: st (+tmux)
* **Notifications**: Dunst
* **Launcher**: fzf
* **File Manager**: lf
* **Text Editor**: Neovim
* **Music player** with ncmpcpp + mpd + mpc
* **Image Viewer** : feh
* **PDF Reader**: Zathura
* **RSS Reader**: Newsboat
* **Email Client**: Neomutt
* **Themes on the fly** using pywal
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
GRUB_CMDLINE_LINUX="rhgb quiet radeon.cik_support=0 amdgpu.cik_support=1"
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
sudo dnf install @base-x dmenu dunst git libXft-devel libX11-devel qutebrowser tmux

## Run this first to save git credentials ##
git config --global credential.helper "store --file ~/.local/share/git-credentials"

# Install yadm
mkdir -p ~/.local/bin
curl -fLo ~/.local/bin/yadm https://github.com/TheLocehiliosan/yadm/raw/master/yadm && chmod a+x ~/.local/bin/yadm
yadm clone https://github.com/freakMCD/dotfiles.git 
```
3. Run 'yadm bootstrap' to install the rest

## Notes

### yadm

**To commit all changes**

    yadm add -u

**For files you will never edit (e.g. "LICENSE")**

    yadm update-index --assume-unchanged <filepath>
    
### nmcli

    nmcli dev status
    nmcli dev disconnect <device>
    nmcli dev connect <device>

### lftp

**Connect to ftp server**

    lftp ftp://192.168.1.3:2121

**Copy Local directory to remote**

    lftp 192.168.1.3:~> mirror -R --only-missing

**Print Local working directory**

    lftp 192.168.1.3:~> lpwd
    /home/edwin/Music/2015-2022




