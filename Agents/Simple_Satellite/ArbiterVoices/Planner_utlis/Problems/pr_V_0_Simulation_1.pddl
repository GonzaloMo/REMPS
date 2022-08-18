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

   (memory_taken mem0 img5)

(image_analysed mem0 img5)

  (at 65 (image_available img1))
  (at 73 (not (image_available img1)))
  (at 73 (image_available img2))
  (at 81 (not (image_available img2)))
  (at 196 (image_available img3))
  (at 204 (not (image_available img3)))
  (at 223 (image_available img4))
  (at 231 (not (image_available img4)))
  (at 425 (image_available img1))
  (at 433 (not (image_available img1)))
  (at 433 (image_available img2))
  (at 441 (not (image_available img2)))
  (at 556 (image_available img3))
  (at 564 (not (image_available img3)))
  (at 583 (image_available img4))
  (at 591 (not (image_available img4)))
  (at 301 (image_available img5))
  (at 309 (not (image_available img5)))
  (at 785 (image_available img1))
  (at 793 (not (image_available img1)))
  (at 793 (image_available img2))
  (at 801 (not (image_available img2)))
  (at 916 (image_available img3))
  (at 924 (not (image_available img3)))
  (at 943 (image_available img4))
  (at 951 (not (image_available img4)))
  (at 661 (image_available img5))
  (at 669 (not (image_available img5)))
  (at 1145 (image_available img1))
  (at 1153 (not (image_available img1)))
  (at 1153 (image_available img2))
  (at 1161 (not (image_available img2)))
  (at 1276 (image_available img3))
  (at 1284 (not (image_available img3)))
  (at 1303 (image_available img4))
  (at 1311 (not (image_available img4)))
  (at 1021 (image_available img5))
  (at 1029 (not (image_available img5)))
  (at 1505 (image_available img1))
  (at 1513 (not (image_available img1)))
  (at 1513 (image_available img2))
  (at 1521 (not (image_available img2)))
  (at 1636 (image_available img3))
  (at 1644 (not (image_available img3)))
  (at 1663 (image_available img4))
  (at 1671 (not (image_available img4)))
  (at 1381 (image_available img5))
  (at 1389 (not (image_available img5)))
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
  (<= (image_score img3) 1)

(>= (total_score) 1)
))
(:metric maximize 
  (image_score img3)
)
)
