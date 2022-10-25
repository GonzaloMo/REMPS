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



  (at 59 (image_available img1))
  (at 67 (not (image_available img1)))
  (at 188 (image_available img2))
  (at 196 (not (image_available img2)))
  (at 241 (image_available img3))
  (at 249 (not (image_available img3)))
  (at 130 (image_available img4))
  (at 138 (not (image_available img4)))
  (at 78 (image_available img5))
  (at 86 (not (image_available img5)))
  (at 419 (image_available img1))
  (at 427 (not (image_available img1)))
  (at 548 (image_available img2))
  (at 556 (not (image_available img2)))
  (at 601 (image_available img3))
  (at 609 (not (image_available img3)))
  (at 490 (image_available img4))
  (at 498 (not (image_available img4)))
  (at 438 (image_available img5))
  (at 446 (not (image_available img5)))
  (at 779 (image_available img1))
  (at 787 (not (image_available img1)))
  (at 908 (image_available img2))
  (at 916 (not (image_available img2)))
  (at 961 (image_available img3))
  (at 969 (not (image_available img3)))
  (at 850 (image_available img4))
  (at 858 (not (image_available img4)))
  (at 798 (image_available img5))
  (at 806 (not (image_available img5)))
  (at 1139 (image_available img1))
  (at 1147 (not (image_available img1)))
  (at 1268 (image_available img2))
  (at 1276 (not (image_available img2)))
  (at 1321 (image_available img3))
  (at 1329 (not (image_available img3)))
  (at 1210 (image_available img4))
  (at 1218 (not (image_available img4)))
  (at 1158 (image_available img5))
  (at 1166 (not (image_available img5)))
  (at 1499 (image_available img1))
  (at 1507 (not (image_available img1)))
  (at 1628 (image_available img2))
  (at 1636 (not (image_available img2)))
  (at 1681 (image_available img3))
  (at 1689 (not (image_available img3)))
  (at 1570 (image_available img4))
  (at 1578 (not (image_available img4)))
  (at 1518 (image_available img5))
  (at 1526 (not (image_available img5)))
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
  (> (image_score img2) 0)
  (<= (image_score img2) 1.0)

(>= (total_score) 1)
))
(:metric maximize 
  (image_score img2)
)
)
