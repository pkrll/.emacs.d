(defun pkrll/display-startup-time ()
  (message "⏳ Emacs loaded in %s with %d garbage collections."
		   (format "%.2f seconds"
				   (float-time
					(time-subtract after-init-time before-init-time)))
		   gcs-done))
;(add-hook 'emacs-startup-hook #'pkrll/display-startup-time)

(setq gc-cons-threshold (* 2 1000 1000)
	  user-emacs-directory "~/.emacs.d"
	  custom-file (concat user-emacs-directory "/custom.el"))

(load-file custom-file)
(load (locate-user-emacs-file "configurations/setup-core.el") nil :nomessage)
(load (locate-user-emacs-file "configurations/setup-ui.el") nil :nomessage)
(load (locate-user-emacs-file "configurations/setup-dashboard.el") nil :nomessage)
(load (locate-user-emacs-file "configurations/setup-editing.el") nil :nomessage)
(load (locate-user-emacs-file "configurations/setup-keybindings.el") nil :nomessage)
(load (locate-user-emacs-file "configurations/setup-programming.el") nil :nomessage)
(load (locate-user-emacs-file "configurations/setup-modeline.el") nil :nomessage)

(require 'setup-core)
(require 'setup-ui)
(require 'setup-dashboard)
(require 'setup-editing)
(require 'setup-keybindings)
(require 'setup-programming)
(require 'setup-modeline)