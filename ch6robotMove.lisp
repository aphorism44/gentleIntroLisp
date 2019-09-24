(setf robot-rooms
	'((living-room 
		(north front-stairs)
		(south dining-room)
		(east kitchen))
	(upstairs-bedroom 
		(west library)
		(south front-stairs))
	(dining-room 
		(north living-room)
		(east pantry)
		(west downstairs-bedroom))
	(kitchen 
		(west living-room)
		(south pantry))
	(pantry 
		(north kitchen)
		(west dining-room))
	(downstairs-bedroom 
		(north back-stairs)
		(east dining-room))
	(back-stairs 
		(south downstairs-bedroom)
		(north library))
	(front-stairs 
		(north upstairs-bedroom)
		(south living-room))
	(library 
		(east upstairs-bedroom)
		(south back-stairs))))
		
(setf loc 'pantry)

;6.41 - set of functions to move robot around
;a - CHOICES - displays directions and rooms from a single room
(defun choices(room)
	(cdr (assoc room robot-rooms)))
	
;b.LOOK - takes in dir and room, and tells what room robot looking into
;e.g., (look north pantry returns kitchen)
(defun look(room direction)
	(car (last (assoc direction (choices room)))))

;c. SET+ROBOT-LOCATION - robbie the robot is teleported here
(defun teleport-robot (room)
	"Moved the robot directly to the ROOM listed, without
	the need to move through the table-map."
	(setf loc room))

;d. HOW-MANY-CHOICES - moves from current location
(defun how-many-choices() 
	(length (choices loc)))

;e - UPSTAIRSP - T if it's upstairs (DEFINED - library and upstairs bedroom)
; also ONSTAIRSP - if on the stairs (DEFINED)
(defun upstairsp()
	(or
	(equal 'upstairs-bedroom loc)
	(equal 'library loc)))
	
(defun onstairsp()
	(or
	(equal 'front-stairs loc)
	(equal 'back-stairs loc)))

;f. - WHERE, add loc with appropriate text-list
(defun where() 
	(append '(the robot is) 
		(cond 
			((upstairsp) '(upstairs in the))
			((onstairsp) '(on the))  
			(t '(downstairs in the))
		)
		(list loc)))
	
;g. - MOVE	- use LOOK; if nothing there, print you hit a wall; else change location and WHERE
(defun move (direction)
	(let ((next-room (look loc direction)))  
	(if (equal nil next-room) '(ouch! the robot hit a wall) (and (teleport-robot next-room) (where)))))
	
