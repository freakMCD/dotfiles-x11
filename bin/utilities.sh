#!/bin/bash
# Sync Files from Linux to android
 
calculator() {
    clear
    bc -l
}

sync_android() {
   clear
   ~/bin/androidsync
}

PS3='Please enter your number choice: '
options=("calculator" "sync android" "quit")
select opt in "${options[@]}"
do
    case $opt in
        "calculator")
            calculator
            break
            ;;
        "sync android")
            sync_android
            break
            ;;
        "quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
