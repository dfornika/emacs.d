(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("947190b4f17f78c39b0ab1ea95b1e6097cc9202d55c73a702395fc817f899393" default)))
 '(package-selected-packages (quote (cider cargo rust-mode dracula-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(setq inhibit-splash-screen t)
(setq ring-bell-function 'ignore)
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

;;
(setq sentence-end-double-space nil)

(setq user-init-dir "~/.emacs.d/")

(defun load-user-file (file)
  (interactive "f")
  "Load a file in current user's configuration directory"
  (load-file (expand-file-name file user-init-dir)))

(load-user-file "packages.el")
(load-user-file "keybindings.el")
(load-user-file "org.el")

;; Line numbers
(setq linum-format "%d ")
(global-linum-mode 1)
