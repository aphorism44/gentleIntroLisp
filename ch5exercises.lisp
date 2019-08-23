;chapter 5 exercises

;5.1 GOOD-STYLE - use LET to define function variable Q; add documentation
(defun good-style(p)
	"Returns the number entered plus 5."
	(let 
		((q (+ p 5))) 
	q))
	
;THEN CALL DOCUMENTATION on the above
;(documentation 'good-style ;function)
;can use "describe" (describe 'cons), but online docs easier to understand
	
;5.6 CRAPS IN LISP! broken into smaller functions

;a - THROW-DIE, returns random number 1-6, inclusive
(defun throw-die()
	(+ 1 (random 6)))

;b - THROW-DICE, returns list showing value of 2 separate die throws
(defun throw-dice()
	(list (throw-die) (throw-die)))

;c - 