(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t)
  (package-initialize))

;; turn on vim bindings
(require 'evil)
(evil-mode 1)

;; global key bindings
(define-key evil-normal-state-map "," 'execute-extended-command)

;; a function to create a new empty buffer
(defun cov-new-empty-buffer ()
  "create new empty buffer.
URL: http://ergoemacs.org/emacs/emacs_new_empty_buffer.html"
  (interactive)
  (let ((-buf (generate-new-buffer "empty")))
    (switch-to-buffer -buf)
    (funcall initial-major-mode)
    (setq buffer-offer-save t)))

;; powerline is the bar at the bottom. helps with vim mode
(require 'powerline)
(powerline-center-evil-theme)
;; (powerline-default-theme)
;; (powerline-center-theme)
;; (powerline-vim-theme)
;; (powerline-nano-theme)

;; auto-complete
(ac-config-default)

;; gruvbox theme
(load-theme 'gruvbox t)

;; c stuff
(setq c-default-style "linux"
      c-basic-offset 4)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("10e231624707d46f7b2059cc9280c332f7c7a530ebc17dba7e506df34c5332c4" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
