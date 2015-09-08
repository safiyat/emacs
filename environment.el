(setq make-backup-files nil)   ; Don't make backup files.

(defalias 'yes-or-no-p 'y-or-n-p)   ; Use y-n-p instead of yes-no-p

(savehist-mode t)              ; Save mini-buffer history

(desktop-save-mode t)          ; Save the desktop mode.

(setq-default ispell-program-name "/usr/bin/aspell")   ; Use aspell for the spellchecker.

(ido-mode t)                   ; Enable ido mode.

