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

   (memory_taken mem0 img3)

(image_analysed mem0 img3)

  (at 102 (image_available img1))
  (at 110 (not (image_available img1)))
  (at 65 (image_available img2))
  (at 73 (not (image_available img2)))
  (at 236 (image_available img3))
  (at 244 (not (image_available img3)))
  (at 257 (image_available img4))
  (at 265 (not (image_available img4)))
  (at 23 (image_available img5))
  (at 31 (not (image_available img5)))
  (at 462 (image_available img1))
  (at 470 (not (image_available img1)))
  (at 425 (image_available img2))
  (at 433 (not (image_available img2)))
  (at 596 (image_available img3))
  (at 604 (not (image_available img3)))
  (at 617 (image_available img4))
  (at 625 (not (image_available img4)))
  (at 383 (image_available img5))
  (at 391 (not (image_available img5)))
  (at 822 (image_available img1))
  (at 830 (not (image_available img1)))
  (at 785 (image_available img2))
  (at 793 (not (image_available img2)))
  (at 956 (image_available img3))
  (at 964 (not (image_available img3)))
  (at 977 (image_available img4))
  (at 985 (not (image_available img4)))
  (at 743 (image_available img5))
  (at 751 (not (image_available img5)))
  (at 1182 (image_available img1))
  (at 1190 (not (image_available img1)))
  (at 1145 (image_available img2))
  (at 1153 (not (image_available img2)))
  (at 1316 (image_available img3))
  (at 1324 (not (image_available img3)))
  (at 1337 (image_available img4))
  (at 1345 (not (image_available img4)))
  (at 1103 (image_available img5))
  (at 1111 (not (image_available img5)))
  (at 1542 (image_available img1))
  (at 1550 (not (image_available img1)))
  (at 1505 (image_available img2))
  (at 1513 (not (image_available img2)))
  (at 1676 (image_available img3))
  (at 1684 (not (image_available img3)))
  (at 1697 (image_available img4))
  (at 1705 (not (image_available img4)))
  (at 1463 (image_available img5))
  (at 1471 (not (image_available img5)))
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
  (> (image_score img1) 0)
  (<= (image_score img1) 3)

  (> (image_score img3) 0)
  (<= (image_score img3) 15)

  (> (image_score img4) 0)
  (<= (image_score img4) 3)

(>= (total_score) 5)
))
(:metric maximize (+
  (image_score img1)
    (+ (image_score img3)
      (image_score img4)
    )
  )
)
)
