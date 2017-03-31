#!/usr/bin/env bash

set -e

if [[ $EUID -ne 0 ]]
then
    echo "This script must be run as root." 1>&2
    exit 1
fi

brew install emacs

TOP_DIR=$(pwd)
UID_LIST=$(cut -d: -f3 /etc/passwd)

for UID1 in $UID_LIST
do
    entry="$(getent passwd $UID1)"
    if [ "${entry##*bash}" ]
    then
        continue
    fi
    USER=$(echo $entry | cut -d: -f1)
    sudo su $USER -c '
        if [ -n "$HOME" ]
        then
            echo "(load-file \"$(pwd)/emacs.d/custom.el\")" > $HOME/.emacs
        fi
    '
done

sudo ln -sf $TOP_DIR/run.sh /usr/bin/emacs
sudo ln -sf $TOP_DIR/run.sh /usr/local/bin/emacs

sudo ln -sf $TOP_DIR/kill_emacs.sh /etc/init.d/kill_emacs
sudo ln -sf /etc/init.d/kill_emacs /etc/rc0.d/K99kill_emacs
sudo ln -sf /etc/init.d/kill_emacs /etc/rc6.d/K99kill_emacs
