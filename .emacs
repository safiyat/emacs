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

(load-file "~/.emacs.d/git-repo/loadpaths/themes/flatland-theme.el")

(if 
	(display-graphic-p)
	(progn
		(load-file "~/.emacs.d/git-repo/loadpaths/fullscreen.el")
		(require 'fullscreen)
		(fullscreen)
	)
)

(load-file "~/.emacs.d/git-repo/loadpaths/epy/epy-init.el")

; (load-file "~/.emacs.d/git-repo/loadpaths/fullscreen.el")
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
(setq text-mode-hook '(lambda() (flyspell-mode t) ))
