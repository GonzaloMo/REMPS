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

  (memory_free mem1)
  (memory_free mem2)
  (memory_free mem3)
  (memory_free mem4)
  (memory_free mem5)
  (memory_free mem6)
  (memory_free mem7)
  (memory_free mem8)
  (memory_free mem9)

   (memory_taken mem0 img9)

(image_analysed mem0 img9)

  (at 15 (image_available img7))
  (at 23 (not (image_available img7)))
  (at 75 (image_available img8))
  (at 83 (not (image_available img8)))
  (at 68 (image_available img12))
  (at 76 (not (image_available img12)))
  (at 8 (image_available img13))
  (at 16 (not (image_available img13)))
  (at 0 (image_available img15))
  (at 2 (not (image_available img15)))
  (at 1 (dump_available))
  (at 28.0 (not (dump_available)))

)
(:goal (and
  (> (image_score img3) 0)
  (<= (image_score img3) 4.0)

(>= (total_score) 1)
))
(:metric maximize 
  (image_score img3)
)
)
