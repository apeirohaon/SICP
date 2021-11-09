(define (f n)
    (if (< n 3)
        n
        (iter 4 2 1 3 n)))
(define (iter a b c i n)
    (if (= i n)
        a
        (iter (+ a (* 2 b) (* 3 c)) a b (+ i 1) n)))

(f 10)