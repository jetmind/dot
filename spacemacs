;; -*- mode: emacs-lisp -*-

(defun dotspacemacs/layers ()
  (setq-default
   dotspacemacs-distribution 'spacemacs
   dotspacemacs-configuration-layer-path '()
   dotspacemacs-configuration-layers
   '(
     ;; Press <SPC f e R> to reload config
     ;; List: https://github.com/syl20bnr/spacemacs/tree/master/layers
     ivy
     ;; auto-completion
     emacs-lisp
     (git :variables git-magit-status-fullscreen t)
     (clojure :variables
              clojure-enable-linters '(clj-kondo joker)
              clojure-toplevel-inside-comment-form t)
     syntax-checking
     ;; python
     ;; ocaml
     (rust :variables
           racer-rust-src-path
           "~/.multirust/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src")
     go
     ;; (haskell :variables haskell-completion-backend 'dante)
     html
     markdown
     yaml
     ;; (javascript :variables tern-command nil)
     sql
     ;; django
     theming
     osx
     ;; swift
   )
   dotspacemacs-additional-packages '(
     evil-smartparens
     imenu-anywhere
     flycheck-clj-kondo
     flycheck-joker
     flycheck-pyflakes
     po-mode
     ;; restclient
     ;; (reason-mode
     ;;  :location
     ;;  (recipe :fetcher github
     ;;          :repo "facebook/reason"
     ;;          :files ("editorSupport/emacs/reason-mode.el"
     ;;                  "editorSupport/emacs/refmt.el")))
     )
   dotspacemacs-excluded-packages '(evil-escape)
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  (setq-default
   dotspacemacs-editing-style 'vim
   dotspacemacs-verbose-loading nil
   dotspacemacs-startup-banner 'official
   dotspacemacs-startup-lists '(recents projects)
   dotspacemacs-ask-for-lazy-installation nil
   dotspacemacs-enable-lazy-installation nil
   dotspacemacs-enable-server t
   ;; Press <SPC> T n to cycle to the next theme in the list
   dotspacemacs-themes '(leuven
                         ;; minimal-light
                         ;; spacemacs-light
                         ;; spacemacs-dark
                         ;; solarized-dark
                         ;; solarized-light
                         ;; monokai
                         ;; zenburn
                         )
   theming-modifications '((leuven
                            (default :background "#F7F7F7" :foreground "#333")
                            (font-lock-builtin-face :foreground "#333")
                            (font-lock-type-face :foreground nil)          ;; namespaces
                            (font-lock-keyword-face :foreground nil)       ;; def
                            (font-lock-preprocessor-face :foreground nil)  ;; interop
                            (cursor :foreground "#007ACC" :background "#007ACC")
                            (hl-line :background "#F0F0F0")

                            (helm-selection :background "#BFDBFE")
                            (region :background "#BFDBFE")

                            (iserach :background "#FFE9A6")
                            (lazy-highlight :background "#FFBC5D")
                            (evil-ex-substitute-matches :background "#FFBC5D")
                            (evil-ex-substitute-replacement :background "#FFE9A6")
                            (evil-search-highlight-persist-highlight-face :background "#FFE9A6")
                            (ahs-face :background "#FFE9A6")
                            (ahs-plugin-whole-buffer-face :background "#FFBC5D")
                            ;; TODO: parens and other punctuation
                            (show-paren-match :foreground "#AA3731" :background nil)

                            ;; Strings
                            (font-lock-string-face :foreground "#448C27")
                            (font-lock-doc-face :foreground "#448C27")
                            (bold :foreground "#777777" :weight normal)  ;; clojure string escape sequence

                            ;; All statically known constants (numbers, symbols, keywords, booleans)
                            (font-lock-constant-face :foreground "#7A3E9D")  ;; keywords
                            (clojure-keyword-face :foreground "#7A3E9D")
                            (highlight-numbers-number :foreground "#7A3E9D")

                            ;; Comments
                            (font-lock-comment-face :foreground "#AA3731"
                                                    :slant normal)
                            (font-lock-comment-delimiter-face :foreground "#AA3731")
                            (hl-todo :foreground "#AA3731")

                            ;; Global definitions
                            (font-lock-function-name-face :foreground "#325CC0")
                            (font-lock-variable-name-face :foreground "#325CC0")
                            ))
   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state nil
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Fira Code"
                               :size 12
                               :weight normal
                               :width normal)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   dotspacemacs-emacs-leader-key "M-m"
   dotspacemacs-major-mode-leader-key ","
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   dotspacemacs-command-key ":"
   dotspacemacs-remap-Y-to-y$ t
   dotspacemacs-auto-save-file-location 'cache
   dotspacemacs-use-ido nil
   dotspacemacs-helm-resize nil
   dotspacemacs-helm-no-header nil
   dotspacemacs-helm-position 'bottom
   dotspacemacs-enable-paste-micro-state t
   dotspacemacs-which-key-delay 0.4
   dotspacemacs-which-key-position 'bottom
   dotspacemacs-loading-progress-bar t
   dotspacemacs-fullscreen-at-startup nil
   dotspacemacs-fullscreen-use-non-native nil
   dotspacemacs-maximized-at-startup nil
   dotspacemacs-active-transparency 90
   dotspacemacs-inactive-transparency 90
   dotspacemacs-mode-line-theme 'spacemacs
   dotspacemacs-mode-line-unicode-symbols t
   dotspacemacs-smooth-scrolling t
   dotspacemacs-smartparens-strict-mode nil
   dotspacemacs-highlight-delimiters nil
   dotspacemacs-persistent-server nil
   dotspacemacs-search-tools '("rg")
   dotspacemacs-default-package-repository nil
   ))

(defun dotspacemacs/user-init ())

(defun setup-web-mode ()
  (setq-default
   css-indent-offset 2
   js-indent-offset 2
   js-indent-level 2
   web-mode-markup-indent-offset 2
   web-mode-css-indent-offset 2
   web-mode-code-indent-offset 2
   web-mode-attr-indent-offset 2))

(defun register-cider-refresh-hooks ()
  (setq cider-refresh-before-fn "user/stop"
        cider-refresh-after-fn  "user/start"))

(defun init-clojure-mode ()
  (setq clojure-indent-style :always-indent)
  ;; define-clojure-indent turns `(-> 0)` into `0` somehow...
  (put-clojure-indent '-> 0)
  (put-clojure-indent '->> 0)
  (define-clojure-indent
    (comp 0)
    (some-> 0)
    (some->> 0)
    (as-> 0)
    (and 0)
    (or  0)
    (and* 0)
    (or* 0)
    (>   0)
    (<   0)
    (>=  0)
    (<=  0)
    (=   0)
    (not= 0)
    (+   0)
    (-   0)
    (*   0)
    (/   0)
    (mod 0)
    (rem 0)
    (max 0)
    (min 0)))


(defun init-cider-mode ()
  ;; disable 'cljr-slash
  (define-key clj-refactor-map (kbd "/") nil))


(defun define-evil-map-key (key action)
  (define-key evil-normal-state-map (kbd key) action)
  (define-key evil-insert-state-map (kbd key) action)
  (define-key evil-visual-state-map (kbd key) action))


(defun setup-keybindings ()
  (define-key evil-normal-state-map "j" 'evil-next-visual-line)
  (define-key evil-normal-state-map "k" 'evil-previous-visual-line)

  ;; cider
  (define-key evil-normal-state-map (kbd "H-<return>") 'cider-eval-defun-at-point)
  (define-key evil-insert-state-map (kbd "H-<return>") 'cider-eval-defun-at-point)
  (define-key evil-visual-state-map (kbd "H-<return>") 'cider-eval-region)

  (define-key evil-normal-state-map (kbd "H-S-<return>") 'cider-eval-defun-to-comment)
  (define-key evil-insert-state-map (kbd "H-S-<return>") 'cider-eval-defun-to-comment)

  ;; paredit
  (define-evil-map-key "H-." 'paredit-forward-slurp-sexp)
  (define-evil-map-key "H-," 'paredit-forward-barf-sexp)
  (define-evil-map-key "H-<" 'paredit-backward-slurp-sexp)
  (define-evil-map-key "H->" 'paredit-backward-barf-sexp)
  (define-evil-map-key "H-k" 'paredit-splice-sexp)

  ;; global
  (global-set-key (kbd "H-t") 'split-window-right-and-focus)
  (global-set-key (kbd "H-p") 'counsel-projectile-find-file)
  (define-evil-map-key "H-p"  'counsel-projectile-find-file)
  (global-set-key (kbd "H-f") 'counsel-projectile-rg)
  (global-set-key (kbd "H-i") 'imenu-anywhere)
  (global-set-key (kbd "H-e") 'ivy-switch-buffer)
  (global-set-key (kbd "C-;") 'er/expand-region)
  (define-key evil-normal-state-map (kbd "SPC SPC") 'spacemacs/evil-search-clear-highlight)

  ;; ex command aliases
  (evil-ex-define-cmd "W" "w")
  (evil-ex-define-cmd "E" "e"))


(defun setup-colors ()
  ;; (global-font-lock-mode -1)
  (setq global-hl-todo-mode nil)
  (setq hl-todo-keyword-faces ()))


(defun setup-flycheck ()
  ;; (require 'flycheck-joker)
  ;; (add-hook 'clojure-mode-hook #'flycheck-mode)
  (require 'flycheck-pyflakes)
  (add-hook 'python-mode-hook  #'flycheck-mode))


(defun setup-mode-line ()
  (spaceline-toggle-hud-off)  ;; makes mode-line unnecessary wide
  (spaceline-toggle-major-mode-off)
  (spaceline-toggle-minor-modes-off)
  (spaceline-toggle-buffer-encoding-abbrev-off))



;; (defun init-po-mode ()
;;   (define-evil-map-key "H-<return>" 'po-edit-msgstr)
;;   (define-evil-map-key "C-j" 'po-next-untranslated-entry)
;;   (define-key po-subedit-mode-map (kbd "h-<return>") 'po-subedit-exit))


(defun dotspacemacs/user-config ()
  (setenv "LANG" "en_US.UTF-8")

  ;; (global-hl-line-mode -1)
  (setup-colors)
  (mac-auto-operator-composition-mode)
  (setq-default line-spacing 0.5)
  (setq vc-follow-symlinks t)

  (setq projectile-enable-caching t)
  (setq projectile-indexing-method 'hybrid)

  (setup-mode-line)

  (setup-flycheck)

  (add-hook 'clojure-mode-hook #'evil-smartparens-mode)
  (add-hook 'clojure-mode-hook #'smartparens-strict-mode)
  (add-hook 'clojure-mode-hook #'paredit-mode)
  (add-hook 'clojure-mode-hook #'init-clojure-mode)
  ;; (add-hook 'po-mode-hook #'init-po-mode)
  ;; (add-hook 'cider-mode-hook   #'init-cider-mode)

  (setup-web-mode)
  ;; (register-cider-refresh-hooks)
  (setup-keybindings)

  ;; (load "~/.finda/integrations/emacs/finda.el")

  (custom-set-variables
   '(cljr-auto-clean-ns nil)
   '(cljr-auto-sort-ns nil)))
