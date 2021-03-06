(define (average x y) (* 0.5 (+ x y)))
(define tolerance 0.00001)
(define (fixed-point f first-guess)
    (define (close-enough? v1 v2)
        (< (abs (- v1 v2))
           tolerance))
    (define (try guess)
        (display guess)
        (let ((next (f guess)))
            (if (close-enough? guess next)
                next
                (try next))))
    (try first-guess))
(define (average-damp f)
    (lambda (x) (/ (+ x (f x)) 2.0)

(fixed-point (average-damp (lambda (x) (/ 10 (* x x)))) 10.0)