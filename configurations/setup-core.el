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

;; Ivy
(use-package ivy
  :hook (after-init . ivy-mode)
  :config
  (setq ivy-height 10
		ivy-use-virtual-buffers t
		ivy-count-format "(%d/%d) "
		ivy-use-selectable-prompt t
		ivy-display-style 'fancy)
  (define-key ivy-minibuffer-map (kbd "RET") #'ivy-alt-done)
  (define-key ivy-mode-map       (kbd "<escape>") #'kill-current-buffer)
  (define-key ivy-minibuffer-map (kbd "<escape>") #'minibuffer-keyboard-quit))

(use-package ivy-rich
  :hook (ivy-mode . ivy-rich-mode)
  :custom
  (setq ivy-virtual-abbreviate 'abbreviate
		ivy-rich-switch-buffer-align-virtual-buffer nil
		ivy-rich-path-style 'abbreviate))

(use-package ivy-prescient
  :after counsel
  :custom
  (ivy-prescient-enable-filtering nil)
  :config
  ;; Uncomment the following line to have sorting remembered across sessions!
  ;(prescient-persist-mode 1)
  (ivy-prescient-mode 1))

;; counsel
(use-package counsel
  :hook (ivy-mode . counsel-mode)
  :config
  (setq counsel-rg-base-command "rg -i -M 120 --no-heading --line-number %s ."
		ivy-initial-inputs-alist nil))

;; Search files, and do it with speed and style
(use-package swiper
  :after ivy
  :bind ("C-s" . swiper-thing-at-point)
  :config
  (setq swiper-goto-start-of-match t))

;; projectile
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

;; all-the-icons packages
(use-package all-the-icons
  :config
  (message "Loaded all-the-icons"))

(use-package all-the-icons-ivy
  :init (add-hook 'after-init-hook 'all-the-icons-ivy-setup))

(use-package all-the-icons-ivy-rich
  :after ivy
  :init (all-the-icons-ivy-rich-mode 1)
  :custom
  (setq all-the-icons-ivy-rich-icon t
        all-the-icons-ivy-rich-color-icon nil
        all-the-icons-ivy-rich-icon-size 1.0))

;; Show the key bindings following your currently entered incomplete command
(use-package which-key
  :config
  (which-key-mode)
  (setq which-key-idle-delay 1.25))

;; Replace built-in help
(use-package helpful
  :commands (helpful-callable helpful-variable helpful-command helpful-key)
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))

(setq idle-update-delay 1
	  initial-scratch-message ""
	  confirm-kill-processes nil)