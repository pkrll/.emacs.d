(provide 'setup-ui)

(scroll-bar-mode -1)  ; Disable visible scroll bar
(tool-bar-mode -1)    ; Disable the tool bar 
(tooltip-mode -1)     ; Disable the tool tips
(set-fringe-mode 10)  ; Add some horizontal padding

(setq inhibit-startup-message t
      linum-format "%4d "
      frame-title-format '((:eval
			    (if (buffer-file-name)
				(abbreviate-file-name (buffer-file-name))
			      "%b"))))

;; Theme
(use-package dracula-theme
  :init
  (load-theme 'dracula t)
  :ensure t)

;; Font settings
(set-face-attribute 'default nil
		    :font "Fira Code Retina"
		    :height 190)
