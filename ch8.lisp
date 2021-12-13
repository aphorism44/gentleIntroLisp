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
