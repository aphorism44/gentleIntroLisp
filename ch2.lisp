;;;LISTS


;;lists are cons cells with pointers; the last points to NIL
(print   (length '(list of words))   )
;nested lists have extra cons cells holding them; each one is a item
(print   (length '((blue sky) (green grass) (brown earth) (red fire)))    )
;empty list is also nil
(print '())
(print (length'()))

;;lists require same number of elements and same elements for equality
(print (equal '(a b (c d)) '(a (b c) d)  ))
(print (equal '(a (b c) d)  '(a (b c) d) ))
(print
  (equal
    '(1 2 (3 4 5 (6 7 8 (9 10 ) ) 11 ) 12) 
     '(1 2 (3 4 5 (6 7 8 9 (10)) 11) 12)       
     )
  )
;;primitive functions for grabbing items
(setf alist '(A B C D))

(print (first alist))
(print (second alist))
(print (third alist))
(print (fourth alist))

;;last is complement of first
(print (rest alist))

;;the CAR (first) and CDR (last)
;;can also use A or D for combinations (executes LEFT to RIGHT)
(print (car alist))
(print (cadr alist))
(print (caddr alist))
(print (cadddr alist))
(print (cdr alist))

;;CAR and CDR of NIL is NIL

;;CONS creates cons cells (CONStruct)
(print   (cons 'a '(b c d))  )
;;adding extra parentheses by consing something TO nil; or nested lists
(print  (cons '(a b c d) nil ))
(print (cons '(now is) '(the time)) ) ;becomes ((NOW IS) THE TIME)
;;lists from scratch
(print (cons 'a nil))
;;list takes any number of paras
(print (list 1 2 3 4 5)  )

;;more predicates
(print (listp 3 ))
(print (listp '(3 4) ))
(print (consp 3 ))
(print (consp '(3 4) ))
(print (atom 3 ))
(print (atom '(3 4) ))
(print (null 3 ))
(print (null () ))

;;can do unary math with lists
(setf unary3 '(X X X))
(setf unary4 '(X X X X))
;;rest = -1; length = convert to num

(defun unary-print (l)
  (print (length l  )))

(defun unary-lose1 (l)
  (rest l))

(defun unary-add1 (l)
  (cons 'X l))

(defun unary-zerop (l)
  (null l))

(defun unary-greaterthan (a b)
  (> (length a) (length b)) )

(unary-print unary4)
(unary-print (unary-add1 unary4 ))
(print (unary-zerop unary3 ))
(print (unary-greaterthan unary3 unary4 ))
(print (unary-greaterthan unary4 unary3 ))



;;a PROPER LIST ends in nil
;;a DOTTED LIST doesn't - the CDR is a value, not a pointer or nil
;;LIST command only creates PROPER LIST
(setf consdot (cons 'a  'b))
(print consdot)
;;LENGTH only works with proper lists - (print (length consdot))

;;circular list - can't do it yet...







