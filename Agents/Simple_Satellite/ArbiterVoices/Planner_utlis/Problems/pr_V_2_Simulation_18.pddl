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

  (memory_free mem2)
  (memory_free mem3)
  (memory_free mem4)
  (memory_free mem5)
  (memory_free mem6)
  (memory_free mem7)
  (memory_free mem8)
  (memory_free mem9)

   (memory_taken mem0 img7)
   (memory_taken mem1 img7)

(image_analysed mem0 img7)
(image_analysed mem1 img7)

  (at 38 (image_available img2))
  (at 46 (not (image_available img2)))
  (at 110 (image_available img3))
  (at 118 (not (image_available img3)))
  (at 77 (image_available img4))
  (at 85 (not (image_available img4)))
  (at 210 (image_available img5))
  (at 218 (not (image_available img5)))
  (at 118 (image_available img6))
  (at 126 (not (image_available img6)))
  (at 25 (image_available img7))
  (at 33 (not (image_available img7)))
  (at 37 (image_available img8))
  (at 45 (not (image_available img8)))
  (at 185 (image_available img9))
  (at 193 (not (image_available img9)))
  (at 114 (image_available img10))
  (at 122 (not (image_available img10)))
  (at 314 (image_available img1))
  (at 322 (not (image_available img1)))
  (at 398 (image_available img2))
  (at 406 (not (image_available img2)))
  (at 470 (image_available img3))
  (at 478 (not (image_available img3)))
  (at 437 (image_available img4))
  (at 445 (not (image_available img4)))
  (at 570 (image_available img5))
  (at 578 (not (image_available img5)))
  (at 478 (image_available img6))
  (at 486 (not (image_available img6)))
  (at 385 (image_available img7))
  (at 393 (not (image_available img7)))
  (at 397 (image_available img8))
  (at 405 (not (image_available img8)))
  (at 545 (image_available img9))
  (at 553 (not (image_available img9)))
  (at 474 (image_available img10))
  (at 482 (not (image_available img10)))
  (at 674 (image_available img1))
  (at 682 (not (image_available img1)))
  (at 758 (image_available img2))
  (at 766 (not (image_available img2)))
  (at 830 (image_available img3))
  (at 838 (not (image_available img3)))
  (at 797 (image_available img4))
  (at 805 (not (image_available img4)))
  (at 930 (image_available img5))
  (at 938 (not (image_available img5)))
  (at 838 (image_available img6))
  (at 846 (not (image_available img6)))
  (at 745 (image_available img7))
  (at 753 (not (image_available img7)))
  (at 757 (image_available img8))
  (at 765 (not (image_available img8)))
  (at 905 (image_available img9))
  (at 913 (not (image_available img9)))
  (at 834 (image_available img10))
  (at 842 (not (image_available img10)))
  (at 1034 (image_available img1))
  (at 1042 (not (image_available img1)))
  (at 1118 (image_available img2))
  (at 1126 (not (image_available img2)))
  (at 1190 (image_available img3))
  (at 1198 (not (image_available img3)))
  (at 1157 (image_available img4))
  (at 1165 (not (image_available img4)))
  (at 1290 (image_available img5))
  (at 1298 (not (image_available img5)))
  (at 1198 (image_available img6))
  (at 1206 (not (image_available img6)))
  (at 1105 (image_available img7))
  (at 1113 (not (image_available img7)))
  (at 1117 (image_available img8))
  (at 1125 (not (image_available img8)))
  (at 1265 (image_available img9))
  (at 1273 (not (image_available img9)))
  (at 1194 (image_available img10))
  (at 1202 (not (image_available img10)))
  (at 1394 (image_available img1))
  (at 1402 (not (image_available img1)))
  (at 1478 (image_available img2))
  (at 1486 (not (image_available img2)))
  (at 1550 (image_available img3))
  (at 1558 (not (image_available img3)))
  (at 1517 (image_available img4))
  (at 1525 (not (image_available img4)))
  (at 1650 (image_available img5))
  (at 1658 (not (image_available img5)))
  (at 1558 (image_available img6))
  (at 1566 (not (image_available img6)))
  (at 1465 (image_available img7))
  (at 1473 (not (image_available img7)))
  (at 1477 (image_available img8))
  (at 1485 (not (image_available img8)))
  (at 1625 (image_available img9))
  (at 1633 (not (image_available img9)))
  (at 1554 (image_available img10))
  (at 1562 (not (image_available img10)))
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
  (<= (image_score img5) 1)

(>= (total_score) 1)
))
(:metric maximize 
  (image_score img5)
)
)
