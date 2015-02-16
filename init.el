;; Make emacs less annoying
(setq inhibit-splash-screen t)
(setq ring-bell-function 'ignore)

;; Add the MELPA repository to the package manager
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t))

;; Remap navigation keys to the home row
(global-unset-key (kbd "C-p"))
(global-unset-key (kbd "C-b"))
(global-unset-key (kbd "C-n"))
(global-unset-key (kbd "C-f"))
(global-unset-key (kbd "M-k"))
(global-set-key (kbd "C-k") 'previous-line)
(global-set-key (kbd "C-h") 'backward-char)
(global-set-key (kbd "C-j") 'next-line)
(global-set-key (kbd "C-l") 'forward-char)

(global-set-key (kbd "M-h") 'backward-word)
(global-set-key (kbd "M-l") 'forward-word)

;; Settings for multiple-cursors
(require 'multiple-cursors)
(global-set-key (kbd "M-c") 'mc/edit-lines)
(global-set-key (kbd "M-j") 'mc/mark-next-like-this)
(global-set-key (kbd "M-k") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; Org Mode
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(setq org-todo-keywords
        '((sequence "TODO" "IN-PROGRESS" "WAITING" "DONE")))
