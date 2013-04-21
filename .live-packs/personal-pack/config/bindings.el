;; Place your bindings here.

;; For example:
;;(define-key global-map (kbd "C-+") 'text-scale-increase)
;;(define-key global-map (kbd "C--") 'text-scale-decrease)
(define-key global-map (kbd "C-c C-s") 'surround-with)
(define-key global-map (kbd "C-'") 'er/expand-region)

;; From magnars
(global-set-key (kbd "<C-return>") 'open-line-below)
(global-set-key (kbd "<C-S-return>") 'open-line-above)

;; Hippie expand
(global-set-key (kbd "M-/") 'hippie-expand)

;; Mac Cmd-key handling
(when (and (window-system)
           (eq system-type 'darwin))
  (setq mac-option-modifier 'nil)
  (setq mac-command-modifier 'meta))
