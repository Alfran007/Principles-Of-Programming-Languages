;Program to create a file for student record and perform operation the following operations on file:
;1) insert record
;2) delete record
;3) modify record
;4)display the record by its primary key.

;Name: Syed Alfran Ali
;ID: 2015KUCP1032

(defstruct student
   firstName  
   lastName   
   rollNo
   gender	
   dob
   fatherName
   motherName
   class
   admissionYear
   address
   contact 
)

(defun addEntry()
	
	(format t "Input total Number of Records: ")
	(setf number (read))

	(setf studentRecords (make-array 100 :fill-pointer 0))

	(dotimes (i number)

		(format t "First Name of the student ~d: " (+ i 1))
		(setf fname (read-line))
		
		(format t "Last Name of the student ~d: " (+ i 1))
		(setf lname (read-line))
		
		(format t "Roll No of the student ~d: " (+ i 1))
		(setf ID (read-line))
			
		(format t "Gender of the student ~d: "(+ i 1))
		(setf gen (read-line))
		
		(format t "Date Of Birth of the student ~d: " (+ i 1))
		(setf dob (read-line))
		
		(format t "Father's Name of the student ~d: " (+ i 1))
		(setf fatherName (read-line))
		
		(format t "Mother's Name of the student ~d: " (+ i 1))
		(setf motherName (read-line))
		
		(format t "Class of the student ~d: " (+ i 1))
		(setf class (read-line))
		
		(format t "Year Of Admission of the student ~d: " (+ i 1))
		(setf year (read-line))
		
		(format t "Address of the student ~d: " (+ i 1))
		(setf address (read-line))
		
		(format t "Contact Details of the student ~d: " (+ i 1))
		(setf mobileNo (read-line))
		

		
		( setq s1 (make-student 
			:firstName fname 
			:lastName lname 
			:rollNo rNO
			:gender gen
			:dob dob
			:fatherName fatherName
			:motherName motherName
			:class class
			:admissionYear year
			:address address
			:contact mobileNo
			)
		)
		
		(vector-push s1 studentRecords)
		(terpri)
	)
	
	(with-open-file (stream "record.txt" :direction :output :if-exists :append :if-does-not-exist :create)
		(dotimes (k (length studentRecords))
			(print (aref studentRecords k) stream)
		)
	)
	
	(write-line "Data is interted in the file(record.txt)")

)

(defun deleteEntry() 

	(format t "Enter the Roll No. of the student whose record you want to delete: ")
	(setf ID (read-line))
	
	(setf found 0)
	(with-open-file (out "helper.txt" :direction :output :if-exists :supersede)
		(with-open-file (stream "record.txt" :direction :input :if-does-not-exist nil)
			(when stream
				(do ((st (read stream nil 'eof) (read stream nil 'eof)))
					((eql st 'eof) 0)
						(if (string= (student-rollNo st) ID)
							(setf found 1)
							(print st out)
						)	
				)
			)
		)
	)
	(when (= found 0)
		(format t "The requested Roll No. does not exist ~%")
		
	)
	(when (= found 1)
		(format t "The record was deleted~%")
	)
	(setq p (probe-file "record.txt"))
	(delete-file p)
	(rename-file "helper.txt" "record.txt")	
)


(defun modify() 

	(format t "Input the Roll No. of the student whose record has to be modified: ")
	(setf ID (read-line))
	
	(setf found 0)
	(with-open-file (out "helper.txt" :direction :output :if-exists :supersede)
		(with-open-file (stream "record.txt" :direction :input :if-does-not-exist nil)
			(when stream
				(do ((st (read stream nil 'eof) (read stream nil 'eof)))
					((eql st 'eof) 0)
						(when (string= (student-rollNo st) ID)
							(setf found 1)
							
							(write-line "1. Modify First Name")
							(write-line "2. Modify Last Name")
							(write-line "3. Gender")
							(write-line "4. Dob")
							(write-line "5. Father's Name.")
							(write-line "6. Mother's Name")
							(write-line "7. Class")
							(write-line "8. Year Of Admission")
							(write-line "9. Address")
							(write-line "10. Contact No.")
							
							(format t "What do you want to modify: ")
							(setf ch (read))
							
							(format t "Enter the new value for ")
							(case ch
								(1 (format t "First Name: ") (setf (student-firstName st) (read-line) ) )
								(2 (format t "Last Name: ") (setf (student-lastName st) (read-line) ) )
								(3 (format t "Gender: ") (setf (student-gender st) (read-line) ) )
								(4 (format t "Dob: ") (setf (student-dob st) (read-line) ) )
								(5 (format t "Father's Name: ") (setf (student-fatherName st) (read-line) ) )
								(6 (format t "Mother's Name: ") (setf (student-motherName st) (read-line) ) )
								(7 (format t "Class: ") (setf (student-class st) (read-line) ) )
								(8 (format t "Year Of Admission: ") (setf (student-admissionYear st) (read-line) ) )
								(9 (format t "Address: ") (setf (student-address st) (read-line) ) )
								(10 (format t "Contact No.: ") (setf (student-contact st) (read-line) ) )
								
							)
							
							(print st out)		
						)
						(when (string/= (student-rollNo st) ID)
							(print st out)
						)	
				)
			)
		)
	)
	(when (= found 0)
		(format t "Invalid request. Roll No. does not exist ~%")
	)
	(when (= found 1)
		(format t "The record is modified~%")
	)
	(setq p (probe-file "record.txt"))
	(delete-file p)
	(rename-file "helper.txt" "record.txt")
		
)


(defun display ()

	(format t "Input the Roll Number to search the student information: ")
	(setf ID (read-line))

	(setf found 0)
	(with-open-file (stream "record.txt" :direction :input :if-does-not-exist nil)
		(when stream
			(do ((st (read stream nil 'eof) (read stream nil 'eof)))
				((eql st 'eof) 0)
				
				(when (string= (student-rollNo st) ID)
					(setf found 1)
					(write st)
					(terpri)
				)
			)
		)
	)
	(when (= found 0)
		(format t "Invalid request. Roll No. does not exist ~%")
	)
)



(setf conti "Y")

(do ((n 0 (+ n 1) ))
	((string-equal conti "N") 0)

	(write-line "Choose 1 to insert a record in the file")
	(write-line "Choose 2 to delete a record from the file")
	(write-line "Choose 3 to modify a record of the file")
	(write-line "Choose 4 to display a record of the file")
	(write-line "Choose 5 to exit")
	(format t "Enter your Value: ")
	(setf Value (read))

	(case Value
		(1 (addEntry))
		(2 (deleteEntry))
		(3 (modify))
		(4 (display))
		(5 (return 0) )
	)
	
	(format t "~%Do you want to continue(y/n): ")
	(setf conti (read-line))
	(terpri)
)

