(defun sFnS (n)
	(setf arr (make-array n))
	(format t "Enter 10 elements to be swapped of the array~%")
    (format t "Enter the numbers:~&")
    (dotimes (var n t)
        (setf (aref arr var) (read) )
    )

	(setq itterator 0)
	(loop 
		(swap itterator (- 9 itterator))
		(setq itterator (+ itterator 2))
		(when (>= itterator 10) (return))
	)

	(format t "New array :")
    (print n)

)

(defun print(n)
    (dotimes(var n t)
        (print (aref arr var) )
    )
)

(defun swap(var y)
    ( setf temp (aref arr var) )
    ( setf (aref arr var) (aref arr y) )
    ( setf (aref arr y) temp )
)

(sFnS 10)