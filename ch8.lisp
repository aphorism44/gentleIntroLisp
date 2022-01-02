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

;8.27 SQUARE-LIST - recursive; take in list, output list of squares
(defun square-list (list)
  (cond ((null list) nil)
      (t (cons (* (car list) (car list)) (square-list (cdr list))))))

;8.28 write efficient MY-NTH, n=0=first element of list
(defun my-nth (n list)
  (cond
    ((null list) nil)
    ((zerop n) (car list))
    (t (my-nth (- n 1) (cdr list)))))

;8.29 - MY-MEMBER, with 2 inputs, but only 1 changes per recursive call
(defun my-member (x list)
  (cond ((null list) nil)
    ((equal x (car list)) t)
    (t (my-member x (cdr list)))))

;8.31 recursive COMPARE-LIST, returns SAME-LENGTH, FIRST-IS-LONGER,
; or SECOND-IS-list
(defun compare-list (list1 list2)
  (cond ((and (null list1) (not (null list2))) 'second-is-longer)
      ((and (null list2) (not (null list1))) 'first-is-longer)
      ((and (null list1) (null list2)) 'same-length)
      (t (compare-list (cdr list1) (cdr list2)))))

;8.32 "conditional augmentation" SUM-NUMERIC-ELEMENTS
(defun sum-numeric-elements (list)
  (cond ((null list) 0)
        ((numberp (car list)) (+ (car list) (sum-numeric-elements (cdr list))))
        (t (sum-numeric-elements (cdr list)))))

;8.33 MY-REMOVE
(defun my-remove (x list)
  (cond ((null list) nil)
      ((equal x (car list)) (my-remove x (cdr list)))
      (t (cons (car list) (my-remove x (cdr list))))))

;8.34 MY-INTERSECTION
(defun my-intersection (list1 list2)
  (cond ((null list1) nil)
        ((my-member (car list1) list2) (cons (car list1) (my-intersection (cdr list1) list2)))
        (t (my-intersection (cdr list1) list2))))

;8.35 MY-SET-DIFFERENCE
(defun my-set-difference (list1 list2)
  (cond ((null list1) list2)
        ((my-member (car list1) list2)
          (my-set-difference (my-remove (car list1) list1) (my-remove (car list1) list2)))
        (t (cons (car list1) (my-set-difference (cdr list1) list2)))))

;8.39 - COUNT-ATOMS (use car/cdr recursion)
(defun count-atoms (list)
  (cond
    ((atom list) 1)
    (t (+ (count-atoms (car list)) (count-atoms (cdr list))))))

;8.40 - COUNT-CONS, return number of cons cells
(defun count-cons (list)
  (cond
    ((atom list) 0)
    (t (+ 1 (count-cons (car list)) (count-cons (cdr list))))))

;8.41 - SUM-TREE, only the numbers in a tree
(defun sum-tree (list)
  (cond ((numberp list) list)
        ((atom list) 0)
        (t (+ (sum-tree (car list)) (sum-tree (cdr list))))))

;8.42 - MY-SUBST, recursive version of SUBST
(defun my-subst (a b list)
  (cond ((equal a list) b)
        ((atom list) list)
        (t (cons (my-subst a b (car list)) (my-subst a b (cdr list))))))

;8.43 - FLATTEN - return in a 1D list all the items in a nested list
(defun flatten (list)
  (cond ((atom list) (list list))
        (t (append (flatten (car list)) (flatten (cdr list))))))

;8.44 - TREE-DEPTH, where a root-only tree is 1
(defun tree-depth (list)
  (cond ((atom list) 0)
        (t (+ 1 (max (tree-depth (car list)) (tree-depth (cdr list)))))))

;8.45 - PAREN-DEPTH - returns the maximum parentheses depth of a nested list
; WARN - solve with car/cdr recursion, but they're not symmetric
(defun paren-depth (list)
  (cond ((atom list) 1)
        (t (max (+ 1 paren-depth (car list)) (paren-depth (cdr list))))))

;8.46 - COUNT-UP with append
(defun count-up (n)
  (cond ((= n 0) (list 0))
        (t (append (count-up(- n 1)) (list n)))))

;8.47 MAKE-LOAF - n Xs, using IF statement
(defun make-loaf(n)
  (if (= n 0) nil (cons 'X (make-loaf(- n 1)))))

;8.48 BURY a symbol under n levels of parentheses
(defun bury (sym n)
  (cond ((= n 1) (list sym))
  (t (list (bury sym (- n 1))))))

;8.49 - PAIRINGS - assume 2 lists of equal length
; e.g., (a b c) (1 2 3) -> ((a 1)(b 2)(c 3))
(defun pairings (l1 l2)
  (cond ((null l1) nil)
        (t (cons (list (car l1) (car l2)) (pairings (cdr l1) (cdr l2))))))

;8.50 - SUBLISTS - a list of subsequent cdr of a list
(defun sublists (list)
  (cond ((null list) nil)
    (t (cons list (sublists (cdr list))))))

;8.51 - MY-REVERSE - with helping function and recursive function of 2 inputs
(defun my-reverse (list)
  (reverse-helper list (length list)))

(defun reverse-helper (list cnt)
  (cond ((= cnt 1) list)
      (t (append (reverse-helper (cdr list) (- cnt 1)) (list (car list))))))

;8.52 - MY-UNION, recursive version
(defun my-union (l1 l2)
  (cond ((null l1) l2)
        ((my-member (car l1) l2) (my-union (cdr l1) l2))
        (t (append (list (car l1)) (my-union (cdr l1) l2)))))

;8.53 LARGEST-EVEN, using MAX
(defun largest-even (list)
  (cond ((null list) 0)
        ((evenp (car list)) (max (car list) (largest-even (cdr list))))
        (t (largest-even (cdr list)))))

;8.54 - HUGE - returns number to its own power (no REDUCE allowed)
(defun huge (n)
  (huge-helper n n))

(defun huge-helper (n cnt)
  (cond ((= cnt 0) 1)
        (t (* n (huge-helper n (- cnt 1))))))

;8.56 EVERY-OTHER (1st, 3rd, 5th, etc.)
(defun every-other (list)
  (every-other-helper list (length list)))

(defun every-other-helper (list cnt)
  (cond ((= cnt 1)  list)
        ((oddp cnt) (cons (car list) (every-other-helper (cdr list) (- cnt 1))))
        (t (every-other-helper (cdr list) (- cnt 1)))))

;8.57 LEFT-HALF - returns first n/2 items, rounded up
;LENGTH is allowed; REVERSE is not
(defun left-half (list)
  (left-half-helper list 0 (round (/ (length list) 2))))

(defun left-half-helper (list index cnt)
  (cond ((= index cnt)  nil)
    (t (cons (nth index list) (left-half-helper list (+ index 1) cnt)))))

;8.58 MERGE-LIST, takes in 2 lists; merge in order
(defun merge-list (l1 l2)
  (cond
    ((null l1) l2)
    ((null l2) l1)
    ((< (car l1) (car l2)) (cons (car l1) (merge-list (cdr l1) l2)))
    ((> (car l1) (car l2)) (cons (car l2) (merge-list l1 (cdr l2))))
    (t (cons (car l1) (car l2) (merge-list (cdr l1) (cdr l2))))))
