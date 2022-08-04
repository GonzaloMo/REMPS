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



  (at 209 (image_available img1))
  (at 217 (not (image_available img1)))
  (at 6 (image_available img2))
  (at 14 (not (image_available img2)))
  (at 147 (image_available img4))
  (at 155 (not (image_available img4)))
  (at 60 (image_available img5))
  (at 68 (not (image_available img5)))
  (at 569 (image_available img1))
  (at 577 (not (image_available img1)))
  (at 366 (image_available img2))
  (at 374 (not (image_available img2)))
  (at 303 (image_available img3))
  (at 311 (not (image_available img3)))
  (at 507 (image_available img4))
  (at 515 (not (image_available img4)))
  (at 420 (image_available img5))
  (at 428 (not (image_available img5)))
  (at 929 (image_available img1))
  (at 937 (not (image_available img1)))
  (at 726 (image_available img2))
  (at 734 (not (image_available img2)))
  (at 663 (image_available img3))
  (at 671 (not (image_available img3)))
  (at 867 (image_available img4))
  (at 875 (not (image_available img4)))
  (at 780 (image_available img5))
  (at 788 (not (image_available img5)))
  (at 1289 (image_available img1))
  (at 1297 (not (image_available img1)))
  (at 1086 (image_available img2))
  (at 1094 (not (image_available img2)))
  (at 1023 (image_available img3))
  (at 1031 (not (image_available img3)))
  (at 1227 (image_available img4))
  (at 1235 (not (image_available img4)))
  (at 1140 (image_available img5))
  (at 1148 (not (image_available img5)))
  (at 1649 (image_available img1))
  (at 1657 (not (image_available img1)))
  (at 1446 (image_available img2))
  (at 1454 (not (image_available img2)))
  (at 1383 (image_available img3))
  (at 1391 (not (image_available img3)))
  (at 1587 (image_available img4))
  (at 1595 (not (image_available img4)))
  (at 1500 (image_available img5))
  (at 1508 (not (image_available img5)))
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
  (>= (image_score img1) 0)
  (<= (image_score img1) 8)

  (>= (image_score img2) 0)
  (<= (image_score img2) 7)

  (>= (image_score img4) 0)
  (<= (image_score img4) 4)

(>= (total_score) 4)
))
(:metric maximize (+
  (image_score img1)
    (+ (image_score img2)
      (image_score img4)
    )
  )
)
)
