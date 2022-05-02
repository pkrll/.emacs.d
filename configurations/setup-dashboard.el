(provide 'setup-dashboard)

(use-package page-break-lines)
(use-package dashboard
  :config
  (setq dashboard-startup-banner 1
		dashboard-set-heading-icons t
		dashboard-set-file-icons t
		dashboard-set-navigator t
		dashboard-set-footer nil
		dashboard-items '((projects . 5)
						  (recents . 5)))
  (dashboard-setup-startup-hook))
