(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024))
(setq inhibit-startup-message t)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 10)
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(menu-bar-mode -1)

(setq visible-bell t)

;;(set-face-attribute 'default nil :font "JetBrains Mono" :height 100)

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
;;(ido-mode 1)
;;(ido-everywhere 1)

;(use-package ido-completing-read+
;  :config
;  (ido-ubiquitous-mode 1))
;(setq ido-enable-flex-matching t)

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
             (setq completion-styles '(flex basic)
                completion-category-defaults nil
                completion-category-overrides '((file (styles partial-completion)))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("dc8285f7f4d86c0aebf1ea4b448842a6868553eded6f71d1de52f3dcbc960039" "ff24d14f5f7d355f47d53fd016565ed128bf3af30eb7ce8cae307ee4fe7f3fd0" "944d52450c57b7cbba08f9b3d08095eb7a5541b0ecfb3a0a9ecd4a18f3c28948" "aec7b55f2a13307a55517fdf08438863d694550565dee23181d2ebd973ebd6b8" "e3daa8f18440301f3e54f2093fe15f4fe951986a8628e98dcd781efbec7a46f2" "2dd4951e967990396142ec54d376cced3f135810b2b69920e77103e0bcedfba9" default))
 '(helm-minibuffer-history-key "M-p")
 '(package-selected-packages
   '(marginalia vertico helm-lsp helm lsp-ido dap-mode lsp-treemacs lsp-ui lsp-mode treemacs modus-themes json-mode vterm tide rjsx-mode prettier-js fancy-compilation fancy-compilation-mode undo-tree hl-indent-scope diff-hl doom-modeline smart-mode-line solaire mood-line haskell-mode tuareg treemacs-evil treemacs-projectile tree-sitter yasnippet magit evil-magit rg tree-sitter-langs rustic company corfu eglot telephone-line dashboard no-littering evil-collection evil ivy helm-projectile projectile doom-themes which-key use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(hl-indent-scope-even-face ((t (:background "#51535f"))))
 '(hl-indent-scope-odd-face ((t (:background "#3c3e4a")))))

(use-package which-key
             :ensure t
             :config (which-key-mode))

;; Themes
;;(use-package doom-themes
;;           :ensure t
;;           :config
;;           (load-theme 'doom-horizon))

(use-package modus-themes
  :ensure t
  :init
  (setq modus-themes-syntax '(green-strings yellow-comments)
        modus-themes-mode-line '(accented borderless)
        modus-themes-hl-line '(accented))
  (modus-themes-load-themes)
  :config
(load-theme 'modus-vivendi t))

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

;;(use-package helm
 ;; :ensure t
 ;;:config (helm-mode 1))
;;(global-set-key (kbd "M-x") 'helm-M-x)
(use-package vertico
  :init
  (vertico-mode)
  :custom
  (vertico-cycle t))

(use-package savehist
  :init
  (savehist-mode))

(use-package marginalia
  :after vertico
  :ensure t
  :custom
  (marginalia-annotators '(marginalia-annotators-heavy marginalia-annotators-light nil))
  :init
  (marginalia-mode))

;; Telephone line
;;(use-package telephone-line
  ;;:ensure t
  ;;:config
  ;;(telephone-line-mode 1))

;;
;;(use-package doom-modeline
  ;;:ensure t
  ;;:init (doom-modeline-mode 1)
  ;;:config
  ;;(setq doom-modeline-lsp t)
  ;;(setq doom-modeline-time t))

;; lsp tings
;(use-package eglot
 ; :hook (c++-mode . eglot-ensure))

(use-package lsp-mode
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
         (XXX-mode . lsp)
         ;; if you want which-key integration
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

(setq lsp-lens-enable nil)

;; optionally
(use-package lsp-ui :commands lsp-ui-mode)
;(use-package lsp-ido)
;; if you are helm user
;;(use-package helm-lsp :commands helm-lsp-workspace-symbol)
;; if you are ivy user
;(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
(use-package lsp-treemacs :commands lsp-treemacs-errors-list)

;; optionally if you want to use debugger
(use-package dap-mode)
;; (use-package dap-LANGUAGE) to load the dap adapter for your language

;; optional if you want which-key integration
(use-package which-key
    :config
    (which-key-mode))

(use-package company
  :ensure t
  :config
  (add-hook 'after-init-hook 'global-company-mode)
  (setq company-minimum-prefix-length 1
          company-idle-delay 0.0))

(use-package rustic
  :config
                                        ;(setq rustic-lsp-client 'eglot))
)


;; Treesitter
(use-package tree-sitter
  :config
  (global-tree-sitter-mode)
  (add-hook 'rustic-mode-hook #'tree-sitter-hl-mode)
  (add-hook 'c++-mode-hook 'tree-sitter-hl-mode))

(use-package tree-sitter-langs)
(use-package rg)

;; magit

(use-package magit)

(use-package yasnippet
  :config
  (yas-global-mode 1))

(use-package treemacs
  :ensure t
  :defer t
  :bind
  (:map global-map
        ("M-0"       . treemacs-select-window)
        ("C-x t 1"   . treemacs-delete-other-windows)
        ("C-x t t"   . treemacs)
        ("C-x t d"   . treemacs-select-directory)
        ("C-x t B"   . treemacs-bookmark)
        ("C-x t C-t" . treemacs-find-file)
        ("C-x t M-t" . treemacs-find-tag)))

(use-package treemacs-evil
  :after (treemacs evil)
  :ensure t)

(use-package treemacs-projectile
  :after (treemacs projectile)
  :ensure t)

(use-package tuareg)

(use-package dired
  :ensure nil
  :commands (dired dired-jump)
  :bind (("C-x C-j" . dired-jump))
  :config
  (evil-collection-define-key 'normal 'dired-mode-map
    "h" 'dired-up-directory
    "l" 'dired-find-file))

(use-package haskell-mode)

(use-package diff-hl
  :config
  (global-diff-hl-mode))
(use-package hl-indent-scope)

;;(use-package undo-tree)

(use-package fancy-compilation
  :commands (fancy-compilation-mode))
(with-eval-after-load 'compile
  (fancy-compilation-mode))

(use-package rjsx-mode
  :ensure t
  :mode "\\.js\\'")

(defun setup-tide-mode()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save-mode-enabled))
  (tide-hl-identifier-mode +1)
  (company-mode +1))

(use-package tide
  :ensure t
  :after (rjsx-mode company flycheck)
  :hook (rjsx-mode . setup-tide-mode))

(use-package prettier-js
  :ensure t
  :after (rjsx-mode)
  :hook (rjsx-mode . prettier-js-mode))

;(use-package vterm
;  :ensure t)

(use-package json-mode
  :ensure t)

(use-package avy)
(avy-setup-default)
(global-set-key (kbd "C-c s r") 'avy-resume)
(global-set-key (kbd "C-c s c") 'evil-avy-goto-char-timer)
