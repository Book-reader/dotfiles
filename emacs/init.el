(setq custom-file "~/.config/emacs/custom.el")
(add-to-list 'load-path (expand-file-name "local/" user-emacs-directory))

(package-initialize)
;; Disable visible scrollbar
(scroll-bar-mode 0)
;; Disable toolbar
(tool-bar-mode 0)
;; Disable tooltips
(tooltip-mode 0)
(menu-bar-mode 0)
(column-number-mode 1)

(global-display-line-numbers-mode 1)
;; Don't highlight lines that are "too long (> 80 chars)"
;; I could increase the limit but I disable instead by removing "lines" from the below list
;; I also remove " indentation" because it seems to be bugged and only works for tabs and not spaces
;; "newline" + "newline-mark", "empty"
(setq indent-tabs-mode nil)
(setq whitespace-style '(face tabs spaces trailing space-before-tab space-after-tab space-mark tab-mark missing-newline-at-eof))
(global-whitespace-mode 1)

(setq visible-bell 1)
(setq inhibit-startup-message 1)
(setq make-backup-files nil)

;; Autocomplete stuff
(fido-mode)

(require 'rc)

;; (rc/require 'doom-themes)
;; (load-theme 'doom-horizon t)

(rc/require-theme 'gruber-darker)

(rc/require 'snap-indent)
(require 'snap-indent)
(add-to-list 'snap-indent-excluded-modes
             'conf-unix-mode
             'conf-space-mode)
;; Global snap-indent
(define-globalized-minor-mode global-snap-indent-mode
  snap-indent-mode
  snap-indent-mode)
(global-snap-indent-mode 1)
(setq snap-indent-on-save 1)
;; list of functions
(setq snap-indent-format '(untabify delete-trailing-whitespace))


(rc/require 'hl-todo)
(require 'hl-todo)
(global-hl-todo-mode 1)

;; Sets font (also works in daemon)
(custom-set-faces
 '(default ((t (:inherit nil :font "0xProto Nerd Font" :height 110)))))

;; From https://emacsredux.com/blog/2013/05/22/smarter-navigation-to-the-beginning-of-a-line/
(defun smarter-move-beginning-of-line (arg)
  "Move point back to indentation of beginning of line.

Move point to the first non-whitespace character on this line.
If point is already there, move to the beginning of the line.
Effectively toggle between the first non-whitespace character and
the beginning of the line.

If ARG is not nil or 1, move forward ARG - 1 lines first.  If
point reaches the beginning or end of the buffer, stop there."
  (interactive "^p")
  (setq arg (or arg 1))

  ;; Move lines first
  (when (/= arg 1)
    (let ((line-move-visual nil))
      (forward-line (1- arg))))

  (let ((orig-point (point)))
    (back-to-indentation)
    (when (= orig-point (point))
      (move-beginning-of-line 1))))

(defun backward-delete-word (arg)
  "Delete characters backward until encountering the beginning of a word.
With argument ARG, do this that many times."
  (interactive "p")
  (delete-region (point) (progn (backward-word arg) (point))))

(rc/require 'multiple-cursors)
(require 'multiple-cursors)

(require 'keys)

(keys/define-keys ""
                  (list
                   '("s-x" execute-extended-command)
                   '("<escape>" keyboard-escape-quit)
                   '("<home>" smarter-move-beginning-of-line)
                   '("C-<backspace>" backward-delete-word)
                   '("s-<backspace>" backward-delete-word)
                   '("C-<tab>" comment-line)
                   '("C-." mc/mark-next-like-this)
                   '("C->" mc/mark-previous-like-this)))

(keys/define-keys "C-f"
                  (list
                   '("f" find-file)
                   '("s" save-buffer)
                   '("l" goto-line)))

(keys/define-keys "C-b"
                  (list
                   '("b" switch-to-buffer)
                   '("k" kill-current-buffer)
                   '("n" next-buffer)
                   '("p" previous-buffer)
                   '("r" revert-buffer)
                   '("i" ibuffer)))

(keys/define-keys "C-e"
                  (list
                   '("e" eval-last-sexp)
                   '("f" eval-buffer)))

(rc/require 'consult)
(require 'consult)

(rc/require 'vterm)
(require 'vterm)

(setq treesit-language-source-alist
      '((c3 "https://github.com/c3lang/tree-sitter-c3")))

(require 'c3-ts-mode)

(load-file custom-file)
