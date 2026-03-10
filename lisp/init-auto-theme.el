(defvar my/theme-dark  'everforest-hard-dark
  "系统深色模式时使用的主题。")

(defvar my/theme-light 'everforest-hard-light
  "系统浅色模式时使用的主题。")

(defvar my/theme-poll-interval 5
  "轮询系统外观的间隔秒数。")

(defvar my/theme--current nil
  "当前已应用的外观，'dark 或 'light，nil 表示尚未初始化。")

(defun my/theme--system-appearance ()
  "用 AppleScript 读取 macOS 当前外观，返回符号 'dark 或 'light。"
  (if (string-match "true"
        (shell-command-to-string
         "osascript -e 'tell app \"System Events\" to return dark mode of appearance preferences'"))
      'dark
    'light))

(defun my/theme--apply (appearance)
  "加载 APPEARANCE 对应的主题，外观未变化时跳过，避免不必要的重绘。"
  (unless (eq appearance my/theme--current)
    (setq my/theme--current appearance)
    (mapc #'disable-theme custom-enabled-themes)
    (pcase appearance
      ('dark  (load-theme my/theme-dark  :no-confirm))
      ('light (load-theme my/theme-light :no-confirm)))))

(defun my/theme-sync ()
  "读取系统外观并同步主题，可手动调用，也由定时器周期触发。"
  (interactive)
  (my/theme--apply (my/theme--system-appearance)))

(add-hook 'window-setup-hook #'my/theme-sync)

(run-with-timer my/theme-poll-interval
                my/theme-poll-interval
                #'my/theme-sync)

(provide 'init-auto-theme)
;;; init-auto-theme.el ends here
