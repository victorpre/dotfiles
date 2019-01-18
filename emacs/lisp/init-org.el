
(global-set-key "\C-ca" 'org-agenda)


(use-package ox-twbs
            :ensure t)

(use-package hide-mode-line
             :ensure t)

;; Org-present
(require 'org-present)
(add-hook 'org-present-mode-hook #'hide-mode-line-mode)
(add-hook 'org-present-mode-hook  (lambda () (linum-mode 0)))
(add-hook 'org-present-mode-hook  (lambda () (evil-mode 0)))


;; Zooming
(global-set-key (kbd "C-+") #'text-scale-increase)
(global-set-key (kbd "C-\-") #'text-scale-decrease)

(provide 'init-org)
