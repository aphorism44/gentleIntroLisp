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
	
