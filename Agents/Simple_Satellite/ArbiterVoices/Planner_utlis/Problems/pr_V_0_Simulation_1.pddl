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



  (at 316 (image_available img1))
  (at 324 (not (image_available img1)))
  (at 204 (image_available img2))
  (at 212 (not (image_available img2)))
  (at 32 (image_available img3))
  (at 40 (not (image_available img3)))
  (at 91 (image_available img4))
  (at 99 (not (image_available img4)))
  (at 341 (image_available img5))
  (at 349 (not (image_available img5)))
  (at 676 (image_available img1))
  (at 684 (not (image_available img1)))
  (at 564 (image_available img2))
  (at 572 (not (image_available img2)))
  (at 392 (image_available img3))
  (at 400 (not (image_available img3)))
  (at 451 (image_available img4))
  (at 459 (not (image_available img4)))
  (at 701 (image_available img5))
  (at 709 (not (image_available img5)))
  (at 1036 (image_available img1))
  (at 1044 (not (image_available img1)))
  (at 924 (image_available img2))
  (at 932 (not (image_available img2)))
  (at 752 (image_available img3))
  (at 760 (not (image_available img3)))
  (at 811 (image_available img4))
  (at 819 (not (image_available img4)))
  (at 1061 (image_available img5))
  (at 1069 (not (image_available img5)))
  (at 1396 (image_available img1))
  (at 1404 (not (image_available img1)))
  (at 1284 (image_available img2))
  (at 1292 (not (image_available img2)))
  (at 1112 (image_available img3))
  (at 1120 (not (image_available img3)))
  (at 1171 (image_available img4))
  (at 1179 (not (image_available img4)))
  (at 1421 (image_available img5))
  (at 1429 (not (image_available img5)))
  (at 1756 (image_available img1))
  (at 1764 (not (image_available img1)))
  (at 1644 (image_available img2))
  (at 1652 (not (image_available img2)))
  (at 1472 (image_available img3))
  (at 1480 (not (image_available img3)))
  (at 1531 (image_available img4))
  (at 1539 (not (image_available img4)))
  (at 1781 (image_available img5))
  (at 1789 (not (image_available img5)))
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
  (<= (image_score img1) 1)

(>= (total_score) 1)
))
(:metric maximize 
  (image_score img1)
)
)
