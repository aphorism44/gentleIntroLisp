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
	(find-if #'(lambda (n) (and (< n (+ k 10)) (> n (- k 10)))) x))

;7.9 FIND-NESTED, return first elemebnt of a list that ia itself a non-NIL list
(defun find-nested (list)
	(first (find-if #'(lambda (l) (and (equal 'cons (type-of l)) (> (length l) 0))) list)))

;mini-keyboard exercises
;7.10 - change song from one key to another
;a. - table NOTE-TABLE
(setf note-table
	'((c 1) (c-sharp 2) (d 3) (d-sharp 4) (e 5) (f 6)
	(f-sharp 7) (g 8) (g-sharp 9) (a 10) (a-sharp 11) (b 12)))

;b. NOTE-TO-NUMBERS, takes a list of notes as input and returns corresponding list of numbers
(defun note-to-numbers (note-list)
	(mapcar #'(lambda (n) (second (assoc n note-table))) note-list))

;c. NUMBER-TO-NOTES - takes in numbers, returns notes
(defun number-to-notes (number-list)
	(let ((number-table (mapcar #'(lambda (l) (list (second l) (first l))) note-table)))
	(mapcar #'(lambda (n) (second (assoc n number-table))) number-list)))

;e. RAISE-NOTE-NUMBERS; raises each note by n (WARN - doesn't account for higher octaves yet)
(defun raise-note-numbers (n n-list)
	(mapcar #'(lambda (e) (+ e n)) n-list))()

;f. NORMALIZE-NOTE-NUMBERS; raising notes above 12 = higher octave; n > 12 = n - 12; n < 1 = n + 12
(defun normalize-note-numbers (num-list)
	(mapcar #'(lambda (n)
	(cond
		((> n 12) (- n 12))
		((< n 1) (+ n 12))
		('t n))
		) num-list))

;g. TRANSPOSE-NOTES; takes in N and a song (A G F G..) and returns song transposed by n half steps
;use NOTE-NUMBERS, NUMBER-NOTES, RAISE-NOTES and NORMALIZE-NOTES

(defun transpose-notes (n note-list)
	(number-to-notes (normalize-note-numbers (raise-note-numbers n (note-to-numbers note-list)))))


;7.11 function to remove numbers from list greater than 1 and less than 5
(defun remove-to-five (list)
	(remove-if #'(lambda (n) (and (> n 1) (< n 5))) list))

;7.12 function that counts the number of times "the" appers in list
(defun count-ands (list)
	(length (remove-if-not #'(lambda (e) (equal e 'and)) list)))

;7.13 returns a list of items from a different list of eqactly length 2 (?)
(defun count-length-two (list)
	(remove-if-not #'(lambda(e) (= (length e) 2)) list))

;7.14 - write INTERSECTION and UNION functions based on REMOVE-IF and REMOVE-IF-NOT
(defun intersection-remove (listA listB)
	(remove-if-not #'(lambda (e) (member e listB)) listA))

(defun union-remove (listA listB)
	(append listA (remove-if #'(lambda (e) (member e listA)) listB)))

;7.15 mini-keyboard exercise, playing cards with assoc
;a. RANK and SUITE, returns of card '(2 CLUBS)
(defun rank (card)
	(car card))
(defun suit (card)
	(cadr card))

;b. COUNT-SUIT, takes in a suit and hand of cards, and returns number of cards in suit
(setf my-hand '(
	(3 hearts)
	(5 clubs)
	(2 diamonds)
	(4 diamonds)
	(ace spades)))

(defun count-suit (suitCheck cardHand)
	(length (remove-if-not #'(lambda (card) (equal (suit card) suitCheck)) cardHand)))

;c. COLOR-OF, retrieves color of card
(setf colors '(
	(clubs black)
	(diamonds red)
	(hearts red)
	(spades black)))

(defun color-of(card)
	(second (assoc (suit card) colors)))

;d FIRST-RED - returns first red card of hand (or NIL)
(defun first-red (cardHand)
	(find-if #'(lambda (card) (equal (color-of card) 'red)) cardHand))

;e BLACK-CARDS - returns list of black cards in a hand
(defun black-cards (cardHand)
	(remove-if #'(lambda (card) (equal (color-of card) 'red)) cardHand))

;f WHAT-RANKS - takes suit and hand, returns  all cards of that suit
(defun what-ranks (checkSuit cardHand)
	(mapcar #'car (remove-if-not #'(lambda (card) (equal (suit card) checkSuit)) cardHand)))

;g. HIGHER-RANK - takes in 2 cards, and returns T if first card has higher rank than second
;HINT - use BEFOREP, p. 171
(setf all-ranks
	'(2 3 4 5 6 7 8 9 10 jack queen king ace))

;WARN - have to add BEFOREP
(defun beforep (x y l)
	"Returns true if X appears before Y in L"
	(member y (member x l)))

(defun higher-rank (cardA cardB)
	(if (< (length (beforep (rank cardA) (rank cardB) all-ranks)) 1)
	cardA cardB))

;h HIGH-CARD, returns highest ranked card in the hand
;HINT - use FIND-IF and ASSOC, OR REDUCE (next chapter)

(defun high-card (cardHand)
	(reduce #'higher-rank cardHand))

;7.16 COMBINE-SETS, collapse list of set into 1 set with reduce (not append)
(defun combine-sets (set-list)
	(remove-duplicates (reduce #'union set-list)))

;7.17 TOTAL-LENGTH, takes in list of lists, returns total length of all of them
(defun total-length (big-list)
	 (reduce #'+ (mapcar #'(lambda (l) (length l)) big-list)))


;7.19 ALL-ODD, T if whole list is odd
(defun all-odd(list)
	(every #'oddp list))

;7.20 NONE-ODD
(defun none-odd(list)
	(every #'evenp list))

;7.21 NOT-ALL-ODD
(defun not-all-odd(list)
	(not (all-odd list)))

;7.22 NOT-NONE-ODD
(defun not-none-odd(list)
	(not (none-odd list)))

;Keyboard exercise, shape knowledge representation
;database = list of assertions; pattern-matcher = searches database
;NOTE - this looks like PROLOG...
(setf block-database '(
	(b1 shape brick)
	(b1 color green)
	(b1 size small)
	(b1 supported-by b2)
	(b1 supported-by b3)
	(b2 shape brick)
	(b2 color red)
	(b2 size small)
	(b2 supports b1)
	(b2 left-of b3)
	(b3 shape brick)
	(b3 color red)
	(b3 size small)
	(b3 supports b1)
	(b3 right-of b2)
	(b4 shape pyramid)
	(b4 color blue)
	(b4 size large)
	(b4 supported-by b5)
	(b5 shape cube)
	(b5 color green)
	(b5 size large)
	(b5 supports b4)
	(b6 shape brick)
	(b6 color purple)
	(b6 size large)))

;7.29
;a. MATCH-ELEMENT, takes 2 symbols input; if 2 are equal (or second a ?) returns T else NIL
;e.g., 'red 'red  and 'red '? returns T
(defun match-element (s1 s2)
	(or (equal s1 s2) (equal s2 '?)))
;b. MATCH-TRIPLE, takes assertion, pattern; T if assertion matches pattern
; matches ? as a wildcard character
(defun match-triple (assert pattern)
	(and
		(match-element (car assert) (car pattern))
		(match-element (cadr assert) (cadr pattern))
		(match-element (caddr assert) (caddr pattern))
		))

;c. FETCH - grab lists of blocks in DB that match pattern
(defun fetch (pattern)
	(remove-if-not #'(lambda (sublist) (match-triple sublist pattern)) block-database))

;e. take block name as input, return pattern asking f/color of block, like (B3 COLOR ?)
(defun get-color-pattern (block)
	(list block 'color '?))

;f. SUPPORTERS, takes block input and returns list of blocks that support it
(defun supporters (block)
	(mapcar #'car (fetch (list '? 'supports block))))

;g. SUPP-CUBE, block input, returns T if supported by any _cube_ (use SUPPORTERS)
(defun supp-cube (block)
	(find-if #'(lambda(blockName) (fetch (list blockName '? 'cube) )) (supporters block)))

;h. (description blockName) returns (shape a color b...etc.)
; first desc1 - finds all a block's assertions
(defun desc1(block)
  (fetch (list block '? '?)))

;i. (desc. continued) now desc2 will return list of (attribute value)
(defun desc2(block)
  (mapcar #'cdr (desc1 block)))

;j. (desc finish)
(defun description(block)
  (reduce #'append (desc2 block)))

;ADVANCED TOPICS
;mapcar can combine parallel lists (any number)
;(mapcar #'* '(1 2 3 4 5) '(6 7 8 9  10))
(setf frenchWords '(
   (one un)
   (two deux)
   (three trois)
   (four quatre)
   (five cinq)))
(setf spanishWords '(
   (one uno)
   (two dos)
   (three tres)
   (four quatro)
   (five cinco)))

;7.30 - return trilingular dictionary from above
(defun translate(word)
  (list word (second 	(assoc word frenchWords)) (second (assoc word spanishWords))))

;higher order functions
(defun make-greater-than-function (n)
  #'(lambda(x)(> x n)))

(setf greater-than-six (make-greater-than-function 6))
; have to call it like this: (funcall greater-than-six 12)
