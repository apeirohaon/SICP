(define (sqrt-iter guess x last)
    (if (good-enough? guess (abs (- guess last)))
        guess
        (sqrt-iter (improve guess x) x guess)))

(define (improve guess x)
    (average guess (/ x guess)))

(define (average x y)
    (/ (+ x y) 2))

(define (good-enough? guess change)
    (< (/ change guess) 0.001))

(define (sqrt x)
    (sqrt-iter 1.0 x x))

(sqrt 0.00000016)