;;;package --- Summary
;-*-Emacs-Lisp-*-
;;; Commentary:

(setq user-full-name 
      "Avinash")
	  
(setq initial-buffer-choice 
      t)
(setq initial-scratch-message 
      "")
(setq-default indent-tabs-mode 
              nil)

(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

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

(menu-bar-mode -1)

(tool-bar-mode -1)

(scroll-bar-mode -1)

(ensure-package-installed 'evil 'magit 'powerline 'airline-themes 'git-gutter 'web-mode 'smartparens 'helm 'helm-projectile 'org 'evil-surround 'expand-region 'smex  'company 'flycheck 'angularjs-mode 'yasnippet 'auto-complete 'projectile 'rainbow-delimiters 'smooth-scrolling 'js3-mode 'rainbow-mode 'emmet-mode 'mmm-mode 'which-key 'sr-speedbar 'multiple-cursors 'ace-jump-mode 'switch-window 'ac-js2 'less-css-mode 'sass-mode 'scss-mode 'autopair 'column-enforce-mode 'undo-tree 'anzu 'command-log-mode 'skewer-mode 'js2-refactor)

(require 'evil)
(evil-mode t)

(require 'evil-surround)
(global-evil-surround-mode 1)

(require 'git-gutter)
(global-git-gutter-mode +1)

(autopair-global-mode)

(global-undo-tree-mode)

(show-paren-mode)

(global-hl-line-mode -1)

(winner-mode t)

(autoload 'ace-jump-mode 
  "ace-jump-mode" 
  "Emacs quick move minor mode"
  t)
(autoload 'ace-jump-mode-pop-mark 
  "ace-jump-mode" 
  "Ace jump back:-"
  t)
	  
(global-anzu-mode +1)

(add-to-list 'auto-mode-alist
             '("\\.scss\\'" . scss-mode))
(add-to-list 'auto-mode-alist
             '("\\.sass\\'" . sass-mode))

(require 'smartparens-config)

(add-hook 'js2-mode-hook
	  'column-enforce-mode)

(add-hook 'js2-mode-hook 
          'ac-js2-mode)

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(setq js2-highlight-level 3)

(require 'helm)
(helm-mode t)
(helm-autoresize-mode 1)
(setq helm-split-window-in-side-p
      t)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)

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
(ac-set-trigger-key "TAB")
(ac-set-trigger-key "<tab>")
(setq-default ac-dwim nil)
(setq-default ac-use-menu-map t)
(define-key ac-menu-map (kbd "<backtab>") 'ac-previous)

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

(when (executable-find "lessc"))

(defun rainbow-mode-setup ()
  (add-hook 'css-mode-hook 'rainbow-mode))
(rainbow-mode-setup)

(require 'mmm-mode)
(setq mmm-global-mode 'maybe)

(which-key-mode 1)

(require 'powerline)
(require 'airline-themes)
(load-theme 'airline-badwolf)

(require 'ido)
    (ido-mode t)

(defun my-move-line-up ()
  "Move the current line up by one step"
  (interactive)
  (transpose-lines 1)
  (forward-line -2))

(defun my-move-line-down ()
  "Move the current line down by one step"
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1))
  
(defun my-eval-and-replace ()
  "Replace expression to the left with it's value in the current buffer"
  (interactive)
  (backward-kill-sexp)
  (prin1 (eval (read (current-kill 0)))
	 (current-buffer)))
  
(defun my-reload-current-file ()
  "Reloads the file loaded in current buffer from the disk"
  (interactive)
  (cond (buffer-file-name (progn (find-alternate-file buffer-file-name)
                                 (message "File reloaded")))
        (t (message "You're not editing a file!"))))
		

(defvar show-paren-delay 0
  "Delay (in seconds) before matching paren is highlighted.")

(defface linum-current
  '((t (:inherit linum :weight bold :underline "#555")))
  "The current line number.")

(defun my-linum-get-format-string ()
  (let* ((width (max 4 (1+ (length (number-to-string
                                    (count-lines (point-min) (point-max)))))))
         (format (concat "%" (number-to-string width) "d "))
         (current-line-format (concat "%-" (number-to-string width) "d ")))
    (setq my-linum-format-string format)
    (setq my-linum-current-line-format-string current-line-format)))

(defvar my-linum-current-line-number 0)

(setq linum-format 'my-linum-relative-line-numbers)

(defun my-linum-relative-line-numbers (line-number)
  (let* ((offset (abs (- line-number my-linum-current-line-number)))
         (linum-display-value (if (= 0 offset)
                                  my-linum-current-line-number
                                offset))
         (format-string (if (= my-linum-current-line-number line-number) my-linum-current-line-format-string my-linum-format-string))
         (face (if (= my-linum-current-line-number line-number) 'linum-current 'linum)))
    (propertize (format format-string linum-display-value) 'face face)))

(defadvice linum-update (around my-linum-update)
  (let ((my-linum-current-line-number (line-number-at-pos)))
    ad-do-it))
(ad-activate 'linum-update)

;;; Set up relative line numbering to mimic `:set number relativenumber`.
(global-linum-mode t)
(add-hook 'linum-before-numbering-hook 'my-linum-get-format-string)

(defun my-apply-keyboard-bindings (pair)
  "Apply keyboard-bindings for supplied list of key-pair values"
  (global-set-key (kbd (car pair))
                  (cdr pair)))

(defvar my-custom-keyboard-bindings 
  '(("C->" . ace-jump-mode)
    ("C-<" . ace-jump-mode-pop-mark)
    ("M-/" . undo-tree-visualize)
    ("C-M-z" . switch-window)
    ("<f5>" . my-reload-current-file)))

(mapc 'my-apply-keyboard-bindings
      my-custom-keyboard-bindings)

;;emacs ends
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("beeb5ac6b65fcccfe434071d4624ff0308b5968bf2f0c01b567d212bcaf66054" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
