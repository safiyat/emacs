#!/usr/bin/env sh

# The script must be symlinked to /etc/init.d/... which in turn be symlinked to
# /etc/rc0.d/K99kill_emacs and /etc/rc6.d/K99kill_emacs.

#set -x

UID_LIST=$(cut -d: -f3 /etc/passwd)

for UID in $UID_LIST
do
    if [ -S "/tmp/emacs$UID/server" ]
    then
	USER=$(getent passwd $UID | cut -d: -f1)
        sudo su $USER -c '
	LOGFILE=$HOME/log.emacs
	echo "For user $USER, logfile $LOGFILE"
	echo -n "`date` : Killing emacs-server..." | tee -a $LOGFILE
	emacsclient -e "(setq desktop-dirname \"$HOME/.emacs.d/\")" > /dev/null
	emacsclient -e "(desktop-save-in-desktop-dir)" > /dev/null
	emacsclient -e "(kill-emacs)" > /dev/null
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
