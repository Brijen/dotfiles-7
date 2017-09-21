;;; cov-py --- Summary:
;;; python settings
;;; Commentary:
;;; use elpy to extend python functions
;;; Code:
(require 'elpy)
(add-hook 'python-mode #'elpy-enable)

(require 'company-jedi)
(add-to-list 'company-backends 'company-jedi)

(require 'jedi)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

(require 'virtualenvwrapper)
(venv-initialize-interactive-shells)
(venv-initialize-eshell)
(setq venv-location (concat (getenv "HOME") "/code/python/venv"))

(setq python-indent-offset 2)

;; workaround for python repl bug. should be fixed in 25.2
(with-eval-after-load 'python
  (defun python-shell-completion-native-try ()
    "Return non-nil if can trigger native completion."
    (let ((python-shell-completion-native-enable t)
	  (python-shell-completion-native-output-timeout
	   python-shell-completion-native-try-output-timeout))
      (python-shell-completion-native-get-completions
       (get-buffer-process (current-buffer))
       nil "_"))))

(provide 'cov-py)
;;; cov-py.el ends here
