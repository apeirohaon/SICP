(define (cbrt-iter guess x last)
(if (good-enough? guess (abs (- guess last)))
    guess
    (cbrt-iter (improve guess x) x guess)))

(define (improve guess x)
    (/ (+ (/ x (* guess guess)) (* 2 guess)) 3.0))

(define (good-enough? guess change)
    (< (/ change guess) 0.001))

(define (cbrt x)
    (cbrt-iter 1.0 x x))

(cbrt 27)