#lang racket/gui

(define (show-comparision image-a image-b)

  ; Make a frame by instantiating the frame% class
  (define frame (new frame%
                     [label "Example"]
                     [width 300]
                     [height 300]
                     ))
  
  ; Make a static text message in the frame
  (define msg (new message% [parent frame]
                   [label "No events so far..."]))
  

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
          (send dc draw-bitmap (read-bitmap image-b) 0 0))]))

  ; Make a button in the frame
  (new button% [parent left-panel]
       [label "Click Me"]
       ; Callback procedure for a button click:
       [callback (lambda (button event)
                   (send msg set-label "Button click"))])

  (new button% [parent right-panel]
       [label "Click Me"]
       ; Callback procedure for a button click:
       [callback (lambda (button event)
                   (send msg set-label "Button click"))])

  ; Show the frame by calling its show method
  (send frame show #t)

  )

(show-comparision "lemon.png" "12.png")

