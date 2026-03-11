;;; Load Everforest hard dark theme

(add-to-list 'custom-theme-load-path
             (expand-file-name "themes/everforest" user-emacs-directory))

(load-theme 'everforest-hard-dark :no-confirm)

(provide 'init-theme)
;;; init-theme.el ends here
