#!/bin/bash
# Sync Files from Linux to android
 
calculator() {
    clear
    bc -l
}

sync_music() {
   clear
   cd ~/Music/2015-2022/
   lftp ftp://192.168.1.3:2121 -e "
   cd Music;
   mirror -R --only-missing --no-recursion;
   bye"
}

PS3='Please enter your number choice: '
options=("calculator" "sync music" "quit")
select opt in "${options[@]}"
do
    case $opt in
        "calculator")
            calculator
            break
            ;;
        "sync music")
            sync_music
            break
            ;;
        "quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
