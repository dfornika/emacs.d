;; Settings for multiple-cursors
(require 'multiple-cursors)
(global-set-key (kbd "M-c") 'mc/edit-lines)
(global-set-key (kbd "M-j") 'mc/mark-next-like-this)
(global-set-key (kbd "M-k") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
