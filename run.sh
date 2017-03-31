#! /usr/bin/env bash

###############################################################################
#                                    run.sh                                   #
#                                                                             #
#    A script to handle the server-client mode.                               #
#    Upon invokation, if a server is not running, starts a server and then    #
#    runs the client.                                                         #
#    Intelligently starts the client in a terminal or in a graphical frame as #
#    invoked.                                                                 #
#                                                                             #
#    Run the following command to run the script whenever emacs is invoked.   #
#                                                                             #
#                 ln -sf /full/path/to/run.sh /usr/bin/emacs                  #
#                                                                             #
###############################################################################

# File to store the script logging information if selected
LOGFILE="$HOME/.log.emacs"

# Send logs to the null device
NOLOG="/dev/null"

# Set the log destination
LOG=$LOGFILE

# Location of the emacs binary to use
emacs_bin="/usr/local/bin/emacs-24.5"

# Location of the emacsclient binary to use
emacsclient_bin="/usr/local/bin/emacsclient"

bold="tput bold"
normal="tput sgr0"

# If the command was run from a real TERM
if [ $TERM != "dumb" ]
then
        TERMINAL=true
        CREATE=" -nw "
        echo "$($bold)`date`: Using a terminal.$($normal)" >> $LOG
else
        TERMINAL=false
        CREATE=" -c "
        TERM="dumb"
        echo "$($bold)`date`: Using a graphical frame.$($normal)" >> $LOG
fi

if [[ $@ == -psn* ]]
then
    echo "$($bold)`date`: Using Application.$($normal)" >> $LOG
    $emacsclient_bin $CREATE  -d localhost:0 2>> $LOG
else
    echo "$($bold)`date`: Using Terminal.$($normal)" >> $LOG
    $emacsclient_bin $CREATE $@ 2>> $LOG
fi

if [ $? -ne 0 ]
then
        echo "`date`: Emacs server not running. Starting the server..." >> $LOG
        # Remove the f*cking lock.
        rm -f $HOME/.emacs.d/.emacs.desktop.lock
        gtimeout 10s $emacs_bin --daemon 2> /dev/null
        if [ "$?" -eq "0" ]
        then
            echo "`date`: Server started successfully." >> $LOG
        else
            echo "`date`: Server couldn't be started." >> $LOG
            exit
        fi
        echo "`date`: Server already running. Starting a client." >> $LOG
        $emacsclient_bin $CREATE $@  2>> $LOG
fi
