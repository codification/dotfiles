(require 'package)
(add-to-list 'package-archives
	     '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(menu-bar-mode nil)
 '(package-selected-packages
   (quote
    (bind-key pipenv use-package docker-compose-mode dockerfile-mode aggressive-indent cider ansible ansible-doc ansible-vault markdown-mode yaml-mode magit rainbow-mode treemacs-evil find-file-in-project expand-region treemacs zenburn-theme company-jedi company paredit)))
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(winner-mode t))


;; get rid of .somefile~ and other trash in your repo folders.

;; (setq
;;  backup-by-copying t			; don't clobber symlinks
;;  backup-directory-alist
;;  '(("." . "~/.saves"))			; don't litter my fs tree
;;  delete-old-versions t
;;  kept-new-versions 6
;;  kept-old-versions 2
;;  version-control t)			; use versioned backups

(setq make-backup-files nil)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq inhibit-startup-screen t)
(setq-default indent-tabs-mode nil)
(setq indent-tabs-mode nil)
(eval-when-compile
  (require 'use-package))

(setq use-package-always-ensure t)
(use-package magit)
(use-package paredit)
(use-package company
  :config
  (progn
    (require 'company-files)
    (add-hook 'after-init-hook 'global-company-mode)))
(use-package company-jedi)
(use-package zenburn-theme)
(use-package rainbow-mode
  :config (rainbow-mode 1))
(use-package treemacs
  :defer t
  :config (progn
    (setq treemacs-follow-after-init          t
          treemacs-width                      35
          treemacs-indentation                2
          treemacs-git-integration            t
          treemacs-collapse-dirs              (if (executable-find "python") 3 0)
          treemacs-silent-refresh             nil
          treemacs-change-root-without-asking nil
          treemacs-sorting                    'alphabetic-desc
          treemacs-show-hidden-files          t
          treemacs-never-persist              nil
          treemacs-is-never-other-window      nil
          treemacs-goto-tag-strategy          'refetch-index)

    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t))
  :bind
  (:map global-map
        ([f8]         . treemacs-toggle)
        ("M-0"        . treemacs-select-window)
        ("C-c 1"      . treemacs-delete-other-windows)
        ;; ("M-m ft"     . treemacs-toggle)
        ;; ("M-m fT"     . treemacs)
        ;; ("M-m fB"     . treemacs-bookmark)
        ;; ("M-m f C-t"  . treemacs-find-file)
        ;; ("M-m f M-t"  . treemacs-find-tag)
	))
(use-package find-file-in-project
  :bind ("C-x f" . find-file-in-project)
  :config (progn
	    (require 'find-file-in-project)
	    ;; ingore directory ".tox/"
	    (setq ffip-prune-patterns `("*/.direnv/*" ,@ffip-prune-patterns))
	    ;; Do NOT ignore directory "bin/"
	    (setq ffip-prune-patterns `(delete "*/bin/*" ,@ffip-prune-patterns))))

(use-package expand-region
  :bind ("C-'" . er/expand-region))
(use-package hl-line
  :config
  (progn
    (global-hl-line-mode 1)
    (global-linum-mode 1)))
(use-package yaml-mode)
(use-package markdown-mode)
(use-package pipenv
  :init
  (add-hook 'python-mode-hook #'pipenv-mode))

(defun my/python-mode-hook ()
  (add-to-list 'company-backends 'company-jedi))

(add-hook 'python-mode-hook 'my/python-mode-hook)


 ;; Unbind Pesky Sleep Button
(global-unset-key [(control z)])
(global-unset-key [(control x)(control z)])
(put 'erase-buffer 'disabled nil)

(put 'dired-find-alternate-file 'disabled nil)



(use-package cider)
(use-package aggressive-indent)
