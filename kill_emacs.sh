#!/usr/bin/env sh

# The script must be symlinked to /etc/rc0.d/K99kill_emacs and /etc/rc6.d/K99kill_emacs

if [ -n "`pgrep emacs-24.5`" ]
then
    echo -n "`date` : Killing emacs-server..." | tee -a /home/safiyat/log.emacs
    emacsclient -e "(kill-emacs)"
    echo " Killed."
fi
