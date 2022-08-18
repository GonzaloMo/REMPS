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

   (memory_taken mem0 img5)
   (memory_taken mem1 img5)
   (memory_taken mem2 img2)

(image_analysed mem0 img5)
(image_analysed mem1 img5)
(image_analysed mem2 img2)

  (at 136 (image_available img1))
  (at 144 (not (image_available img1)))
  (at 232 (image_available img2))
  (at 240 (not (image_available img2)))
  (at 38 (image_available img5))
  (at 46 (not (image_available img5)))
  (at 496 (image_available img1))
  (at 504 (not (image_available img1)))
  (at 592 (image_available img2))
  (at 600 (not (image_available img2)))
  (at 285 (image_available img3))
  (at 293 (not (image_available img3)))
  (at 273 (image_available img4))
  (at 281 (not (image_available img4)))
  (at 398 (image_available img5))
  (at 406 (not (image_available img5)))
  (at 856 (image_available img1))
  (at 864 (not (image_available img1)))
  (at 952 (image_available img2))
  (at 960 (not (image_available img2)))
  (at 645 (image_available img3))
  (at 653 (not (image_available img3)))
  (at 633 (image_available img4))
  (at 641 (not (image_available img4)))
  (at 758 (image_available img5))
  (at 766 (not (image_available img5)))
  (at 1216 (image_available img1))
  (at 1224 (not (image_available img1)))
  (at 1312 (image_available img2))
  (at 1320 (not (image_available img2)))
  (at 1005 (image_available img3))
  (at 1013 (not (image_available img3)))
  (at 993 (image_available img4))
  (at 1001 (not (image_available img4)))
  (at 1118 (image_available img5))
  (at 1126 (not (image_available img5)))
  (at 1576 (image_available img1))
  (at 1584 (not (image_available img1)))
  (at 1672 (image_available img2))
  (at 1680 (not (image_available img2)))
  (at 1365 (image_available img3))
  (at 1373 (not (image_available img3)))
  (at 1353 (image_available img4))
  (at 1361 (not (image_available img4)))
  (at 1478 (image_available img5))
  (at 1486 (not (image_available img5)))
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
  (> (image_score img2) 0)
  (<= (image_score img2) 8)

  (> (image_score img4) 0)
  (<= (image_score img4) 1)

(>= (total_score) 2)
))
(:metric maximize (+
  (image_score img2)
    (image_score img4)
  )
)
)
