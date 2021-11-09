(define (cont-frac n d k)
    (define (cf n d k c)
        (if (= k 0)
            c
            (cf n d (- k 1) (/ (n k) (+ (d k) c)))))
    (let ((start (/ (n k) (d k))))
        (cf n d k start)))

(define (tan-cf x k)
    (cont-frac (lambda (i) (if (= i 1) x (- (* x x))))
               (lambda (i) (+ 1 (* (- i 1) 2)))
               k))

(tan-cf 1.0 20)