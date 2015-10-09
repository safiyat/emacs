#!/usr/bin/env bash

###############################################################################
#                                                                             #
#                                                                             #
#           ln -s -f script.sh /usr/bin/emacs                                 #
#                                                                             #
#                                                                             #
###############################################################################

if [[ -t 1 ]]; then
        echo "Terminal"
        TERMINAL=true
        CREATE="-nw"
else
        echo "Not-a-terminal"
        TERMINAL=false
        CREATE="-c"
fi

SERVER_RUNNING=$(pgrep -f "emacs --daemon")

if [ -z $SERVER_RUNNING ]
then
        echo "Emacs server not running. Starting the server..."
        /etc/alternatives/emacs --daemon 2> /dev/null
        echo $?
        if [ $? ]
        then
            echo "Server started successfully."
        else
            echo "Server couldn't be started."
            exit
        fi
else
        echo "Server already running. Starting a client."
fi
echo "HERE YOU GO: $@"

#if [ -z "$*" ]
#then
#        emacsclient -c  2> /dev/null
#else
#        emacsclient $@  2> /dev/null
#fi
emacsclient $CREATE $@  2> /dev/null
