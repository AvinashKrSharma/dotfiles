					; ~/.emacs.d/my-loadpackages.el
					; loading package
(load "~/.emacs.d/my-packages.el")

(require 'magit)
(require 'evil)
(evil-mode t)
(define-key global-map (kbd "C-c m") 'magit-status)

(add-hook 'term-mode-hook (lambda()
			        (setq yas-dont-activate t)))
