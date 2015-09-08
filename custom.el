;TO DO
;      Figure out custom-set-variables, setq and setq-default.
;      Test various settings of fringe-mode.
;      Multiple cursors.
;      Virtualenv
;      Python
;      Flymake
;      Pymacs
;    Auto-complete
;      ac-fuzzy-complete
;      ac-user-dictionary   - ac-dictionary-directories
;
;      Override C-h to use keybindings.el
;      Override C-w to use keybindings.el
;      Override C-u to use keybindings.el
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
(load-file (concat (file-name-as-directory cust-emacs-dir) "loadpaths/autopair.el"))


(add-to-list 'load-path (concat (file-name-as-directory cust-emacs-dir) "loadpaths/ac"))
(require 'auto-complete-config)
(ac-config-default)

(setq make-backup-files nil)   ; Don't make backup files.

(defalias 'yes-or-no-p 'y-or-n-p)   ; Use y-n-p instead of yes-no-p

(savehist-mode t)              ; Save mini-buffer history

(desktop-save-mode t)          ; Save the desktop mode.

(setq-default ispell-program-name "/usr/bin/aspell")   ; Use aspell for the spellchecker.
(ido-mode t)
(setq-default autopair-mode t)

(defun comment-or-uncomment-region-or-line ()
    "Comments or uncomments the region or the current line if there's no active region."
    (interactive)
    (let (beg end)
        (if (region-active-p)
            (setq beg (region-beginning) end (region-end))
            (setq beg (line-beginning-position) end (line-end-position)))
        (comment-or-uncomment-region beg end)))
