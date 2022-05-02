(provide 'setup-modeline)

(use-package doom-modeline
  :ensure t
  :init
  (doom-modeline-mode 1)
  (column-number-mode)
  (set-face-attribute 'mode-line nil
					  :height 150)
  (set-face-attribute 'mode-line-inactive nil
					  :height 150)
  (set-face-background 'mode-line nil)
  (set-face-background 'mode-line-inactive nil)
  (set-face-foreground 'mode-line "white")
  :custom
  ((doom-modeline-height 30)
   (doom-modeline-lsp t)
   (doom-modeline-buffer-file-name 'file-name)
   (doom-modeline-major-mode-icon t)))