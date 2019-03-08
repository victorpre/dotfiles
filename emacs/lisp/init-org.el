
(global-set-key "\C-ca" 'org-agenda)


(use-package ox-twbs
            :ensure t)

(use-package hide-mode-line
             :ensure t)

;; Org-present
(require 'org-present)
(eval-after-load "org-present"
  '(progn
     (add-hook 'org-present-mode-hook
               (lambda ()
                 (hide-mode-line-mode 1)
                 (evil-mode 0)
                 (linum-mode 0)
                 (org-present-big)
                 (org-display-inline-images)
                 (org-present-read-only)
                 (org-toggle-latex-fragment)))
     (add-hook 'org-present-mode-quit-hook
               (lambda ()
                 (evil-mode t)
                 (linum-mode t)
                 (hide-mode-line-mode -1)
                 (org-present-small)
                 (org-remove-inline-images)
                 (org-present-read-write)
                 (org-toggle-latex-fragment)))))

;; Image links
(require 'org-yt)
(defun org-image-link (protocol link _description)
  "Interpret LINK as base64-encoded image data."
  (cl-assert (string-match "\\`img" protocol) nil
             "Expected protocol type starting with img")
  (let ((buf (url-retrieve-synchronously (concat (substring protocol 3) ":" link))))
    (cl-assert buf nil
               "Download of image \"%s\" failed." link)
    (with-current-buffer buf
      (goto-char (point-min))
      (re-search-forward "\r?\n\r?\n")
      (buffer-substring-no-properties (point) (point-max)))))

(org-link-set-parameters
 "imghttp"
 :image-data-fun #'org-image-link)

(org-link-set-parameters
 "imghttps"
 :image-data-fun #'org-image-link)

;; Zooming
(global-set-key (kbd "C-+") #'text-scale-increase)
(global-set-key (kbd "C-\-") #'text-scale-decrease)

;; Latex
;; Add #+STARTUP: latexpreview on the top of the org file
(setq org-preview-latex-default-process 'imagemagick)


(provide 'init-org)
