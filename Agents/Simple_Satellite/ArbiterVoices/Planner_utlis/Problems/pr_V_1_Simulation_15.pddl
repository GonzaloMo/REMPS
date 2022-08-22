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

   (memory_taken mem0 img4)

(image_analysed mem0 img4)

  (at 175 (image_available img1))
  (at 183 (not (image_available img1)))
  (at 168 (image_available img3))
  (at 176 (not (image_available img3)))
  (at 142 (image_available img4))
  (at 150 (not (image_available img4)))
  (at 535 (image_available img1))
  (at 543 (not (image_available img1)))
  (at 284 (image_available img2))
  (at 292 (not (image_available img2)))
  (at 528 (image_available img3))
  (at 536 (not (image_available img3)))
  (at 502 (image_available img4))
  (at 510 (not (image_available img4)))
  (at 309 (image_available img5))
  (at 317 (not (image_available img5)))
  (at 895 (image_available img1))
  (at 903 (not (image_available img1)))
  (at 644 (image_available img2))
  (at 652 (not (image_available img2)))
  (at 888 (image_available img3))
  (at 896 (not (image_available img3)))
  (at 862 (image_available img4))
  (at 870 (not (image_available img4)))
  (at 669 (image_available img5))
  (at 677 (not (image_available img5)))
  (at 1255 (image_available img1))
  (at 1263 (not (image_available img1)))
  (at 1004 (image_available img2))
  (at 1012 (not (image_available img2)))
  (at 1248 (image_available img3))
  (at 1256 (not (image_available img3)))
  (at 1222 (image_available img4))
  (at 1230 (not (image_available img4)))
  (at 1029 (image_available img5))
  (at 1037 (not (image_available img5)))
  (at 1615 (image_available img1))
  (at 1623 (not (image_available img1)))
  (at 1364 (image_available img2))
  (at 1372 (not (image_available img2)))
  (at 1608 (image_available img3))
  (at 1616 (not (image_available img3)))
  (at 1582 (image_available img4))
  (at 1590 (not (image_available img4)))
  (at 1389 (image_available img5))
  (at 1397 (not (image_available img5)))
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
  (> (image_score img5) 0)
  (<= (image_score img5) 7)

(>= (total_score) 2)
))
(:metric maximize 
  (image_score img5)
)
)
