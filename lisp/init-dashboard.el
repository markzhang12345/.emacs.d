;;; package --- Summary
;;; Commentary:
;;; Code:
(unless (package-installed-p 'projectile)
  (package-install 'projectile))

(use-package projectile
  :demand t
  :config
  (projectile-mode 1)
  (setq projectile-sort-order 'recently-active))

(unless (package-installed-p 'dashboard)
  (package-install 'dashboard))

(use-package dashboard
  :config
  (random t)
  ;; banner 图片，不存在时回退到官方 logo
(let* ((assets-dir (expand-file-name "assets/" user-emacs-directory))
         (banners (directory-files assets-dir t "^banner[0-9]+\\.png$")))
    (setq dashboard-startup-banner
          (if banners
              (nth (random (length banners)) banners)
            'official)))

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
            ;; 如果启动时没有打开任何实际文件，则显示 dashboard
            ;; buffer-file-name 有值说明当前 buffer 是文件，不显示
            (unless (buffer-file-name (current-buffer))
              (dashboard-open))))

(provide 'init-dashboard)
;;; init-dashboard.el ends here

