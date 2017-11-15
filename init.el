;; Make emacs less annoying
(setq inhibit-splash-screen t)
(setq ring-bell-function 'ignore)
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

;;
(setq sentence-end-double-space nil)

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
