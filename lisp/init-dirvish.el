;;; lisp/init-dirvish.el --- 文件树配置 -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(unless (package-installed-p 'dirvish)
  (package-install 'dirvish))

(use-package dirvish
  :demand t
  :config
  (dirvish-override-dired-mode) ;; 用 dirvish 接管所有 dired buffer

  ;; 左侧文件树宽度
  (setq dirvish-side-width 35)

  ;; 使用 nerd-icons 显示文件图标
  (setq dirvish-attributes '(nerd-icons file-size))

  :bind
  ("C-x n t" . dirvish-side)) ;; 沿用之前 neotree 的快捷键

(setq dirvish-use-header-line nil) ;; 暂时不实用dirvish-fd

(provide 'init-dirvish)
;;; init-dirvish.el ends here
