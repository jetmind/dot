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
     clojure
     ;; python
     ;; ocaml
     ;; (rust :variables
     ;;       racer-rust-src-path
     ;;       "~/.multirust/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src")
     ;; haskell
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
     ;; restclient
     ;; (reason-mode
     ;;  :location
     ;;  (recipe :fetcher github
     ;;          :repo "facebook/reason"
     ;;          :files ("editorSupport/emacs/reason-mode.el"
     ;;                  "editorSupport/emacs/refmt.el")))
     )
   dotspacemacs-excluded-packages '()
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  (setq-default
   dotspacemacs-editing-style 'vim
   dotspacemacs-verbose-loading nil
   dotspacemacs-startup-banner 'official
   dotspacemacs-startup-lists '(recents projects)
   dotspacemacs-ask-for-lazy-installation nil
   ;; Press <SPC> T n to cycle to the next theme in the list
   dotspacemacs-themes '(leuven
                         minimal-light
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
                               :size 14
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
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
   dotspacemacs-mode-line-unicode-symbols nil
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
   web-mode-markup-indent-offset 2
   web-mode-css-indent-offset 2
   web-mode-code-indent-offset 2
   web-mode-attr-indent-offset 2))

(defun register-cider-refresh-hooks ()
  (setq cider-refresh-before-fn "user/stop"
        cider-refresh-after-fn  "user/start"))

(defun set-indent-style ()
  (setq clojure-indent-style :always-indent)
  (define-clojure-indent
    (->  0)
    (->> 0)
    (some-> 0)
    (some->> 0)
    (as-> 0)
    (and 0)
    (or  0)
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
    (rem 0)))


(defun define-evil-map-key (key action)
  (define-key evil-normal-state-map (kbd key) action)
  (define-key evil-insert-state-map (kbd key) action)
  (define-key evil-visual-state-map (kbd key) action))


(defun setup-keybindings ()
  (define-key evil-normal-state-map "j" 'evil-next-visual-line)
  (define-key evil-normal-state-map "k" 'evil-previous-visual-line)

  ;; cider
  (define-key evil-normal-state-map (kbd "s-<return>") 'cider-eval-defun-at-point)
  (define-key evil-insert-state-map (kbd "s-<return>") 'cider-eval-defun-at-point)
  (define-key evil-visual-state-map (kbd "s-<return>") 'cider-eval-region)

  ;; paredit
  (define-evil-map-key "s-." 'paredit-forward-slurp-sexp)
  (define-evil-map-key "s-," 'paredit-forward-barf-sexp)
  (define-evil-map-key "s-<" 'paredit-backward-slurp-sexp)
  (define-evil-map-key "s->" 'paredit-backward-barf-sexp)
  (define-evil-map-key "s-k" 'paredit-splice-sexp)

  ;; global
  (global-set-key (kbd "s-t") 'split-window-right-and-focus)
  (global-set-key (kbd "s-p") 'counsel-projectile-find-file)
  (define-evil-map-key "s-p"  'counsel-projectile-find-file)
  (global-set-key (kbd "s-f") 'counsel-projectile-rg)
  (global-set-key (kbd "s-i") 'imenu-anywhere)

  ;; (global-set-key (kbd "s-p") 'helm-projectile-find-file)
  ;; (define-evil-map-key "s-p"  'helm-projectile-find-file)
  ;; (global-set-key (kbd "s-f") 'spacemacs/helm-project-do-ag)

  (global-set-key (kbd "C-;") 'er/expand-region))


(defun setup-colors ()
  (setq hl-todo-keyword-faces ()))


(defun dotspacemacs/user-config ()
  ;; (global-hl-line-mode -1)
  (setup-colors)

  ;; (setq helm-grep-ag-command "rg --smart-case --no-heading --line-number %s %s %s")

  (mac-auto-operator-composition-mode)
  (setq-default line-spacing 5)
  (setq vc-follow-symlinks t)
  (add-hook 'clojure-mode-hook #'evil-smartparens-mode)
  (add-hook 'clojure-mode-hook #'smartparens-strict-mode)
  (add-hook 'clojure-mode-hook #'set-indent-style)
  (setup-web-mode)
  ;; (register-cider-refresh-hooks)
  (setup-keybindings)

  (define-key clj-refactor-map (kbd "/") nil)  ;; disable 'cljr-slash

  (custom-set-variables
   '(cljr-auto-clean-ns nil)
   '(cljr-auto-sort-ns nil))
)
