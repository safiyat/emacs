#!/usr/bin/env bash

###############################################################################
#                                                                             #
#                                                                             #
#           ln -sf /full/path/to/script.sh /usr/bin/emacs                     #
#                                                                             #
#                                                                             #
###############################################################################


LOGFILE="/home/safiyat/logs.emacs"
NOLOG="/dev/null"
log=$LOGFILE

bold=$(tput bold)
normal=$(tput sgr0)

if [ $TERM != "dumb" ]
then
        TERMINAL=true
        CREATE="-nw"
        echo "${bold}`date`: Using a terminal.${normal}" >> $log
else
        TERMINAL=false
        CREATE="-c"
        echo "${bold}`date`: Using a graphical frame.${normal}" >> $log
fi

SERVER_RUNNING=$(pgrep -f "emacs --daemon")

if [ -z $SERVER_RUNNING ]
then
        echo "`date`: Emacs server not running. Starting the server..." >> $log
        # echo "Emacs server not running. Starting the server..."
        timeout 10s /etc/alternatives/emacs --daemon 2> /dev/null
        if [[ $? -eq "0" ]]
        then
            # echo "Server started successfully."
            echo "`date`: Server started successfully." >> $log
        else
            # echo "Server couldn't be started."
            echo "`date`: Server couldn't be started." >> $log
            exit
        fi
else
        # echo "Server already running. Starting a client."
        echo "`date`: Server already running. Starting a client." >> $log
fi

emacsclient $CREATE $@  2>> $log
