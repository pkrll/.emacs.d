(provide 'setup-programming)

(add-hook 'prog-mode-hook
		  (lambda ()
			(linum-mode)               ; Toggle on line mode
			(electric-pair-mode 1)     ; Create pair brackets
			(electric-indent-mode t))) ; Sane indentation policy

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package magit
  :commands magit-status
  :config
  (message "Loaded magit"))

(defun pkrll/lsp-mode-setup ()
  (setq lsp-headerline-breadcrump-segments '(path-up-to-project file symbols))
  (lsp-headerline-breadcrumb-mode))

(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :hook (lsp-mode . pkrll/lsp-mode-setup)
  :init
  (setq lsp-keymap-prefix "C-c l")
  :config
  (lsp-enable-which-key-integration t)
  (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\.build\\'")
  (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\.swiftpm\\'")
  (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]*.xcassets\\'")
  (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]fastlane\\'")
  (message "Loaded lsp-mode")
  :bind
  ("C-M-j" . lsp-find-definition))

(use-package lsp-ui
  :hook (lsp-mode . lsp-ui-mode)
  :custom
  (setq lsp-ui-doc-position 'bottom))

(use-package lsp-treemacs
  :after lsp)

(use-package lsp-sourcekit
  :after lsp-mode
  :config
  (setq lsp-sourcekit-executable "/usr/local/bin/sourcekit-lsp"))

(use-package swift-mode
  :hook
  (swift-mode . (lambda () (lsp))))

(use-package company
  :after lsp-mode
  :hook (lsp-mode . company-mode)
  :bind
  (:map company-active-map
		("<tab>" . company-complete-selection)
		("C-'" . company-select-next-or-abort))
  (:map lsp-mode-map
		("<tab>" . company-indent-or-complete-common))
  :custom
  (company-minimum-prefix-length 1)
  (company-idle-delay 0.0))

(use-package company-box
  :hook (company-mode . company-box-mode))

;(use-package company-sourcekit
;  :hook swift-mode
;  :config
;  (setq sourcekit-sourcekittendaemon-executable "/usr/local/bin/sourcekittendaemon"))

(use-package clean-aindent-mode
  :hook (prog-mode . clean-aindent-mode)
  :config (message "Loaded clean-aindent-mode"))

(use-package multiple-cursors
  :hook (prog-mode . multiple-cursors-mode)
  :bind
  ("C-`" . mc/mark-next-lines)
  ("M-d" . mc/mark-next-like-this)
  :config
  (message "Loaded multiple-cursors"))

(use-package treemacs
  :defer t
  :config
  (setq treemacs-follow-after-init t
        treemacs-expand-after-init t
		treemacs-project-follow-mode t
		treemacs-follow-mode t
		treemacs-filewatch-mode t
        treemacs-width 40
        treemacs-indentation 1
        treemacs-git-integration t
        treemacs-git-mode 'extended
        treemacs-collapse-dirs 0
        treemacs-silent-refresh	t
		treemacs-change-root-without-asking t
        treemacs-sorting 'alphabetic-case-insensitive-desc
        treemacs-show-hidden-files nil
        treemacs-never-persist nil
        treemacs-is-never-other-window nil
		treemacs-display-current-project-exclusively t
        treemacs-goto-tag-strategy 'refetch-index
		treemacs-text-scale	0)
  (treemacs-fringe-indicator-mode 'always)
  (treemacs-follow-mode t)
  (treemacs-project-follow-mode t))

(use-package flycheck
  :init (global-flycheck-mode))

(use-package git-gutter
  :hook (prog-mode . git-gutter-mode)
  :config
  (setq git-gutter:update-interval 0.1))

(use-package git-gutter-fringe
  :config
  (define-fringe-bitmap 'git-gutter-fr:added [224] nil nil '(center repeated))
  (define-fringe-bitmap 'git-gutter-fr:modified [224] nil nil '(center repeated))
  (define-fringe-bitmap 'git-gutter-fr:deleted [224] nil nil '(center repeated)))
