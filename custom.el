(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;; '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(column-number-mode t)
 '(custom-enabled-themes (quote (flatland)))
 '(display-battery-mode t)
 '(display-time-mode t)
 '(fringe-mode nil nil (fringe))
 '(indicate-buffer-boundaries (quote ((top . left) (bottom . right))))
 '(save-place t nil (saveplace))
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(tool-bar-mode nil)
 '(tool-bar-position (quote top) t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(defconst cust-emacs-dir
  (file-name-directory (or load-file-name
                           (when (boundp 'bytecomp-filename) bytecomp-filename)
                           buffer-file-name))
  "Directory of custom-emacs"
)

; (add-to-list 'load-path cust-emacs-dir)

(load-file (concat (file-name-as-directory cust-emacs-dir) "loadpaths/themes/flatland-theme.el"))

(if 
	(display-graphic-p)
	(progn
		(load-file (concat (file-name-as-directory cust-emacs-dir) "loadpaths/fullscreen.el"))
		(require 'fullscreen)
		(fullscreen)
	)
)

(load-file (concat (file-name-as-directory cust-emacs-dir) "loadpaths/epy/epy-init.el"))

; (load-file "loadpaths/fullscreen.el")
; (require 'fullscreen)
; (fullscreen)
(menu-bar-mode -1)

(global-linum-mode t)

 ;; (setq inhibit-startup-message t)

(setq user-full-name "Safiyat Reza")
(setq user-mail-address "md.reza@snapdeal.com")

(setq make-backup-files nil)

(defalias 'yes-or-no-p 'y-or-n-p)

(global-set-key (kbd "C-/") 'comment-or-uncomment-region)

 ;; (require 'autopair)

 ;; (require 'auto-complete-config)
 ;; (ac-config-default)

(savehist-mode t)

(desktop-save-mode 1)

(setq-default ispell-program-name "/usr/bin/aspell")
;; (setq text-mode-hook '(lambda() (flyspell-mode t) ))

(epy-setup-checker "pyflakes %f")
(require 'highlight-indentation)
(add-hook 'python-mode-hook 'highlight-indentation)

;; Set transparency of emacs
 (defun transparency (value)
   "Sets the transparency of the frame window. 0=transparent/100=opaque"
   (interactive "nTransparency Value 0 - 100 opaque:")
   (set-frame-parameter (selected-frame) 'alpha value))

(global-set-key [C-tab] 'next-multiframe-window)
(global-set-key [C-S-iso-lefttab] 'previous-multiframe-window)

(global-set-key [s-tab] 'next-buffer)
(global-set-key [s-S-iso-lefttab] 'previous-buffer)

(load-file (concat (file-name-as-directory cust-emacs-dir) "loadpaths/fill-column-indicator.el"))
(require 'fill-column-indicator)
(define-globalized-minor-mode
 global-fci-mode fci-mode (lambda () (fci-mode 1)))
(global-fci-mode t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 ;; (defun fci-rule-column-set (value)
   ;; "Sets the column at which the rule is displayed"
   ;; (defcustom fci-rule-column value))
