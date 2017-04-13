;;; package --- defines keybindings
;; describes keybindings and configures evil mode

;;; Commentary:
;; this file replaces my init-editor file.  i think it's a little less ambiguous
;; and i moved some visual elements to the main init.el for now.

;;; Code:
(defun cov--config-evil ()
  "Config evil mode states and keybindings."
  (delete 'multi-term evil-insert-state-modes)
  (delete 'eshell-mode evil-insert-state-modes))

(defun cov--config-evil-leader ()
  "Config leader keys etc."
  (evil-leader/set-leader ",")
  (evil-leader/set-key
    "b" 'helm-mini
    "x" 'helm-M-x
    "E" 'eval-buffer
    "." 'golden-ratio
    "o" 'projectile-find-file-other-window
    "I" 'cov-edit-init))

(use-package evil
  :ensure t
  :config
  (add-hook 'evil-mode-hook 'cov--config-evil)
  (evil-mode 1)
  (use-package evil-leader
    :ensure t
    :config
    (global-evil-leader-mode)
    (cov--config-evil-leader))
  (use-package evil-surround
    :ensure t
    :config
    (global-evil-surround-mode)))

(provide 'cov-keybind)
;;; cov-keybind.el ends here
