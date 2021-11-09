#lang sicp

(define (average a b) (/ (+ a b) 2))
(define (square x) (* x x))

(define (make-point x y) (cons x y))
(define (x-point point) (car point))
(define (y-point point) (cdr point))

(define (make-segment a b) (cons a b))
(define (start-segment seg) (car seg))
(define (end-segment seg) (cdr seg))

(define (make-rectangle w y)
  (cons (cons w (make-point (x-point w) (y-point y)))
        (cons y (make-point (x-point y) (y-point w)))))
(define (rect-point-1 rect) (car (car rect)))
(define (rect-point-2 rect) (cdr (car rect)))
(define (rect-point-3 rect) (car (cdr rect)))
(define (rect-point-4 rect) (cdr (cdr rect)))

(define (dist p1 p2)
  (sqrt (+ (square (- (x-point p1) (x-point p2)))
           (square (- (y-point p1) (y-point p2))))))

(define (perimeter rect)
  (+ (dist (rect-point-1 rect) (rect-point-2 rect))
     (dist (rect-point-2 rect) (rect-point-3 rect))
     (dist (rect-point-3 rect) (rect-point-4 rect))
     (dist (rect-point-4 rect) (rect-point-1 rect))))

(define (area rect)
  (abs (* (- (x-point (rect-point-1 rect)) (x-point (rect-point-3 rect))) (- (y-point (rect-point-1 rect)) (y-point (rect-point-3 rect))))))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))