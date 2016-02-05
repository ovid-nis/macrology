;;;; nodes.lisp
;;;; in reference to on-lisp 77 until ...

(in-package #:macrology)

;; (defnode 'people "is the person a man?"
;;   'male 'female)

;; (run-node 'people)

(defstruct node contents yes no)

(defvar *nodes* (make-hash-table))

(defun defnode (name conts &optional yes no)
  (setf (gethash name *nodes*)
	(if yes
	    #'(lambda ()
		(format t "~A~%>> " conts)
		(case (read)
		  (yes (funcall (gethash yes *nodes*)))
		  (t (funcall (gethash no *nodes*)))))
	    #'(lambda ()
		conts)
	    
	    ;; (make-node :contents conts
	    ;; 	       :yes yes
	    ;; 	       :no no)
	    )))


(defun run-node (name)
  (let ((n (gethash name *nodes*)))
    (cond ((node-yes n)
	   (format t "~A~%>> " (node-contents n))
	   (case (read)
	     (yes (run-node (node-yes n)))
	     (t (run-node (node-no n)))))
	  (t (node-contents n)))))

(defvar *nodes* (make-hash-table))

(defun defnode (name conts &optional yes no)
  (setf (gethash name *nodes*)
	(if yes
	    #'(lambda ()
		(format t )))))
