; Syed Alfran Ali
; 2015 KUCP 1032
; Assignment 1: To implement fibonacci series in LISP

; Extra(Learning in class)

; (print "Hello World")
; (defun power (x y) (if (= y 0) 1 (* x (power x (1- y)))))
; plusp x : x>0 
; minusp x : x<0
; (write(power 3 4))
; (write (+ 7 9 11))
; zerop returns true if number is 0 else false
; nreverse modify in reverse and returns the given sequence




; Question: Write a program for fibonacci Series

; n is the number passed in the fibonacci function.
; do loop is used for iterations.
; setf is used to set the value here globally defined variable var1,var2 and sum is used.



; Main function which will be called by terminal
(defun fibonacci(n)
    (setf var1 0 var2 1)
    (setf sum 0)
    (cond
        ((= n 1) (print var1))   ; Condition checking if n=1 or n=2
        ((= n 2) (print var1)(print var2))
        ((> n 2) (fibo n))       ; for n>2 below function is used
    )
)

;Operator function performs the fibonacci algorithm called by main
(defun fibo(n)

    (print var1)(print var2)     ; printing 0 and 1
    (do((i 2 (+ i 1))) ((= i n)) ; For i>2 , i is incremented by unless i becomes n
        (setf sum (+ var1 var2)) ; sum = var1 + var2
        (print sum)
        (setf var1 var2 var2 sum)) ; Assigning the values of var2 to var1 and sum to var2
)

;END

