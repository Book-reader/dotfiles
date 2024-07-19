; Disables the welcome screen
(setq inhibit-startup-message t)

(scroll-bar-mode -1) ; Disable visible scrollbar
(tool-bar-mode -1) ; Disable toolbar
(tooltip-mode -1) ; Disable tooltips
(set-fringe-mode 10) ; Give some breathing room (what does this do? is it for the bottom panel?)
(menu-bar-mode -1) ; Disable the menu bar

(setq visible-bell t) ; For when u go too far (incorrent command, down arrow at end of file)

(custom-set-faces
 '(default ((t (:inherit nil :font "0xProto Nerd Font Mono" :height 110))))); Sets font (in daemon)

(load-theme 'doom-horizon t) ; Sets the theme

(global-set-key (kbd "<escape>") 'keyboard-escape-quit) ; Make escape quit prompts


(column-number-mode) ; Show the column we are on as well as the line (in the modeline)
(global-display-line-numbers-mode t) ; Show line numbers on the left

; We dont want to see line numbers in the terminal, (e)shell, or org mode
; The dolist is a for loop (for mode in (mode-hooks))
(dolist (mode '(org-mode-hook
		term-mode-hook
		eshell-mode-hook
		shell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

; Setup the plugin manager
(setq plugin-setup-file (expand-file-name "plugin-setup.el" user-emacs-directory))
(load plugin-setup-file)

; The plugins
(setq plugins-file (expand-file-name "plugins.el" user-emacs-directory))
(load plugins-file)


(provide 'init)

; Gets rid of the annoying custom-set-variables block by moving to a new file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)
