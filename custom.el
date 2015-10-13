;; TO DO
;;      Figure out custom-set-variables, setq and setq-default.
;;      Test various settings of fringe-mode.
;;      Multiple cursors.
;;      Virtualenv
;;      Python
;;      Flymake
;;      Pymacs
;;    Auto-complete
;;      ac-fuzzy-complete
;;      ac-user-dictionary   - ac-dictionary-directories

;;      Override C-h to use keybindings.el
;;      Override C-w to use keybindings.el
;;      Override C-u to use keybindings.el


(setq user-full-name "Md Safiyat Reza")
(setq user-mail-address "md.reza@snapdeal.com")

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                        ;; ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))

(defconst cust-emacs-dir     ;; Find the path of the current directory.
  (file-name-directory (or load-file-name
                           (when (boundp 'bytecomp-filename) bytecomp-filename)
                           buffer-file-name))
  "Directory of custom-emacs"
)

#(defun post-frame-create (&optional frame)
#"Functions to be run after each new frame is created."
#    (load-file (concat (file-name-as-directory cust-emacs-dir) "appearance.el"))
#    (load-file (concat (file-name-as-directory cust-emacs-dir) "editing.el"))
#    (load-file (concat (file-name-as-directory cust-emacs-dir) "environment.el"))
#    (load-file (concat (file-name-as-directory cust-emacs-dir) "keybindings.el"))
#)

#(add-hook 'after-make-frame 'post-frame-create)

(load-file (concat (file-name-as-directory cust-emacs-dir) "appearance.el"))
(load-file (concat (file-name-as-directory cust-emacs-dir) "editing.el"))
(load-file (concat (file-name-as-directory cust-emacs-dir) "environment.el"))
(load-file (concat (file-name-as-directory cust-emacs-dir) "keybindings.el"))
