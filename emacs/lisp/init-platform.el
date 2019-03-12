(when (eq system-type 'darwin)

      ;; default Latin font (e.g. Consolas)
      (set-face-attribute 'default nil :family "DejaVu Sans Mono for Powerline")

      ;; default font size (point * 10)
      ;;
      ;; WARNING!  Depending on the default font,
      ;; if the size is not supported very well, the frame will be clipped
      ;; so that the beginning of the buffer may not be visible correctly.
      (set-face-attribute 'default nil :height 140)
      (global-set-key (kbd "M-q") 'save-buffers-kill-terminal) ; CMD + q


      (global-set-key (kbd "M-v") #'clipboard-yank)
      (global-set-key (kbd "M-c") #'clipboard-kill-region)

)

(provide 'init-platform)
