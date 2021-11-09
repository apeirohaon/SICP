(define (identity x) x)
(define (square x) (* x x))
(define (inc x) (+ x 1))
(define (sum term a next b)
    (define (iter a result)
        (if (> a b)
            result
            (iter (next a) (+ result (term a)))))
    (iter a 0))

(sum square 4 inc 6)