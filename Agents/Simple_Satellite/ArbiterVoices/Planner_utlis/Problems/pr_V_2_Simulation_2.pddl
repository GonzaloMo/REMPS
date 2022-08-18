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



  (at 16 (image_available img3))
  (at 24 (not (image_available img3)))
  (at 43 (image_available img4))
  (at 51 (not (image_available img4)))
  (at 245 (image_available img1))
  (at 253 (not (image_available img1)))
  (at 253 (image_available img2))
  (at 261 (not (image_available img2)))
  (at 376 (image_available img3))
  (at 384 (not (image_available img3)))
  (at 403 (image_available img4))
  (at 411 (not (image_available img4)))
  (at 121 (image_available img5))
  (at 129 (not (image_available img5)))
  (at 605 (image_available img1))
  (at 613 (not (image_available img1)))
  (at 613 (image_available img2))
  (at 621 (not (image_available img2)))
  (at 736 (image_available img3))
  (at 744 (not (image_available img3)))
  (at 763 (image_available img4))
  (at 771 (not (image_available img4)))
  (at 481 (image_available img5))
  (at 489 (not (image_available img5)))
  (at 965 (image_available img1))
  (at 973 (not (image_available img1)))
  (at 973 (image_available img2))
  (at 981 (not (image_available img2)))
  (at 1096 (image_available img3))
  (at 1104 (not (image_available img3)))
  (at 1123 (image_available img4))
  (at 1131 (not (image_available img4)))
  (at 841 (image_available img5))
  (at 849 (not (image_available img5)))
  (at 1325 (image_available img1))
  (at 1333 (not (image_available img1)))
  (at 1333 (image_available img2))
  (at 1341 (not (image_available img2)))
  (at 1456 (image_available img3))
  (at 1464 (not (image_available img3)))
  (at 1483 (image_available img4))
  (at 1491 (not (image_available img4)))
  (at 1201 (image_available img5))
  (at 1209 (not (image_available img5)))
  (at 1 (dump_available))
  (at 36.0 (not (dump_available)))
  (at 178.0 (dump_available))
  (at 216.0 (not (dump_available)))
  (at 358.0 (dump_available))
  (at 396.0 (not (dump_available)))
  (at 538.0 (dump_available))
  (at 576.0 (not (dump_available)))
  (at 718.0 (dump_available))
  (at 756.0 (not (dump_available)))
  (at 898.0 (dump_available))
  (at 936.0 (not (dump_available)))
  (at 1078.0 (dump_available))
  (at 1116.0 (not (dump_available)))
  (at 1258.0 (dump_available))
  (at 1296.0 (not (dump_available)))
  (at 1438.0 (dump_available))
  (at 1476.0 (not (dump_available)))

)
(:goal (and
  (> (image_score img1) 0)
  (<= (image_score img1) 1)

(>= (total_score) 1)
))
(:metric maximize 
  (image_score img1)
)
)
