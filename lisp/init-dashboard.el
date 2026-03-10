;;; package --- Summary
;;; Commentary:
;;; Code:
(unless (package-installed-p 'projectile)
  (package-install 'projectile))

(unless (package-installed-p 'dashboard)
  (package-install 'dashboard))

(use-package dashboard
  :config
  ;; banner 图片，不存在时回退到官方 logo
  (let ((banner (expand-file-name "assets/banner.png" user-emacs-directory)))
    (setq dashboard-startup-banner
          (if (file-exists-p banner) banner 'official)))

  (setq dashboard-display-icons-p t)
  (setq dashboard-icon-type 'nerd-icons)
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (setq dashboard-projects-backend 'projectile)
  (setq dashboard-items '((recents   . 10)
                          (projects  . 10)))
  
  (dashboard-setup-startup-hook))

(add-hook 'window-setup-hook
          (lambda ()
            (dashboard-open)))

(provide 'init-dashboard)
;;; init-dashboard.el ends here

