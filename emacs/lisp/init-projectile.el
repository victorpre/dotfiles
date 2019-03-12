(use-package projectile
  :ensure t
  :defer t
  :config

)

(use-package helm
             :ensure t
             :defer t
             :config
             (require 'helm-config)
             (helm-mode 1)
             (helm-autoresize-mode 1)
)

(use-package helm-projectile
             :ensure t
             :config
            (projectile-global-mode)
            (helm-projectile-on)
)



(provide 'init-projectile)
