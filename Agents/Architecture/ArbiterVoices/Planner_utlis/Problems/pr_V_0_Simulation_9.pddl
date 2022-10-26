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
  (memory_free mem3)
  (memory_free mem4)
  (memory_free mem5)
  (memory_free mem6)
  (memory_free mem7)
  (memory_free mem8)
  (memory_free mem9)

   (memory_taken mem1 img2)
   (memory_taken mem2 img3)

(image_analysed mem1 img2)
(image_analysed mem2 img3)

  (at 96 (image_available img2))
  (at 104 (not (image_available img2)))
  (at 149 (image_available img3))
  (at 157 (not (image_available img3)))
  (at 38 (image_available img4))
  (at 46 (not (image_available img4)))
  (at 327 (image_available img1))
  (at 335 (not (image_available img1)))
  (at 456 (image_available img2))
  (at 464 (not (image_available img2)))
  (at 509 (image_available img3))
  (at 517 (not (image_available img3)))
  (at 398 (image_available img4))
  (at 406 (not (image_available img4)))
  (at 346 (image_available img5))
  (at 354 (not (image_available img5)))
  (at 687 (image_available img1))
  (at 695 (not (image_available img1)))
  (at 816 (image_available img2))
  (at 824 (not (image_available img2)))
  (at 869 (image_available img3))
  (at 877 (not (image_available img3)))
  (at 758 (image_available img4))
  (at 766 (not (image_available img4)))
  (at 706 (image_available img5))
  (at 714 (not (image_available img5)))
  (at 1047 (image_available img1))
  (at 1055 (not (image_available img1)))
  (at 1176 (image_available img2))
  (at 1184 (not (image_available img2)))
  (at 1229 (image_available img3))
  (at 1237 (not (image_available img3)))
  (at 1118 (image_available img4))
  (at 1126 (not (image_available img4)))
  (at 1066 (image_available img5))
  (at 1074 (not (image_available img5)))
  (at 1407 (image_available img1))
  (at 1415 (not (image_available img1)))
  (at 1536 (image_available img2))
  (at 1544 (not (image_available img2)))
  (at 1589 (image_available img3))
  (at 1597 (not (image_available img3)))
  (at 1478 (image_available img4))
  (at 1486 (not (image_available img4)))
  (at 1426 (image_available img5))
  (at 1434 (not (image_available img5)))
  (at 1 (dump_available))
  (at 22.0 (not (dump_available)))
  (at 164.0 (dump_available))
  (at 202.0 (not (dump_available)))
  (at 344.0 (dump_available))
  (at 382.0 (not (dump_available)))
  (at 524.0 (dump_available))
  (at 562.0 (not (dump_available)))
  (at 704.0 (dump_available))
  (at 742.0 (not (dump_available)))
  (at 884.0 (dump_available))
  (at 922.0 (not (dump_available)))
  (at 1064.0 (dump_available))
  (at 1102.0 (not (dump_available)))
  (at 1244.0 (dump_available))
  (at 1282.0 (not (dump_available)))
  (at 1424.0 (dump_available))
  (at 1462.0 (not (dump_available)))
  (at 1604.0 (dump_available))
  (at 1642.0 (not (dump_available)))

)
(:goal (and
  (> (image_score img3) 0)
  (<= (image_score img3) 1)

  (> (image_score img4) 0)
  (<= (image_score img4) 5)

  (> (image_score img5) 0)
  (<= (image_score img5) 3)

(>= (total_score) 2)
))
(:metric maximize (+
  (image_score img3)
    (+ (image_score img4)
      (image_score img5)
    )
  )
)
)