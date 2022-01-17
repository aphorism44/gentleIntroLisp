; family geneology keyboard exercise
; form: (name father mother) - if nil, unknown

(setf family '(
(colin nil nil)
(deirdre nil nil)
(arthur nil nil)
(kate nil nil)
(frank nil nil)
(linda nil nil)
(suzanne colin deirdre)
(bruce arthur kate)
(charles arthur kate)
(david arthur kate)
(ellen arthur kate)
(george frank linda)
(hillary frank linda)
(andre nil nil)
(tamara bruce suzanne)
(vincent bruce suzanne)
(wanda nil nil)
(ivan george ellen)
(julie george ellen)
(marie george ellen)
(nigel andre hillary)
(frederick nil tamara)
(zelda vincent wanda)
(joshua ivan wanda)
(quentin nil nil)
(robert quentin julie)
(olivia nigel marie)
(peter nigel marie)
(erica nil nil)
(yvette robert zelda)
(diane peter erica)))

;8.60a - FATHER, MOTHER, PARENTS, CHILDREN - return nil for nil
(defun parents-helper (name)
  (cdr (assoc name family)))

(defun father (name)
  (if (null name) nil
  (car (parents-helper name))))
(defun mother (name)
  (if (null name) nil
  (cadr (parents-helper name))))
(defun parents (name)
  (if (null name) nil
  (remove nil (parents-helper name))))
(defun children (name)
  (if (null name) nil
  (remove nil (mapcar #'(lambda (family) (if (member name (cdr family)) (car family))) family))))

;8.60b - SIBLINGS - includes half-siblings
(defun siblings (name)
  (remove name (union (children (mother name)) (children (father name)))))

;8.60c MAPUNION - applicative function that: a) takes a function and list as input,
; and, b) computes union of all the results; use 2 existing applicative operators
(defun mapunion (fn lists)
  (remove-duplicates (reduce #'append (mapcar fn lists))))

;8.60d GRANDPARENTS - use MAPUNION
(defun grandparents (name)
  (mapunion #'parents (parents name)))

;8.60e COUSINS - use mapunion - return 1st cousins
; (children of any of parents' siblings)
(defun cousins (name)
  (mapunion #'children (mapunion #'siblings (parents name))))

;8.60f DESCENDED-FROM, 2 input, T if first person is descended from the second
; recursive - you are descended from someone if (base) they're your parents,
; or if (recursive function) either father or mother is descended from them
(defun descended-from (descendant ancestor)
  (cond
    ))
