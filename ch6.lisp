;;;LIST DATA STRUCTURES

;;parentesis notation of list is easy but misleading; better to cons them

(print (cons 1 '(2 3 4))) ;okay
(print (cons '(1 2 3) 4)) ;dot list

;;append combines lists

(setf l1 '(a b))
(setf l2 '(c d))
(setf l3 '(e f))
(setf l4 (append l1 l2 l3))
(print l4)

;nondestructive; copies first part and conses it to second part
(setf part1 '(only the good))
(print (append part1 '(die young)))
(print part1)

;;CONS/LIST/APPEND
;1. CONS creates a new cons cell
;2. LIST makes new lists into a chain ending in nil
;3. see above for APPEND

(print(cons 'rice '(and beans) )) ;(RICE AND BEANS)
(print(list 'rice '(and beans) )) ;(RICE (AND BEANS))
;(step(append 'rice '(and beans) )) ;error; RICE not a list

(print(cons '(here today) '(gone tomorrow) )) ;((HERE TODAY) GONE TOMMOROW)
(print(list '(here today) '(gone tomorrow) )) ;((HERE TODAY)(GONE TOMORROW))
(print(append '(here today) '(gone tomorrow) )) ;(HERE TODAY GONE TOMORROW)

(print(cons '(rice and) 'beans) ) ;((RICE AND) . BEANS)
(print(list '(rice and) 'beans) ) ;((RICE AND) BEANS))
(print(append '(rice and) 'beans)) ;(RICE AND . BEANS)


;;REVERSE (non-destructive)
(setf testList '(one two three four five))
(print (reverse testList))

;;NTH and NTHCDR and LAST
(print (nthcdr 0 testList)) ;whole list
(print (nthcdr 3 testList)) ; (FOUR FIVE)
(print (nthcdr 7 testList)) ;NIL

(print (nth 0 testList)) ;ONE
(print (nth 3 testList)) ;FOUR
(print (nth 7 testList)) ;NIL

(print (last testList)) ;(FIVE)

;;REMOVE - all occurrences in a list
(setf list2 '(1 3 2 5 3 6  0 2 3 4))
(print (remove 3 list2))
(print (remove 0 list2))
(print list2) ;nondestructive

;;LISTS AS SETS
(setf set1 '(huey dewey louie))

;;MEMBER
(print (member 'dewey set1)) ;sublist w/dewey at beginning (order matters) 
(print (member 'donald set1)) ;nil

;;INTERSECTION/UNION/SET-DIFFERENCE


(setf num1 '(2 3 6 4))
(setf num2 '(9 4 7 2))
(setf num3 '(1 1 2 2 3 4 4 5 6))
(print (intersection num1 num2))
(print (union num1 num2)) ;doesn't repeat dupe items
(print (set-difference num1 num2)) ;removes set2 from set1
(print (union num3 nil)) ;repeats dupe items
(print (intersection num3 num3)) ;ditto; neither will unioning

;;SUBSETP - t/nil based on subset
(print (subsetp '(2 4) num1))

;;EXAMPLE -sets; turn titles into name

(defun titledp (name)
  (member (first name) '(mr ms miss mrs dr rev )))

(print (titledp '(john doe)))
(print (titledp '(dr jane doe)))

;;TABLES
;association list has key-value
;represented by a list of lists
;ASSOC - looks up by key

(setf esNum '((1 uno) (2 dos) (3 tres) (4 quatro) (5 cinco)))

(print (assoc 3 esNum)) ;(3 tres)
(print (assoc 1 esNum)) ;ditto
(print (assoc 6 esNum)); nil

;RASSOC - looks up by cdr (needs to be dotted pairs)
(setf squares '((1 . 1) (2 . 4) (3 . 9) (4 . 16) (5 . 25)))

(print (rassoc 4 squares)) ;(2 . 4)
(print (rassoc 16 squares)) ;ditto
(print (rassoc 0 squares)); nil

(print (assoc 3 squares)) ;(3 . 9)


;;EXERCISE - simulate simple creature w/cycle of 5 states (Nerdus Americanis)
(setf nerd-states '((sleeping eating) (eating waiting-for-a-computer) (waiting-for-a-computer programming) (programming debugging) (debugging sleeping)))

(defun nerdus (state)
  (cdr (assoc state nerd-states)))

(defun nerd-on-caffeine (state)
  (if (equal '(sleeping) (nerdus state)) (nerdus 'sleeping) (nerdus state) )
  )

(print (nerdus 'eating))
(print (nerdus 'debugging))
(print (nerd-on-caffeine 'eating))
(print (nerd-on-caffeine 'debugging))


;;SDRAW - draws cons cell representations of list; not standard Common Lisp
(load "sdraw.generic")
;(sdraw nerd-states)
;(sdraw squares)
;(sdraw-loop) ;this results in a prompt
;(scrawl squares); prompts for car and cdr


;;EXERCISE - Robbie the Robot moving; similar to text adventure
;rooms list is collection of symbol associated with cells of direction-newRoom
(setf rooms '(
 (living-room (north front-stairs) (south dining-room) (east kitchen))
 (upstairs-bedroom (west library) (south front-stairs))
 (dining-room (north living-room) (east pantry) (west downstairs-bedroom))
 (kitchen (west living-room) (south pantry))
 (pantry (north kitchen) (west dining-room))
 (downstairs-bedroom (north back-stairs) (east dining-room))
 (back-stairs (south downstairs-bedroom) (north library))
 (front-stairs (north upstairs-bedroom) (south living-room))
 (library (east upstairs-bedroom) (south back-stairs))))

(setf loc nil)

(defun choices(room)
  (cdr (assoc room rooms)))

(defun look (room direction)
  (cdr (assoc direction (choices room))))

(defun set-robot-location(place)
  (setf loc place))

(defun how-many-choices()
  (length (choices loc)))

(defun upstairsp()
   (or (equal loc 'library) (equal loc 'upstairs-bedroom)))

(defun onstairsp()
   (or (equal loc 'front-stairs) (equal loc 'back-stairs)))

(defun where-is-robot()
  (let ((connectString (cond ((upstairsp) '(upstairs in)) ((onstairsp) '(on)) (t '(downstairs in)))))    
    (list '(robbie is) connectString '(the) loc )
    ))

;(assoc 'kitchen rooms)
(set-robot-location 'back-stairs)
;(print (where-is-robot))


;;TREES
;use nested lists
;below commands look at _entire_ structure of list, not just first level
;SUBST: substitutes one item for another everywhere (subst new old list)
;SUBLIS: can make many substitutions at once

(setf list1 (subst 'fred 'bill
  '(bill jones sent me an itemized bill for the tires)))

(step list1)


(setf list2 (sublis '((roses . violets) (red . blue)) '(roses are red)))
(print list2)

;garbage collection - consing (creating new cells) triggers this more since
;they all take up space

;some functions take keyword arguments
(setf text1 '(b a n a n a - p a n d a))
(step (remove 'a text1))
(step (remove 'a text1 :count 3)) ;only remove first 3





