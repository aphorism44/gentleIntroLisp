(defparameter *grid* (make-array '(5 5) :initial-contents '((a b c d e) (f g h i k) (l m n o p) (q r s t u) (v w x y z))))

(defun get-letter (row) (col) (aref *grid* row col))

