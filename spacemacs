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
     html
     markdown
     yaml
     javascript
   )
   dotspacemacs-additional-packages '(
     evil-smartparens
   )
   dotspacemacs-excluded-packages '()
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  (setq-default
   dotspacemacs-editing-style 'vim
   dotspacemacs-verbose-loading nil
   dotspacemacs-startup-banner 'official
   dotspacemacs-startup-lists '(recents projects)
   ;; Press <SPC> T n to cycle to the next theme in the list
   dotspacemacs-themes '(minimal-light
                         leuven
                         spacemacs-light
                         spacemacs-dark
                         ;; solarized-dark
                         ;; solarized-light
                         ;; monokai
                         ;; zenburn
                         )
   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Fira Mono"
                               :size 20
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
   dotspacemacs-highlight-delimiters 'all
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
    (and 0)
    (or  0)
    (=   0)
    (+   0)
    (-   0)
    (*   0)
    (/   0)
    (mod 0)
    (rem 0)))

(defun dotspacemacs/user-config ()
  (global-hl-line-mode -1)
  (setq-default line-spacing 5)
  (add-hook 'clojure-mode-hook #'smartparens-strict-mode)
  (add-hook 'clojure-mode-hook #'evil-smartparens-mode)
  (add-hook 'clojure-mode-hook #'set-indent-style)

  (define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
  (define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)

  (setup-web-mode)
  (register-cider-refresh-hooks)
)

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cider-cljs-lein-repl
   "(do (require 'cljs.repl.node) (cemerick.piggieback/cljs-repl (cljs.repl.node/repl-env)))")
 '(package-selected-packages
   (quote
    (yaml-mode ws-butler window-numbering web-mode volatile-highlights vi-tilde-fringe utop tuareg caml tagedit spacemacs-theme spaceline powerline smooth-scrolling smeargle slim-mode scss-mode sass-mode restart-emacs rainbow-delimiters pyvenv pytest pyenv-mode py-yapf popwin pip-requirements persp-mode pcre2el paradox page-break-lines orgit open-junk-file ocp-indent neotree move-text mmm-mode merlin markdown-toc markdown-mode magit-gitflow macrostep lorem-ipsum linum-relative leuven-theme less-css-mode jade-mode info+ indent-guide ido-vertical-mode hy-mode hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation help-fns+ helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make projectile helm-gitignore request helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag haml-mode google-translate golden-ratio gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger gh-md flx-ido flx fill-column-indicator fancy-battery expand-region exec-path-from-shell evil-visualstar evil-tutor evil-surround evil-smartparens evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit magit magit-popup git-commit with-editor evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-args evil-anzu anzu emmet-mode elisp-slime-nav define-word cython-mode company-web web-completion-data company-statistics company-quickhelp pos-tip company-anaconda company clj-refactor hydra inflections edn multiple-cursors paredit peg clean-aindent-mode cider-eval-sexp-fu eval-sexp-fu highlight cider spinner queue pkg-info clojure-mode epl buffer-move bracketed-paste auto-yasnippet yasnippet auto-highlight-symbol auto-compile packed anaconda-mode pythonic f dash s aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core async ac-ispell auto-complete popup quelpa package-build use-package which-key bind-key bind-map evil minimal-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
