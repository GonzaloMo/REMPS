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



  (at 176 (image_available img1))
  (at 184 (not (image_available img1)))
  (at 34 (image_available img2))
  (at 42 (not (image_available img2)))
  (at 333 (image_available img3))
  (at 341 (not (image_available img3)))
  (at 184 (image_available img4))
  (at 192 (not (image_available img4)))
  (at 37 (image_available img5))
  (at 45 (not (image_available img5)))
  (at 536 (image_available img1))
  (at 544 (not (image_available img1)))
  (at 394 (image_available img2))
  (at 402 (not (image_available img2)))
  (at 693 (image_available img3))
  (at 701 (not (image_available img3)))
  (at 544 (image_available img4))
  (at 552 (not (image_available img4)))
  (at 397 (image_available img5))
  (at 405 (not (image_available img5)))
  (at 896 (image_available img1))
  (at 904 (not (image_available img1)))
  (at 754 (image_available img2))
  (at 762 (not (image_available img2)))
  (at 1053 (image_available img3))
  (at 1061 (not (image_available img3)))
  (at 904 (image_available img4))
  (at 912 (not (image_available img4)))
  (at 757 (image_available img5))
  (at 765 (not (image_available img5)))
  (at 1256 (image_available img1))
  (at 1264 (not (image_available img1)))
  (at 1114 (image_available img2))
  (at 1122 (not (image_available img2)))
  (at 1413 (image_available img3))
  (at 1421 (not (image_available img3)))
  (at 1264 (image_available img4))
  (at 1272 (not (image_available img4)))
  (at 1117 (image_available img5))
  (at 1125 (not (image_available img5)))
  (at 1616 (image_available img1))
  (at 1624 (not (image_available img1)))
  (at 1474 (image_available img2))
  (at 1482 (not (image_available img2)))
  (at 1773 (image_available img3))
  (at 1781 (not (image_available img3)))
  (at 1624 (image_available img4))
  (at 1632 (not (image_available img4)))
  (at 1477 (image_available img5))
  (at 1485 (not (image_available img5)))
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
  (<= (image_score img2) 4.0)

(>= (total_score) 1)
))
(:metric maximize 
  (image_score img2)
)
)
