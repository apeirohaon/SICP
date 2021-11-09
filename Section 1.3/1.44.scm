(define dx 0.00001)
(define (compose f g)
    (lambda (x) (f (g x))))
(define (repeated f n)
    (define (r f n c)
        (cond ((= c 0) (lambda (x) x))
            ((= c 1) f)
            (else (r (compose f f) n (- c 1)))))
    (r f n n))
(define (smooth f)
    (lambda (x) (/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3)))
(define (r-smooth f n)
    ((repeated smooth n) f))