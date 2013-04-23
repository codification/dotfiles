
(let ((adjustment-file (expand-file-name "~/.live-packs/adjustments.el")))
  (when (file-exists-p adjustment-file)
    (load-file adjustment-file)))

(live-add-packs '(~/.live-packs/personal-pack))
