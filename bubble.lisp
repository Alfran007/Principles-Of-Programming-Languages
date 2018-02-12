(defun bubble_sort (n)
    (setf arr (make-array n))
    (format t "Enter any 10 elements in the array for sorting~%")
    (format t "Enter the numbers:~&")
    (dotimes (var n t)
        (setf (aref arr var) (read) )
    )
    (loop for i from 1 to 10
		do
		(loop for j from 0 to 8
			do
			
				(if (> (aref arr j) (aref arr (+ j 1)))
					(swap j (+ j 1))
				)
			
		)
    )
	(format t "Sorted array is :")
    (print n)
)

(defun print(n)
    (dotimes(var n t)
        (print (aref arr var) )
    )
)
(defun swap(var local)
    ( setf var2 (aref arr var) )
    ( setf (aref arr var) (aref arr local) )
    ( setf (aref arr local) var2 )
)

(bubble_sort 10)