(define(problem satprob)
(:domain SimpleSatellite)
(:objects
  mem0 mem1 mem2 mem3 mem4 mem5 mem6 mem7 mem8 mem9 - memory
 img1 img2 img3 img4 img5 - image
)
(:init
  (sat_free)
  (= (image_score img1) 0)
  (= (image_score img2) 0)
  (= (image_score img3) 0)
  (= (image_score img4) 0)
  (= (image_score img5) 0)
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



  (at 164 (image_available img1))
  (at 172 (not (image_available img1)))
  (at 157 (image_available img3))
  (at 165 (not (image_available img3)))
  (at 131 (image_available img4))
  (at 139 (not (image_available img4)))
  (at 1 (dump_available))
  (at 25.0 (not (dump_available)))
  (at 167.0 (dump_available))
  (at 205.0 (not (dump_available)))

)
(:goal (and
  (> (image_score img5) 0)
  (<= (image_score img5) 4.0)

(>= (total_score) 1)
))
(:metric maximize 
  (image_score img5)
)
)
