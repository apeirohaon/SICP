#lang sicp

(define (make-interval a b) (cons a b))
(define (upper-bound int) (cdr int))
(define (lower-bound int) (car int))

(define (make-center-percent c p)
  (make-interval (- c (* c p)) (+ c (* c p))))
(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))
(define (percent i)
  (/ (- (upper-bound i) (center i)) (center i)))