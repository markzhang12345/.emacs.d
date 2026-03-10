(add-to-list 'load-path (expand-file-name (concat user-emacs-directory "lisp")))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(require 'init-startup)
(require 'init-elpa)
(require 'init-ui)
(require 'init-theme)
(require 'init-auto-theme)
(require 'init-dashboard)
(require 'init-dirvish)
(require 'init-package)
(require 'init-lsp)

(when (file-exists-p custom-file)
  (load-file custom-file))
;;; init.el ends here
