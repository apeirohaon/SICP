(define (accumulate combiner base term a next b)
    (if (> a b)
        base
        (* (term a)
           (accumulate combiner base term (next a) next b))))

(define (product term a next b) (accumulate * 1 term a next b))
(define (sum term a next b) (accumulate + 0 term a next b))