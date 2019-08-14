;Chapter 3 exercises

;3.5 - HALF, CUBE, ONEMOREP
(defun half (x)
  (/ x 2.0))

(defun cube (x)
  (* x x x))
 
(defun onemorep (a b) (equal (+ 1 a) b))

;3.6 PYTHAG, x and y, return hypothenuse
(defun pythag (x y)
  (sqrt (+ (* x x) (* y y)) ))

;3.7 MILES-PER-GALLON, initialReading, finalReading, gallons
(defun miles-per-gallon (initial-odometer-reading final-odometer-reading gallons-consumed)
   (/ (- final-odometer-reading initial-odometer-reading) gallons-consumed))

;3.11 LONGER-THAN, 2 lists (identical to Ch2 unary function)
(defun longer-than (la lb) (> (length la) (length lb)))

;3.12 ADDLENGTH, takes in list, outputs new list with length of input
;added to the front of it
(defun addlength (l) (cons (length l) l))

;keyboard exercises

;3.22.c
(defun myfun (a b) 
	(list (list a) b))

;3.22.d
(defun firstp (sym l)
	(equal sym (car l)))

;3.22.e
(defun mid-add1 (l)
	(list (car l) (+ 1 (cadr l)) (caddr l)))

;3.22.f
(defun f-to-c (f) 
	(/ (* 5.0 (- f 32)) 9.0))

;advanced topic exercises
;3.23 - in lambda, write: DOUBLE, SQUARE, ONEMOREP
;(lambda (n) (* 2 n))
;(lambda (n) (* n n))
;(lambda (a b) (equal (- b 1) b ))

