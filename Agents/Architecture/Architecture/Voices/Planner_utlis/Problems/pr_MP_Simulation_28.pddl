(define(problem satprob)
(:domain SimpleSatellite)
(:objects
  mem0 mem1 mem2 mem3 mem4 mem5 mem6 mem7 mem8 mem9 - memory
 img1 img2 img3 img4 img5 img6 img7 img8 img9 img10 - image
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

   (memory_taken mem0 img10)

(image_analysed mem0 img10)

  (at 0 (image_available img1))
  (at 7 (not (image_available img1)))
  (at 61 (image_available img9))
  (at 69 (not (image_available img9)))
  (at 23 (image_available img10))
  (at 31 (not (image_available img10)))
  (at 1 (dump_available))
  (at 5.0 (not (dump_available)))

)
(:goal (and
  (> (image_score img7) 0)
  (<= (image_score img7) 12.0)

(>= (total_score) 3)
))
(:metric maximize 
  (image_score img7)
)
)