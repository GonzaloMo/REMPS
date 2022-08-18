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

  (memory_free mem2)
  (memory_free mem3)
  (memory_free mem4)
  (memory_free mem5)
  (memory_free mem6)
  (memory_free mem7)
  (memory_free mem8)
  (memory_free mem9)

   (memory_taken mem0 img3)
   (memory_taken mem1 img2)

(image_analysed mem0 img3)
(image_analysed mem1 img2)

  (at 60 (image_available img2))
  (at 68 (not (image_available img2)))
  (at 310 (image_available img1))
  (at 318 (not (image_available img1)))
  (at 420 (image_available img2))
  (at 428 (not (image_available img2)))
  (at 299 (image_available img3))
  (at 307 (not (image_available img3)))
  (at 125 (image_available img4))
  (at 133 (not (image_available img4)))
  (at 323 (image_available img5))
  (at 331 (not (image_available img5)))
  (at 670 (image_available img1))
  (at 678 (not (image_available img1)))
  (at 780 (image_available img2))
  (at 788 (not (image_available img2)))
  (at 659 (image_available img3))
  (at 667 (not (image_available img3)))
  (at 485 (image_available img4))
  (at 493 (not (image_available img4)))
  (at 683 (image_available img5))
  (at 691 (not (image_available img5)))
  (at 1030 (image_available img1))
  (at 1038 (not (image_available img1)))
  (at 1140 (image_available img2))
  (at 1148 (not (image_available img2)))
  (at 1019 (image_available img3))
  (at 1027 (not (image_available img3)))
  (at 845 (image_available img4))
  (at 853 (not (image_available img4)))
  (at 1043 (image_available img5))
  (at 1051 (not (image_available img5)))
  (at 1390 (image_available img1))
  (at 1398 (not (image_available img1)))
  (at 1500 (image_available img2))
  (at 1508 (not (image_available img2)))
  (at 1379 (image_available img3))
  (at 1387 (not (image_available img3)))
  (at 1205 (image_available img4))
  (at 1213 (not (image_available img4)))
  (at 1403 (image_available img5))
  (at 1411 (not (image_available img5)))
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
  (<= (image_score img1) 3)

  (> (image_score img3) 0)
  (<= (image_score img3) 1)

  (> (image_score img4) 0)
  (<= (image_score img4) 2)

(>= (total_score) 2)
))
(:metric maximize (+
  (image_score img1)
    (+ (image_score img3)
      (image_score img4)
    )
  )
)
)
