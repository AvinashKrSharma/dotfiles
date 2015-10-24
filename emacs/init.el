(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)

(defun ensure-package-installed (&rest packages)
  "Assure every package is installed, ask for installation if it’s not.

Return a list of installed packages or nil for every skipped package."
  (mapcar
   (lambda (package)
     (if (package-installed-p package)
         nil
       (if (y-or-n-p (format "Package %s is missing. Install it? " package))
           (package-install package)
         package)))
   packages))

;; Make sure to have downloaded archive description.
(or (file-exists-p package-user-dir)
    (package-refresh-contents))

;; Activate installed packages
(package-initialize)

(ensure-package-installed 'evil 'magit 'powerline 'git-gutter 'web-mode 'smartparens 'helm 'org 'evil-surround 'expand-region 'smex  'company 'flycheck 'angularjs-mode 'yasnippet 'auto-complete 'projectile 'rainbow-delimiters 'smooth-scrolling 'js3-mode 'rainbow-mode)

(require 'evil)
(evil-mode t)

(require 'evil-surround)
(global-evil-surround-mode 1)

(require 'powerline)
(powerline-default-theme)

(require 'git-gutter)
(global-git-gutter-mode +1)

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(require 'smartparens-config)

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(require 'js3-mode)
(defun ome-tern-setup ()
  (when (el-get-package-installed-p 'js2-mode)
    (add-hook 'js2-mode-hook (lambda () (tern-mode t))))
  (when (el-get-package-installed-p 'js3-mode)
    (add-hook 'js3-mode-hook (lambda () (tern-mode t))))
  (setq tern-command (cons (executable-find "tern") '()))
  (eval-after-load 'tern
    '(progn
       (require 'tern-auto-complete)
       (tern-ac-setup))))

(require 'helm)
(helm-mode t)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)

(require 'org)

(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

(require 'smex)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(smex-initialize)

(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)

(require 'auto-complete-config)
(ac-config-default)

(require 'yasnippet)
(setq yas-snippet-dirs '("~/.emacs.d/elpa/yasnippet/snippets"))
(yas-global-mode 1)

(add-to-list 'yas-snippet-dirs "~/.emacs.d/elpa/angularjs-mode/snippets")

(require 'projectile)
(projectile-global-mode)

(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(require 'smooth-scrolling)

(setq css-indent-offset 2)

(add-hook 'css-mode-hook
          (lambda ()
            (linum-mode 1)))

(defun web-mode-setup ()
  (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.hbs\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

  (defun web-mode-hook ()
    ;; indentation
    ;; HTML offset indentation
    (setq web-mode-markup-indent-offset 2)
    ;; CSS offset indentation
    (setq web-mode-code-indent-offset 2)
    ;; Script offset indentation (for JavaScript, Java, PHP, etc.)
    (setq web-mode-css-indent-offset 2)
    ;; HTML content indentation
    (setq web-mode-indent-style 2)

    ;; padding
    ;; For <style> parts
    (setq web-mode-style-padding 1)
    ;; For <script> parts
    (setq web-mode-script-padding 1)
    ;; For multi-line blocks
    (setq web-mode-block-padding 0))

  (add-hook 'web-mode-hook 'web-mode-hook))
(web-mode-setup)

(defun less-css-mode-setup ()
  (setq less-css-compile-at-save t))
(less-css-mode-setup)

(when (executable-find "lessc")

(defun rainbow-mode-setup ()
  (add-hook 'css-mode-hook 'rainbow-mode))
(rainbow-mode-setup)
