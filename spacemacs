;; -*- mode: emacs-lisp -*-

(defun dotspacemacs/layers ()
  (setq-default
   dotspacemacs-distribution 'spacemacs
   dotspacemacs-configuration-layer-path '()
   dotspacemacs-configuration-layers
   '(
     ;; Press <SPC f e R> to reload config
     ;; List: https://github.com/syl20bnr/spacemacs/tree/master/layers
     auto-completion
     emacs-lisp
     (git :variables
          git-magit-status-fullscreen t)
     clojure
     python
     ocaml
     rust
     html
     markdown
     yaml
     javascript
     sql
     django
     theming
     osx
     swift
   )
   dotspacemacs-additional-packages '(
     evil-smartparens
     restclient
     (reason-mode
      :location
      (recipe :fetcher github
              :repo "facebook/reason"
              :files ("editorSupport/emacs/reason-mode.el"
                      "editorSupport/emacs/refmt.el"))))
   dotspacemacs-excluded-packages '()
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  (setq-default
   dotspacemacs-editing-style 'vim
   dotspacemacs-verbose-loading nil
   dotspacemacs-startup-banner 'official
   dotspacemacs-startup-lists '(recents projects)
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
                            (font-lock-keyword-face :foreground "#333")  ;; def, etc
                            (font-lock-type-face :foreground "#333")  ;; namespace
                            (font-lock-preprocessor-face :foreground "#333")  ;; interop
                            (font-lock-builtin-face :foreground "#333")
                            (highlight-numbers-number :foreground "#333")
                            (font-lock-function-name-face :foreground "#333")
                            (font-lock-variable-name-face :foreground "#333")
                            (font-lock-constant-face :foreground "#333")  ;; keywords
                            (font-lock-string-face :foreground "#8F8F8F")
                            (font-lock-doc-face :foreground "#8F8F8F")
                            (font-lock-comment-face :slant normal)

                            ;; comments
                            ;; (font-lock-comment-face :foreground "#22aa22" :background "#DDFFDD")
                            ;; (hl-todo :background "#DDFFDD")
                            ;; (font-lock-comment-delimiter-face :background "#DDFFDD")
                            ))
   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state t
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
   dotspacemacs-mode-line-unicode-symbols t
   dotspacemacs-smooth-scrolling t
   dotspacemacs-smartparens-strict-mode nil
   dotspacemacs-highlight-delimiters nil
   dotspacemacs-persistent-server nil
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
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
    (=   0)
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

  ;; paredit
  (define-evil-map-key "C-."   'paredit-forward-slurp-sexp)
  (define-evil-map-key "C-,"   'paredit-forward-barf-sexp)
  (define-evil-map-key "C-s-," 'paredit-backward-slurp-sexp)
  (define-evil-map-key "C-s-." 'paredit-backward-barf-sexp)
  (define-evil-map-key "C-s-k" 'paredit-split-sexp)
  (define-evil-map-key "C-s-j" 'paredit-join-sexps)
  (define-evil-map-key "C-k"   'paredit-splice-sexp)

  ;; global
  (global-set-key (kbd "s-t") 'split-window-right-and-focus)
  (global-set-key (kbd "C-p") 'helm-projectile-find-file)
  (global-set-key (kbd "C-s") 'spacemacs/helm-project-do-ag)
  (define-evil-map-key "C-p"  'helm-projectile-find-file))

(defun dotspacemacs/user-config ()
  ;; (global-hl-line-mode -1)
  (mac-auto-operator-composition-mode)
  (setq-default line-spacing 5)
  (add-hook 'clojure-mode-hook #'smartparens-strict-mode)
  (add-hook 'clojure-mode-hook #'evil-smartparens-mode)
  (add-hook 'clojure-mode-hook #'set-indent-style)
  (setup-web-mode)
  (register-cider-refresh-hooks)
  (setup-keybindings)
)
