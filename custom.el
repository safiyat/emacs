;TO DO
;      Figure out custom-set-variables, setq and setq-default
;      Test various settings of fringe-mode
;      
;
;
;


(setq user-full-name "Md Safiyat Reza")
(setq user-mail-address "md.reza@snapdeal.com")

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
;                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))

(defconst cust-emacs-dir     ; Find the path of the current directory.
  (file-name-directory (or load-file-name
                           (when (boundp 'bytecomp-filename) bytecomp-filename)
                           buffer-file-name))
  "Directory of custom-emacs"
)

(load-file (concat (file-name-as-directory cust-emacs-dir) "appearance.el"))
(load-file (concat (file-name-as-directory cust-emacs-dir) "keybindings.el"))

(add-to-list 'load-path (concat (file-name-as-directory cust-emacs-dir) "loadpaths/ac"))
(require 'auto-complete-config)
(ac-config-default)

(setq make-backup-files nil)   ; Don't make backup files.

(defalias 'yes-or-no-p 'y-or-n-p)   ; Use y-n-p instead of yes-no-p

(savehist-mode t)              ; Save mini-buffer history

(desktop-save-mode 1)          ; Save the desktop mode.

(setq-default ispell-program-name "/usr/bin/aspell")   ; Use aspell for the spellchecker.

