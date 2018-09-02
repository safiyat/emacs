;; Keyboard shorctcuts for use with command line.

;; C - ctrl or control key
;; M - alt or option key
;; s - COMMAND key on MAC

;; Commands to mimic (if not replicate) the shortcuts supported in the linux commandline environment.
;; A concise list can be found here:
;;     https://en.wikipedia.org/wiki/Table_of_keyboard_shortcuts#Command_line_shortcuts

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

;; Other shortcuts

(global-set-key (kbd "C-/") 'comment-or-uncomment-region-or-line)

;; Windows are the buffers you see on-screen (in split view, maybe), not different frames (tabs).
(global-set-key (kbd "s-]") 'next-multiframe-window)
(global-set-key (kbd "s-[") 'previous-multiframe-window)

;; Scroll the file down by a line
(global-set-key (kbd "<s-up>") 'scroll-down-line)
;; Scroll the file up by a line
(global-set-key (kbd "<s-down>") 'scroll-up-line)

(global-set-key (kbd "C-x C-r") 'revert-buffer)

