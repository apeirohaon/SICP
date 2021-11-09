(define (cont-frac n d k)
    (define (cf n d k c)
        (if (= k 0)
            c
            (cf n d (- k 1) (/ (n k) (+ (d k) c)))))
    (let ((start (/ (n k) (d k))))
        (cf n d k start)))

(cont-frac (lambda (i) 1.0)
            (lambda (i) 1.0)
            11)