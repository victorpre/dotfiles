(use-package flycheck
  :ensure t
  :diminish flycheck-mode
  :defer t
  :config
  ; Arrow
  (when (fboundp 'define-fringe-bitmap)
    (define-fringe-bitmap 'arrow/flycheck-fringe-indicator
      (vector #b00000000
              #b00000000
              #b10000000
              #b11000000
              #b11100000
              #b11110000
              #b11111000
              #b11111100
              #b11111110
              #b11111110
              #b11111100
              #b11111000
              #b11110000
              #b11100000
              #b11000000
              #b10000000
              #b00000000)))

  ; Circle
  (when (fboundp 'define-fringe-bitmap)
    (define-fringe-bitmap 'victorpre/flycheck-fringe-indicator
      (vector #b00000000
              #b00000000
              #b00000000
              #b00000000
              #b00000000
              #b00000000
              #b00000000
              #b00011100
              #b00111110
              #b00111110
              #b00111110
              #b00011100
              #b00000000
              #b00000000
              #b00000000
              #b00000000
              #b01111111)))


  ;; Highlighting error
  (set-face-attribute 'flycheck-warning nil
                    :background "#b58900"
                    :foreground "#262626"
                    :underline nil)

  (set-face-attribute 'flycheck-error nil
                    :background "#dc322f"
                    :foreground "#262626"
                    :underline nil)

  (set-face-attribute 'flycheck-fringe-error nil
                      :inherit 'error
                      :background nil
                      :foreground "#dc322f"
                      :weight 'bold
                      :width 'extra-expanded)

  (set-face-attribute 'flycheck-fringe-warning nil
                      :inherit 'error
                      :background nil
                      :foreground "#b58900"
                      :weight 'bold
                      :width 'extra-expanded)

  (set-face-attribute 'flycheck-fringe-info nil
                      :background "medium sea green"
                      :foreground "black")

  (flycheck-define-error-level 'error
    :overlay-category 'flycheck-error-overlay
    :fringe-bitmap 'victorpre/flycheck-fringe-indicator
    :fringe-face 'flycheck-fringe-error)

  (flycheck-define-error-level 'warning
    :overlay-category 'flycheck-warning-overlay
    :fringe-bitmap 'arrow/flycheck-fringe-indicator
    :fringe-face 'flycheck-fringe-warning)

  (flycheck-define-error-level 'info
    :overlay-category 'flycheck-info-overlay
    :fringe-bitmap 'arrow/flycheck-fringe-indicator
    :fringe-face 'flycheck-fringe-info)
  ;; disable jshint since we prefer eslint checking
  (setq-default flycheck-disabled-checkers
                (append flycheck-disabled-checkers
                        '(javascript-jshint)))
  ;; use eslint with js2-mode for js and JSX files
  (flycheck-add-mode 'javascript-eslint 'js2-mode)
  (flycheck-add-mode 'javascript-eslint 'rjsx-mode)
  ;; customize flycheck temp file prefix
  (setq-default flycheck-temp-prefix ".flycheck")
  ;; disable json-jsonlist checking for json files
  (setq-default flycheck-disabled-checkers
                (append flycheck-disabled-checkers
                        '(json-jsonlist)))
  (setq-default flycheck-disabled-checkers
                (append flycheck-disabled-checkers
                        '(emacs-lisp-checkdoc)))
  ; (setq-default flycheck-disabled-checkers
  ;               (append flycheck-disabled-checkers
  ;                       '(ruby-rubocop)))
  (setq flycheck-rubocop-lint-only t)
  (setq-default flycheck-ruby-executable "~/.rbenv/shims/ruby")
  (setq-default flycheck-ruby-rubocop-executable "~/.rbenv/shims/rubocop")

  (setq flycheck-global-modes '(not org-mode))
  )

(add-hook 'after-init-hook 'global-flycheck-mode)
(provide 'init-flycheck)
