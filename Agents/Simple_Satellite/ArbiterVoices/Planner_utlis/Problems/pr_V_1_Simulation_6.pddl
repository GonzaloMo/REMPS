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

   (memory_taken mem1 img4)
   (memory_taken mem2 img1)

(image_analysed mem1 img4)
(image_analysed mem2 img1)

  (at 150 (image_available img1))
  (at 158 (not (image_available img1)))
  (at 246 (image_available img2))
  (at 254 (not (image_available img2)))
  (at 52 (image_available img5))
  (at 60 (not (image_available img5)))
  (at 510 (image_available img1))
  (at 518 (not (image_available img1)))
  (at 606 (image_available img2))
  (at 614 (not (image_available img2)))
  (at 299 (image_available img3))
  (at 307 (not (image_available img3)))
  (at 287 (image_available img4))
  (at 295 (not (image_available img4)))
  (at 412 (image_available img5))
  (at 420 (not (image_available img5)))
  (at 870 (image_available img1))
  (at 878 (not (image_available img1)))
  (at 966 (image_available img2))
  (at 974 (not (image_available img2)))
  (at 659 (image_available img3))
  (at 667 (not (image_available img3)))
  (at 647 (image_available img4))
  (at 655 (not (image_available img4)))
  (at 772 (image_available img5))
  (at 780 (not (image_available img5)))
  (at 1230 (image_available img1))
  (at 1238 (not (image_available img1)))
  (at 1326 (image_available img2))
  (at 1334 (not (image_available img2)))
  (at 1019 (image_available img3))
  (at 1027 (not (image_available img3)))
  (at 1007 (image_available img4))
  (at 1015 (not (image_available img4)))
  (at 1132 (image_available img5))
  (at 1140 (not (image_available img5)))
  (at 1590 (image_available img1))
  (at 1598 (not (image_available img1)))
  (at 1686 (image_available img2))
  (at 1694 (not (image_available img2)))
  (at 1379 (image_available img3))
  (at 1387 (not (image_available img3)))
  (at 1367 (image_available img4))
  (at 1375 (not (image_available img4)))
  (at 1492 (image_available img5))
  (at 1500 (not (image_available img5)))
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
  (> (image_score img4) 0)
  (<= (image_score img4) 5)

(>= (total_score) 1)
))
(:metric maximize 
  (image_score img4)
)
)
