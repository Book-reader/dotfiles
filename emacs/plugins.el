(use-package general) ; Better keybind stuff

(use-package ivy ; Ivy is for fuzzy completion
;  :diminish ; Hides "ivy" from the mode line (Elisp/d ivy ElDoc)
  :general 
  ("C-s" 'swiper)
  (:keymaps 'ivy-minibuffer-map
  "TAB" 'ivy-alt-done
  "C-l" 'ivy-alt-done
  "C-j" 'ivy-next-line
  "C-k" 'ivy-previous-line)
  (:keymaps 'ivy-switch-buffer-map
  "C-k" 'ivy-previous-line
  "C-l" 'ivy-done
  "C-d" 'ivy-switch-buffer-kill)
  (:keymaps 'ivy-reverse-i-search-map
  "C-k" 'ivy-previous-line
  "C-d" 'ivy-reverse-i-search-kill)
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
  :general
  ([remap describe-function] 'counsel-describe-function)
  ([remap describe-command] 'helpful-command)
  ([remap describe-variable] 'counsel-describe-variable)
  ([remap describe-key] 'helpful-key))

(use-package doom-themes) ; ALL the themes

(use-package multiple-cursors ; Edit on multiple lines at once
  :general
  ("C->" 'mc/mark-next-like-this)
  ("C-<" 'mc/mark-previous-like-this)
  ("C-c C-<" 'mc/mark-all-like-this)
  ("C-." 'mc/unmark-next-like-this)
  ("C-," 'mc/unmark-previous-like-this)
  ("C-c C-." 'mc/keyboard-quit)
  )
 
(use-package projectile ; Programming project intergration
  :general
  ("C-c p" 'projectile-command-map)
  :config
  (when (file-directory-p "~/code")
    (setq projectile-project-search-path '("~/code")))
  (when (file-directory-p "~/git")
    (setq projectile-project-search-path '("~/git")))
  (setq projectile-switch-project-action #'projectile-dired)
  :init
  (projectile-mode 1)
  )

(use-package hl-todo ; Highloght TODOs
  :init
  (hl-todo-mode 1))

(use-package magit ; Git stuff
  )

(use-package magit-todos ; Hightlight TODOs in magit
  )


; TODO: Chose one of these
(use-package org-modern
  :init
  (global-org-modern-mode 1))
; (use-package org-superstar)


; TODO The font is doing some wierd clipping stuff so I need to fix it
