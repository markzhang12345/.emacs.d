(add-to-list 'load-path (expand-file-name (concat user-emacs-directory "lisp")))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(require 'init-startup)
(require 'init-elpa)
(require 'init-terminal-ui)
(require 'init-package)
(require 'init-lsp)

(when (file-exists-p custom-file)
  (load-file custom-file))
;;; init.el ends here
