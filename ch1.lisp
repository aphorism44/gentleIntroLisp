;;;BASICS


;;basic math
(print "basic math")
(print (+ 4 4))
(print (- 10 4))
(print (* 9 6))
(print (/ 5 2))
(print (/ 5.0 2))
(print (abs -143))
(print (sqrt 144))

;;symbols are denoted: 'stringName

;;T and NIL
(print "these are all T")
(print (numberp 2))
(print (symbolp 'dog))
(print (zerop 0))
(print (oddp 29))
(print (evenp 28))
(print (< 1 2))
(print (equal 'cat 'cat))
(print (= 2 2))
(print "and these are all NIL")
(print (numberp 'dog))
(print (symbolp 2))
(print (zerop 35))
(print (oddp 28))
(print (evenp 29))
(print (< 2 1))
(print (equal 'cat 'dog))
(print (= 2 -2))

;;binding functions together
(print "functions, simple")
(defun add1 (n)
  (+ 1 n))

(defun add2 (n)
  (add1 (add1 n)))

(defun twop (n)
  (= 2 n))

(print (add1 4))
(print (add2 4))
(print (twop 3))
(print (twop 2))

;;NOT is the negator
(print "not usage")
(print (not t))
(print (not nil))
(print (not 'cat))
(print (not 14))




