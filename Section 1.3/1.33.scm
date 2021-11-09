(define (smallest-divisor n) (find-divisor n 2))
(define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
          ((divides? test-divisor n) test-divisor)
          (else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b) (= (remainder b a) 0))
(define (inc x) (+ x 1))
(define (identity x) x)
(define (square x) (* x x))
(define (prime? n x)
    (= n (smallest-divisor n)))
(define (relprime? i n)
    (define (iter c i n)
        (if (> c i)
            #t
            (if (and (divides? c i) (divides? c n)) 
                #f
                (iter (inc c) i n))))
    (if (or (and (= i 2) (divides? 2 n)) (= i n))
        #f
        (iter 2 i n)))

(define (filtered-accumulate filter combiner base term a next b)
    (if (> a b)
        base
        (if (filter a b)
            (combiner (term a)
                      (filtered-accumulate filter combiner base term (next a) next b))
            (filtered-accumulate filter combiner base term (next a) next b))))

(define (a a b)
    (filtered-accumulate prime? + 0 square a inc b))

(define (b n)
    (filtered-accumulate relprime? * 1 identity 1 inc n))

(a 1 10)
(b 13)