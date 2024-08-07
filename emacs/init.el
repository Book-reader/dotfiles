; Disables the welcome screen
(setq inhibit-startup-message t)

(scroll-bar-mode -1) ; Disable visible scrollbar
(tool-bar-mode -1) ; Disable toolbar
(tooltip-mode -1) ; Disable tooltips
(set-fringe-mode 10) ; Give some breathing room (what does this do? is it for the bottom panel?)
(menu-bar-mode -1) ; Disable the menu bar

(setq-default indent-tabs-mode t) ; Use spaces for tabs
(setq-default tab-width 4) ; Set number of spaces to 4

(setq visible-bell t) ; For when u go too far (incorrent command, down arrow at end of file)

(custom-set-faces
 '(default ((t (:inherit nil :font "0xProto Nerd Font Mono" :height 110))))); Sets font (in daemon)


; Setup the plugin manager
(load (expand-file-name "plugin-setup.el" user-emacs-directory))

; The plugins
(load (expand-file-name "plugins.el" user-emacs-directory))

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

(general-create-definer st/leader-keys
  :global-prefix "C-SPC"
  :prefix "C-SPC")
(general-auto-unbind-keys)

; Setup cutom global keybinds

(general-define-key
 "M-x" 'counsel-M-x
 "<escape>" 'keyboard-escape-quit ; Make escape quit prompts
 "C--" 'text-scale-decrease
 "C-=" 'text-scale-increase
 "C-<backspace>" 'backward-delete-word
 "M-<backspace>" 'backward-delete-word)

(defun backward-delete-word (arg)
  "Delete characters backward until encountering the beginning of a word.
With argument ARG, do this that many times."
  (interactive "p")
  (delete-region (point) (progn (backward-word arg) (point))))

(st/leader-keys
  "f" '(:ignore t :wk "file")
  "f f" 'find-file
  "f F" 'sudo-edit
  "f s" 'save-buffer
  "f d" 'make-directory
  "f c" '((lambda () (interactive) (find-file "~/.config/emacs/init.el")) :wk "open config")

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
  "b i" '(ibuffer :wl "IBuffer")

  "u" '(:ignore t :wk "undo")
  "u u" '(undo :wk "Undo")
  "u r" '(undo-redo :wk "Redo")

  "h" '(:ignore t :wk "help")
  "h k" '(general-describe-keybindings :wk "keys")
  "h v" '(helpful-variable :wk "Describe Variable")
  "h f" '(describe-function :wk "Describe Function")

  "p" '(ignore t :wk "project")
  "p r" '(projectile-run-project :wk "Run project")
  "p d" '(projectile-dired :wk "View project folder")
  "p f" '(projectile-find-file :wk "Find file in project")
  "p p" '(projectile-switch-project :wk "Open Project")
  "p g" '(counsel-projectile-rg :wk "Search Project")

  "w" '(ignore t :wk "Window/Split")
  "w k" '(quit-window :wk "Close Split")
  "w s <down>" 'split-window-below


  "e" '(:ignore t :wk "Evaluate")    
  "e b" '(eval-buffer :wk "Evaluate elisp in buffer")
  "e d" '(eval-defun :wk "Evaluate defun containing or after point")
  "e e" '(eval-expression :wk "Evaluate and elisp expression")
  "e l" '(eval-last-sexp :wk "Evaluate elisp expression before point")
  "e r" '(eval-region :wk "Evaluate elisp in region")

  "TAB TAB" '(comment-line :wk "Comment line")

  "t" '(:ignore t :wk "Toggle")
  "t l" '(display-line-numbers-mode :wk "Toggle line numbers")
  "t t" '(visual-line-mode :wk "Toggle truncated lines")

  "k" '(:ignore t :wk "Delete")
  "k k" '(kill-whole-line :wk "Delete line")

  "g" '(:ignore t :wk "Git")
  "g s" '(magit-status :wk "Git status")
  )


; Gets rid of the annoying custom-set-variables block by moving to a new file
; Then doesnt load the file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
;(load custom-file)

(provide 'init)
