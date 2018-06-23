(custom-set-variables
 '(ansi-color-faces-vector          ; Add support for these faces.
   [default bold shadow italic underline bold bold-italic bold])
 '(column-number-mode t)            ; Show column number in the mode line.
 '(display-time-mode t)             ; Show system time
 '(tool-bar-mode nil)               ; Hide tool bar.
 '(menu-bar-mode nil)               ; Hide menu bar.
 '(scroll-bar-mode nil)             ; Hide menu bar.
 ;; '(display-battery-mode t)       ; Show battery status
 ;; '(send-mail-function (quote sendmail-send-it))
)

(setq theme-file "loadpath/themes/flatland-emacs/flatland-theme.el")
(load-file (concat (file-name-as-directory cust-emacs-dir) theme-file)) ; Load theme.

;; Set transparency of emacs
(defun opacity (value)
   "Sets the opacity of the frame window. 0=transparent/100=opaque"
   (interactive "nOpacity Value 0 - 100 opaque:")
   (set-frame-parameter (selected-frame) 'alpha value))


(require 'frame)

;; Hook to let the cursor be white.
(defun set-cursor-hook (frame)
(modify-frame-parameters
 frame (list (cons 'cursor-color 'white))))
;; Add the hook to the list of hooks after make frame funtion.
(add-hook 'after-make-frame-functions 'set-cursor-hook)
