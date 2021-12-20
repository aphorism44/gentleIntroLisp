;chapter 6 exercises 

;6.6 - LAST=ELEMENT - a. return LAST element of list rather than last cons cell;
; b. write version that uses REVERSE instead of LAST
; c. write version using NTH and LENGTH
; NOTE - in a dotted cell, "a.c" counts as element, not as a cell

(defun last-element-last (list)
	(car (last list)))

(defun last-element-reverse(list)
	(car (reverse list)))

(defun last-element-nth (list)
	(nth (- (length list) 1) list))

;6.7 use REVERSE to write a NEXT-TO-LAST function; then use NTH for the same thing
(defun next-to-last-reverse (list)
	(cadr (reverse list)))

(defun next-to-last-nth (list)
	(nth (- (length list) 2) list))

;6.8 create MY-BUTLAST returning list with last element removed
;(MY-BUTLAST ’(ROSES ARE RED)) -> (ROSES ARE)
;(MY-BUTLAST ’(G A G A)) -> (G A G)
(defun my-butlast (list)
	(reverse (cdr (reverse list))))

;6.10 PALINDROMEP - check if list is a palindrome
(defun palindromep (list)
	(equal list (reverse list)))

;6.11 MAKE-PALINDROME - creates a palindrome from list (by doubling it)
(defun make-palindrome (list)
	(append list (reverse list)))

;6.15 CONTAINS-ARTICLE-P, return T/nil if includes "the," "a," and "an"
; use intersection, then member-or (if possible, do member-and)
(defun contains-article-p (list)
	(> (length (intersection list '(the a an))) 0))

(defun contains-article-p-memberor (list)
	(or
		(> (length (member 'a list)) 0)
		(> (length (member 'an list)) 0)
		(> (length (member 'the list)) 0)))

(defun contains-article-p-memberand (list)
	(not (and
		(not (member 'the list))
		(not (member 'a list))
		(not (member 'an list)))))

;6.19 ADD-VOWELS - just add a/e/i/o/u to a list; order doesn't matter
(defun add-vowels (set)
	(union '(a e i o u) set))

;6.21 MY-SUBSETP - check if one set is subset of another with set-difference
(defun my-subsetp (setA setB)
	(equal nil (set-difference setA setB)))

;6.24 SET-EQUAL, check if 2 sets are equal (each is subset of the other)
(defun set-equal (setA setB)
	(and (subsetp setA setB) (subsetp setB setA)))

;6.25 PROPER-SUBSET, not a subset if the sets are the same size (equal)
(defun proper-subset (setA setB)
	(and (subsetp setA setB) (not (set-equal setA setB))))

;mini keyboard exercise - 6.26
; take 2 lists and return items in common
; format is (a b c -vs- c d e)
;a. 0 RIGHT-SIDE - return evertything to right of '-vs-'
(defun right-side (list)
	(cdr (member '-vs- list)))

;b. LEFT-SIDE - to the left
(defun left-side (list)
	(cdr (member '-vs- (reverse list))))

;c. COUNT-COMMON - returns number of items left and right have in common
(defun count-common(list)
	(intersection (right-side list) (left-side list)))

;d. COMPARE - returns (n COMMON FEATURES) where n = count of common items
(defun compare (list)
	(cons (length (count-common list)) '(common features)))

;6.30 - table BOOKS
(setf sf-books
	'((i-robot isaac-asimov)
	(dune frank-herbert)
	(nova samuel-delany)
	(neuromancer william-gibson)
	(the-demolished-man alfred-bester)))


;6.31 WHO-WROTE - input=book, output-author
(defun who-wrote (book)
	(second (assoc book sf-books)))

;6.33 WHAT-WROTE - use 6.32 suggestion
(setf sf-books-reverse
	'((i-robot . isaac-asimov)
	(dune . frank-herbert)
	(nova . samuel-delany)
	(neuromancer . william-gibson)
	(the-demolished-man . alfred-bester)))

(defun what-wrote (author)
	(car (rassoc author sf-books-reverse)))

;mini keyboard exercise
;6.35 - sim nerd - 5 states {sleeping, eating, waiting for a computer, programming, debugging}

;a - table of sequential states
(setf nerd-states
	'((sleeping eating)
	(eating waiting-for-a-computer)
	(waiting-for-a-computer programming)
	(programming debugging)
	(debugging sleeping)))

;b - NERDUS - take in state, get next state
(defun nerdus (state)
	(second (assoc state nerd-states)))

;c - SLEEPLESS-NERD - never sleeps - goes from debugging to eating
(defun sleepless-nerd (state)
	(if (equal state 'debugging) (nerdus 'sleeping) (nerdus state)))

;d - NERD-ON-CAFFEINE - jumps two states instead of one
(defun nerd-on-caffeine (state)
	(nerdus (nerdus state)))

;review exercises
;6.36 - SWAP - exchange first and last member of list
(defun swap (list)
	(append (last list) (reverse (cons (first list) (cdr (reverse (remove (first list) list)))))))

;6.38 ROTATE-LEFT and ROTATE-RIGHT; left would change (a b c d e) to (b c d e a), etc
;right changes (a b c d e) to (e a b c d)
(defun rotate-left (list)
	(reverse (cons (first list) (reverse (cdr list)))))

(defun rotate-right (list)
	(append (last list) (reverse (cdr (reverse list)))))


;CHECK THE OSs FOR sdraw.generic, (sdraw '(1 2 (3 4) 5)
; MAC - YES
; WINDOWS 10 -
; UBUNTU 20 - YES

;advanced topics

;6.42 ROYAL-WE, change I to WE
(defun royal-we (list)
	(subst 'we 'i list))
