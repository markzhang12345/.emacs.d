;;; lisp/init-lsp.el --- LSP 配置 -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(unless (package-installed-p 'lsp-mode)
  (package-install 'lsp-mode))

(unless (package-installed-p 'lsp-ui)
  (package-install 'lsp-ui))

(use-package lsp-mode
  :commands lsp
  :custom
  (lsp-server-trace nil)
  (lsp-keymap-prefix "C-c l")
  (lsp-read-process-output-max (* 1024 1024))
  (lsp-headerline-breadcrumb-enable t)   ;; 顶部显示文件路径/符号面包屑
  ;; 关闭了lsp的IO日志和stderr输出，等有问题的时候再手动打开
  (lsp-log-io nil)
  (lsp-keep-workspace-alive nil)
  (lsp-clangd-binary-path "user/bin/clangd")
  (lsp-clients-clangd-args '("--log=error"
                              "--header-insertion-decorators=0"))
  :hook
  ;; 打开 C/C++ 文件时自动启动 lsp
  (c-mode   . lsp)
  (c++-mode . lsp)
  ;; lsp 启动后激活 which-key 集成，显示可用快捷键提示
  (lsp-mode . lsp-enable-which-key-integration)
  (before-save . lsp-format-buffer))

(use-package lsp-ui
  :after lsp-mode
  :custom
  (lsp-ui-doc-enable t)
  (lsp-ui-doc-position 'at-point)        ;; 浮窗显示在光标处
  (lsp-ui-doc-show-with-cursor t)        ;; 光标停留时自动弹出
  ;; 行尾显示诊断信息（错误/警告）
  (lsp-ui-sideline-enable t)
  (lsp-ui-sideline-show-diagnostics t)
  (lsp-ui-sideline-show-code-actions t)) ;; 行尾也显示可用的 code action

(provide 'init-lsp)
;;; init-lsp.el ends here
