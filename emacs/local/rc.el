;; From https://github.com/rexim/dotfiles/blob/dd91e2e6a3b12684a3db818ad1de24d3f4c7e06d/.emacs.rc/rc.el
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/")  t)

(defvar rc/package-contents-refreshed nil)

(defun rc/package-refresh-contents-once ()
  (when (not rc/package-contents-refreshed)
    (setq rc/package-contents-refreshed t)
    (package-refresh-contents)))

(defun rc/require-one-package (package)
  (when (not (package-installed-p package))
    (rc/package-refresh-contents-once)
    (package-install package)))

(defun rc/require (&rest packages)
  (dolist (package packages)
    (rc/require-one-package package)))

(defun rc/require-theme (theme)
  (let ((theme-package (intern (concat (symbol-name theme) "-theme"))))
    (rc/require-one-package theme-package)
    (load-theme theme t)))

(provide 'rc)
