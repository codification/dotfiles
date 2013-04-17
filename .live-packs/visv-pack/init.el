;; User pack init file
;;
;; User this file to initiate the pack configuration.
;; See README for more information.

;; Load bindings config
(live-load-config-file "my-own.el")
(live-load-config-file "bindings.el")

;; Add external projects under /lib to load path
(dolist (project (directory-files (live-pack-lib-dir) t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))
