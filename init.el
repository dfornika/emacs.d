(setq inhibit-splash-screen t)
(setq ring-bell-function 'ignore)
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(eval-when-compile
  (require 'use-package))

(use-package doom-themes
  :ensure t
  :config (load-theme 'doom-nord t))

(use-package cider
  :ensure t)

(use-package multiple-cursors
  :ensure t)

(use-package magit
  :ensure t)

;; Line numbers
(setq linum-format "%d ")
(global-linum-mode 1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("947190b4f17f78c39b0ab1ea95b1e6097cc9202d55c73a702395fc817f899393" default)))
 '(package-selected-packages (quote (doom-themes cider cargo rust-mode dracula-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
