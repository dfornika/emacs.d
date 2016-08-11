;; Make emacs less annoying
(setq inhibit-splash-screen t)
(setq ring-bell-function 'ignore)
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

;;
(setq sentence-end-double-space nil)

;; Add the MELPA repository to the package manager
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t))

;; Thanks slipset
;; https://raw.githubusercontent.com/slipset/emacs/master/elisp/ensure-packages.el
(require 'cl)
(setq url-http-attempt-keepalives nil)

(defvar ensure-packages
  '(bind-key
    magit
    multiple-cursors)
  "A list of packages to ensure are installed at launch.")

(defun ensure-packages-package-installed-p (p)
  (cond ((package-installed-p p) t)
	(t nil)))
  
(defun ensure-packages-installed-p ()
  (mapcar 'ensure-packages-package-installed-p ensure-packages))
  
(defun ensure-packages-install-missing ()
  (interactive)
  (unless (every 'identity (ensure-packages-installed-p))
    ;; check for new packages (package versions)
    (message "%s" "Emacs is now refreshing its package database...")
    (package-refresh-contents)
    (message "%s" " done.")
    ;; install the missing packages
    (dolist (p ensure-packages)
      (when (not (package-installed-p p))
	(package-install p)))))

(ensure-packages-install-missing)

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

;; Line numbers
(setq linum-format "%d ")
(global-linum-mode 1)

;; Org Mode
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(setq org-todo-keywords
        '((sequence "TODO" "IN-PROGRESS" "WAITING" "DONE")))

;; Change behaviour for window splitting
(defun my/vsplit-last-buffer (prefix)
  "Split the window vertically and display the previous buffer."
  (interactive "p")
  (split-window-vertically)
  (other-window 1 nil)
  (if (= prefix 1)
      (switch-to-next-buffer)))
(defun my/hsplit-last-buffer (prefix)
  "Split the window horizontally and display the previous buffer."
  (interactive "p")
  (split-window-horizontally)
  (other-window 1 nil)
  (if (= prefix 1) (switch-to-next-buffer)))
(bind-key "C-x 2" 'my/vsplit-last-buffer)
(bind-key "C-x 3" 'my/hsplit-last-buffer)

;; Enter cider mode when entering the clojure major mode
(add-hook 'clojure-mode-hook 'cider-mode)

;; Turn on auto-completion with Company-Mode
(global-company-mode)
(add-hook 'cider-repl-mode-hook #'company-mode)
(add-hook 'cider-mode-hook #'company-mode)

;; Replace return key with newline-and-indent when in cider mode.
(add-hook 'cider-mode-hook '(lambda () (local-set-key (kbd "RET") 'newline-and-indent)))

;; Show parenthesis mode
(show-paren-mode 1)

;; Evaluate an emacs lisp expression and replace it by its result.
(defun eval-and-replace ()
  "Replace the preceding sexp with its value."
  (interactive)
  (backward-kill-sexp)
  (condition-case nil
    (prin1 (eval (read (current-kill 0)))
      (current-buffer))
    (error (message "Invalid expression")
      (insert (current-kill 0)))))

(global-set-key (kbd "C-c e") 'eval-and-replace)
