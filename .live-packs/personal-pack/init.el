1;; User pack init file
;;
;; User this file to initiate the pack configuration.
;; See README for more information.
;; Various defuns
(live-load-config-file "magnars-defuns.el")
(live-load-config-file "my-own.el")
;; Load bindings config
(live-load-config-file "bindings.el")

(cua-mode -1)

;; No tabs, just spaces
(setq-default indent-tabs-mode nil)
;; disable linewrapping, I find it annoying
(setq-default truncate-lines t)

;; Tab-width 4 for HTML
(add-hook 'html-mode-hook
          (lambda()
            (setq sgml-basic-offset 4)
            (setq indent-tabs-mode nil)))

;; Add external projects under /lib to load path
(dolist (project (directory-files (live-pack-lib-dir) t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))

(require 'expand-region)

(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)

;;
;; Common LISP stuff, according to starter-kit-lisp
;;
(add-hook 'lisp-mode-hook 'run-coding-hook)
;;(add-hook 'lisp-mode-hook 'idle-highlight)
(add-hook 'lisp-mode-hook 'turn-on-paredit)
(font-lock-add-keywords 'lisp-mode
                        '(("(\\|)" . 'esk-paren-face)))

;; Quicklisp and sbcl - for now commented out since
;; My gentoo workstation has problems installing sbcl

;; (load (expand-file-name "~/quicklisp/slime-helper.el"))
;; (setq inferior-lisp-program "/usr/local/bin/sbcl")

;; Stolen from
;; https://github.com/benzitohhh/.live-packs/blob/master/immanuel_ben-pack/init.el
;; extra snippets for yas
(let ((custom-yasnippet-dir
        (concat (file-name-directory load-file-name) "etc/snippets")))
  (setq yas/snippet-dirs
        (cons custom-yasnippet-dir yas/snippet-dirs)))
(yas/reload-all)
(yas/global-mode 1)

;; Dired
(setq dired-recursive-copies 'always)
(setq dired-recursive-deletes 'top)
(setq dired-dwim-target t)
;;; Avoid creating new buffers for every directory
(put 'dired-find-alternate-file 'disabled nil)
(add-hook 'dired-mode-hook
 (lambda ()
  (define-key dired-mode-map (kbd "^")
    (lambda () (interactive) (find-alternate-file "..")))
  ; was dired-up-directory
 ))
