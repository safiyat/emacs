(add-to-list 'load-path (concat (file-name-as-directory cust-emacs-dir) "loadpath/ac"))
(require 'auto-complete-config)
;; (ac-config-default)
(setq-default auto-complete-mode t)

(setq-default indent-tabs-mode nil)

(load-file (concat (file-name-as-directory cust-emacs-dir) "loadpath/autopair.el"))
(require 'autopair)
(autopair-global-mode)

(load-file (concat (file-name-as-directory cust-emacs-dir) "loadpath/fill-column-indicator.el"))
(require 'fill-column-indicator)
(setq-default fci-mode nil)
(setq-default fci-rule-column 80)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(add-hook 'before-save-hook (lambda () (untabify (point-min) (point-max))))

(defun comment-or-uncomment-region-or-line ()
    "Comments or uncomments the region or the current line if there's no active region."
    (interactive)
    (let (beg end)
        (if (region-active-p)
            (setq beg (region-beginning) end (region-end))
          (setq beg (line-beginning-position) end (line-end-position)))
        ;; (print beg)
        ;; (goto-char beg)
        ;; (print end)
        ;; (set-mark-command t)
        ;; (goto-char end)
        (comment-or-uncomment-region beg end))
    )
