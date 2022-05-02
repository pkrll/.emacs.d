(provide 'setup-editing)

(defvar backup-directory "~/.emacs.d/.backups/")
(if (not (file-exists-p backup-directory))
	(make-directory backup-directory t))

(setq make-backup-files t
	  backup-directory-alist `((".*" . ,backup-directory))
	  backup-by-copying t
	  delete-old-versions t
	  kept-old-versions 1
	  kept-new-versions 1
	  auto-save-file-name-transforms `((".*" ,backup-directory t))
	  auto-save-timeout 20
	  auto-save-interval 200
	  create-lockfiles nil
	  kill-whole-line t
	  mode-require-final-newline nil)

(setq-default tab-width 4)

;; Update any changes made on file to the current buffer
(global-auto-revert-mode)

;; Delete selected text when typing
(delete-selection-mode)