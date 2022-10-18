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



  (at 253 (image_available img1))
  (at 261 (not (image_available img1)))
  (at 2 (image_available img2))
  (at 10 (not (image_available img2)))
  (at 246 (image_available img3))
  (at 254 (not (image_available img3)))
  (at 220 (image_available img4))
  (at 228 (not (image_available img4)))
  (at 27 (image_available img5))
  (at 35 (not (image_available img5)))
  (at 613 (image_available img1))
  (at 621 (not (image_available img1)))
  (at 362 (image_available img2))
  (at 370 (not (image_available img2)))
  (at 606 (image_available img3))
  (at 614 (not (image_available img3)))
  (at 580 (image_available img4))
  (at 588 (not (image_available img4)))
  (at 387 (image_available img5))
  (at 395 (not (image_available img5)))
  (at 973 (image_available img1))
  (at 981 (not (image_available img1)))
  (at 722 (image_available img2))
  (at 730 (not (image_available img2)))
  (at 966 (image_available img3))
  (at 974 (not (image_available img3)))
  (at 940 (image_available img4))
  (at 948 (not (image_available img4)))
  (at 747 (image_available img5))
  (at 755 (not (image_available img5)))
  (at 1333 (image_available img1))
  (at 1341 (not (image_available img1)))
  (at 1082 (image_available img2))
  (at 1090 (not (image_available img2)))
  (at 1326 (image_available img3))
  (at 1334 (not (image_available img3)))
  (at 1300 (image_available img4))
  (at 1308 (not (image_available img4)))
  (at 1107 (image_available img5))
  (at 1115 (not (image_available img5)))
  (at 1693 (image_available img1))
  (at 1701 (not (image_available img1)))
  (at 1442 (image_available img2))
  (at 1450 (not (image_available img2)))
  (at 1686 (image_available img3))
  (at 1694 (not (image_available img3)))
  (at 1660 (image_available img4))
  (at 1668 (not (image_available img4)))
  (at 1467 (image_available img5))
  (at 1475 (not (image_available img5)))
  (at 76.0 (dump_available))
  (at 114.0 (not (dump_available)))
  (at 256.0 (dump_available))
  (at 294.0 (not (dump_available)))
  (at 436.0 (dump_available))
  (at 474.0 (not (dump_available)))
  (at 616.0 (dump_available))
  (at 654.0 (not (dump_available)))
  (at 796.0 (dump_available))
  (at 834.0 (not (dump_available)))
  (at 976.0 (dump_available))
  (at 1014.0 (not (dump_available)))
  (at 1156.0 (dump_available))
  (at 1194.0 (not (dump_available)))
  (at 1336.0 (dump_available))
  (at 1374.0 (not (dump_available)))
  (at 1516.0 (dump_available))
  (at 1554.0 (not (dump_available)))
  (at 1696.0 (dump_available))
  (at 1734.0 (not (dump_available)))

)
(:goal (and
  (> (image_score img1) 0)
  (<= (image_score img1) 6)

  (> (image_score img2) 0)
  (<= (image_score img2) 8)

  (> (image_score img5) 0)
  (<= (image_score img5) 11)

(>= (total_score) 5)
))
(:metric maximize (+
  (image_score img1)
    (+ (image_score img2)
      (image_score img5)
    )
  )
)
)
