#lang racket

(require 2htdp/image)

(define rainbow (list "red" "orange" "yellow" "green" "blue" "indigo" "voilet"))

(define (rainbowShapes a b c)
  (help-repeat a b c rainbow))

(define (help-repeat a b c d)
  (cond
      [(= b 0) (above (text "A circle has no sides" 40 "black")
                      (underlay/offset (circle 50 "solid" "yellow")
                                       0 5
                                       (underlay/offset (underlay/offset (circle 10 "solid" "black")
                                                                         -30 0
                                                                         (circle 10 "solid" "black"))
                                                        0 30 (beside (crop/align "left" "bottom" 25 30 (circle 40 "solid" "black"))
                                                                     (crop/align "right" "bottom" 25 30 (circle 40 "solid" "black"))))))]
      [(= b 1) (above (text "There's no 1-sided polygon but here's a line:" 40 "black")
                      (add-line empty-image
                                0 0 0 60
                                (make-pen "black" 5 "solid" "butt" "round")))]
      [(= b 2) (above (text "There's no 2-sided polygon but here's a curved line:" 40 "black")
                      (add-curve empty-image
                                 20 20 0 3
                                 80 80 0 3
                                 (make-pen "black" 5 "solid" "round" "round")))]
      [(= b 3) (regular-polygon a b c (first d))]
      [(underlay/align "middle" "bottom" (regular-polygon a b c (first d) ) (help-repeat a (- b 1) c (rest d)))]
      )
  )

(rainbowShapes 50 2 "solid" )

