(print (current-time-string))

(setq user-full-name "Md Safiyat Reza")
(setq user-mail-address "safiyat@voereir.com")

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ;; ("marmalade" . "https://marmalade-repo.org/packages/")
			 ("melpa" . "http://melpa.org/packages/")))

(defconst cust-emacs-dir     ;; Find the path of the current directory.
  (file-name-directory (or load-file-name
			   (when (boundp 'bytecomp-filename) bytecomp-filename)
			   buffer-file-name))
  "Directory of custom-emacs"
)

(load-file (concat (file-name-as-directory cust-emacs-dir) "appearance.el"))
(load-file (concat (file-name-as-directory cust-emacs-dir) "editing.el"))
(load-file (concat (file-name-as-directory cust-emacs-dir) "environment.el"))
(load-file (concat (file-name-as-directory cust-emacs-dir) "keybindings.el"))
