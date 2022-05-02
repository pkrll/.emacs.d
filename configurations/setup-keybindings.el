(provide 'setup-keybindings)

;; Make ESC quit prompts
(add-hook 'emacs-startup-hook
		  (lambda ()
			(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

			;; Navigation
			(define-key global-map (kbd "C-p") (kbd "<up>"))
			(define-key global-map (kbd "C-'") (kbd "<right>"))
			(define-key global-map (kbd "C-;") (kbd "<down>"))
			(define-key global-map (kbd "C-l") (kbd "<left>"))

			(subword-mode +1)

			(define-key global-map (kbd "A-<left>") 'backward-sexp)
			(define-key global-map (kbd "A-<right>") 'forward-sexp)
			(define-key global-map (kbd "A-<backspace>") 'backward-kill-sexp)

			(define-key global-map (kbd "C-<left>") 'subword-backward)
			(define-key global-map (kbd "C-M-l") 'subword-backward)
			(define-key global-map (kbd "C-<right>") 'subword-forward)
			(define-key global-map (kbd "C-M-'") 'subword-forward)
			;;(define-key global-map (kbd "C-<backspace>") (lambda () (interactive) (delete-region (point) (point-at-bol))))

			(define-key global-map (kbd "M-<left>") 'beginning-of-line-text)
			(define-key global-map (kbd "M-l") 'beginning-of-line-text)
			(define-key global-map (kbd "M-<right>") 'end-of-line)
			(define-key global-map (kbd "M-'") 'end-of-line)
			(define-key global-map (kbd "M-<backspace>") (lambda () (interactive) (delete-region (point) (line-beginning-position))))
			(define-key global-map (kbd "M-<up>") 'beginning-of-buffer)
			(define-key global-map (kbd "M-p") 'beginning-of-buffer)
			(define-key global-map (kbd "M-<down>") 'end-of-buffer)
			(define-key global-map (kbd "M-;") 'end-of-buffer)

			;; 
			(define-key global-map (kbd "M-+") 'text-scale-increase)
			(define-key global-map (kbd "M-_") 'text-scale-decrease)
			(define-key global-map (kbd "M-)") (lambda () (interactive) (text-scale-set 0)))
			))