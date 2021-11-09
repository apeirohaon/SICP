(define (inc x) (+ x 1))
(define (double g)
    (lambda (x) (g (g x))))

((double inc) 5)
(((double (double double)) inc) 5)