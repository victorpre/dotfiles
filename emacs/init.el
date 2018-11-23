(setq user-full-name "victorpre")
(setq user-mail-address "victor.presumido@gmail.com")
;;; package --- Main init file
;;; Commentary:
;;; This is my init file
(package-initialize)

;;; Code:
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'base)

(provide 'init)
;;; init.el ends here
