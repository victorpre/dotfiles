; First time requires:
; M-x all-the-icons-install-fonts
(use-package all-the-icons)

(use-package color-theme-sanityinc-solarized
  :ensure t
  :config
  (load-theme 'sanityinc-solarized-dark t))

(provide 'init-theme)
