#lang sicp

(define (make-rat n d)
  (let ((g (gcd n d)))
    (cond ((and (positive? n) (positive? d)) (cons (/ n g) (/ d g)))
          ((and (positive? n) (not (positive? d))) (cons (- (/ n g)) (- (/ d g))))
          ((and (not (positive? n)) (positive? d)) (cons (/ n g) (/ d g)))
          (else (cons (- (/ n g)) (- (/ d g)))))))
(define (numer x) (car x))
(define (denom x) (cdr x))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))
