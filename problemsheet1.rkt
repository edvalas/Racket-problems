#lang racket

; question 1
;(a)
;(* 3 (+ 5 (/ 10 5)))
;(b)
;(+ 2 3 4 5)
;(c)
;(+ 1 (+ 5 (+ 2 (/ 10 3))))
;(d)
;(+ 1 (+ 5 (+ 2 (/ 10 3.0))))
;(e)
;(* (+ 3 5)(/ 10 2))
;(f)
;(+ (* (+ 3 5)(/ 10 2)) (+ 1 (+ 5 (+ 2 (/ 10 3)))))

; question 2
(define (discount x y) (* x (- 1 (/ y 100))))
(define (discount2 x y) (- x (* x (/ y 100))))

; question 3
(define (grcomdiv x y)
  (if (= y 0)
      x
      (grcomdiv y (remainder x y))))

; question 4
(define (appearances x l)
  (if (null? l)
      0
      (+ (if (= x (car l))
             1
             0)(appearances x (cdr l)))))

; question 5 - not done
(define (inter list1 list2) 1)

; Question 6
(define (numatoms l)
  (if (null? l)
      0
      (+ 1 (numatoms (cdr l)))))
           
; question 7
(define (forever n)
  (if (= n 0)
      1
      (+ 1 (forever n))))
; this function takes in an argument. If zero is passed then the function returns 1.
; with any other number the function calls the false part of the if evaluation
; which tries to add 1 to recursion call of the function with same parameter
; which then tries to call itself again without doing anything but calling itslef...

; Question 8
(define (range-aux n a)
  (if (= n 0)
      a
      (range-aux (- n 1) (cons n a))))

(define (range n) (range-aux n null))

; Question 9
(define (rev l)
  (if (null? l)
      null
      (append (rev (cdr l)) (list (car l)))))

(define (revwcons-aux l a)
  (if (null? l)
    a
    (revwcons-aux (cdr l) (cons (car l) a))))

(define (revwcons l) (revwcons-aux l null))

; Question 10
(define (fsum35 x)
  (if (= x 0)
      0
      (if (or (= (remainder x 3) 0) (= (remainder x 5) 0))
          (+ x (fsum35 (- x 1)))
          (fsum35 (- x 1)))))

; Question 12
(define (fibo l)
  (if (> (car l) 4000000)
      0
      (if (= (remainder (car l) 2) 0)
          (+ (car l) (fibo (cons (+ (car l) (car (cdr l))) l)))
          (fibo (cons (+ (car l) (car (cdr l))) l)))))

; call fibo with (list 1 0) to start the fibonacci sequence 0, 1, 1, 2, 3, 5..
; (fibo (list 1 0))