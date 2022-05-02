(provide 'setup-core)

;; Initializer package sources
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
						 ("org" . "https://orgmode.org/elpa/")
						 ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)

(setq use-package-always-ensure t)
;; (setq use-package-verbose t)

(use-package all-the-icons
  :config
  (message "Loaded all-the-icons"))

(use-package helm
  :init
  (add-hook 'emacs-startup-hook 'helm-mode 1)
  :bind
  ([remap execute-extended-command] . helm-M-x)
  ("C-x b" . helm-mini)
  ("C-s" . swiper)
  :config
  (setq helm-M-x-fuzzy-match t                ; Enable fuzzy match
		helm-split-window-in-side-p t))        ; Open Helm buffer inside current window

(use-package swiper-helm
  :ensure t)

(use-package which-key
  :config
  (which-key-mode)
  (setq which-key-idle-delay 1.25))

(use-package helpful
  :bind
  ([remap describe-function] . helpful-callable)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . helpful-variable)
  ([remap describe-key] . helpful-key))

(use-package projectile
  :diminish projectile-mode
  :config (projectile-mode)
  (add-to-list 'projectile-globally-ignored-directories '"^\\.build$")
  (add-to-list 'projectile-globally-ignored-directories '"^\\.swiftpm$")
  (add-to-list 'projectile-globally-ignored-directories '"^\\elpa$")
  (setq projectile-enable-caching t
		projectile-indexing-method 'native)
  :custom ((projectile-completion-system 'ivy))
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :bind
  ("M-O" . projectile--find-file)
  :init
  (when (file-directory-p "~/Developer")
    (setq projectile-project-search-path '("~/Developer")))
  (setq projectile-switch-project-action #'projectile-dired))

(setq idle-update-delay 1
	  initial-scratch-message ""
	  confirm-kill-processes nil)