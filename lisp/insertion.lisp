(defun insert (x lst &optional (flag #'<))
  (if (null lst)
    (list x)
    (if (funcall flag x (car lst))
          (cons x lst) 
          (cons (car lst) (insert x (cdr lst) flag)))))

(defun insertionSort (lst &optional (flag #'<))
  (if (null lst)
    lst
    (insert (car lst) (insertionSort (cdr lst) flag) flag)))

(insertionSort '(5 4 7 3 1 6 9 8))