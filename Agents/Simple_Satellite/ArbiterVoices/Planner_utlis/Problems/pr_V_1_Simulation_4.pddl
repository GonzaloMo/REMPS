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

  (memory_free mem1)
  (memory_free mem2)
  (memory_free mem3)
  (memory_free mem4)
  (memory_free mem5)
  (memory_free mem6)
  (memory_free mem7)
  (memory_free mem8)
  (memory_free mem9)

   (memory_taken mem0 img4)

(image_analysed mem0 img4)

  (at 109 (image_available img1))
  (at 117 (not (image_available img1)))
  (at 223 (image_available img2))
  (at 231 (not (image_available img2)))
  (at 0 (image_available img3))
  (at 0 (not (image_available img3)))
  (at 52 (image_available img4))
  (at 60 (not (image_available img4)))
  (at 469 (image_available img1))
  (at 477 (not (image_available img1)))
  (at 583 (image_available img2))
  (at 591 (not (image_available img2)))
  (at 352 (image_available img3))
  (at 360 (not (image_available img3)))
  (at 412 (image_available img4))
  (at 420 (not (image_available img4)))
  (at 324 (image_available img5))
  (at 332 (not (image_available img5)))
  (at 829 (image_available img1))
  (at 837 (not (image_available img1)))
  (at 943 (image_available img2))
  (at 951 (not (image_available img2)))
  (at 712 (image_available img3))
  (at 720 (not (image_available img3)))
  (at 772 (image_available img4))
  (at 780 (not (image_available img4)))
  (at 684 (image_available img5))
  (at 692 (not (image_available img5)))
  (at 1189 (image_available img1))
  (at 1197 (not (image_available img1)))
  (at 1303 (image_available img2))
  (at 1311 (not (image_available img2)))
  (at 1072 (image_available img3))
  (at 1080 (not (image_available img3)))
  (at 1132 (image_available img4))
  (at 1140 (not (image_available img4)))
  (at 1044 (image_available img5))
  (at 1052 (not (image_available img5)))
  (at 1549 (image_available img1))
  (at 1557 (not (image_available img1)))
  (at 1663 (image_available img2))
  (at 1671 (not (image_available img2)))
  (at 1432 (image_available img3))
  (at 1440 (not (image_available img3)))
  (at 1492 (image_available img4))
  (at 1500 (not (image_available img4)))
  (at 1404 (image_available img5))
  (at 1412 (not (image_available img5)))
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
  (at 1618.0 (dump_available))
  (at 1656.0 (not (dump_available)))

)
(:goal (and
  (> (image_score img3) 0)
  (<= (image_score img3) 2.0)

(>= (total_score) 1)
))
(:metric maximize 
  (image_score img3)
)
)
