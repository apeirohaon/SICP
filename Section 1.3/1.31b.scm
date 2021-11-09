(define (identity x) x)
(define (inc x) (+ x 1))
(define (product term a next b)
    (define (iter a result)
        (if (> a b)
            result
            (iter (next a) (* result (term a)))))
    (iter a 1))

(define (factorial a b) (product identity a inc b))

(define (aprox-pi n)
    (define (term-a x) (* x (+ x 2)))
    (define (term-b x) (* x x))
    (define (next x) (+ x 2))
    (* 4.0
       (/ (product term-a 2 next (* n 2))
          (product term-b 3 next (+ 1 (* n 2))))))

(aprox-pi 500)