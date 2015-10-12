#!/usr/bin/env bash

###############################################################################
#                                                                             #
#                                                                             #
#           ln -s -f /full/path/to/script.sh /usr/bin/emacs                   #
#                                                                             #
#                                                                             #
###############################################################################

if [ $TERM == "dumb" ]
then
        TERMINAL=false
        CREATE="-c"
else
        TERMINAL=true
        CREATE="-nw"
fi

SERVER_RUNNING=$(pgrep -f "emacs --daemon")

if [ -z $SERVER_RUNNING ]
then
        echo "Emacs server not running. Starting the server..."
        timeout 10s /etc/alternatives/emacs --daemon 2> /dev/null
        if [[ $? -eq "0" ]]
        then
            echo "Server started successfully."
        else
            echo "Server couldn't be started."
            exit
        fi
else
        echo "Server already running. Starting a client."
fi

emacsclient $CREATE $@  2> /dev/null

