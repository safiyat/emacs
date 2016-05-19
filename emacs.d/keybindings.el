;; Works on CMD?
(global-set-key (kbd "C-/") 'comment-or-uncomment-region-or-line)

(global-set-key (kbd "C-^") 'enlarge-window)
(global-set-key (kbd "C-}") 'enlarge-window-horizontally)
(global-set-key (kbd "C-{") 'shrink-window-horizontally)

;; Works on CMD?
(global-set-key [C-tab] 'next-multiframe-window)
(global-set-key [C-S-iso-lefttab] 'previous-multiframe-window)

;; Works on CMD?
(global-set-key [s-tab] 'next-buffer)
(global-set-key [s-S-iso-lefttab] 'previous-buffer)


(setq-default help-char nil)          ; To enable C-h for 'backward-delete-char
(setq-default kill-region nil)        ; To enable C-w for 'backward-kill-word
(setq-default universal-argument nil) ; To enable C-u for 'backward-kill-sentence

(defun backward-kill-line (arg)
  "Kill ARG lines backward."
  (interactive "p")
  (kill-line (- 1 arg)))
(global-set-key (kbd "C-u") 'backward-kill-line)
(global-set-key (kbd "C-h") 'backward-delete-char)
(global-set-key (kbd "C-w") 'backward-kill-word)

(global-set-key (kbd "<M-S-up>") 'scroll-down-line)
(global-set-key (kbd "<M-S-down>") 'scroll-up-line)

(global-set-key (kbd "<M-S-up>") 'scroll-down-line)
(global-set-key (kbd "<M-S-down>") 'scroll-up-line)

(global-set-key (kbd "<C-f5>") 'revert-buffer)
