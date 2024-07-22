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
(load (expand-file-name "plugin-setup.el" user-emacs-directory))

; The plugins
(load (expand-file-name "plugins.el" user-emacs-directory))


(general-create-definer st/leader-keys
  :global-prefix "C-SPC"
  :prefix "C-SPC")
(general-auto-unbind-keys)

; Setup cutom global keybinds

(general-define-key
 "M-x" 'counsel-M-x
 "<escape>" 'keyboard-escape-quit ; Make escape quit prompts
 )

(st/leader-keys
  "f" '(:ignore t :wk "file")
  "f f" 'find-file
  "f s" 'save-buffer
  "f c" '('(find-file ~/.config/emacs/init.el) :wk "open config") ; TODO: Broken, FIXME

  "c" '(:ignore t :wk "copy")
  "c c" '(kill-ring-save :wk "copy selected")
  "c x" '(kill-region :wk "cut selected")
  "c p" '(yank :wk "paste")

  "b" '(:ignore t :wk "buffer")
  "b b" '(switch-to-buffer :wk "Switch buffer")
  "b k" '(kill-current-buffer :wk "Kill current buffer")
  "b n" '(next-buffer :wk "Next buffer")
  "b p" '(previous-buffer :wk "Previous Buffer")
  "b r" '(revert-buffer :wk "Reload Buffer")

  "u" '(:ignore t :wk "undo")
  "u u" '(undo :wk "Undo")
  "u r" '(undo-redo :wk "Redo")

  "h" '(:ignore t :wk "help")
  "h k" '(general-describe-keybindings :wk "keys")
  "h d" '(:ignore t :wk "Describe")
  "h d v" '(helpful-variable :wk "Describe Variable")
  "h d f" '(describe-function :wk "Describe Function")

  "p" '(ignore t :wk "project")
  "p r" '(projectile-run-project :wk "Run project")
  "p d" '(projectile-dired :wk "View project folder")
  "p f" '(projectile-find-file :wk "Find file in project")
  "p p" '(projectile-switch-project :wk "Open Project"))


; Gets rid of the annoying custom-set-variables block by moving to a new file
; Then doesnt load the file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
;(load custom-file)

(provide 'init)
