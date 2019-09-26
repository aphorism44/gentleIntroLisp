;chapter 7 exercises

;7.1- ADD1, then apply it to (1 3 5 7 9)
(defun add1(n) (+ 1 n))

;(mapcar #'add1 '(1 2 5 7 9))

;7.2 use mapcar on DAILY-PLANET-STAFF table to extract SSNs

(setf daily-planet-staff '((olsen jimmy 123-76-4535 cub-reporter)
(kent clark 089-52-6787 reporter)
(lane lois 951-26-1438 reporter)
(white perry 355-16-7439 editor)))

;(mapcar #'third daily-planet-staff)

;7.4 - figure out how to to above for greater than five; start with greater-than-5-p
(defun greater-than-five-p (n)
	(> n 5))

;(mapcar #'greater-than-five-p '(2 0 3 4 0 -5 -6))

;7.7
(mapcar #'(lambda (word) (if (equal 'down word) 'up 'down)) '(up down up up))

;7.8 FIND-ROUGH - function takes list X and number K, then returns first item in X that's +=10 to K
(defun find-rough (x k)
	(find-if #'(lambda (n) (or (< n (+ k 10)) (> n (- k 10)))) x))
	
;7.9 FIND-NESTED, return first elemebnt of a list that ia itself a non-NIL list
(defun find-nested (list)
	(find-if #'(lambda (l)  (if (and (equal 'cons (type-of l)) (> (length l) 0))  (car l)))))