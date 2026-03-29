;;; init-terminal-ui.el --- 终端 UI 配置 -*- lexical-binding: t -*-
;;; Commentary:
;;; 纯终端（emacs -nw）友好的 UI 配置
;;; Code:

;; 关闭菜单栏、工具栏、滚动条（终端下部分自动禁用）
(menu-bar-mode -1)
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

;; 显式启用语法高亮
(global-font-lock-mode 1)
(setq font-lock-maximum-decoration t)

;; 相对行号
(setq display-line-numbers-type 'relative)
(add-hook 'prog-mode-hook 'display-line-numbers-mode)

;; 光标样式（竖线）
(setq-default cursor-type 'bar)

;; ibuffer 替代默认 buffer 列表
(use-package ibuffer
  :ensure nil
  :bind ("C-x C-b" . ibuffer))

;; 自动清理旧 buffer
(use-package midnight
  :ensure nil
  :config
  (setq midnight-period (* 3 24 60 60))
  (midnight-mode 1))

(provide 'init-terminal-ui)
;;; init-terminal-ui.el ends here
