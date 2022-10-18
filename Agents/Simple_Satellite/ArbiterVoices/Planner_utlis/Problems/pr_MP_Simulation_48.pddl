(define(problem satprob)
(:domain SimpleSatellite)
(:objects
  mem0 mem1 mem2 mem3 mem4 mem5 mem6 mem7 mem8 mem9 - memory
 img1 img2 img3 img4 img5 img6 img7 img8 img9 img10 img11 img12 img13 img14 img15 - image
)
(:init
  (sat_free)
  (= (image_score img1) 0)
  (= (image_score img2) 0)
  (= (image_score img3) 0)
  (= (image_score img4) 0)
  (= (image_score img5) 0)
  (= (image_score img6) 0)
  (= (image_score img7) 0)
  (= (image_score img8) 0)
  (= (image_score img9) 0)
  (= (image_score img10) 0)
  (= (image_score img11) 0)
  (= (image_score img12) 0)
  (= (image_score img13) 0)
  (= (image_score img14) 0)
  (= (image_score img15) 0)
  (= (total_score) 0)

  (memory_free mem0)
  (memory_free mem1)
  (memory_free mem3)
  (memory_free mem5)
  (memory_free mem6)
  (memory_free mem7)
  (memory_free mem8)
  (memory_free mem9)

   (memory_taken mem2 img6)
   (memory_taken mem4 img1)

(image_analysed mem2 img6)
(image_analysed mem4 img1)

  (at 90 (image_available img5))
  (at 98 (not (image_available img5)))
  (at 91 (image_available img6))
  (at 99 (not (image_available img6)))
  (at 91 (image_available img10))
  (at 99 (not (image_available img10)))
  (at 43 (image_available img13))
  (at 51 (not (image_available img13)))
  (at 21 (image_available img14))
  (at 29 (not (image_available img14)))
  (at 1 (dump_available))
  (at 37.0 (not (dump_available)))

)
(:goal (and
  (> (image_score img1) 0)
  (<= (image_score img1) 3.0)

  (> (image_score img8) 0)
  (<= (image_score img8) 14.0)

  (> (image_score img12) 0)
  (<= (image_score img12) 13.0)

  (> (image_score img13) 0)
  (<= (image_score img13) 17.0)

  (> (image_score img15) 0)
  (<= (image_score img15) 15.0)

(>= (total_score) 13)
))
(:metric maximize (+
  (image_score img1)
    (+ (image_score img8)
      (+ (image_score img12)
        (+ (image_score img13)
          (image_score img15)
        )
      )
    )
  )
)
)
