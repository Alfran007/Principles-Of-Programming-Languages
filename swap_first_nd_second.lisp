(defun sFnS (n)
	(setf arr (make-array n))
	(format t "Enter any 10 elements in the array~%")
    (format t "Enter the numbers:~&")
    (dotimes (var n t)
        (setf (aref arr var) (read) )
    )

	(setq i 0)
	(loop 
		(swap i (+ i 1))
		(setq i (+ i 2))
		(when (>= i 10) (return))
	)

	(format t "New array is :")
    (print n)

)

(defun print(n)
    (dotimes(x n t)
        (print (aref arr x) )
    )
)

(defun swap(x y)
    ( setf temp (aref arr x) )
    ( setf (aref arr x) (aref arr y) )
    ( setf (aref arr y) temp )
)

(sFnS 10)