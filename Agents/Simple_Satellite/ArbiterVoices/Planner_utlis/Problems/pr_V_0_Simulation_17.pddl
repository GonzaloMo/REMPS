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



  (at 103 (image_available img1))
  (at 111 (not (image_available img1)))
  (at 112 (image_available img2))
  (at 120 (not (image_available img2)))
  (at 330 (image_available img3))
  (at 338 (not (image_available img3)))
  (at 227 (image_available img4))
  (at 235 (not (image_available img4)))
  (at 145 (image_available img5))
  (at 153 (not (image_available img5)))
  (at 144 (image_available img6))
  (at 152 (not (image_available img6)))
  (at 141 (image_available img7))
  (at 149 (not (image_available img7)))
  (at 160 (image_available img8))
  (at 168 (not (image_available img8)))
  (at 158 (image_available img9))
  (at 166 (not (image_available img9)))
  (at 171 (image_available img10))
  (at 179 (not (image_available img10)))
  (at 463 (image_available img1))
  (at 471 (not (image_available img1)))
  (at 472 (image_available img2))
  (at 480 (not (image_available img2)))
  (at 690 (image_available img3))
  (at 698 (not (image_available img3)))
  (at 587 (image_available img4))
  (at 595 (not (image_available img4)))
  (at 505 (image_available img5))
  (at 513 (not (image_available img5)))
  (at 504 (image_available img6))
  (at 512 (not (image_available img6)))
  (at 501 (image_available img7))
  (at 509 (not (image_available img7)))
  (at 520 (image_available img8))
  (at 528 (not (image_available img8)))
  (at 518 (image_available img9))
  (at 526 (not (image_available img9)))
  (at 531 (image_available img10))
  (at 539 (not (image_available img10)))
  (at 823 (image_available img1))
  (at 831 (not (image_available img1)))
  (at 832 (image_available img2))
  (at 840 (not (image_available img2)))
  (at 1050 (image_available img3))
  (at 1058 (not (image_available img3)))
  (at 947 (image_available img4))
  (at 955 (not (image_available img4)))
  (at 865 (image_available img5))
  (at 873 (not (image_available img5)))
  (at 864 (image_available img6))
  (at 872 (not (image_available img6)))
  (at 861 (image_available img7))
  (at 869 (not (image_available img7)))
  (at 880 (image_available img8))
  (at 888 (not (image_available img8)))
  (at 878 (image_available img9))
  (at 886 (not (image_available img9)))
  (at 891 (image_available img10))
  (at 899 (not (image_available img10)))
  (at 1183 (image_available img1))
  (at 1191 (not (image_available img1)))
  (at 1192 (image_available img2))
  (at 1200 (not (image_available img2)))
  (at 1410 (image_available img3))
  (at 1418 (not (image_available img3)))
  (at 1307 (image_available img4))
  (at 1315 (not (image_available img4)))
  (at 1225 (image_available img5))
  (at 1233 (not (image_available img5)))
  (at 1224 (image_available img6))
  (at 1232 (not (image_available img6)))
  (at 1221 (image_available img7))
  (at 1229 (not (image_available img7)))
  (at 1240 (image_available img8))
  (at 1248 (not (image_available img8)))
  (at 1238 (image_available img9))
  (at 1246 (not (image_available img9)))
  (at 1251 (image_available img10))
  (at 1259 (not (image_available img10)))
  (at 1543 (image_available img1))
  (at 1551 (not (image_available img1)))
  (at 1552 (image_available img2))
  (at 1560 (not (image_available img2)))
  (at 1770 (image_available img3))
  (at 1778 (not (image_available img3)))
  (at 1667 (image_available img4))
  (at 1675 (not (image_available img4)))
  (at 1585 (image_available img5))
  (at 1593 (not (image_available img5)))
  (at 1584 (image_available img6))
  (at 1592 (not (image_available img6)))
  (at 1581 (image_available img7))
  (at 1589 (not (image_available img7)))
  (at 1600 (image_available img8))
  (at 1608 (not (image_available img8)))
  (at 1598 (image_available img9))
  (at 1606 (not (image_available img9)))
  (at 1611 (image_available img10))
  (at 1619 (not (image_available img10)))
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

  (> (image_score img8) 0)
  (<= (image_score img8) 3)

(>= (total_score) 1)
))
(:metric maximize (+
  (image_score img1)
    (image_score img8)
  )
)
)
