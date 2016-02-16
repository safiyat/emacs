#!/usr/bin/env sh

# The script must be symlinked to /etc/init.d/... which in turn be symlinked to
# /etc/rc0.d/K99kill_emacs and /etc/rc6.d/K99kill_emacs.

#set -x

if [[ $EUID -ne 0 ]]
then
    echo "This script must be run as root." 1>&2
    exit 1
fi

UID_LIST=$(cut -d: -f3 /etc/passwd)

for UID1 in $UID_LIST
do
    if [ -S "/tmp/emacs$UID1/server" ]
    then
        USER=$(getent passwd $UID1 | cut -d: -f1)
        sudo su $USER -c '
            LOGFILE=$HOME/.log.emacs
            echo "For user $USER, logfile $LOGFILE"
            echo -n "`date` : Killing emacs-server..." | tee -a $LOGFILE
            /usr/local/bin/emacsclient -e "(setq desktop-dirname \"$HOME/.emacs.d/\")" > /dev/null
            /usr/local/bin/emacsclient -e "(desktop-save-in-desktop-dir)" > /dev/null
            /usr/local/bin/emacsclient -e "(kill-emacs)" > /dev/null
            if [ "$?" -eq "0" ]
            then
                echo " Killed." | tee -a $LOGFILE
            else
                echo " Could not be killed." | tee -a $LOGFILE
            fi
            echo "" | tee -a $LOGFILE
        '
    fi
done
