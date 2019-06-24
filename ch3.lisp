;;;FUNCTIONS

;;functions defined
(defun average (x y)
  (/ (+ x y) 2.0))

(defun half (x)
  (/ x 2.0))

(defun cube (x)
  (* x x x))

(defun pythag (x y)
  (sqrt (+ (* x x) (* y y)) ))

(defun miles-per-gallon (initial-odometer-reading final-odometer-reading gallons-consumed)
   (/ (- final-odometer-reading initial-odometer-reading) gallons-consumed))

(defun F-TO-C (f) 
  (/ (* 5.0 (- f 32)) 9.0))

(defun no-args ()
  '(you can still run functions without arguments))

;;variables defined

(print pi)
(print (list 33 'cubed 'is (cube 33)    ) )

;;READ-EVAL-PRINT loop - like a pocket calculator

;;QUOTE function works exactly like the '
(print (list (quote a) (quote b) (quote c)))

;;LAMBDA NOTATION - unambigous definition of a mathematical function
(lambda (x) (+ x 3)) ;x + 3
(lambda (x y) (+ (* 3 x) (* y y))) ;3x + y^2
;;BUT lambda isn't a function; DEFUN is needed for that

;;SCOPE for function variables limited to function itself


;;APPLY applies a function to its inputs; first argument is #' followed by function name
(print (apply #'+ '(2 3)  ))
(print (apply #'pythag '(3 4)))
