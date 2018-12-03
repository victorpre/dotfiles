; (use-package spaceline
;  :ensure t
;  :config

;  (use-package spaceline-config
;    :ensure spaceline
;    :config
;    (spaceline-spacemacs-theme)
;    (spaceline-helm-mode)
;    (setq spaceline-highlight-face-func 'spaceline-highlight-face-evil-state)
;    (setq powerline-default-separator 'arrow)
;    (setq ns-use-srgb-colorspace nil)
;    (setq powerline-height 20)
;    (spaceline-toggle-buffer-size-off)
;    (spaceline-compile)
;   )
;  (use-package diminish :ensure t
;    :config
;    (diminish 'undo-tree-mode)
;    (diminish 'which-key-mode)
;    (diminish 'flyspell-mode)
;    (diminish 'ivy-mode)
;    (diminish 'flycheck-mode)
;    (diminish 'eldoc-mode)
;    (diminish 'overwrite-mode)
; ))



(add-hook 'emacs-lisp-mode-hook 'eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'eldoc-mode)
(add-hook 'ielm-mode-hook 'eldoc-mode)

(use-package telephone-line
             :ensure t
             :config

             (use-package telephone-line-utils)

            (telephone-line-defsegment git-segment ()
              (let ((fg-color "#6fb593"))
                (telephone-line-raw
                  (format "%s %s"
                          (propertize (all-the-icons-octicon "git-branch")
                                      'face `(:family ,(all-the-icons-octicon-family) :height 1.0 :foreground ,fg-color)
                                      'display '(raise 0.0))
                          (propertize
                            (substring vc-mode (+ (if (eq (vc-backend buffer-file-name) 'Hg) 2 3) 2))
                            'face `(:foreground ,fg-color)))
                  t)))

            (custom-set-faces
              '(telephone-line-evil-emacs ((t (:inherit telephone-line-evil :background "#6c71c4"))))
              '(telephone-line-evil-normal ((t (:inherit telephone-line-evil :background "#d33682"))))
              '(telephone-line-evil-insert ((t (:inherit telephone-line-evil :background "#268bd2"))))
              '(telephone-line-evil-motion ((t (:inherit telephone-line-evil :background "DarkSlateBlue"))))
              '(telephone-line-evil-operator ((t (:inherit telephone-line-evil :background "VioletRed"))))
              '(telephone-line-evil-visual ((t (:inherit telephone-line-evil :background "#cb4b16"))))
              '(telephone-line-evil-replace ((t (:inherit telephone-line-evil :background "#dc322f"))))
              )

            (setq telephone-line-lhs
                  '((evil   . (telephone-line-evil-tag-segment))
                    (accent     . ((git-segment :active)))
                    (nil    . (telephone-line-projectile-buffer-segment))))
            (setq telephone-line-rhs
                  '((nil    . (telephone-line-misc-info-segment))
                    (accent . (telephone-line-major-mode-segment))
                    (evil   . (telephone-line-airline-position-segment))))

            (telephone-line-mode t)
)
;; fix powerline separators
(setq powerline-default-separator 'utf-8)
(provide 'init-powerline)
