#lang sicp

(define (make-interval a b) (cons a b))
(define (upper-bound int) (cdr int))
(define (lower-bound int) (car int))

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
  (let ((a (lower-bound x))
        (b (upper-bound x))
        (c (lower-bound y))
        (d (upper-bound y)))
    (let ((a? (>= a 0))
          (b? (>= b 0))
          (c? (>= c 0))
          (d? (>= d 0)))
      (cond ((and a? b? c? d?)
             (make-interval (* a c) (* b d)))
            ((and a? b? d?)
             (make-interval (* b c) (* b d)))
            ((and b? c? d?)
             (make-interval (* d a) (* d b)))
            ((and b? d?)
             (make-interval (min (* a d) (* b c)) (max (* a c) (* b d))))
            ((and c? d?)
             (make-interval (* a d) (* b c)))
            ((and a? b?)
             (make-interval (* c b) (* d a)))
            (d?
             (make-interval (* a d) (* a c)))
            (b?
             (make-interval (* c b) (* c a)))
            (else
             (make-interval (* b d) (* a c)))))))

(define (div-interval x y)
  (cond (= (upper-bound y) 0) (error "divide by zero")
        (= (lower-bound y) 0) (error "divide by zero")
        (else (mul-interval
               x
               (make-interval (/ 1.0 (upper-bound y))
                              (/ 1.0 (lower-bound y)))))))
