(define (iterative-improve good-enough? improve)
  (define (try guess)
    (let ((next (improve guess)))
      (if (good-enough? guess next)
          next
          (try next))))
  (lambda (first-guess) (try first-guess)))

(define (sqrt x)
    (define (average x y)
        (/ (+ x y) 2))
    (define (improve guess)
        (average guess (/ x guess)))
    (define (good-enough? guess last)
        (< (/ (abs (- guess last)) guess) 0.001))
    ((iterative-improve good-enough? improve) 1.0))

(define (fixed-point f first-guess)
    (define tolerance 0.00001)
    (define (close-enough? v1 v2)
        (< (abs (- v1 v2))
        tolerance))
    ((iterative-improve close-enough? f) first-guess))

