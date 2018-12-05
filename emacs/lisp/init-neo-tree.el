(use-package neotree
  :ensure t
  :config
   (when (eq 'darwin system-type)
       (setq neo-default-system-application "open"))

  (setq neo-theme (if (display-graphic-p) 'icons ))
  ;; ;; Fixed width window is an utterly horrendous idea
  ;; (setq neo-window-fixed-size nil)
  (setq neo-window-fixed-size nil)
  (setq neo-window-width 35)
  ;; When neotree is opened, find the active file and
  ;; highlight it
  (setq neo-smart-open t)
  (evil-define-key 'normal neotree-mode-map (kbd "<tab>") 'neotree-enter)
  (evil-define-key 'normal neotree-mode-map (kbd "SPC") 'neotree-quick-look)
  (evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
  (evil-define-key 'normal neotree-mode-map (kbd "R") 'neotree-refresh)
  (evil-define-key 'normal neotree-mode-map (kbd "<return>") 'neotree-enter)
  (evil-define-key 'normal neotree-mode-map (kbd "o") 'neotree-enter)
  (evil-define-key 'normal neotree-mode-map (kbd "O") 'neotree-open-file-in-system-application)
  (evil-define-key 'normal neotree-mode-map (kbd "|") (neotree-make-executor :file-fn 'neo-open-file-vertical-split))
  (evil-define-key 'normal neotree-mode-map (kbd "-") (neotree-make-executor :file-fn 'neo-open-file-horizontal-split))
 )

(provide 'init-neo-tree)
