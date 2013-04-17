;; User pack init file
;;
;; User this file to initiate the pack configuration.
;; See README for more information.

(cua-mode -1)


;; Various defuns
(live-load-config-file "my-own.el")
(live-load-config-file "magnars-defuns.el")
;; Load bindings config
(live-load-config-file "bindings.el")

;; No tabs, just spaces
(setq-default indent-tabs-mode nil)

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
