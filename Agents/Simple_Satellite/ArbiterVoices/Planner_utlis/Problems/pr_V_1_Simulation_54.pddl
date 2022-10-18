(define(problem satprob)
(:domain SimpleSatellite)
(:objects
  mem0 mem1 mem2 mem3 mem4 mem5 mem6 mem7 mem8 mem9 - memory
 img1 img2 img3 img4 img5 img6 img7 img8 img9 img10 img11 img12 img13 img14 img15 img16 img17 img18 img19 img20 - image
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
  (= (image_score img16) 0)
  (= (image_score img17) 0)
  (= (image_score img18) 0)
  (= (image_score img19) 0)
  (= (image_score img20) 0)
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



  (at 46 (image_available img1))
  (at 54 (not (image_available img1)))
  (at 227 (image_available img2))
  (at 235 (not (image_available img2)))
  (at 126 (image_available img3))
  (at 134 (not (image_available img3)))
  (at 179 (image_available img4))
  (at 187 (not (image_available img4)))
  (at 16 (image_available img5))
  (at 24 (not (image_available img5)))
  (at 146 (image_available img6))
  (at 154 (not (image_available img6)))
  (at 78 (image_available img7))
  (at 86 (not (image_available img7)))
  (at 269 (image_available img8))
  (at 277 (not (image_available img8)))
  (at 228 (image_available img9))
  (at 236 (not (image_available img9)))
  (at 222 (image_available img10))
  (at 230 (not (image_available img10)))
  (at 106 (image_available img11))
  (at 114 (not (image_available img11)))
  (at 129 (image_available img12))
  (at 137 (not (image_available img12)))
  (at 66 (image_available img13))
  (at 74 (not (image_available img13)))
  (at 173 (image_available img14))
  (at 181 (not (image_available img14)))
  (at 154 (image_available img15))
  (at 162 (not (image_available img15)))
  (at 40 (image_available img16))
  (at 48 (not (image_available img16)))
  (at 343 (image_available img17))
  (at 351 (not (image_available img17)))
  (at 254 (image_available img18))
  (at 262 (not (image_available img18)))
  (at 111 (image_available img19))
  (at 119 (not (image_available img19)))
  (at 106 (image_available img20))
  (at 114 (not (image_available img20)))
  (at 406 (image_available img1))
  (at 414 (not (image_available img1)))
  (at 587 (image_available img2))
  (at 595 (not (image_available img2)))
  (at 486 (image_available img3))
  (at 494 (not (image_available img3)))
  (at 539 (image_available img4))
  (at 547 (not (image_available img4)))
  (at 376 (image_available img5))
  (at 384 (not (image_available img5)))
  (at 506 (image_available img6))
  (at 514 (not (image_available img6)))
  (at 438 (image_available img7))
  (at 446 (not (image_available img7)))
  (at 629 (image_available img8))
  (at 637 (not (image_available img8)))
  (at 588 (image_available img9))
  (at 596 (not (image_available img9)))
  (at 582 (image_available img10))
  (at 590 (not (image_available img10)))
  (at 466 (image_available img11))
  (at 474 (not (image_available img11)))
  (at 489 (image_available img12))
  (at 497 (not (image_available img12)))
  (at 426 (image_available img13))
  (at 434 (not (image_available img13)))
  (at 533 (image_available img14))
  (at 541 (not (image_available img14)))
  (at 514 (image_available img15))
  (at 522 (not (image_available img15)))
  (at 400 (image_available img16))
  (at 408 (not (image_available img16)))
  (at 703 (image_available img17))
  (at 711 (not (image_available img17)))
  (at 614 (image_available img18))
  (at 622 (not (image_available img18)))
  (at 471 (image_available img19))
  (at 479 (not (image_available img19)))
  (at 466 (image_available img20))
  (at 474 (not (image_available img20)))
  (at 766 (image_available img1))
  (at 774 (not (image_available img1)))
  (at 947 (image_available img2))
  (at 955 (not (image_available img2)))
  (at 846 (image_available img3))
  (at 854 (not (image_available img3)))
  (at 899 (image_available img4))
  (at 907 (not (image_available img4)))
  (at 736 (image_available img5))
  (at 744 (not (image_available img5)))
  (at 866 (image_available img6))
  (at 874 (not (image_available img6)))
  (at 798 (image_available img7))
  (at 806 (not (image_available img7)))
  (at 989 (image_available img8))
  (at 997 (not (image_available img8)))
  (at 948 (image_available img9))
  (at 956 (not (image_available img9)))
  (at 942 (image_available img10))
  (at 950 (not (image_available img10)))
  (at 826 (image_available img11))
  (at 834 (not (image_available img11)))
  (at 849 (image_available img12))
  (at 857 (not (image_available img12)))
  (at 786 (image_available img13))
  (at 794 (not (image_available img13)))
  (at 893 (image_available img14))
  (at 901 (not (image_available img14)))
  (at 874 (image_available img15))
  (at 882 (not (image_available img15)))
  (at 760 (image_available img16))
  (at 768 (not (image_available img16)))
  (at 1063 (image_available img17))
  (at 1071 (not (image_available img17)))
  (at 974 (image_available img18))
  (at 982 (not (image_available img18)))
  (at 831 (image_available img19))
  (at 839 (not (image_available img19)))
  (at 826 (image_available img20))
  (at 834 (not (image_available img20)))
  (at 1126 (image_available img1))
  (at 1134 (not (image_available img1)))
  (at 1307 (image_available img2))
  (at 1315 (not (image_available img2)))
  (at 1206 (image_available img3))
  (at 1214 (not (image_available img3)))
  (at 1259 (image_available img4))
  (at 1267 (not (image_available img4)))
  (at 1096 (image_available img5))
  (at 1104 (not (image_available img5)))
  (at 1226 (image_available img6))
  (at 1234 (not (image_available img6)))
  (at 1158 (image_available img7))
  (at 1166 (not (image_available img7)))
  (at 1349 (image_available img8))
  (at 1357 (not (image_available img8)))
  (at 1308 (image_available img9))
  (at 1316 (not (image_available img9)))
  (at 1302 (image_available img10))
  (at 1310 (not (image_available img10)))
  (at 1186 (image_available img11))
  (at 1194 (not (image_available img11)))
  (at 1209 (image_available img12))
  (at 1217 (not (image_available img12)))
  (at 1146 (image_available img13))
  (at 1154 (not (image_available img13)))
  (at 1253 (image_available img14))
  (at 1261 (not (image_available img14)))
  (at 1234 (image_available img15))
  (at 1242 (not (image_available img15)))
  (at 1120 (image_available img16))
  (at 1128 (not (image_available img16)))
  (at 1423 (image_available img17))
  (at 1431 (not (image_available img17)))
  (at 1334 (image_available img18))
  (at 1342 (not (image_available img18)))
  (at 1191 (image_available img19))
  (at 1199 (not (image_available img19)))
  (at 1186 (image_available img20))
  (at 1194 (not (image_available img20)))
  (at 1486 (image_available img1))
  (at 1494 (not (image_available img1)))
  (at 1667 (image_available img2))
  (at 1675 (not (image_available img2)))
  (at 1566 (image_available img3))
  (at 1574 (not (image_available img3)))
  (at 1619 (image_available img4))
  (at 1627 (not (image_available img4)))
  (at 1456 (image_available img5))
  (at 1464 (not (image_available img5)))
  (at 1586 (image_available img6))
  (at 1594 (not (image_available img6)))
  (at 1518 (image_available img7))
  (at 1526 (not (image_available img7)))
  (at 1709 (image_available img8))
  (at 1717 (not (image_available img8)))
  (at 1668 (image_available img9))
  (at 1676 (not (image_available img9)))
  (at 1662 (image_available img10))
  (at 1670 (not (image_available img10)))
  (at 1546 (image_available img11))
  (at 1554 (not (image_available img11)))
  (at 1569 (image_available img12))
  (at 1577 (not (image_available img12)))
  (at 1506 (image_available img13))
  (at 1514 (not (image_available img13)))
  (at 1613 (image_available img14))
  (at 1621 (not (image_available img14)))
  (at 1594 (image_available img15))
  (at 1602 (not (image_available img15)))
  (at 1480 (image_available img16))
  (at 1488 (not (image_available img16)))
  (at 1783 (image_available img17))
  (at 1791 (not (image_available img17)))
  (at 1694 (image_available img18))
  (at 1702 (not (image_available img18)))
  (at 1551 (image_available img19))
  (at 1559 (not (image_available img19)))
  (at 1546 (image_available img20))
  (at 1554 (not (image_available img20)))
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
  (> (image_score img6) 0)
  (<= (image_score img6) 6.0)

  (> (image_score img11) 0)
  (<= (image_score img11) 1.0)

  (> (image_score img12) 0)
  (<= (image_score img12) 10.0)

  (> (image_score img16) 0)
  (<= (image_score img16) 8.0)

  (> (image_score img19) 0)
  (<= (image_score img19) 5.0)

(>= (total_score) 6)
))
(:metric maximize (+
  (image_score img6)
    (+ (image_score img11)
      (+ (image_score img12)
        (+ (image_score img16)
          (image_score img19)
        )
      )
    )
  )
)
)
