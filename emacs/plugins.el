(use-package ivy ; Ivy is for fuzzy completion
;  :diminish ; Hides "ivy" from the mode line (Elisp/d ivy ElDoc)
  :bind (("C-s" . swiper)
	 :map ivy-minibuffer-map
	 ("TAB" . ivy-alt-done)
	 ("C-l" . ivy-alt-done)
	 ("C-j" . ivy-next-line)
	 ("C-k" . ivy-previous-line)
	 :map ivy-switch-buffer-map
	 ("C-k" . ivy-previous-line)
	 ("C-l" . ivy-done)
	 ("C-d" . ivy-switch-buffer-kill)
	 :map ivy-reverse-i-search-map
	 ("C-k" . ivy-previous-line)
	 ("C-d" . ivy-reverse-i-search-kill))
  :init
  (ivy-mode 1))

(use-package counsel ; Part of ivy
  :init
  (counsel-mode 1)
  :config
  (setq ivy-initial-inputs-alist nil))

(use-package ivy-rich ; Descriptions & more for ivy
  :init
  (ivy-rich-mode 1)
  :config
  (setq ivy-rich-path-style 'abbrev))

(use-package nerd-icons-ivy-rich ; Nerd font icons for ivy-rich
  :init
  (nerd-icons-ivy-rich-mode 1))

(use-package nerd-icons) ; Nerd font icons for emacs

(use-package beacon
  :config
  (beacon-mode 1))

(use-package doom-modeline ; Sets the bottom bar
  :custom
  ((doom-modeline-height 20))
  :init
  (doom-modeline-mode 1))

(use-package rainbow-delimiters ; Makes brackets rainbow
  :hook (prog-mode . rainbow-delimiters-mode)) ; prog-mode is any programming language


(use-package which-key ; Provides completions for keybinds
  :init (which-key-mode 1)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.3))


(use-package helpful ; Better help screens
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))

(use-package doom-themes) ; ALL the themes

(use-package multiple-cursors
  :bind
  ("C->" . mc/mark-next-like-this)
  ("C-<" . mc/mark-previous-like-this)
  ("C-c C-<" . mc/mark-all-like-this)
  ("C-." . mc/unmark-next-like-this)
  ("C-," . mc/unmark-previous-like-this)
  ("C-c C-." . mc/keyboard-quit))