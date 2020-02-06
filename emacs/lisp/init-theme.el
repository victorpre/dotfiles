; First time requires:
; M-x all-the-icons-install-fonts
(use-package all-the-icons)

(use-package dracula-theme
  :ensure t
  :config
  (load-theme 'dracula t))

(provide 'init-theme)
