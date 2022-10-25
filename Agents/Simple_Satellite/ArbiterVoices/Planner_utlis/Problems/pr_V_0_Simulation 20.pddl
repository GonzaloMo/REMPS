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



  (at 79 (image_available img1))
  (at 87 (not (image_available img1)))
  (at 175 (image_available img2))
  (at 183 (not (image_available img2)))
  (at 162 (image_available img3))
  (at 170 (not (image_available img3)))
  (at 340 (image_available img4))
  (at 348 (not (image_available img4)))
  (at 139 (image_available img5))
  (at 147 (not (image_available img5)))
  (at 253 (image_available img6))
  (at 261 (not (image_available img6)))
  (at 99 (image_available img7))
  (at 107 (not (image_available img7)))
  (at 313 (image_available img8))
  (at 321 (not (image_available img8)))
  (at 86 (image_available img9))
  (at 94 (not (image_available img9)))
  (at 144 (image_available img10))
  (at 152 (not (image_available img10)))
  (at 439 (image_available img1))
  (at 447 (not (image_available img1)))
  (at 535 (image_available img2))
  (at 543 (not (image_available img2)))
  (at 522 (image_available img3))
  (at 530 (not (image_available img3)))
  (at 700 (image_available img4))
  (at 708 (not (image_available img4)))
  (at 499 (image_available img5))
  (at 507 (not (image_available img5)))
  (at 613 (image_available img6))
  (at 621 (not (image_available img6)))
  (at 459 (image_available img7))
  (at 467 (not (image_available img7)))
  (at 673 (image_available img8))
  (at 681 (not (image_available img8)))
  (at 446 (image_available img9))
  (at 454 (not (image_available img9)))
  (at 504 (image_available img10))
  (at 512 (not (image_available img10)))
  (at 799 (image_available img1))
  (at 807 (not (image_available img1)))
  (at 895 (image_available img2))
  (at 903 (not (image_available img2)))
  (at 882 (image_available img3))
  (at 890 (not (image_available img3)))
  (at 1060 (image_available img4))
  (at 1068 (not (image_available img4)))
  (at 859 (image_available img5))
  (at 867 (not (image_available img5)))
  (at 973 (image_available img6))
  (at 981 (not (image_available img6)))
  (at 819 (image_available img7))
  (at 827 (not (image_available img7)))
  (at 1033 (image_available img8))
  (at 1041 (not (image_available img8)))
  (at 806 (image_available img9))
  (at 814 (not (image_available img9)))
  (at 864 (image_available img10))
  (at 872 (not (image_available img10)))
  (at 1159 (image_available img1))
  (at 1167 (not (image_available img1)))
  (at 1255 (image_available img2))
  (at 1263 (not (image_available img2)))
  (at 1242 (image_available img3))
  (at 1250 (not (image_available img3)))
  (at 1420 (image_available img4))
  (at 1428 (not (image_available img4)))
  (at 1219 (image_available img5))
  (at 1227 (not (image_available img5)))
  (at 1333 (image_available img6))
  (at 1341 (not (image_available img6)))
  (at 1179 (image_available img7))
  (at 1187 (not (image_available img7)))
  (at 1393 (image_available img8))
  (at 1401 (not (image_available img8)))
  (at 1166 (image_available img9))
  (at 1174 (not (image_available img9)))
  (at 1224 (image_available img10))
  (at 1232 (not (image_available img10)))
  (at 1519 (image_available img1))
  (at 1527 (not (image_available img1)))
  (at 1615 (image_available img2))
  (at 1623 (not (image_available img2)))
  (at 1602 (image_available img3))
  (at 1610 (not (image_available img3)))
  (at 1780 (image_available img4))
  (at 1788 (not (image_available img4)))
  (at 1579 (image_available img5))
  (at 1587 (not (image_available img5)))
  (at 1693 (image_available img6))
  (at 1701 (not (image_available img6)))
  (at 1539 (image_available img7))
  (at 1547 (not (image_available img7)))
  (at 1753 (image_available img8))
  (at 1761 (not (image_available img8)))
  (at 1526 (image_available img9))
  (at 1534 (not (image_available img9)))
  (at 1584 (image_available img10))
  (at 1592 (not (image_available img10)))
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
  (> (image_score img4) 0)
  (<= (image_score img4) 17.0)

(>= (total_score) 4)
))
(:metric maximize 
  (image_score img4)
)
)
