;;; lisp/init-org.el --- Org-mode 配置 -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package org
  :ensure nil
  :mode ("\\.org\\'" . org-mode)
  :config
  (setq org-startup-folded 'content)
  (setq org-hide-emphasis-markers t)
  (setq org-startup-with-inline-images t)
  (setq org-return-follows-link t)
  (setq org-src-fontify-natively t)
  (setq org-src-window-setup 'current-window))

(unless (package-installed-p 'org-bullets)
  (package-install 'org-bullets))

(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode))

(add-hook 'before-save-hook #'org-align-all-tags nil t)

(provide 'init-org)
;;; init-org.el ends here
