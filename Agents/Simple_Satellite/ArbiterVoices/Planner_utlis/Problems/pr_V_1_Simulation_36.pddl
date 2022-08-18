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



  (at 159 (image_available img1))
  (at 167 (not (image_available img1)))
  (at 285 (image_available img2))
  (at 293 (not (image_available img2)))
  (at 171 (image_available img3))
  (at 179 (not (image_available img3)))
  (at 350 (image_available img4))
  (at 358 (not (image_available img4)))
  (at 103 (image_available img5))
  (at 111 (not (image_available img5)))
  (at 170 (image_available img6))
  (at 178 (not (image_available img6)))
  (at 343 (image_available img7))
  (at 351 (not (image_available img7)))
  (at 341 (image_available img8))
  (at 349 (not (image_available img8)))
  (at 296 (image_available img9))
  (at 304 (not (image_available img9)))
  (at 147 (image_available img10))
  (at 155 (not (image_available img10)))
  (at 281 (image_available img11))
  (at 289 (not (image_available img11)))
  (at 65 (image_available img12))
  (at 73 (not (image_available img12)))
  (at 196 (image_available img13))
  (at 204 (not (image_available img13)))
  (at 272 (image_available img14))
  (at 280 (not (image_available img14)))
  (at 133 (image_available img15))
  (at 141 (not (image_available img15)))
  (at 519 (image_available img1))
  (at 527 (not (image_available img1)))
  (at 645 (image_available img2))
  (at 653 (not (image_available img2)))
  (at 531 (image_available img3))
  (at 539 (not (image_available img3)))
  (at 710 (image_available img4))
  (at 718 (not (image_available img4)))
  (at 463 (image_available img5))
  (at 471 (not (image_available img5)))
  (at 530 (image_available img6))
  (at 538 (not (image_available img6)))
  (at 703 (image_available img7))
  (at 711 (not (image_available img7)))
  (at 701 (image_available img8))
  (at 709 (not (image_available img8)))
  (at 656 (image_available img9))
  (at 664 (not (image_available img9)))
  (at 507 (image_available img10))
  (at 515 (not (image_available img10)))
  (at 641 (image_available img11))
  (at 649 (not (image_available img11)))
  (at 425 (image_available img12))
  (at 433 (not (image_available img12)))
  (at 556 (image_available img13))
  (at 564 (not (image_available img13)))
  (at 632 (image_available img14))
  (at 640 (not (image_available img14)))
  (at 493 (image_available img15))
  (at 501 (not (image_available img15)))
  (at 879 (image_available img1))
  (at 887 (not (image_available img1)))
  (at 1005 (image_available img2))
  (at 1013 (not (image_available img2)))
  (at 891 (image_available img3))
  (at 899 (not (image_available img3)))
  (at 1070 (image_available img4))
  (at 1078 (not (image_available img4)))
  (at 823 (image_available img5))
  (at 831 (not (image_available img5)))
  (at 890 (image_available img6))
  (at 898 (not (image_available img6)))
  (at 1063 (image_available img7))
  (at 1071 (not (image_available img7)))
  (at 1061 (image_available img8))
  (at 1069 (not (image_available img8)))
  (at 1016 (image_available img9))
  (at 1024 (not (image_available img9)))
  (at 867 (image_available img10))
  (at 875 (not (image_available img10)))
  (at 1001 (image_available img11))
  (at 1009 (not (image_available img11)))
  (at 785 (image_available img12))
  (at 793 (not (image_available img12)))
  (at 916 (image_available img13))
  (at 924 (not (image_available img13)))
  (at 992 (image_available img14))
  (at 1000 (not (image_available img14)))
  (at 853 (image_available img15))
  (at 861 (not (image_available img15)))
  (at 1239 (image_available img1))
  (at 1247 (not (image_available img1)))
  (at 1365 (image_available img2))
  (at 1373 (not (image_available img2)))
  (at 1251 (image_available img3))
  (at 1259 (not (image_available img3)))
  (at 1430 (image_available img4))
  (at 1438 (not (image_available img4)))
  (at 1183 (image_available img5))
  (at 1191 (not (image_available img5)))
  (at 1250 (image_available img6))
  (at 1258 (not (image_available img6)))
  (at 1423 (image_available img7))
  (at 1431 (not (image_available img7)))
  (at 1421 (image_available img8))
  (at 1429 (not (image_available img8)))
  (at 1376 (image_available img9))
  (at 1384 (not (image_available img9)))
  (at 1227 (image_available img10))
  (at 1235 (not (image_available img10)))
  (at 1361 (image_available img11))
  (at 1369 (not (image_available img11)))
  (at 1145 (image_available img12))
  (at 1153 (not (image_available img12)))
  (at 1276 (image_available img13))
  (at 1284 (not (image_available img13)))
  (at 1352 (image_available img14))
  (at 1360 (not (image_available img14)))
  (at 1213 (image_available img15))
  (at 1221 (not (image_available img15)))
  (at 1599 (image_available img1))
  (at 1607 (not (image_available img1)))
  (at 1725 (image_available img2))
  (at 1733 (not (image_available img2)))
  (at 1611 (image_available img3))
  (at 1619 (not (image_available img3)))
  (at 1790 (image_available img4))
  (at 1798 (not (image_available img4)))
  (at 1543 (image_available img5))
  (at 1551 (not (image_available img5)))
  (at 1610 (image_available img6))
  (at 1618 (not (image_available img6)))
  (at 1783 (image_available img7))
  (at 1791 (not (image_available img7)))
  (at 1781 (image_available img8))
  (at 1789 (not (image_available img8)))
  (at 1736 (image_available img9))
  (at 1744 (not (image_available img9)))
  (at 1587 (image_available img10))
  (at 1595 (not (image_available img10)))
  (at 1721 (image_available img11))
  (at 1729 (not (image_available img11)))
  (at 1505 (image_available img12))
  (at 1513 (not (image_available img12)))
  (at 1636 (image_available img13))
  (at 1644 (not (image_available img13)))
  (at 1712 (image_available img14))
  (at 1720 (not (image_available img14)))
  (at 1573 (image_available img15))
  (at 1581 (not (image_available img15)))
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
  (> (image_score img10) 0)
  (<= (image_score img10) 1)

  (> (image_score img11) 0)
  (<= (image_score img11) 16)

(>= (total_score) 4)
))
(:metric maximize (+
  (image_score img10)
    (image_score img11)
  )
)
)
