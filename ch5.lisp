;;;VARIABLES / SIDE EFFECTS

;;SETF macro - assigns (or replaces) existing
(setf vowels '(a e i o u))
(step (length vowels))
(step (rest vowels))
(step (car vowels))
(setf vowels2 (cdr vowels))
(step vowels)
(step vowels2)
(setf vowels (car vowels))
(step vowels)

;;SIDE EFFECT - any change to data
;;SETF does this since it actually changes a variable

;;RANDOM - returns number >= 0 but < n
;;so does the random func (but only inside the RNG)
(step (random 4.3))

;;LET - used to define local variables (in addition to parameters)
;;you MUST use the variable within the LET body
;;this is its LEXICAL CONTEXT
(defun average (x y)
  (let ((sum (+ x y)))
         (/ sum 2.0)))

(step (average 4 5))
;;(LET (declarations) calc-with-declarations)
(let ((temp1 4) (temp2 5)) (print (+ temp1 temp2)))

;;LET* - just like let, but creates local variables one at a time, not all at once
;;needed when one of the variables depends on a previous one
(defun price-diff-percent (old new)
  (let*  ((difference (- new old))
           (proportion (/ difference old))
           (percentage (* proportion 100.0)))
    (list percentage " %")
  ))

(step(price-diff-percent 90 100))

;;DOCUMENTATION will return documentation strings
;;you can place the doc comments immediately after argument list in defun
(defun add (a b)
  "Returns the sum of two inputed numbers"
  (+ a b))


(print (documentation 'add 'function))

;;comments - ; until next carriage return; USE THIS CONVENTION
;;;before a function
;;before a line
;after a line

;;;EXAMPLE - CRAP GAME

(setf *random-state* (make-random-state t)) ;don't forget this!

(defun throw-die()
  "Returns random number from 1 to 6"
  (+ (random 6) 1)
  )

(defun throw-dice()
  "Returns a list from two outputs of throw-die function"
  (list (throw-die) (throw-die)))



(defun snake-eyes-p (throw)
  "Returns T/NIL if a dice throw is two ones"
  (and (equal (car throw) 1) (equal (cadr throw) 1)))

(defun boxcars-p (throw)
  "Returns T/NIL if a dice throw is two sixes"
  (and (equal (car throw) 6) (equal (cadr throw) 6)))

(defun instant-win-p (throw)
  "Returns T/NIL if a dice throw is an instance win (7 or 11 on first throw)"
  (or (equal (+ (car throw) (cadr throw)) 7) (equal (+ (car throw) (cadr throw)) 11)   ))

(defun instant-loss-p (throw)
  "Returns T/NIL if a dice throw is an instant loss (2,3,12 on first throw)"
  (or (equal (+ (car throw) (cadr throw)) 3) (snake-eyes-p throw) (boxcars-p throw)  )   )

(defun say-throw (throw)
  "Returns either the dice throw sum or boxcars/snake eyes notice."
  (cond ( (boxcars-p throw) 'boxcars)
    ( (snake-eyes-p throw) 'snake-eyes)
    (t (+ (car throw)(cadr throw)) )  ))

(defun craps (throw)
  "Returns string based on first throw of craps game."
  (let* ((throwValue (say-throw throw))  
        (outputValue (cond ((instant-win-p throw) 'you-win ) ((instant-loss-p throw) 'you-lose) (t (list 'your-point-is throwValue)))))    
    (list 'throw (car throw) 'and (cadr throw) '-- throwValue '-- outputValue  )))

(defun try-for-point (point)
  "Once your point is made, continue throwing until you win by making point or lose by rolling 7."
  (let* ( (throw (throw-dice))
        (throwValue (say-throw throw))  
        (outputValue (cond ((equal throwValue point) 'you-win ) ((equal throwValue 7) 'you-lose) (t (list 'your-point-is point)))))    
    (list 'throw (car throw) 'and (cadr throw) '-- throwValue '-- outputValue  )))

(setf t1 (throw-dice))
(setf firstRoll (craps t1))
(step firstRoll)
(setf point (sixth firstRoll))
(setf secondRoll (try-for-point point))
(step secondRoll)


;symbols are evaluated as follows:
;1. if beginning of list, is a function name
;2. otherwise, a variable name


;symbols are not variables, but serve as names of variables
;scoping is different too

(setf a 100)

(defun f (a)
  (list a (g (+ a 1))))

(defun g(b)
  (list a b))

(step (f 3))

;outputs (3 (100 4))
;a in function-f refers to the local variable a fed in
;a in function-g defaults to the global a

(step aaa)




