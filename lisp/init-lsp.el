;;; lisp/init-lsp.el --- LSP 配置 -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;;; ── 安装依赖 ─────────────────────────────────────────────────────────────────
(unless (package-installed-p 'lsp-mode) (package-install 'lsp-mode))
(unless (package-installed-p 'lsp-ui)   (package-install 'lsp-ui))
(unless (package-installed-p 'conda)    (package-install 'conda))

;;; ── lsp-mode 公共配置 ────────────────────────────────────────────────────────
(use-package lsp-mode
  :commands lsp
  :custom
  (lsp-server-trace nil)
  (lsp-keymap-prefix "C-c l")
  (lsp-read-process-output-max (* 1024 1024))
  (lsp-headerline-breadcrumb-enable t)
  (lsp-log-io nil)
  (lsp-keep-workspace-alive nil)

  ;; ── C/C++ (clangd) ──────────────────────────────────────────────────────────
  ;; 使用 Xcode 自带的 clangd，只输出 error 级别日志
  (lsp-clients-clangd-binary-path "/usr/bin/clangd")
  (lsp-clients-clangd-args '("--log=error"
                              "--header-insertion-decorators=0"))

  :hook
  ;; ── C/C++ hooks ─────────────────────────────────────────────────────────────
  (c-mode      . lsp)
  (c++-mode    . lsp)

  ;; ── Python hooks ────────────────────────────────────────────────────────────
  (python-mode . lsp)

  ;; ── 公共 hooks ───────────────────────────────────────────────────────────────
  (lsp-mode    . lsp-enable-which-key-integration)
  (before-save . lsp-format-buffer))

;;; ── lsp-ui 界面增强（公共）──────────────────────────────────────────────────
(use-package lsp-ui
  :after lsp-mode
  :custom
  (lsp-ui-doc-enable t)
  (lsp-ui-doc-position 'at-point)
  (lsp-ui-doc-show-with-cursor t)
  (lsp-ui-sideline-enable t)
  (lsp-ui-sideline-show-diagnostics t)
  (lsp-ui-sideline-show-code-actions t))

;;; ── Python：conda 环境管理 ───────────────────────────────────────────────────
;; 切换 conda 环境后，pylsp 路径自动跟随，lsp 自动重启
(use-package conda
  :config
  (setq conda-anaconda-home "/opt/anaconda3")
  (setq conda-env-home-directory "/opt/anaconda3/envs")
  ;; 切换环境后更新 pylsp 路径并重启 lsp
  (add-hook 'conda-postactivate-hook
            (lambda ()
              (setq lsp-pylsp-server-command
                    (list (concat conda-env-current-path "/bin/pylsp")))
              (when (bound-and-true-p lsp-mode)
                (lsp-restart-workspace))))
  ;; 默认激活 base 环境
  (conda-env-activate "base"))

(provide 'init-lsp)
;;; init-lsp.el ends here
