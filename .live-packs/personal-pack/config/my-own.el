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

(defun count-lines-between (start end)
  (- (count-lines start end) 1))

(defun start-of-line-p (pos)
  (/= (line-number-at-pos pos)
      (line-number-at-pos (- pos 1))))

(defun is-multiline-region ()
  (interactive)
  (message "Multiline: %s"
           (when (and (region-active-p)
                      (count-lines-between (region-beginning) (region-end)))
             (destructuring-bind (start end) (define-area)
               (when (and (start-of-line-p start)
                          (start-of-line-p end))
                 t)))))

(live-load-config-file "ox-reveal.el")
