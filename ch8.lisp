; Chapter 8 exercises

;8.2 - IF version of this function
(defun anyoddp-r (list)
  (if (null list)
    nil
    (or (oddp (car list)) (anyoddp (cdr list)))))

;8.3 - just test this
(defun factorial-r (n)
  (cond ((zerop n)  1)
        (t (* n (factorial (- n 1))))))

;8.4
(defun laugh (n)
  (cond ((zerop n) nil)
    (t (cons 'ha (laugh (- n 1))))))

;8.5
(defun sum-list-r (list)
  (cond ((null list) 0)
  (t (+ (car list) (sum-list (cdr list))))))

;8.6
(defun alloddp-r (list)
  (cond
    ((null list) t)
    (t (and (oddp (car list)) (alloddp-r (cdr list))))))

;8.7 recursive form of member
(defun rec-member (x list)
  (cond ((null list) nil)
    ((equal (car list) x) list)
    (t (rec-member x (cdr list)))))

(setf nums
  '((one uno)
    (two dos)
    (three tres)
    (four quatro)
    (five cinco)))

;8.8 recursive form of assoc
(defun rec-assoc (x nested-list)
  (cond
    ((null nested-list) nil)
    ((equal x (caar nested-list)) (car nested-list))
    (t (rec-assoc x (cdr nested-list)))))

;8.9 recursive form of nth
(defun rec-nth (n list)
  (cond
    ((null list) nil)
    ((zerop n) (car list))
    (t (rec-nth (- n 1) (cdr list)))))

;8.10 write rec-plus (+), add1, sub1, and use cond and zerop
;if x >= 0 and y > 0, x + y = x + 1 + (y - 1)
; if y = 0, x + y = x
(defun add1 (n) (+ n 1))
(defun sub1 (n) (- n 1))

(defun rec-plus (x y)
  (cond
    ((zerop y) x)
    (t  (rec-plus (add1 x) (sub1 y)))))

;8.11 fibonacci
(defun fib (n)
  (cond
    ((= n 0) 1)
    ((= n 1) 1)
    (t  (+ (fib (- n 1)) (fib (- n 2))))))

;8.17 FIND-FIRST_ODD using double-test tail recursion
(defun find-first-odd (list)
  (cond ((null list) nil)
        ((oddp (car list)) (car list))
        (t (find-first-odd (cdr list)))))

;8.18 LAST-ELEMENT - keeps looking until it finds a cell whose cdr is an atom
; then return car of that cell; NOTE - not sure what this should return...
(defun last-element (list)
  (cond ((atom (cdr list)) (car list))
        (t (last-element (cdr list)))))

;8.21 - ADD-NUMS up to n
(defun add-nums (n)
  (cond ((= n 0) 0)
        (t (+ n (add-nums (- n 1))))))

;8.22 - ALL-EQUAL
(defun all-equal (list)
  (cond ((null (cdr list)) t)
        (t  (and (equal (car list) (cadr list)) (all-equal (cdr list))))))

;8.24 COUNT-DOWN, using list-consing from n to 1
(defun count-down(n)
  (cond ((= n 0) nil)
  (t (cons n (count-down (- n 1))))))
