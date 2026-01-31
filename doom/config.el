;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-dracula)
(setq doom-font (font-spec :family "MesloLGS NF" :size 14))
(setq doom-unicode-font (font-spec :family "MesloLGS NF"))
;; (setq doom-symbol-font (font-spec :family "MesloLGS NF" :size 8))


;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(setq projectile-project-search-path '("~/Code/"))

;; --------------------------------------------------------------------------
;; Custom "Tmux-like" Control-A Map
;; --------------------------------------------------------------------------

;; 1. Define the custom menu
(defvar my-ctrl-a-map (make-sparse-keymap)
  "My custom prefix map for C-a (Tmux style)")

;; 2. Fill the menu with commands
(map! :map my-ctrl-a-map
      ;; --- Window Movements (Arrows + Vim keys) ---
      "<left>"  #'evil-window-left
      "h"       #'evil-window-left
      "<right>" #'evil-window-right
      "l"       #'evil-window-right
      "<up>"    #'evil-window-up
      "k"       #'evil-window-up
      "<down>"  #'evil-window-down
      "j"       #'evil-window-down

      ;; --- Workspace Switching ---
      "a"       #'+workspace/other        ; Toggle last workspace
      "1"       #'+workspace/switch-to-0
      "2"       #'+workspace/switch-to-1
      "3"       #'+workspace/switch-to-2
      "4"       #'+workspace/switch-to-3
      "5"       #'+workspace/switch-to-4
      "6"       #'+workspace/switch-to-5
      "7"       #'+workspace/switch-to-6
      "8"       #'+workspace/switch-to-7
      "9"       #'+workspace/switch-to-8
      "0"       #'+workspace/switch-to-final

      ;; --- Actions ---
      "c"       #'+workspace/new
      "x"       #'+workspace/kill)

;; 3. Bind 'C-a' to this new menu GLOBALLY (The Nuclear Option)
;; This ensures it works in Terminals, Dired, and Insert Mode.
(after! general
  (general-def :keymaps 'override
    "C-a" my-ctrl-a-map))

;; 4. Force "Which-Key" Descriptions
;; This ensures the popup menu shows readable labels instead of function names.
(after! which-key
  (which-key-add-keymap-based-replacements my-ctrl-a-map
    "c"       "New Workspace"
    "x"       "Kill Workspace"
    "a"       "Previous Workspace"
    "1"       "Workspace 1"
    "2"       "Workspace 2"
    "3"       "Workspace 3"
    "4"       "Workspace 4"
    "5"       "Workspace 5"
    "6"       "Workspace 6"
    "7"       "Workspace 7"
    "8"       "Workspace 8"
    "9"       "Workspace 9"
    "0"       "Last Workspace"
    "h"       "Window Left"
    "l"       "Window Right"
    "k"       "Window Up"
    "j"       "Window Down"
    "<left>"  "Window Left"
    "<right>" "Window Right"
    "<up>"    "Window Up"
    "<down>"  "Window Down"))

;; Formatting
(use-package lsp-biome
  :vc (:url "https://github.com/cxa/lsp-biome")
  :preface
  (defun my/lsp-biome-active-hook ()
    (setq-local apheleia-formatter '(biome)))

  :config
  (add-hook 'lsp-biome-active-hook #'my/lsp-biome-active-hook))


;; Formatting buffer
(map! :leader
      :prefix "c"
      :desc "Format buffer"
      "=" #'+format/buffer)


(after! apheleia
  (add-to-list 'apheleia-formatters
               '(rubocop . ("bundle" "exec" "rubocop"
                            "--stdin" filepath
                            "-A"
                            "--stderr"
                            "--format" "quiet"
                            "--fail-level" "fatal")))

  (add-to-list 'apheleia-formatters
               '(biome . ("biome" "format" "--stdin-file-path" filepath)))

  (setq apheleia-mode-alist (assq-delete-all 'ruby-mode apheleia-mode-alist))
  (setq apheleia-mode-alist (assq-delete-all 'ruby-ts-mode apheleia-mode-alist))

  (add-to-list 'apheleia-mode-alist '(ruby-ts-mode . rubocop))
  (add-to-list 'apheleia-mode-alist '(ruby-mode . rubocop)))

(setq flycheck-ruby-rubocop-executable "~/.asdf/shims/rubocop")
;; End Formatting

(with-eval-after-load 'evil
  (defalias #'forward-evil-word #'forward-evil-symbol)
  ;; make evil-search-word look for symbol rather than word boundaries
  (setq-default evil-symbol-word-search t))


(setq-default shell-file-name "/bin/zsh")

;; Vterm adjustments
(after! vterm
  ;; Set terminal type and environment
  (setq vterm-environment '("TERM=xterm-256color"
                            "INSIDE_EMACS=vterm"))

  ;; Set max scrollback
  (setq vterm-max-scrollback 10000)

  ;; Better handling of long lines
  (setq vterm-copy-exclude-prompt t)

  ;; Use builtin prompt detection for better right prompt support
  (setq vterm-use-vterm-prompt-detection-method 'builtin)

  ;; Enable directory tracking
  (add-to-list 'vterm-eval-cmds '("update-pwd" (lambda (path) (setq default-directory path)))))

;; UTF-8 encoding
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)


;; Indent Guide
(after! indent-bars
  (setq indent-bars-highlight-current-depth t)

  ;; Enable Tree-Sitter support for more accurate guides
  (setq indent-bars-treesit-support t)


  ;; --- Appearance ---
  (setq
   indent-bars-pattern "."
   indent-bars-width-frac 0.5
   indent-bars-pad-frac 0.25
   indent-bars-color-by-depth nil
   indent-bars-display-on-blank-lines t
   indent-bars-highlight-current-depth '(:face default :blend 0.4))
  )

;; Workspace
(after! persp-mode
  ;; alternative, non-fancy version which only centers the output of +workspace--tabline
  (defun centered-workspaces ()
    (+doom-dashboard--center (frame-width) (+workspace--tabline)))

  (defun hy/invisible-current-workspace ()
    "The tab bar doesn't update when only faces change (i.e. the
    current workspace), so we invisibly print the current workspace
    name as well to trigger updates"
    (propertize (safe-persp-name (get-current-persp)) 'invisible t))

  (customize-set-variable 'tab-bar-format '(+workspace--tabline tab-bar-format-align-right hy/invisible-current-workspace))

  ;; don't show current workspaces when we switch, since we always see them
  (advice-add #'+workspace/display :override #'ignore)
  ;; same for renaming and deleting (and saving, but oh well)
  (advice-add #'+workspace-message :override #'ignore))

;; need to run this later for it to not break frame size for some reason
(run-at-time nil nil (cmd! (tab-bar-mode +1)))

(map! :leader :desc "Switch to last workspace" "TAB TAB" #'+workspace/other)
;; End Workspace

;; Start on Full screen
(add-to-list 'initial-frame-alist '(fullscreen . maximized))


;; Visual Replace with evil mode
(defun visual-replace-regexp ()
  "Start an evil-ex command to substitute the visual selection."
  (interactive)
  ;; This command is only for visual mode
  (when (region-active-p)
    (let* (;; Get the selected text
           (search-term (buffer-substring-no-properties (region-beginning) (region-end)))
           ;; Quote the text so special characters like '.' or '*'
           ;; are treated as literal text, not regex.
           (quoted-term (regexp-quote search-term))
           (ex-command (concat "%s/" quoted-term "/"))) ;; Build the command string
      (deactivate-mark) ;; Deactivate the visual selection (exits visual mode)

      ;; Open the evil command line with our string pre-filled
      (evil-ex ex-command))))

;; Bind 'gr' in visual mode
(map! :v "gr" #'visual-replace-regexp)

;; Turn off evil mode - useful for vterm
(map! :leader "d n e" #'turn-off-evil-mode)

(after! treesit
  (setq treesit-language-source-alist
        '((typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src" nil nil)
          (tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src" nil nil))))

(use-package typescript-ts-mode
  :mode (("\\.ts\\'" . typescript-ts-mode)
         ("\\.tsx\\'" . tsx-ts-mode))
  :config
  (add-hook! '(typescript-ts-mode-hook tsx-ts-mode-hook) #'lsp!))


;; Search
;; #alpha beta Search for alpha and beta in any order.
;; #alpha.*beta Search for alpha before beta.
;; #\(alpha\|beta\) Search for alpha or beta (Note Emacs syntax!)
;; #word -- -C3 Search for word, include 3 lines as context
;; #;; first#second Search for first, quick filter for second.


(after! treemacs
  (setq treemacs-lock-width nil))

;; Remove --literal-pathspecs from Magit's global git arguments
(with-eval-after-load 'magit
  (setq magit-git-global-arguments
        (remove "--literal-pathspecs" magit-git-global-arguments)))


;; Code completion
(after! corfu
  (setq corfu-auto t
        corfu-preselect 'first
        +corfu-want-tab-prefer-expand-snippets t))

;; Claude
(use-package! claude-code-ide
  :bind ("C-c a i" . claude-code-ide-menu) ; Set your favorite keybinding
  :config
  (setq claude-code-ide-terminal-backend 'eat)
  (claude-code-ide-emacs-tools-setup)) ; Optionally enable Emacs MCP tools

;; Org-Present
(defun my/org-present-start ()
  (setq-local face-remapping-alist
              '((default (:height 1.5) default)  ; This replaces (text-scale-set)
                (header-line (:height 4.0) variable-pitch)
                (org-document-title (:height 1.75) org-document-title)
                (org-level-1 (:height 1.5) org-level-1)
                (org-level-2 (:height 1.2) org-level-2)
                (org-block-begin-line (:height 0.7) org-block)))

  (setq header-line-format " ")
  (set-face-background 'header-line "doom-modeline-bar-inactive")
  (org-display-inline-images)
  (visual-fill-column-mode 1)
  (visual-line-mode 1)
  (doom-disable-line-numbers-h)
  (text-scale-set 4)
  (hl-line-mode 0)
  (menu-bar-mode 0)
  (tool-bar-mode 0)
  )

(defun my/org-present-end ()
  (setq-local face-remapping-alist nil)
  (setq header-line-format nil)
  (org-remove-inline-images)
  (visual-fill-column-mode 0)
  (visual-line-mode 0)
  (hl-line-mode 1)
  (menu-bar-mode 1)
  (text-scale-set 0)
  (doom-enable-line-numbers-h)
  (doom/reset-font-size))

(use-package! org-present
  :hook
  ((org-present-mode . my/org-present-start)
   (org-present-mode-quit . my/org-present-end))
  :config
  (setq visual-fill-column-width 20
        visual-fill-column-center-text t)
  (map! :map org-present-mode-keymap
        :nm "n" #'org-present-next
        :nm "b" #'org-present-prev
        :nm "q" #'org-present-quit)
  )


;; Auto Disable evil
(after! (evil vterm eat)
  (evil-set-initial-state 'vterm-mode 'emacs))
