;; User pack init file
;;
;; User this file to initiate the pack configuration.
;; See README for more information.

;; Load bindings config
(live-load-config-file "my-own.el")
(live-load-config-file "bindings.el")

;; (when (window-system)
;;   (set-face-attribute 'default nil :font "Anonymous Pro" :height 140)
;;   ;;(add-to-list 'default-frame-alist '(font . "Anonymous Pro 14"))
;;   )
;;
