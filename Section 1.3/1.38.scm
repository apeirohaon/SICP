(define (cont-frac n d k)
    (define (cf n d k c)
        (if (= k 0)
            c
            (cf n d (- k 1) (/ (n k) (+ (d k) c)))))
    (let ((start (/ (n k) (d k))))
        (cf n d k start)))

(define (seq i)
    (define (divides? a b) (= (remainder b a) 0))
    (if (divides? 3 (+ i 1))
        (* (/ (+ i 1) 3) 2)
        1))

(cont-frac (lambda (i) 1.0)
           seq
           20)