;;; package --- Summary
;;; Commentary:
;;; Code:

;; 设置系统代理，走本地 7897 端口
(setq url-proxy-services
      '(("http"  . "127.0.0.1:7897")
        ("https" . "127.0.0.1:7897")))

(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("gnu"   . "https://elpa.gnu.org/packages/")
        ("org"   . "https://orgmode.org/elpa/")))

;;个别时候会出现签名检验失败
(setq package-check-signature nil) 

;; 初始化软件包管理器
(require 'package)
(unless (bound-and-true-p package--initialized)
    (package-initialize))

;; 刷新软件源索引
(unless package-archive-contents
    (package-refresh-contents))

;; 第一个扩展插件：use-package，用来批量统一管理软件包
(unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package))

(setq use-package-always-ensure t
      use-package-always-defer t
      use-package-enable-imenu-support t
      use-package-expand-minimally t)

(require 'use-package)

(provide 'init-elpa)
