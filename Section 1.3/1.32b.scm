(define (accumulate combiner base term a next b)
    (define (iter a result)
        (if (> a b)
            result
            (iter (next a) (accumulate combiner base result (term a)))))
    (iter a base))