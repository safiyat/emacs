(global-set-key (kbd "C-/") 'comment-or-uncomment-region-or-line)

(global-set-key (kbd "C-^") 'enlarge-window)
(global-set-key (kbd "C-}") 'enlarge-window-horizontally)
(global-set-key (kbd "C-{") 'shrink-window-horizontally)

(global-set-key [C-tab] 'next-multiframe-window)
(global-set-key [C-S-iso-lefttab] 'previous-multiframe-window)

(global-set-key [s-tab] 'next-buffer)
(global-set-key [s-S-iso-lefttab] 'previous-buffer)


(setq help-char nil)          ; To enable C-h for 'backward-delete-char
(setq kill-region nil)        ; To enable C-w for 'backward-kill-word
(setq universal-argument nil) ; To enable C-u for 'backward-kill-sentence

(global-set-key [C-h] 'backward-delete-char)
(global-set-key [C-w] 'backward-kill-word)
(global-set-key [C-u] 'backward-kill-sentence)
