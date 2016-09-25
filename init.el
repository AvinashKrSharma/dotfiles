;;; package --- Summary
;;; Commentary:
;;; Code:

;Repo
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(package-initialize)

;packages
;Create repositories cache, if required
(when (not package-archive-contents)
  (package-refresh-contents))

;Declare a list of required packages
(defvar packages-list
  '(helm
    multiple-cursors
    magit
    ace-jump-mode
    powerline
    switch-window
    buffer-move
    undo-tree
    material-theme
    evil
    evil-leader
    evil-magit
    key-chord
    git-gutter
    web-mode
    smartparens
    helm-projectile
    org
    evil-surround
    expand-region
    smex
    company
    flycheck
    jsx-mode
    neotree
    angular-mode
    yasnippet
    auto-complete
    ag
    projectile
    rainbow-delimiters
    smooth-scrolling
    js3-mode
    rainbow-mode
    emmet-mode
    mmm-mode
    which-key
    sr-speedbar
    ac-js2
    less-css-mode
    sass-mode
    scss-mode
    autopair
    column-enforce-mode
    anzu
    command-log-mode
    hackernews
    skewer-mode
    js2-refactor)
)

;Install required packages
(mapc (lambda (p)
        (package-install p))
      packages-list)


;; UI
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;Activate material theme
(load-theme 'material
            t)

;Disable splash message, start *scratch* buffer by default
(setq initial-buffer-choice
      t)
(setq initial-scratch-message
      "")

;Enforce spaces for indentation, instead of tabs
(setq-default indent-tabs-mode
              nil)

;Enable windmove
(windmove-default-keybindings)

(setq x-select-enable-clipboard t)
(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(global-linum-mode t)
(setq-default truncate-lines t)

;; Remember the cursor position of files when reopening them
(setq save-place-file "~/.emacs.d/saveplace")
(setq-default save-place t)

;; show the column number in the status bar
(column-number-mode t)

;; Powerline
(require 'powerline)
(powerline-center-evil-theme)
(setq powerline-default-separator
      'wave)

;; Highlight cursor line
(global-hl-line-mode t)

;; Make lines longer than 80 highlighted
(setq whitespace-line-column 80) ;; limit line length
(setq whitespace-style '(face lines-tail))
(global-whitespace-mode t)
(add-hook 'prog-mode-hook 'whitespace-mode)

(require 'mmm-mode)
(setq mmm-global-mode 'maybe)

;; Git Gutter
(global-git-gutter-mode 1)
;; If you enable global minor mode
(require 'git-gutter)
(global-git-gutter-mode t)
;; ;; If you would like to use git-gutter.el and linum-mode
(git-gutter:linum-setup)

(require 'smooth-scrolling)
(smooth-scrolling-mode t)
(setq smooth-scroll-margin 1)

(setq inhibit-startup-screen t)

(global-undo-tree-mode)

(show-paren-mode t)
(require 'smartparens-config)
(smartparens-global-mode t)
(show-smartparens-global-mode t)
;; Do not highlight paren area
(setq sp-highlight-pair-overlay nil)
(setq sp-highlight-wrap-overlay nil)
(setq sp-highlight-wrap-tag-overlay nil)
(setq show-paren-delay 0)

(autoload 'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)
(autoload 'ace-jump-mode-pop-mark
  "ace-jump-mode"
  "Ace jump back:-"
  t)

(add-hook 'js2-mode-hook
	  'column-enforce-mode)

(add-hook 'js2-mode-hook
          'ac-js2-mode)

(add-to-list 'auto-mode-alist
             '("\\.scss\\'" . scss-mode))
(add-to-list 'auto-mode-alist
             '("\\.sass\\'" . sass-mode))
(add-to-list 'auto-mode-alist
             '("\\.js\\'" . js2-mode))

(setq js2-highlight-level 3)

(require 'helm-config)
(require 'helm)
(helm-mode 1)
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
(global-company-mode t)
(setq company-tooltip-limit 12)                      ; bigger popup window
(setq company-idle-delay .1)                         ; decrease delay before autocompletion popup shows
(setq company-echo-delay 0)                          ; remove annoying blinking
(setq company-begin-commands '(self-insert-command)) ; start autocompletion only after typing
(setq company-dabbrev-downcase nil)                  ; Do not convert to lowercase
(setq company-selection-wrap-around t)               ; continue from top when reaching bottom
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-inf-ruby))
;; Hack to trigger candidate list on first TAB, then cycle through candiates with TAB
(defvar tip-showing nil)
(eval-after-load 'company
  '(progn
     (define-key company-active-map (kbd "TAB")  (lambda ()
       (interactive)
       (company-complete-common)
       (if tip-showing
         (company-select-next))
     ))
     (define-key company-active-map [tab] 'company-select-next)))

(defun company-pseudo-tooltip-on-explicit-action (command)
  "'company-pseudo-tooltip-frontend',  COMMAND - param.  but only on an explicit action."
  (when (company-explicit-action-p)
    (setq tip-showing t)
    (company-pseudo-tooltip-frontend command)))

(defun company-echo-metadata-on-explicit-action-frontend (command)
  "'company-mode' front-end showing the documentation in the echo area.  COMMAND - param."
  (pcase command
    (`post-command (when (company-explicit-action-p)
                     (company-echo-show-when-idle 'company-fetch-metadata)))
    (`hide
      (company-echo-hide)
      (setq tip-showing nil)
     )))

(setq company-frontends '(company-pseudo-tooltip-on-explicit-action company-echo-metadata-on-explicit-action-frontend company-preview-if-just-one-frontend))
;; End TAB cycle hack


(defadvice save-buffer (before save-buffer-always activate)
  "Always save buffer."
  (set-buffer-modified-p t))


(require 'flycheck)
(global-flycheck-mode)

(require 'auto-complete-config)
(ac-config-default)
(ac-set-trigger-key "TAB")
(ac-set-trigger-key "<tab>")
(setq-default ac-dwim nil)
(setq-default ac-use-menu-map t)

(require 'yasnippet)
(setq yas-snippet-dirs '("~/.emacs.d/elpa/yasnippet*/snippets"))
(yas-global-mode 1)

(require 'projectile)
(setq projectile-enable-caching t)
(setq projectile-globally-ignored-directories (append '("node_modules" ".git") projectile-globally-ignored-directories))
(projectile-mode t)
(setq projectile-sort-order (quote recently-active))

(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(setq css-indent-offset 2)
(add-hook 'css-mode-hook
          (lambda ()
            (linum-mode 1)))

(require 'editorconfig)
(editorconfig-mode 1)

(defun web-mode-setup ()
  "Web mode activates for following file-types."
  (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.hbs\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode)))

(web-mode-setup)

(defun rainbow-mode-setup ()
  "Rainbow mode."
  (add-hook 'css-mode-hook 'rainbow-mode))
(rainbow-mode-setup)

(which-key-mode 1)

(require 'ido)
(ido-mode t)

;JSX mode
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . jsx-mode))
(autoload 'jsx-mode "jsx-mode" "JSX mode" t)

(defun my-move-line-up ()
  "Move the current line up by one step."
  (interactive)
  (transpose-lines 1)
  (forward-line -2))

(defun my-move-line-down ()
  "Move the current line down by one step."
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1))

(defun my-eval-and-replace ()
  "Replace expression to the left with it's value in the current buffer."
  (interactive)
  (backward-kill-sexp)
  (prin1 (eval (read (current-kill 0)))
	 (current-buffer)))

(defun my-reload-current-file ()
  "Reloads the file loaded in current buffer from the disk."
  (interactive)
  (cond (buffer-file-name (progn (find-alternate-file buffer-file-name)
                                 (message "File reloaded")))
        (t (message "You're not editing a file!"))))

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
(add-hook 'linum-before-numbering-hook 'my-linum-get-format-string)

(require 'hackernews)

;;;EVIL

(evil-mode t)

(setq evil-want-fine-undo 'fine)

; Auto-indent with the Return key
(define-key global-map (kbd "RET") 'newline-and-indent)

(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
  "b" 'ido-switch-buffer
  "d" 'kill-buffer
  "f" 'fiplr-find-file
  "gb" 'mo-git-blame-current
  "gl" 'magit-log
  "gs" 'magit-status
  "hs" 'split-window-below
  "j" 'ace-jump-mode
  "n" 'neotree-toggle
  "r" 'neotree-find
  "s" 'projectile-ag
  "u" 'undo-tree-visualize
  "vs" 'split-window-right
  "x" 'smex
  "y" 'helm-show-kill-ring
  "<up>" 'buf-move-up
  "<down>" 'buf-move-down
  "<left>" 'buf-move-left
  "<right>" 'buf-move-right
  "r" 'my-reload-current-file)

(defun buffer-exists (bufname)
  "Check if buffer exists.  BUFNAME is the name of buffer, duh."
  (not (eq nil (get-buffer bufname))))
(defun switch-to-previous-buffer ()
  "Switch to previously open buffer.  Repeated invocations toggle between the two most recently open buffers."
  (interactive)
  ;; Don't switch back to the ibuffer!!!
  (if (buffer-exists "*Ibuffer*")  (kill-buffer "*Ibuffer*"))
  (switch-to-buffer (other-buffer (current-buffer) 1)))

(require 'evil-magit)
;; (setq evil-magit-state 'normal)

;; Make HJKL keys work in special buffers
(evil-add-hjkl-bindings magit-branch-manager-mode-map 'emacs
  "K" 'magit-discard-item
  "L" 'magit-key-mode-popup-logging)
(evil-add-hjkl-bindings magit-status-mode-map 'emacs
  "K" 'magit-discard-item
  "l" 'magit-key-mode-popup-logging
  "h" 'magit-toggle-diff-refine-hunk)
(evil-add-hjkl-bindings magit-log-mode-map 'emacs)
(evil-add-hjkl-bindings magit-commit-mode-map 'emacs)
(evil-add-hjkl-bindings occur-mode 'emacs)

(require 'evil-surround)
(global-evil-surround-mode 1)

(setq evil-default-cursor t)
(progn (setq evil-default-state 'normal)
       (setq evil-auto-indent t)
       (setq evil-shift-width 2)
       (setq evil-search-wrap t)
       (setq evil-find-skip-newlines t)
       (setq evil-move-cursor-back nil)
       (setq evil-mode-line-format 'before)
       (setq evil-esc-delay 0.001)
       (setq evil-cross-lines t))

;To override emacs maps with evil maps
(setq evil-overriding-maps nil)
(setq evil-intercept-maps nil)

;; Don't wait for any other keys after escape is pressed.
(setq evil-esc-delay 0)

;; Don't show default text in command bar
;  ** Currently breaks visual range selection, looking for workaround
(add-hook 'minibuffer-setup-hook (lambda () (evil-ex-remove-default)))

(evil-set-initial-state 'git-commit-mode 'normal)

;Self explanatory
(setq evil-want-C-i-jump t)
(setq evil-want-C-u-scroll t)

;; (define-key evil-normal-state-map (kbd "RET") 'save-buffer)
(define-key evil-normal-state-map (kbd "C-k") 'evil-scroll-down)
(define-key evil-normal-state-map (kbd "C-l") 'evil-scroll-up)

;; Yank whole buffer
(define-key evil-normal-state-map (kbd "gy") (kbd "gg v G y"))

(setq key-chord-two-keys-delay 0.075)
(key-chord-mode 1)

(define-key evil-normal-state-map " h" 'windmove-left)
(define-key evil-normal-state-map " j" 'windmove-down)
(define-key evil-normal-state-map " k" 'windmove-up)
(define-key evil-normal-state-map " l" 'windmove-right)
(define-key evil-normal-state-map " d" (kbd ":%bd"))
(define-key evil-normal-state-map " w" (kbd "<c-w>w"))

(provide 'init)
;;; init.el ends here
;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:
