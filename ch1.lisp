;;ch1 Exercises

;1.4 SUB2, subtracts 2 from unput
(defun sub1 (n) (- n 1))
(defun sub2 (n) (sub1 (sub1 n)))

;1.5 write TWOP in terms of ZEROP and SUB2
(defun twop (n) (zerop(sub2 n)))

;1.6 two different versions of HALF
(defun half-a (n) (/ n 2))
(defun half-b (n) (/ n 2.0))

;1.9 - TWOMOREP, returns T if first input is 2 more than second input;
;use ADD2 function from earlier

(defun add1 (n) (+ n 1))
(defun add2 (n) (add1 (add1 n)))

(defun twomorep-a (a b) (= a (add2 b)))

;1.10 find way to write TWOMOREP predicate usingf SUB2
;instead of ADD2


(defun twomorep-b (a b) (= (sub2 a) b))

;1.11 AVERAGE
(defun average (a b) (/ (+ a b) 2.0))

;1.12 MORE-THAN-HALF-P - is first input more than half of
;the second input?

(defun more-than-half-p (a b) (> a (/ b 2.0)))

;1.15 NOT-ONEP (t if anything but one)
(defun not-onep (n) (not (equal n 1)))

;1.16 NOT-PLUSP, T if input not greater than 0
(defun not-plusp (n) (not (> n 0)))

;1.17 define EVENP in terms of ODDP
(defun evenp-b (n) (oddp (+ n 1)))

;1.20 XOR (exclusicve or)
(defun xor-b (a b) (not (equal a b)))