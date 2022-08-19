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

   (memory_taken mem0 img1)
   (memory_taken mem1 img3)

(image_analysed mem0 img1)
(image_analysed mem1 img3)

  (at 238 (image_available img1))
  (at 246 (not (image_available img1)))
  (at 126 (image_available img2))
  (at 134 (not (image_available img2)))
  (at 13 (image_available img4))
  (at 21 (not (image_available img4)))
  (at 263 (image_available img5))
  (at 271 (not (image_available img5)))
  (at 598 (image_available img1))
  (at 606 (not (image_available img1)))
  (at 486 (image_available img2))
  (at 494 (not (image_available img2)))
  (at 314 (image_available img3))
  (at 322 (not (image_available img3)))
  (at 373 (image_available img4))
  (at 381 (not (image_available img4)))
  (at 623 (image_available img5))
  (at 631 (not (image_available img5)))
  (at 958 (image_available img1))
  (at 966 (not (image_available img1)))
  (at 846 (image_available img2))
  (at 854 (not (image_available img2)))
  (at 674 (image_available img3))
  (at 682 (not (image_available img3)))
  (at 733 (image_available img4))
  (at 741 (not (image_available img4)))
  (at 983 (image_available img5))
  (at 991 (not (image_available img5)))
  (at 1318 (image_available img1))
  (at 1326 (not (image_available img1)))
  (at 1206 (image_available img2))
  (at 1214 (not (image_available img2)))
  (at 1034 (image_available img3))
  (at 1042 (not (image_available img3)))
  (at 1093 (image_available img4))
  (at 1101 (not (image_available img4)))
  (at 1343 (image_available img5))
  (at 1351 (not (image_available img5)))
  (at 1678 (image_available img1))
  (at 1686 (not (image_available img1)))
  (at 1566 (image_available img2))
  (at 1574 (not (image_available img2)))
  (at 1394 (image_available img3))
  (at 1402 (not (image_available img3)))
  (at 1453 (image_available img4))
  (at 1461 (not (image_available img4)))
  (at 1703 (image_available img5))
  (at 1711 (not (image_available img5)))
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
  (<= (image_score img1) 1)

(>= (total_score) 1)
))
(:metric maximize 
  (image_score img1)
)
)
