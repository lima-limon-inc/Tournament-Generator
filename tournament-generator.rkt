#lang racket

(define (generate-fights member-a rest-members)
  (map
   (lambda (b) (cons member-a b))
   (filter (lambda (b) (not (equal? member-a b)))
           rest-members)
   )
  )

(define (sort-cons cell)
  (let
      (
       [first-element (car cell)]
       [second-element (cdr cell)]
       )
      (if (> first-element second-element)
          (cons second-element first-element)
          (cons first-element second-element)
          )
    )
  )

(define (generate-tournamet members)
  (let
      (
       [tournament (map (lambda (a) (generate-fights a members)) members)]
       )
      (remove-duplicates
       (map sort-cons 
            (foldr append '() tournament)
            )
       )
    )
  )

(define members (list 1 2 3 4 5))

(generate-tournamet members)
