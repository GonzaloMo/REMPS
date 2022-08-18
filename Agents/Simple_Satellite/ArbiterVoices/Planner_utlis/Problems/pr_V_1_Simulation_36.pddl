(define(problem satprob)
(:domain SimpleSatellite)
(:objects
  mem0 mem1 mem2 mem3 mem4 mem5 mem6 mem7 mem8 mem9 - memory
 img1 img2 img3 img4 img5 img6 img7 img8 img9 img10 img11 img12 img13 img14 img15 - image
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
  (= (image_score img11) 0)
  (= (image_score img12) 0)
  (= (image_score img13) 0)
  (= (image_score img14) 0)
  (= (image_score img15) 0)
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



  (at 263 (image_available img1))
  (at 271 (not (image_available img1)))
  (at 39 (image_available img2))
  (at 47 (not (image_available img2)))
  (at 134 (image_available img3))
  (at 142 (not (image_available img3)))
  (at 146 (image_available img4))
  (at 154 (not (image_available img4)))
  (at 157 (image_available img5))
  (at 165 (not (image_available img5)))
  (at 287 (image_available img6))
  (at 295 (not (image_available img6)))
  (at 124 (image_available img7))
  (at 132 (not (image_available img7)))
  (at 4 (image_available img8))
  (at 12 (not (image_available img8)))
  (at 232 (image_available img9))
  (at 240 (not (image_available img9)))
  (at 22 (image_available img10))
  (at 30 (not (image_available img10)))
  (at 158 (image_available img11))
  (at 166 (not (image_available img11)))
  (at 147 (image_available img12))
  (at 155 (not (image_available img12)))
  (at 28 (image_available img13))
  (at 36 (not (image_available img13)))
  (at 65 (image_available img14))
  (at 73 (not (image_available img14)))
  (at 238 (image_available img15))
  (at 246 (not (image_available img15)))
  (at 623 (image_available img1))
  (at 631 (not (image_available img1)))
  (at 399 (image_available img2))
  (at 407 (not (image_available img2)))
  (at 494 (image_available img3))
  (at 502 (not (image_available img3)))
  (at 506 (image_available img4))
  (at 514 (not (image_available img4)))
  (at 517 (image_available img5))
  (at 525 (not (image_available img5)))
  (at 647 (image_available img6))
  (at 655 (not (image_available img6)))
  (at 484 (image_available img7))
  (at 492 (not (image_available img7)))
  (at 364 (image_available img8))
  (at 372 (not (image_available img8)))
  (at 592 (image_available img9))
  (at 600 (not (image_available img9)))
  (at 382 (image_available img10))
  (at 390 (not (image_available img10)))
  (at 518 (image_available img11))
  (at 526 (not (image_available img11)))
  (at 507 (image_available img12))
  (at 515 (not (image_available img12)))
  (at 388 (image_available img13))
  (at 396 (not (image_available img13)))
  (at 425 (image_available img14))
  (at 433 (not (image_available img14)))
  (at 598 (image_available img15))
  (at 606 (not (image_available img15)))
  (at 983 (image_available img1))
  (at 991 (not (image_available img1)))
  (at 759 (image_available img2))
  (at 767 (not (image_available img2)))
  (at 854 (image_available img3))
  (at 862 (not (image_available img3)))
  (at 866 (image_available img4))
  (at 874 (not (image_available img4)))
  (at 877 (image_available img5))
  (at 885 (not (image_available img5)))
  (at 1007 (image_available img6))
  (at 1015 (not (image_available img6)))
  (at 844 (image_available img7))
  (at 852 (not (image_available img7)))
  (at 724 (image_available img8))
  (at 732 (not (image_available img8)))
  (at 952 (image_available img9))
  (at 960 (not (image_available img9)))
  (at 742 (image_available img10))
  (at 750 (not (image_available img10)))
  (at 878 (image_available img11))
  (at 886 (not (image_available img11)))
  (at 867 (image_available img12))
  (at 875 (not (image_available img12)))
  (at 748 (image_available img13))
  (at 756 (not (image_available img13)))
  (at 785 (image_available img14))
  (at 793 (not (image_available img14)))
  (at 958 (image_available img15))
  (at 966 (not (image_available img15)))
  (at 1343 (image_available img1))
  (at 1351 (not (image_available img1)))
  (at 1119 (image_available img2))
  (at 1127 (not (image_available img2)))
  (at 1214 (image_available img3))
  (at 1222 (not (image_available img3)))
  (at 1226 (image_available img4))
  (at 1234 (not (image_available img4)))
  (at 1237 (image_available img5))
  (at 1245 (not (image_available img5)))
  (at 1367 (image_available img6))
  (at 1375 (not (image_available img6)))
  (at 1204 (image_available img7))
  (at 1212 (not (image_available img7)))
  (at 1084 (image_available img8))
  (at 1092 (not (image_available img8)))
  (at 1312 (image_available img9))
  (at 1320 (not (image_available img9)))
  (at 1102 (image_available img10))
  (at 1110 (not (image_available img10)))
  (at 1238 (image_available img11))
  (at 1246 (not (image_available img11)))
  (at 1227 (image_available img12))
  (at 1235 (not (image_available img12)))
  (at 1108 (image_available img13))
  (at 1116 (not (image_available img13)))
  (at 1145 (image_available img14))
  (at 1153 (not (image_available img14)))
  (at 1318 (image_available img15))
  (at 1326 (not (image_available img15)))
  (at 1703 (image_available img1))
  (at 1711 (not (image_available img1)))
  (at 1479 (image_available img2))
  (at 1487 (not (image_available img2)))
  (at 1574 (image_available img3))
  (at 1582 (not (image_available img3)))
  (at 1586 (image_available img4))
  (at 1594 (not (image_available img4)))
  (at 1597 (image_available img5))
  (at 1605 (not (image_available img5)))
  (at 1727 (image_available img6))
  (at 1735 (not (image_available img6)))
  (at 1564 (image_available img7))
  (at 1572 (not (image_available img7)))
  (at 1444 (image_available img8))
  (at 1452 (not (image_available img8)))
  (at 1672 (image_available img9))
  (at 1680 (not (image_available img9)))
  (at 1462 (image_available img10))
  (at 1470 (not (image_available img10)))
  (at 1598 (image_available img11))
  (at 1606 (not (image_available img11)))
  (at 1587 (image_available img12))
  (at 1595 (not (image_available img12)))
  (at 1468 (image_available img13))
  (at 1476 (not (image_available img13)))
  (at 1505 (image_available img14))
  (at 1513 (not (image_available img14)))
  (at 1678 (image_available img15))
  (at 1686 (not (image_available img15)))
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
  (<= (image_score img2) 1)

  (> (image_score img3) 0)
  (<= (image_score img3) 19)

(>= (total_score) 4)
))
(:metric maximize (+
  (image_score img2)
    (image_score img3)
  )
)
)