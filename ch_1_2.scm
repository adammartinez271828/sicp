; Exercise 1.9

(define (inc x) (+ x 1))
(define (dec x) (- x 1))

; The following function will execute recursively, since it will not finish
; fully evaluating the arguments of the expression before calling the + operator
; again.
(define (+ a b)
  (if (= a 0)
      b
      (inc (+ (dec a) b))
  )
)
; See below:
;(+ 4 5)
;(inc (+ 3 5))
;(inc (inc (+ 2 5)))
;(inc (inc (inc (+ 1 5))))
;(inc (inc (inc (inc (+ 0 5)))))
;(inc (inc (inc (inc 5))))
;(inc (inc (inc 6)))
;(inc (inc 7))
;(inc 8)
;8

; The following function is iterative because it can fully evaluate the
; arguments before calling the operator again.
(define (+ a b)
  (if (= a 0)
      b
      (+ (dec a) (inc b))
  )
)
; See below:
;(+ 4 5)
;(+ 3 6)
;(+ 2 7)
;(+ 1 8)
;(+ 0 9)
;9

; Exercise 1.10
; As an aside, this isn't really THE Ackermann's function, although it exhibits
; the same kind of behavior.
(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1) (A x (- y 1))))
  )
)

; Before I begin, note that (A 0 n) = 2n
;(A 1 10)
;(A 0 (A 1 9))
;(A 0 (A 0 (A 1 8)))
;... call me lazy, I don't care.  It will expand 10 times.
;(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 1))))))))))
;(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 2)))))))))
;(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 4))))))))
;...
;(A 0 (A 0 256))
;(A 0 512)
;1024 ; = 2^10 => (A 1 n) = 2^n

;(A 2 4)
;(A 1 (A 2 3))
;(A 1 (A 1 (A 2 2)))
;(A 1 (A 1 (A 1 (A 1 1))))
;(A 1 (A 1 (A 1 2)))
;(A 1 (A 1 4))
;(A 1 16)
;65536
; for (A 2 n) you will expand n times, and have a sequence of
; (A 1 (A 1 ... (A 1 1))).  The tail will collapse into 2^1, then 2^2, then 2^4...
; so it will be (A 2 n) = 2^(2^n)

;(A 3 3)
;(A 2 (A 3 2))
;(A 2 (A 2 (A 3 1)))
;(A 2 (A 2 2))
;(A 2 4)
;65536

;(define (exp x n) (if (= n 1) x (* x (exp x (- n 1)))))

; Exercise 1.11
; A function f is defined by the rule that
;    f(n) = n if n < 3
;    f(n) = f(n-1) + 2f(n-2) + 3f(n-3) if n>= 3
; Write a procedure that computes f by means of a recursive process.  Write a
; procedure that computes f by means of an iterative process.

(define (f n) ; recursive
  (if (< n 3)
      n
      (+ (f (- n 1))
         (* 2 (f (- n 2)))
         (* 3 (f (- n 3)))
      )
  )
)

(define (f n) ; iterative
  (define (f-iter i p1 p2 p3)
    (if (= i n)
        (+ p1 (* 2 p2) (* 3 p3))
        (f-iter
          (+ i 1)
          (+ p1 (* 2 p2) (* 3 p3))
          p1
          p2
        )
    )
  )
  (if (< n 3)
      n
      (f-iter 3 2 1 0) ; f(2) = 2, f(1) = 1, f(0) = 0
  )
)

; Exercise 1.12
