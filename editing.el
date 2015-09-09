(setq-default indent-tabs-mode nil)

(add-to-list 'load-path (concat (file-name-as-directory cust-emacs-dir) "loadpaths/ac"))
(require 'auto-complete-config)
;; (ac-config-default)
(setq-default auto-complete-mode nil)

(load-file (concat (file-name-as-directory cust-emacs-dir) "loadpaths/autopair.el"))
(setq-default autopair-mode t)

(defun comment-or-uncomment-region-or-line ()
    "Comments or uncomments the region or the current line if there's no active region."
    (interactive)
    (let (beg end)
        (if (region-active-p)
            (setq beg (region-beginning) end (region-end))
          (setq beg (line-beginning-position) end (line-end-position)))
        ;; (print beg)
        (goto-char beg)
        ;; (print end)
        (set-mark-command t)
        (goto-char end)
        (comment-or-uncomment-region beg end))
    )
