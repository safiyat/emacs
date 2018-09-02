;; Display the time in the beginning of the *Messages*.
(print (current-time-string))



;; Set the user name and email.
(setq user-full-name "Md Safiyat Reza")
(setq user-mail-address "reza.safiyat@gmail.com")



;; Set the package archives to load from when needed.
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ;; ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))



;; Define the path to the emacs.d directory as cust-emacs-dir
(defconst cust-emacs-dir     ;; Find the path of the current directory.
  (file-name-directory (or load-file-name
                           (when (boundp 'bytecomp-filename) bytecomp-filename)
                           buffer-file-name))
  "Directory of custom-emacs"
)



;; List of custom elisp files to be laoded.
(setq custom-files '("server-mode.el" "appearance.el" "editor.el" "tramp.el" "keybindings.el"))

;; Load the said files.
(let (filename)
  (dolist (filename custom-files)
    (load-file (concat (file-name-as-directory cust-emacs-dir) filename))))

