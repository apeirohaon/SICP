#lang sicp

(define (equal? a b)
  (if (not (or (pair? a) (pair? b)))
      (eq? a b)
      (and (eq? (car a) (car b))
           (equal? (cdr a) (cdr b)))))