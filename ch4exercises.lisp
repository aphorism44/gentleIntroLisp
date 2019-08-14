;chapter 4 exercises

;4.1 MAKE-EVEN; adds one to odd; leaves even unchanged
(defun make-even(n)
   (if (oddp n) (+ 1 n) n))
   
;4.2 FURTHER - adds 1 to positive number, subtracts 1 from neg
;(personal choice -add to 0)
(defun further (n) 
	(if (< n 0) (- n 1) (+ n 1)))
	
;4.3 MY-NOT - pretend NOT doesn't exist; use IF and constants
(defun my-not(n) 
	(if (equal n nil) T nil))
	
;4.4 ORDERED - take 2 numbers, output list in asc order
(defun ordered (a b) 
	(if (> a b) (list b a) (list a b)))
	
;4.6 write MY-ABS (version of ABS) using COND instead of IF
(defun my-abs(n)
	(cond 
	((< n 0) (- 0 n))
	(t n)))

;4.8 EMPHASIZE - change good = great, bad = horrible, etc.
;based on first word in list; if no match add "very"
(defun emphasize (l)
	(cond 
		((equal (car l) 'good) (cons 'great (cdr l)))
		((equal (car l) 'bad) (cons 'horrible (cdr l)))
		((equal (car l) 'sucks) (cons 'blows (cdr l)))
		(t (cons 'very l))))
		
;4.10 CONSTRAIN - 3 inputs (x, max, min)
; x < min -> min; x > max -> max; between -> x
;write 1 version with COND, and the second with nested IFs
(defun constrain-a (x min max)
	(cond
		((< x min) min)
		((> x max) max)
		(t x)))
		
(defun constrain-b (x min max)
	(if (< x min) min (if (> x max) max x ) ))

;4.11 FIRST ZERO - takes list of 3 numbers; returns a word
; (either first, second, third, or none) indicating first zero
(defun first-zero (l)
	(cond
		( (= (car l) 0) 'first)
		( (= (cadr l) 0) 'second)
		( (= (caddr l) 0) 'third)
		( t 'none)))
		
;4.12 CYCLE - returns n+1 f/1-99, but 99 returns 1
;PERSONAL CHOICE - returns 1 under inputs outside 1-99 
(defun cycle (n)
	(cond
		( (> n 98) 1)
		( (> n 0) (+ n 1) )
		(t 1)))
		
;4.13 HOWCOMPUTE, inverse of a COMPUTE FUNCTION
; input = 3 numpers; figures out which operation would
;return c from a and b (SUM-OF, PRODUCT-OF, (BEATS ME))
(defun howcompute (a b c)
	(cond
		( (= c (+ a b)) 'sum-of  )
		( (= c (* a b)) 'product-of  )
		( (= c (- b a)) 'subtract-first-from-second  )
		( (= c (- a b)) 'subtract-second-from-first  )
		( t '(beats me)  )))

;4.15 GEQ - return T if first input is >= to second input
(defun geq (a b) 
	(or (> a b) (= a b)))
	
;4.16 square odd+, double odd-, default divide by 2
(defun weirdnum (n) 
	(cond
		((and (oddp n) (or (> n 0) (= n 0))) (* n n))
		((and (oddp n) (< n 0)) (* n 2))
		(t (/ n 2))))

;4.17 predicate, returns T if first input is BOY or GIRL AND
;second input is CHILD; OR firsrt input is MAN or WOMAN AND second
;input is ADULY