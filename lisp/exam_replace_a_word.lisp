
(write-line "Please enter the Paragraph with no \\n :")
(defvar para (read-line))
(write-line "Please enter the key to search :")
(defvar key (read-line))
(write-line "Please enter value to replace :")
(defvar val (read-line))
(defvar flag 0)
(loop for it from 0 to (- (length para) (length key))
    do(setq flag 0)
    do(if(> (+ it (length key)) (length para))
		     (return )
    )
    do(loop for it2 from 0 to (- (length key) 1)
        do(if (char/= (char para (+ it it2)) (char key it2))
            (setf flag 1)
        )
    )
	    do(if (= flag 0)
        (setf paragraph (concatenate 'string (subseq para 0 it) val (subseq para (+ it (length key)))))
    )
)
(write paragraph)

	
	
