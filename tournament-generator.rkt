#lang racket


(provide generate-tournamet)


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
      (if (string>? first-element second-element)
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
      (shuffle
       (remove-duplicates
        (map sort-cons 
             (foldr append '() tournament)
             )
        )
       )
    )
  )
