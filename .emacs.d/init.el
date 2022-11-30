
(setq gc-cons-threshold 100000000)

(setq inhibit-startup-message t)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 10)
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(menu-bar-mode -1)

(setq visible-bell t)

(set-face-attribute 'default nil :font "Ubuntu Mono" :height 120)

(column-number-mode)
(global-display-line-numbers-mode t)

;; Initialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			("org" . "https://orgmode.org/elpa/")
			("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
	(package-install 'use-package))


(require 'use-package)
(setq use-package-always-ensure t)

(show-paren-mode 1)
(ido-mode 1)
(ido-everywhere 1)

(use-package ido-completing-read+
  :config
  (ido-ubiquitous-mode 1))
;;(setq ido-enable-flex-matching t)

(use-package no-littering)

;; no-littering doesn't set this by default so we must place
 ;;auto save files in the same path as it uses for sessions
(setq auto-save-file-name-transforms
            `((".*" ,(no-littering-expand-var-file-name "auto-save/") t)))

(use-package amx
:ensure t
:config
(amx-mode +1))


(use-package orderless
	     :init
	     (setq completion-styles '(orderless basic)
		completion-category-defaults nil
		completion-category-overrides '((file (styles partial-completion)))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("944d52450c57b7cbba08f9b3d08095eb7a5541b0ecfb3a0a9ecd4a18f3c28948" "aec7b55f2a13307a55517fdf08438863d694550565dee23181d2ebd973ebd6b8" "e3daa8f18440301f3e54f2093fe15f4fe951986a8628e98dcd781efbec7a46f2" "2dd4951e967990396142ec54d376cced3f135810b2b69920e77103e0bcedfba9" default))
 '(helm-minibuffer-history-key "M-p")
 '(package-selected-packages
   '(tree-sitter yasnippet magit evil-magit rg tree-sitter-langs rustic company corfu eglot telephone-line dashboard no-littering evil-collection evil ivy helm-projectile projectile doom-themes which-key use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(use-package which-key
	     :ensure t
	     :config (which-key-mode))

;; Themes
(use-package doom-themes
	     :ensure t
	     :config
	     (load-theme 'doom-dracula))


;; Projectile
(use-package projectile
	     :ensure t
	     :config
	     (define-key projectile-mode-map (kbd "C-x p") 'projectile-command-map)
	     (projectile-mode +1))



;;; EVIL MODe


(use-package evil
	       :init
		(setq evil-want-integration t)
		(setq evil-want-keybinding nil)
		(setq evil-want-C-u-scroll t)
		(setq evil-want-C-i-jump nil)
		:config
		(evil-mode 1)
		(define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
		(define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)
		;; Use visual line motions even outside of visual-line-mode buffers
		(evil-global-set-key 'motion "j" 'evil-next-visual-line)
		(evil-global-set-key 'motion "k" 'evil-previous-visual-line)
		(evil-set-initial-state 'messages-buffer-mode 'normal)
		(evil-set-initial-state 'dashboard-mode 'normal))


(use-package evil-collection
	     :after evil
	     :config
	     (evil-collection-init))


(use-package dashboard
  :ensure t
  :init
  (progn
    (setq dashboard-items '((recents . 1)
			    (projects . 1))))
  :config
  (dashboard-setup-startup-hook))


;; Telephone line
(use-package telephone-line
  :ensure t
  :config
  (telephone-line-mode 1))

;; lsp tings
(use-package eglot)

(use-package company
  :ensure t
  :config
  (add-hook 'after-init-hook 'global-company-mode))

(use-package rustic
  :config
  (setq rustic-lsp-client 'eglot))



;; Treesitter
(use-package tree-sitter
  :config
  (global-tree-sitter-mode)
  (add-hook 'rustic-mode-hook #'tree-sitter-hl-mode))
  
(use-package tree-sitter-langs)
(use-package rg)

;; magit

(use-package magit)

(use-package yasnippet
  :config
  (yas-global-mode 1))


