(define (>= x y) (or (> x y) (= x y)))
(define (cube x) (* x x x))
(define (simpson f a b n)
    (define h (/ (- b a) n))
    (define (y k) (f (+ a (* k h))))
    (define (simpson-sum c n)
        (cond ((>= c n) 0)
              ((even? c) (+ (* 2 (y c))
                           (simpson-sum (+ c 1) n)))
              (else (+ (* 4 (y c))
                       (simpson-sum (+ c 1) n)))))
    (* (/ h 3)
       (+ (y 0)
          (y n)
          (simpson-sum 1 n))))
    
(simpson cube 0 5.0 1000)