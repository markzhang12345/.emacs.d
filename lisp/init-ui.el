;;; package --- Summary
;;; Commentary:
;;; Code:
(tool-bar-mode -1)
(scroll-bar-mode -1)

(unless (package-installed-p 'nerd-icons)
  (package-install 'nerd-icons))

(use-package nerd-icons
  :demand t
  :config
  (unless (find-font (font-spec :name "Symbols Nerd Font Mono"))
    (nerd-icons-install-fonts t)))

(setq display-line-numbers-type 'relative)
(add-hook 'prog-mode-hook 'display-line-numbers-mode)

(unless (package-installed-p 'doom-modeline)
  (package-install 'doom-modeline))

(use-package doom-modeline
  :demand t
  :hook (after-init . doom-modeline-mode)
  :custom
  (doom-modeline-height 28)
  (doom-modeline-bar-width 4)
  (doom-modeline-icon t)
  (doom-modeline-major-mode-icon t)
  (doom-modeline-lsp t)
  (doom-modeline-buffer-file-name-style 'truncate-upto-project))

(use-package ibuffer
  :ensure nil
  :bind ("C-x C-b" . ibuffer))

(use-package midnight
  :ensure nil
  :config
  (setq midnight-period (* 3 24 60 60))
  (midnight-mode 1))

(setq-default cursor-type 'bar)

(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))

(provide 'init-ui)
;;; init-ui.el ends here
