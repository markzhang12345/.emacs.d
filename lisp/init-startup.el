;;; package --- Summary
;;; Commentary:
;;; Code:

(prefer-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)

(setq inhibit-startup-screen t)

(setq gc-cons-threshold most-positive-fixnum)

(add-hook 'after-init-hook
          (lambda ()
            (setq gc-cons-threshold (* 16 1024 1024))))

(setq make-backup-files nil) ; 禁用备份文件
(setq auto-save-default nil)
(which-key-mode 1)

(electric-pair-mode 1)

(provide 'init-startup)
;;; init-startup.el ends here
