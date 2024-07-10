#lang racket/gui

(require plot)

(provide show-comparision)


(define (show-comparision competetitions memberDirectory)

  (define points (make-hash))

  (define current-competition "")
  (define image-a "")
  (define image-b "")

  (define width 300)
  (define height 300)


  (define (show-results points memberDirectory)
    (let* (
           [results-sorted (sort (hash->list points) #:key cdr >)]
           [results-in-vector (map (lambda (cell) (vector (string-replace (car cell) memberDirectory "") (cdr cell))) results-sorted)]
           )
      (plot (discrete-histogram results-in-vector)
            #:out-file "resultados.png"
            #:width (* width 3)
            #:height (* height 3)
            )
      )
    )


  (define (initialize-values)
    (set! current-competition (car competetitions))
    (set! image-a (string-append memberDirectory (car current-competition)))
    (set! image-b (string-append memberDirectory (cdr current-competition)))
    )
  (initialize-values)

  (define (update-competition)
    (begin
      (set! competetitions (cdr competetitions))
      (if (equal? (length competetitions) 0)
          (begin
            ;; (send frame show #f)
            (for ([this-child (send frame get-children)])
              (send frame delete-child this-child))
            (show-results points memberDirectory)
            (new canvas% 
                 [parent frame]
                 [paint-callback
                  (lambda (canvas dc)
                    (send dc draw-bitmap (read-bitmap "resultados.png") 0 0)
                    )])
            )
          (initialize-values)
          )
      )
    )


  ; Make a frame by instantiating the frame% class
  (define frame (new frame%
                     [label "Tournament"]
                     [width 300]
                     [height 300]
                     ))
  
  ; Make a static text message in the frame
  (define msg (new message% [parent frame]
                   [label "Which one do you prefer?"]))
  

  (define my-hori-panel (new horizontal-panel%
                             [parent frame]
                             [alignment '(left center)]
                             ))

  (define left-panel (new vertical-panel%
                          [parent my-hori-panel]))

  (define right-panel (new vertical-panel%
                          [parent my-hori-panel]))

  (define left-canvas (new canvas% 
       [parent left-panel]
       [paint-callback
        (lambda (canvas dc)
          (send dc draw-bitmap (read-bitmap image-a) 0 0))]))

  (define right-canvas (new canvas% 
       [parent right-panel]
       [paint-callback
        (lambda (canvas dc)
          (send dc draw-bitmap (read-bitmap image-b) 0 0)
          )]))

  ; Make a button in the frame
  (new button%
       [parent left-panel]
       [label "I choose this one"]
       ; Callback procedure for a button click:
       [callback (lambda (button event)
                   (begin
                   (hash-set! points image-a (+ (hash-ref points image-a 0) 1))
                   (update-competition)
                   (send left-canvas refresh-now)
                   (send right-canvas refresh-now)
                   )
                   )])

  (new button%
       [parent right-panel]
       [label "I choose this one"]
       ; Callback procedure for a button click:
       [callback (lambda (button event)
                   (begin
                   (hash-set! points image-b (+ (hash-ref points image-b 0) 1))
                   (update-competition)
                   (send left-canvas refresh-now)
                   (send right-canvas refresh-now)
                   )
                   )])

  ; Show the frame by calling its show method
  (send frame show #t)

  (send frame fullscreen #t)

  )
