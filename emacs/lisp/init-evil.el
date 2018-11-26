;; Evil Mode
;;; Code:
;;; init-evil.el -- My evil mode configuration.
;;; Commentary:
;;; Code:
(defun air--config-evil-leader ()
  "Configure evil leader mode."
  (evil-leader/set-leader ",")
  (evil-leader/set-key
    "g"  'magit-status
    "l"  'whitespace-mode       ;; Show invisible characters
    "S"  'delete-trailing-whitespace
    "t"  'gtags-reindex)

  (defun magit-blame-toggle ()
    "Toggle magit-blame-mode on and off interactively."
    (interactive)
    (if (and (boundp 'magit-blame-mode) magit-blame-mode)
        (magit-blame-quit)
      (call-interactively 'magit-blame))))

(use-package evil
            :ensure t
            ; :defer .1
            :init
            (setq evil-normal-state-tag   (propertize "NORMAL")
                  evil-emacs-state-tag    (propertize "EMACS")
                  evil-insert-state-tag   (propertize "INSERT")
                  evil-motion-state-tag   (propertize "MOTION")
                  evil-visual-state-tag   (propertize "VISUAL")
                  evil-operator-state-tag (propertize "OPERATOR")
            )
      :commands (evil-mode evil-define-key)
            :config
            (evil-mode 1))

(use-package evil-leader
             :ensure t
             :config
             (global-evil-leader-mode)
             (air--config-evil-leader))

(use-package evil-surround
             :ensure t
             :config
             (global-evil-surround-mode))

(use-package evil-indent-textobject
             :ensure t)


(provide 'init-evil)
;;; init-evil.el ends here
