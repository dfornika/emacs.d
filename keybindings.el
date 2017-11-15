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
