;chapter 2 exercises 

;2.8 write MY-THIRD using FIRST and two RESTs

(defun my-third-a (l) (first (rest (rest l))))

;2.9 write MY-THIRD using SECOND

(defun my-third-b (l) (second (rest l)))

;2.12 - function for fourth element of list?
;(print (cadddr '(a b c d e)))

;2.18 - funciton that takes 2 inputs and cons them
(defun cons-two (a b) (cons a b))

;2.21 function, takes in 4 paras and returns 2-element nested list
(defun two-nested (a b c d) (list (list a b) (list c d)))

;2.22 DUO-CONS, adds 2 elements in front of list, 3 inputs
(defun duo-cons (a b l) (cons a (cons b l)))

;2.23 TWO-DEEPER, surrounds input w/two levels of parantheses
(defun two-deeper (n) (list (list n)))

;advanced topic exercises

;2.29 - UNARY-ADD1, increases unary number (in list) by 1
(defun unary-add1 (l) (cons 'x l))

;2.31 UNARY-ZEROP
(defun unary-zerop (l) (equal 0 (length l)))

;2.32 UNARY-GREATERP, analagous to >
(defun unary-greaterp (la lb) (> (length la) (length lb)))
