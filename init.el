;; -*- emacs-lisp -*-

;; A big contributor to startup times is garbage collection. We up the gc
;; threshold to temporarily prevent it from running, then reset it later by
;; enabling `gcmh-mode'. Not resetting it will cause stuttering/freezes.
(setq gc-cons-threshold most-positive-fixnum)

;; turn off splash screen messages
(setq inhibit-startup-echo-area-message t
      inhibit-startup-screen t)

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/")
             '("org" . "http://orgmode.org/elpa/"))
(when (version< emacs-version "27.0") (package-initialize))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(default-frame-alist '((width . 158) (height . 100) (top . 0) (left . 0)))
 '(menu-bar-mode nil)
 '(package-selected-packages
   '(clojurescript-mode flycheck-clj-kondo flycheck counsel-projectile lsp-mode clj-refactor use-package typescript-mode dired-details applescript-mode company-pollen pollen-mode edn gnuplot which-key org-babel-eval-in-repl htmlize ox-reveal ttl-mode sparql-mode yaml-mode visual-regexp undo-tree tuareg smex smartparens slime-company skewer-mode robe restclient rainbow-mode processing-mode pretty-symbols powerline parenface-plus paredit pallet motion-mode markdown-mode magit json-mode js2-refactor ido-ubiquitous haml-mode go-mode geiser fringe-helper flymake-ruby flymake-coffee find-file-in-project expand-region elisp-slime-nav diminish company-quickhelp company-inf-ruby company-ghc color-theme coffee-mode cider-eval-sexp-fu cider bundler aggressive-indent ag ack-and-a-half ace-jump-mode))
 '(safe-local-variable-values
   '((eval define-clojure-indent
           (assoc 0)
           (ex-info 0)
           (for! 1)
           (for* 1)
           (as-> 2)
           (nextjournal\.commands\.api/register! 1)
           (nextjournal\.commands\.api/register-context-fn! 1)
           (commands/register! 1))
     (eval define-clojure-indent
           (assoc 0)
           (ex-info 0)
           (for! 1)
           (for* 1)
           (as-> 2)
           (uix/context-provider 1)
           (nextjournal\.commands\.api/register! 1)
           (nextjournal\.commands\.api/register-context-fn! 1)
           (commands/register! 1))
     (eval define-clojure-indent
           (assoc 0)
           (ex-info 0)
           (for! 1)
           (for* 1)
           (as-> 2)
           (uix/context-provider 1)
           (ductile\.ui\.commands\.api/register! 1)
           (ductile\.ui\.commands\.api/register-context-fn! 1)
           (commands/register! 1))
     (eval
      (lambda nil
        (when
            (not
             (featurep 'nextjournal))
          (let
              ((init-file-path
                (expand-file-name "emacs.d/nextjournal.el" default-directory)))
            (when
                (file-exists-p init-file-path)
              (load init-file-path)
              (require 'nextjournal))))))
     (geiser-scheme-implementation quote mit)
     (eval define-clojure-indent
           (assoc 0)
           (ex-info 0)
           (for! 1)
           (for* 1)
           (as-> 2)
           (uix/context-provider 1)
           (arsproto\.ui\.commands\.api/register! 1)
           (arsproto\.ui\.commands\.api/register-context-fn! 1)
           (commands/register! 1))
     (eval progn
           (make-variable-buffer-local 'cider-jack-in-nrepl-middlewares)
           (add-to-list 'cider-jack-in-nrepl-middlewares "shadow.cljs.devtools.server.nrepl/middleware"))
     (web-mode-markup-indent-offset . default-indent)
     (web-mode-css-indent-offset . default-indent)
     (web-mode-code-indent-offset . default-indent)
     (javascript-indent-level . default-indent)
     (css-indent-offset . default-indent)
     (default-indent . 2)
     (js2-mode-show-strict-warnings)
     (magit-save-repository-buffers . dontask)
     (frame-resize-pixelwise . t)
     (display-line-numbers-width-start . t)
     (cljr-magic-requires)
     (cider-save-file-on-load)
     (cider-repl-display-help-banner)
     (cider-auto-track-ns-form-changes)
     (eval
      (lambda nil
        (let
            ((init-file-path
              (expand-file-name "emacs.d/nextjournal.el" default-directory)))
          (when
              (file-exists-p init-file-path)
            (load init-file-path)
            (require 'nextjournal)))))
     (cider-refresh-after-fn . "com.nextjournal.journal.repl/post-refresh")
     (cider-refresh-before-fn . "com.nextjournal.journal.repl/pre-refresh")))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil))

;;; utf-8 all the time
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(setq slime-net-coding-system 'utf-8-unix)

;; I'll be sending files from the command line
(server-start)

;;; local lisp packages for this configuration live here
(add-to-list 'load-path (concat user-emacs-directory "lisp"))

;;; Like /etc/rc.d, all startup filenames begin with a number and get
;;; loaded in numerical order.
(mapc #'load-file (directory-files (concat user-emacs-directory "modules") t "[0-9]*.el$"))

;;; PER-USER CUSTOMIZATIONS

;; Here's a hook to load "~/.emacs.d/lisp/<username>-local.el" if such
;; a file exists on the load path.  Place personal extensions to this
;; configuration in that file to avoid merge hassles later.
(let ((per-user-file (concat (user-login-name) "-local.el")))
  (when (locate-library per-user-file) (load per-user-file)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-scrollbar-bg ((t (:background "#2faf2faf2faf"))))
 '(company-scrollbar-fg ((t (:background "#22e222e222e2"))))
 '(company-tooltip ((t (:inherit default :background "#1b341b341b34"))))
 '(company-tooltip-common ((t (:inherit font-lock-constant-face))))
 '(company-tooltip-common-selection ((t (:inherit font-lock-keyword-face))))
 '(company-tooltip-selection ((t (:inherit font-lock-keyword-face)))))
(put 'narrow-to-region 'disabled nil)
