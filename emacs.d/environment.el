(defalias 'yes-or-no-p 'y-or-n-p)                      ; Use y-n-p instead of yes-no-p

(savehist-mode t)                                      ; Save mini-buffer history

; Error prone. Make it work in server/client as well as other scenarios.
;; (desktop-save-mode t)                                  ; Error prone.
(when (not (boundp 'dsm-on))
      (desktop-save-mode t)
      ; (print "desktop-save-mode t")
      (setq-default dsm-on t))                         ; Save the desktop mode.

(setq make-backup-files nil)                           ; Don't create backup files

; Use only if aspell is installed.
(setq-default ispell-program-name "/usr/bin/aspell")   ; Use aspell for the spellchecker.

(ido-mode t)                                           ; Enable ido mode

(load-file (concat (file-name-as-directory cust-emacs-dir) "loadpath/markdown-mode.el")) ; Load markdown module.
