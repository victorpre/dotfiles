(use-package spaceline
 :ensure t
 :config

 (use-package spaceline-config
   :ensure spaceline
   :config
   (spaceline-spacemacs-theme)
   (spaceline-helm-mode)
   (setq spaceline-highlight-face-func 'spaceline-highlight-face-evil-state)
   (setq powerline-default-separator 'arrow)
   (setq ns-use-srgb-colorspace nil)
   (setq powerline-height 20)
   (spaceline-toggle-buffer-size-off)
   (spaceline-compile)
   )
 (use-package diminish :ensure t
   :config
   (diminish 'undo-tree-mode)
   (diminish 'which-key-mode)
   (diminish 'flyspell-mode)
   (diminish 'ivy-mode)
   (diminish 'flycheck-mode)
   (diminish 'eldoc-mode)
   (diminish 'overwrite-mode)
));; fix powerline separators
(setq powerline-default-separator 'utf-8)
(provide 'init-powerline)
