(defun insert-around (start start-str end end-str)
  (goto-char end)
  (insert end-str)
  (goto-char start)
  (insert start-str))

(defun define-area ()
  (if (region-active-p)
      (list (region-beginning) (region-end))
    (let ((bounds (bounds-of-thing-at-point 'symbol)))
      (list (car bounds) (cdr bounds)))))

(defun surround-with (s)
  (interactive "sString to surround with: ")
  (let ((area (define-area)))
    (let ((start (car area))
          (end (cadr area)))
      (insert-around start s
                     end s))))

(defun surround-with-tag (tag)
  (interactive "s<tag> to surround with: ")
  (let ((area (define-area)))
    (let ((start (car area))
          (end (cadr area))
          (start-tag (format "<%s>" tag))
          (end-tag (format "</%s>" tag)))
      (insert-around start start-tag
                     end end-tag))))
