; Chapter 1, exercises 1.1 - 1.8

(define (sos a b) (+ (square a) (square b)))

;(define (f a b c)
;        (cond ((and (<= a c) (<= a b)) (sos b c))
;              ((and (<= b c) (<= b a)) (sos a c))
;              (else                    (sos a b))
;        )
;)
;
;(f 1 2 3)

(define (test x y)
        (if (= x 0)
            0
            y
        )
)

(define (p) (p))

(test 0 p)

;(define (sqrt x) (sqrt-iter 1.0 x))
;
;(define (sqrt-iter guess x)
;    (if (good-enough? guess x)
;        guess
;        (sqrt-iter (improve guess x) x)
;    )
;)
;
;(define (good-enough? guess x)
;        (< (abs (- (square guess) x)) 0.001)
;)
;
;(define (improve guess x) (average guess (/ x guess)))
;
;(define (average x y) (/ (+ x y) 2))
;
;(define (sqrt2 x) (sqrt-iter2 1.0 x))
;
;(define (sqrt-iter2 guess x)
;        (if (better-enough? guess x)
;            guess
;            (sqrt-iter2 (improve guess x) x)
;        )
;)
;
;(define (better-enough? guess x)
;        (<
;         (abs (- 1.0 (/ (improve guess x) guess)))
;         0.001
;        )
;)
;
;(define (curt x) (curt-iter 1.0 x))
;
;(define (curt-iter guess x)
;        (if (curt-better? guess x)
;            guess
;            (curt-iter (curt-improve guess x) x)
;        )
;)
;
;(define (curt-better? guess x)
;        (<
;          (abs (- 1.0 (/ (curt-improve guess x) guess)))
;          0.001
;        )
;)
;
;(define (curt-improve y x)
;        (/ (+ (/ x (square y)) (* 2 y)) 3)
;)

; Refactoring to include blocks and lexical scoping:
(define (sqrt x)
        (define (iter guess)
                (if (good-enough? guess)
                    guess
                    (iter (improve guess))
                )
        )
        (define (good-enough? guess)
                (<
                  (abs (- 1.0 (/ (improve guess) guess)))
                  0.001
                )
        )
        (define (improve guess) (average guess (/ x guess)))
        (define (average x y) (/ (+ x y) 2))
        (iter 1.0)
)

(define (curt x)
        (define (iter guess)
                (if (good-enough? guess)
                    guess
                    (iter (improve guess))
                )
        )
        (define (good-enough? guess)
                (<
                  (abs (- 1.0 (/ (improve guess) guess)))
                  0.001
                )
        )
        (define (improve guess)
                (/ (+ (/ x (square guess)) (* 2 guess)) 3)
        )
        (iter 1.0)
)

; Exercise 1.8 end.
