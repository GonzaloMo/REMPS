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

  (memory_free mem3)
  (memory_free mem4)
  (memory_free mem5)
  (memory_free mem6)
  (memory_free mem7)
  (memory_free mem8)
  (memory_free mem9)

   (memory_taken mem0 img3)
   (memory_taken mem1 img5)
   (memory_taken mem2 img2)

(image_analysed mem0 img3)
(image_analysed mem1 img5)
(image_analysed mem2 img2)

  (at 31 (image_available img4))
  (at 39 (not (image_available img4)))
  (at 288 (image_available img1))
  (at 296 (not (image_available img1)))
  (at 312 (image_available img2))
  (at 320 (not (image_available img2)))
  (at 105 (image_available img3))
  (at 113 (not (image_available img3)))
  (at 391 (image_available img4))
  (at 399 (not (image_available img4)))
  (at 267 (image_available img5))
  (at 275 (not (image_available img5)))
  (at 648 (image_available img1))
  (at 656 (not (image_available img1)))
  (at 672 (image_available img2))
  (at 680 (not (image_available img2)))
  (at 465 (image_available img3))
  (at 473 (not (image_available img3)))
  (at 751 (image_available img4))
  (at 759 (not (image_available img4)))
  (at 627 (image_available img5))
  (at 635 (not (image_available img5)))
  (at 1008 (image_available img1))
  (at 1016 (not (image_available img1)))
  (at 1032 (image_available img2))
  (at 1040 (not (image_available img2)))
  (at 825 (image_available img3))
  (at 833 (not (image_available img3)))
  (at 1111 (image_available img4))
  (at 1119 (not (image_available img4)))
  (at 987 (image_available img5))
  (at 995 (not (image_available img5)))
  (at 1368 (image_available img1))
  (at 1376 (not (image_available img1)))
  (at 1392 (image_available img2))
  (at 1400 (not (image_available img2)))
  (at 1185 (image_available img3))
  (at 1193 (not (image_available img3)))
  (at 1471 (image_available img4))
  (at 1479 (not (image_available img4)))
  (at 1347 (image_available img5))
  (at 1355 (not (image_available img5)))
  (at 1 (dump_available))
  (at 21.0 (not (dump_available)))
  (at 163.0 (dump_available))
  (at 201.0 (not (dump_available)))
  (at 343.0 (dump_available))
  (at 381.0 (not (dump_available)))
  (at 523.0 (dump_available))
  (at 561.0 (not (dump_available)))
  (at 703.0 (dump_available))
  (at 741.0 (not (dump_available)))
  (at 883.0 (dump_available))
  (at 921.0 (not (dump_available)))
  (at 1063.0 (dump_available))
  (at 1101.0 (not (dump_available)))
  (at 1243.0 (dump_available))
  (at 1281.0 (not (dump_available)))
  (at 1423.0 (dump_available))
  (at 1461.0 (not (dump_available)))

)
(:goal (and
  (> (image_score img5) 0)
  (<= (image_score img5) 1)

(>= (total_score) 1)
))
(:metric maximize 
  (image_score img5)
)
)
