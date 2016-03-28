(custom-set-variables
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(column-number-mode t)            ; Show column number in the mode line.
 '(display-battery-mode t)          ; Show battery status
 '(display-time-mode t)             ; Show system time
 '(save-place t nil (saveplace))    ; Point goes to the last place where it was when you previously visited the same file.
 '(show-paren-mode t)               ; Highlight matching parenthesis and other characters.
 '(size-indication-mode t)          ; Show size of buffer on the mode line.
 '(tool-bar-mode nil)               ; Hide tool bar.
 '(menu-bar-mode nil)               ; Hide menu bar.
 '(scroll-bar-mode nil)             ; Hide menu bar.
 '(send-mail-function (quote sendmail-send-it))
)

(global-linum-mode t) ; Enable line numbers globally.
(visual-line-mode t)  ; Enable word wrapping in the english format.
(toggle-truncate-lines t) ; Disable word wrap.
(blink-cursor-mode t)
;;(set-cursor-color 'white)
;;(cursor-type hbar)
(load-file (concat (file-name-as-directory cust-emacs-dir) "loadpath/themes/flatland-theme.el")) ; Load theme.

;; Set transparency of emacs
(defun opacity (value)
   "Sets the opacity of the frame window. 0=transparent/100=opaque"
   (interactive "nOpacity Value 0 - 100 opaque:")
   (set-frame-parameter (selected-frame) 'alpha value))


(require 'frame)
(defun set-cursor-hook (frame)
(modify-frame-parameters
 frame (list (cons 'cursor-color "White"))))

(add-hook 'after-make-frame-functions 'set-cursor-hook)
