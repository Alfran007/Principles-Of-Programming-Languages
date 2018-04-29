; Syed Alfran Ali
;  2015KUCP1032

;DECLARING AND INITIALIZING LISTS

(setq a ( list 1 2 3 100))
(setq b ( list 7 1 2 3 45 6 10 11 0))
(print "LIST-1")
(print a)
(print b)

(defvar intersect (list))
(defvar union (list))
(defvar diff (list))
(defvar diff1 (list))

;finding intersection
(dolist (x a)
 (dolist (x1 b)
  (if (= x x1)
     (push x1 intersect)
  )
  
 )
)
(print "INTERSECTION")
(print intersect)


;finding union
(dolist (x a)
     (push x union)
  ) 
 
(dolist (x1 b)
(if (not (member x1 union))
     (push x1 union)
  )
 

 
)
(print "UNION")
(print union)

;finding difference
(dolist (x a)
     (if (not (member x b))
     (push x diff)
)
) 
(print "DIFFERENCE LIST1-LIST2")
(print diff)

(dolist (x1 b)
     (if (not (member x1 a))
     (push x1 diff1)
  )
    
  ) 
(print "DIFFERENCE LIST2-LIST1")
(print diff1)




