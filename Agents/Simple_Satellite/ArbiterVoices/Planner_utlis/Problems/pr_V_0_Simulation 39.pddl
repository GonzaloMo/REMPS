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



  (at 203 (image_available img1))
  (at 211 (not (image_available img1)))
  (at 149 (image_available img2))
  (at 157 (not (image_available img2)))
  (at 186 (image_available img3))
  (at 194 (not (image_available img3)))
  (at 101 (image_available img4))
  (at 109 (not (image_available img4)))
  (at 218 (image_available img5))
  (at 226 (not (image_available img5)))
  (at 151 (image_available img6))
  (at 159 (not (image_available img6)))
  (at 343 (image_available img7))
  (at 351 (not (image_available img7)))
  (at 325 (image_available img8))
  (at 333 (not (image_available img8)))
  (at 31 (image_available img9))
  (at 39 (not (image_available img9)))
  (at 59 (image_available img10))
  (at 67 (not (image_available img10)))
  (at 216 (image_available img11))
  (at 224 (not (image_available img11)))
  (at 52 (image_available img12))
  (at 60 (not (image_available img12)))
  (at 330 (image_available img13))
  (at 338 (not (image_available img13)))
  (at 329 (image_available img14))
  (at 337 (not (image_available img14)))
  (at 260 (image_available img15))
  (at 268 (not (image_available img15)))
  (at 563 (image_available img1))
  (at 571 (not (image_available img1)))
  (at 509 (image_available img2))
  (at 517 (not (image_available img2)))
  (at 546 (image_available img3))
  (at 554 (not (image_available img3)))
  (at 461 (image_available img4))
  (at 469 (not (image_available img4)))
  (at 578 (image_available img5))
  (at 586 (not (image_available img5)))
  (at 511 (image_available img6))
  (at 519 (not (image_available img6)))
  (at 703 (image_available img7))
  (at 711 (not (image_available img7)))
  (at 685 (image_available img8))
  (at 693 (not (image_available img8)))
  (at 391 (image_available img9))
  (at 399 (not (image_available img9)))
  (at 419 (image_available img10))
  (at 427 (not (image_available img10)))
  (at 576 (image_available img11))
  (at 584 (not (image_available img11)))
  (at 412 (image_available img12))
  (at 420 (not (image_available img12)))
  (at 690 (image_available img13))
  (at 698 (not (image_available img13)))
  (at 689 (image_available img14))
  (at 697 (not (image_available img14)))
  (at 620 (image_available img15))
  (at 628 (not (image_available img15)))
  (at 923 (image_available img1))
  (at 931 (not (image_available img1)))
  (at 869 (image_available img2))
  (at 877 (not (image_available img2)))
  (at 906 (image_available img3))
  (at 914 (not (image_available img3)))
  (at 821 (image_available img4))
  (at 829 (not (image_available img4)))
  (at 938 (image_available img5))
  (at 946 (not (image_available img5)))
  (at 871 (image_available img6))
  (at 879 (not (image_available img6)))
  (at 1063 (image_available img7))
  (at 1071 (not (image_available img7)))
  (at 1045 (image_available img8))
  (at 1053 (not (image_available img8)))
  (at 751 (image_available img9))
  (at 759 (not (image_available img9)))
  (at 779 (image_available img10))
  (at 787 (not (image_available img10)))
  (at 936 (image_available img11))
  (at 944 (not (image_available img11)))
  (at 772 (image_available img12))
  (at 780 (not (image_available img12)))
  (at 1050 (image_available img13))
  (at 1058 (not (image_available img13)))
  (at 1049 (image_available img14))
  (at 1057 (not (image_available img14)))
  (at 980 (image_available img15))
  (at 988 (not (image_available img15)))
  (at 1283 (image_available img1))
  (at 1291 (not (image_available img1)))
  (at 1229 (image_available img2))
  (at 1237 (not (image_available img2)))
  (at 1266 (image_available img3))
  (at 1274 (not (image_available img3)))
  (at 1181 (image_available img4))
  (at 1189 (not (image_available img4)))
  (at 1298 (image_available img5))
  (at 1306 (not (image_available img5)))
  (at 1231 (image_available img6))
  (at 1239 (not (image_available img6)))
  (at 1423 (image_available img7))
  (at 1431 (not (image_available img7)))
  (at 1405 (image_available img8))
  (at 1413 (not (image_available img8)))
  (at 1111 (image_available img9))
  (at 1119 (not (image_available img9)))
  (at 1139 (image_available img10))
  (at 1147 (not (image_available img10)))
  (at 1296 (image_available img11))
  (at 1304 (not (image_available img11)))
  (at 1132 (image_available img12))
  (at 1140 (not (image_available img12)))
  (at 1410 (image_available img13))
  (at 1418 (not (image_available img13)))
  (at 1409 (image_available img14))
  (at 1417 (not (image_available img14)))
  (at 1340 (image_available img15))
  (at 1348 (not (image_available img15)))
  (at 1643 (image_available img1))
  (at 1651 (not (image_available img1)))
  (at 1589 (image_available img2))
  (at 1597 (not (image_available img2)))
  (at 1626 (image_available img3))
  (at 1634 (not (image_available img3)))
  (at 1541 (image_available img4))
  (at 1549 (not (image_available img4)))
  (at 1658 (image_available img5))
  (at 1666 (not (image_available img5)))
  (at 1591 (image_available img6))
  (at 1599 (not (image_available img6)))
  (at 1783 (image_available img7))
  (at 1791 (not (image_available img7)))
  (at 1765 (image_available img8))
  (at 1773 (not (image_available img8)))
  (at 1471 (image_available img9))
  (at 1479 (not (image_available img9)))
  (at 1499 (image_available img10))
  (at 1507 (not (image_available img10)))
  (at 1656 (image_available img11))
  (at 1664 (not (image_available img11)))
  (at 1492 (image_available img12))
  (at 1500 (not (image_available img12)))
  (at 1770 (image_available img13))
  (at 1778 (not (image_available img13)))
  (at 1769 (image_available img14))
  (at 1777 (not (image_available img14)))
  (at 1700 (image_available img15))
  (at 1708 (not (image_available img15)))
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
  (<= (image_score img1) 12.0)

(>= (total_score) 3)
))
(:metric maximize 
  (image_score img1)
)
)
