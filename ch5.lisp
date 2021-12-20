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

;c - SNAKE-EYES-P and BOXCARS-P, takes in list and checks if it's (1 1) or (6 6)
(defun snake-eyes-p (throw)
	(= 2 (sum-throw throw)))

(defun boxcars-p (throw)
	(= 12 (sum-throw throw)))

;ADD - a function that sums throw (used very often)
(defun sum-throw (throw)
	(+ (car throw) (cadr throw)))

;d - INSTANT-WIN-P, INSTANT-LOSS-P; win = 7,11; loss=2,3,12
(defun instant-win-p(throw)
	(OR
	(= 7 (sum-throw throw))
	(= 11 (sum-throw throw))))

(defun instant-loss-p(throw)
	(OR
	(= 2 (sum-throw throw))
	(= 3 (sum-throw throw))
	(= 12 (sum-throw throw))))
;e. SAY-THROW - takes a throw as input, and returns: sum, SNAKE-EYES, or BOXCARS
(defun say-throw(throw)
	(cond
		((snake-eyes-p throw) 'SNAKEEYES)
		((boxcars-p throw) 'BOXCARS)
		(t (sum-throw throw))))

;ADD - helper function to say what you threw
(defun throw-to-text (throw)
	(list 'throw (car throw) 'and (cadr throw)))

;f. CRAPS - returns win/lose/point for first throw
(defun craps()
    (let* ((throw (throw-dice))
			(part1 (list (throw-to-text throw) '--))
			(sum (say-throw throw))
			(part2 (cond
				((instant-win-p throw) '(-- you win))
				((instant-loss-p throw) '(-- you lose))
				(t (list '(-- your point is) (sum-throw throw))))))
	(list part1 sum part2)))

;g. TRY-FOR-POINT - win, try again, or lose (on a 7)
(defun try-for-point(point)
	(let* ((throw (throw-dice))
		(part1 (list (throw-to-text throw) '--))
		(sum (sum-throw throw))
		(part2 (cond
			((= point sum) '(-- you win))
			((= 7 sum) '(-- you lose))
			(t '(-- throw again)))))
	(list part1 sum part2)))
