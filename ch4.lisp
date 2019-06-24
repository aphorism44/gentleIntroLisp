;;;CONDITIONALS

;;IF (t/f)
(print (if (oddp 1 ) 'odd 'even ))
(defun my-abs (x)
  (if (< x 0) (- x) x))

(defun further (n)
  (if (< n 0) (- n 1) (+ n 1)))

(print (my-abs -22))

(print (further -3))
(print (further 3))
(print (further 0))

;;COND - like a switch statement
;;NOTE - you have to create negative numbers with - function

(defun compare (a b)
  (cond ((equal a b) 'number-are-same)
    ((> a b) 'first-number-larger)
    ((> b a) 'second-number-larger)))

(print (compare 23 43))
(print (compare 1 (- 33)))
(print (compare (- 23) (- 23)))

;;use T as COND value for the default
(defun country-capital (p)
  (cond ((equal p 'paris) 'france)
    ((equal p 'london) 'england)
    ((equal p 'berlin) 'germany)
    ((equal p 'beijing) 'china)
    ((equal p 'washington) 'united_states)
    (t 'unknown)))

(print (country-capital 'paris))
(print (country-capital 'washington))
(print (country-capital 'tokyo))

(defun cycle (n)
  (cond ((< n 99) (+ 1 n))
    (t 1)))

(print (cycle 3))
(print (cycle 98))
(print (cycle 99))

;;AND and OR macros; will short-circuit at a false, while OR at true
;;AND returns NIL or value of last clause
;;OR returns NIL or value of first non-nil clause
;;they are CONDITIONALS because they don't evaluate all terms

(print(and 13 nil 12)) ;nil
(print(and 12 3 -2)) ;-2
(print(or 13 nil 12)) ;13
(print(or nil nil)) ;nil

(defun play-rpc (a b)
  (cond ((or (and (equal a 'rock) (equal b 'scissors))
         (and (equal a 'paper) (equal b 'rock))
          (and (equal a 'scissors) (equal b 'paper)))
    'first-wins)
    ((or (and (equal b 'rock) (equal a 'scissors))
         (and (equal b 'paper) (equal a 'rock))
          (and (equal b 'scissors) (equal a 'paper)))
    'second-wins)
    (t 'tie)))

(print (play-rpc 'rock 'paper))
(print (play-rpc 'paper 'paper))
(print (play-rpc 'scissors 'paper))
(print (play-rpc 'rock 'scissors))
(print (play-rpc 'paper 'scissors))
(print (play-rpc 'scissors 'scissors))
(print (play-rpc 'rock 'rock))
(print (play-rpc 'paper 'rock))
(print (play-rpc 'scissors 'rock))

;;STEP is a conditional used to debug
;;can print things out
(step (if (oddp 5) 'yes 'no))
;;when placed on a function, but apparently works diffferent depending on implementation
(step (my-abs -5))
(step (play-rpc 'rock 'scissors))

;;BOOLEAN/LOGICAL function - where output is T or NIL only

;;DE MORGAN THEOREM
;;(and x y) ===    (not (or (not x) (not y)))
;;(or x y) ===    (not (and (not x) (not y)))


