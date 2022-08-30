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

  (memory_free mem0)
  (memory_free mem1)
  (memory_free mem2)
  (memory_free mem3)
  (memory_free mem4)
  (memory_free mem5)
  (memory_free mem6)
  (memory_free mem7)
  (memory_free mem8)
  (memory_free mem9)



  (at 182 (image_available img2))
  (at 190 (not (image_available img2)))
  (at 37 (image_available img3))
  (at 45 (not (image_available img3)))
  (at 95 (image_available img4))
  (at 103 (not (image_available img4)))
  (at 178 (image_available img5))
  (at 186 (not (image_available img5)))
  (at 236 (image_available img7))
  (at 244 (not (image_available img7)))
  (at 83 (image_available img8))
  (at 91 (not (image_available img8)))
  (at 100 (image_available img9))
  (at 108 (not (image_available img9)))
  (at 1 (dump_available))
  (at 11.0 (not (dump_available)))
  (at 153.0 (dump_available))
  (at 191.0 (not (dump_available)))

)
(:goal (and
  (> (image_score img2) 0)
  (<= (image_score img2) 1.0)

(>= (total_score) 1)
))
(:metric maximize 
  (image_score img2)
)
)
