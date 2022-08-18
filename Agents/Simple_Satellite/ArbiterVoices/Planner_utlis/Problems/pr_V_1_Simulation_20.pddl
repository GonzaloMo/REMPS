(define(problem satprob)
(:domain SimpleSatellite)
(:objects
  mem0 mem1 mem2 mem3 mem4 mem5 mem6 mem7 mem8 mem9 - memory
 img1 img2 img3 img4 img5 img6 img7 img8 img9 img10 - image
)
(:init
  (sat_free)
  (= (image_score img1) 0)
  (= (image_score img2) 0)
  (= (image_score img3) 0)
  (= (image_score img4) 0)
  (= (image_score img5) 0)
  (= (image_score img6) 0)
  (= (image_score img7) 0)
  (= (image_score img8) 0)
  (= (image_score img9) 0)
  (= (image_score img10) 0)
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



  (at 14 (image_available img1))
  (at 22 (not (image_available img1)))
  (at 158 (image_available img2))
  (at 166 (not (image_available img2)))
  (at 14 (image_available img3))
  (at 22 (not (image_available img3)))
  (at 40 (image_available img4))
  (at 48 (not (image_available img4)))
  (at 244 (image_available img5))
  (at 252 (not (image_available img5)))
  (at 231 (image_available img6))
  (at 239 (not (image_available img6)))
  (at 102 (image_available img7))
  (at 110 (not (image_available img7)))
  (at 332 (image_available img8))
  (at 340 (not (image_available img8)))
  (at 96 (image_available img9))
  (at 104 (not (image_available img9)))
  (at 22 (image_available img10))
  (at 30 (not (image_available img10)))
  (at 374 (image_available img1))
  (at 382 (not (image_available img1)))
  (at 518 (image_available img2))
  (at 526 (not (image_available img2)))
  (at 374 (image_available img3))
  (at 382 (not (image_available img3)))
  (at 400 (image_available img4))
  (at 408 (not (image_available img4)))
  (at 604 (image_available img5))
  (at 612 (not (image_available img5)))
  (at 591 (image_available img6))
  (at 599 (not (image_available img6)))
  (at 462 (image_available img7))
  (at 470 (not (image_available img7)))
  (at 692 (image_available img8))
  (at 700 (not (image_available img8)))
  (at 456 (image_available img9))
  (at 464 (not (image_available img9)))
  (at 382 (image_available img10))
  (at 390 (not (image_available img10)))
  (at 734 (image_available img1))
  (at 742 (not (image_available img1)))
  (at 878 (image_available img2))
  (at 886 (not (image_available img2)))
  (at 734 (image_available img3))
  (at 742 (not (image_available img3)))
  (at 760 (image_available img4))
  (at 768 (not (image_available img4)))
  (at 964 (image_available img5))
  (at 972 (not (image_available img5)))
  (at 951 (image_available img6))
  (at 959 (not (image_available img6)))
  (at 822 (image_available img7))
  (at 830 (not (image_available img7)))
  (at 1052 (image_available img8))
  (at 1060 (not (image_available img8)))
  (at 816 (image_available img9))
  (at 824 (not (image_available img9)))
  (at 742 (image_available img10))
  (at 750 (not (image_available img10)))
  (at 1094 (image_available img1))
  (at 1102 (not (image_available img1)))
  (at 1238 (image_available img2))
  (at 1246 (not (image_available img2)))
  (at 1094 (image_available img3))
  (at 1102 (not (image_available img3)))
  (at 1120 (image_available img4))
  (at 1128 (not (image_available img4)))
  (at 1324 (image_available img5))
  (at 1332 (not (image_available img5)))
  (at 1311 (image_available img6))
  (at 1319 (not (image_available img6)))
  (at 1182 (image_available img7))
  (at 1190 (not (image_available img7)))
  (at 1412 (image_available img8))
  (at 1420 (not (image_available img8)))
  (at 1176 (image_available img9))
  (at 1184 (not (image_available img9)))
  (at 1102 (image_available img10))
  (at 1110 (not (image_available img10)))
  (at 1454 (image_available img1))
  (at 1462 (not (image_available img1)))
  (at 1598 (image_available img2))
  (at 1606 (not (image_available img2)))
  (at 1454 (image_available img3))
  (at 1462 (not (image_available img3)))
  (at 1480 (image_available img4))
  (at 1488 (not (image_available img4)))
  (at 1684 (image_available img5))
  (at 1692 (not (image_available img5)))
  (at 1671 (image_available img6))
  (at 1679 (not (image_available img6)))
  (at 1542 (image_available img7))
  (at 1550 (not (image_available img7)))
  (at 1772 (image_available img8))
  (at 1780 (not (image_available img8)))
  (at 1536 (image_available img9))
  (at 1544 (not (image_available img9)))
  (at 1462 (image_available img10))
  (at 1470 (not (image_available img10)))
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
  (<= (image_score img1) 14)

  (> (image_score img4) 0)
  (<= (image_score img4) 19)

(>= (total_score) 7)
))
(:metric maximize (+
  (image_score img1)
    (image_score img4)
  )
)
)
