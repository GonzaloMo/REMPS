(define(problem satprob)
(:domain SimpleSatellite)
(:objects
  mem0 mem1 mem2 mem3 mem4 mem5 mem6 mem7 mem8 mem9 - memory
 img1 img2 img3 img4 img5 img6 img7 img8 img9 img10 img11 img12 img13 img14 img15 img16 img17 img18 img19 img20 img21 img22 img23 img24 img25 - image
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
  (= (image_score img21) 0)
  (= (image_score img22) 0)
  (= (image_score img23) 0)
  (= (image_score img24) 0)
  (= (image_score img25) 0)
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



  (at 186 (image_available img1))
  (at 194 (not (image_available img1)))
  (at 334 (image_available img2))
  (at 342 (not (image_available img2)))
  (at 193 (image_available img3))
  (at 201 (not (image_available img3)))
  (at 252 (image_available img4))
  (at 260 (not (image_available img4)))
  (at 115 (image_available img5))
  (at 123 (not (image_available img5)))
  (at 58 (image_available img6))
  (at 66 (not (image_available img6)))
  (at 274 (image_available img7))
  (at 282 (not (image_available img7)))
  (at 203 (image_available img8))
  (at 211 (not (image_available img8)))
  (at 22 (image_available img9))
  (at 30 (not (image_available img9)))
  (at 176 (image_available img10))
  (at 184 (not (image_available img10)))
  (at 214 (image_available img11))
  (at 222 (not (image_available img11)))
  (at 35 (image_available img12))
  (at 43 (not (image_available img12)))
  (at 126 (image_available img13))
  (at 134 (not (image_available img13)))
  (at 76 (image_available img14))
  (at 84 (not (image_available img14)))
  (at 136 (image_available img15))
  (at 144 (not (image_available img15)))
  (at 119 (image_available img16))
  (at 127 (not (image_available img16)))
  (at 59 (image_available img17))
  (at 67 (not (image_available img17)))
  (at 149 (image_available img18))
  (at 157 (not (image_available img18)))
  (at 321 (image_available img19))
  (at 329 (not (image_available img19)))
  (at 242 (image_available img20))
  (at 250 (not (image_available img20)))
  (at 271 (image_available img21))
  (at 279 (not (image_available img21)))
  (at 290 (image_available img22))
  (at 298 (not (image_available img22)))
  (at 254 (image_available img23))
  (at 262 (not (image_available img23)))
  (at 326 (image_available img24))
  (at 334 (not (image_available img24)))
  (at 42 (image_available img25))
  (at 50 (not (image_available img25)))
  (at 546 (image_available img1))
  (at 554 (not (image_available img1)))
  (at 694 (image_available img2))
  (at 702 (not (image_available img2)))
  (at 553 (image_available img3))
  (at 561 (not (image_available img3)))
  (at 612 (image_available img4))
  (at 620 (not (image_available img4)))
  (at 475 (image_available img5))
  (at 483 (not (image_available img5)))
  (at 418 (image_available img6))
  (at 426 (not (image_available img6)))
  (at 634 (image_available img7))
  (at 642 (not (image_available img7)))
  (at 563 (image_available img8))
  (at 571 (not (image_available img8)))
  (at 382 (image_available img9))
  (at 390 (not (image_available img9)))
  (at 536 (image_available img10))
  (at 544 (not (image_available img10)))
  (at 574 (image_available img11))
  (at 582 (not (image_available img11)))
  (at 395 (image_available img12))
  (at 403 (not (image_available img12)))
  (at 486 (image_available img13))
  (at 494 (not (image_available img13)))
  (at 436 (image_available img14))
  (at 444 (not (image_available img14)))
  (at 496 (image_available img15))
  (at 504 (not (image_available img15)))
  (at 479 (image_available img16))
  (at 487 (not (image_available img16)))
  (at 419 (image_available img17))
  (at 427 (not (image_available img17)))
  (at 509 (image_available img18))
  (at 517 (not (image_available img18)))
  (at 681 (image_available img19))
  (at 689 (not (image_available img19)))
  (at 602 (image_available img20))
  (at 610 (not (image_available img20)))
  (at 631 (image_available img21))
  (at 639 (not (image_available img21)))
  (at 650 (image_available img22))
  (at 658 (not (image_available img22)))
  (at 614 (image_available img23))
  (at 622 (not (image_available img23)))
  (at 686 (image_available img24))
  (at 694 (not (image_available img24)))
  (at 402 (image_available img25))
  (at 410 (not (image_available img25)))
  (at 906 (image_available img1))
  (at 914 (not (image_available img1)))
  (at 1054 (image_available img2))
  (at 1062 (not (image_available img2)))
  (at 913 (image_available img3))
  (at 921 (not (image_available img3)))
  (at 972 (image_available img4))
  (at 980 (not (image_available img4)))
  (at 835 (image_available img5))
  (at 843 (not (image_available img5)))
  (at 778 (image_available img6))
  (at 786 (not (image_available img6)))
  (at 994 (image_available img7))
  (at 1002 (not (image_available img7)))
  (at 923 (image_available img8))
  (at 931 (not (image_available img8)))
  (at 742 (image_available img9))
  (at 750 (not (image_available img9)))
  (at 896 (image_available img10))
  (at 904 (not (image_available img10)))
  (at 934 (image_available img11))
  (at 942 (not (image_available img11)))
  (at 755 (image_available img12))
  (at 763 (not (image_available img12)))
  (at 846 (image_available img13))
  (at 854 (not (image_available img13)))
  (at 796 (image_available img14))
  (at 804 (not (image_available img14)))
  (at 856 (image_available img15))
  (at 864 (not (image_available img15)))
  (at 839 (image_available img16))
  (at 847 (not (image_available img16)))
  (at 779 (image_available img17))
  (at 787 (not (image_available img17)))
  (at 869 (image_available img18))
  (at 877 (not (image_available img18)))
  (at 1041 (image_available img19))
  (at 1049 (not (image_available img19)))
  (at 962 (image_available img20))
  (at 970 (not (image_available img20)))
  (at 991 (image_available img21))
  (at 999 (not (image_available img21)))
  (at 1010 (image_available img22))
  (at 1018 (not (image_available img22)))
  (at 974 (image_available img23))
  (at 982 (not (image_available img23)))
  (at 1046 (image_available img24))
  (at 1054 (not (image_available img24)))
  (at 762 (image_available img25))
  (at 770 (not (image_available img25)))
  (at 1266 (image_available img1))
  (at 1274 (not (image_available img1)))
  (at 1414 (image_available img2))
  (at 1422 (not (image_available img2)))
  (at 1273 (image_available img3))
  (at 1281 (not (image_available img3)))
  (at 1332 (image_available img4))
  (at 1340 (not (image_available img4)))
  (at 1195 (image_available img5))
  (at 1203 (not (image_available img5)))
  (at 1138 (image_available img6))
  (at 1146 (not (image_available img6)))
  (at 1354 (image_available img7))
  (at 1362 (not (image_available img7)))
  (at 1283 (image_available img8))
  (at 1291 (not (image_available img8)))
  (at 1102 (image_available img9))
  (at 1110 (not (image_available img9)))
  (at 1256 (image_available img10))
  (at 1264 (not (image_available img10)))
  (at 1294 (image_available img11))
  (at 1302 (not (image_available img11)))
  (at 1115 (image_available img12))
  (at 1123 (not (image_available img12)))
  (at 1206 (image_available img13))
  (at 1214 (not (image_available img13)))
  (at 1156 (image_available img14))
  (at 1164 (not (image_available img14)))
  (at 1216 (image_available img15))
  (at 1224 (not (image_available img15)))
  (at 1199 (image_available img16))
  (at 1207 (not (image_available img16)))
  (at 1139 (image_available img17))
  (at 1147 (not (image_available img17)))
  (at 1229 (image_available img18))
  (at 1237 (not (image_available img18)))
  (at 1401 (image_available img19))
  (at 1409 (not (image_available img19)))
  (at 1322 (image_available img20))
  (at 1330 (not (image_available img20)))
  (at 1351 (image_available img21))
  (at 1359 (not (image_available img21)))
  (at 1370 (image_available img22))
  (at 1378 (not (image_available img22)))
  (at 1334 (image_available img23))
  (at 1342 (not (image_available img23)))
  (at 1406 (image_available img24))
  (at 1414 (not (image_available img24)))
  (at 1122 (image_available img25))
  (at 1130 (not (image_available img25)))
  (at 1626 (image_available img1))
  (at 1634 (not (image_available img1)))
  (at 1774 (image_available img2))
  (at 1782 (not (image_available img2)))
  (at 1633 (image_available img3))
  (at 1641 (not (image_available img3)))
  (at 1692 (image_available img4))
  (at 1700 (not (image_available img4)))
  (at 1555 (image_available img5))
  (at 1563 (not (image_available img5)))
  (at 1498 (image_available img6))
  (at 1506 (not (image_available img6)))
  (at 1714 (image_available img7))
  (at 1722 (not (image_available img7)))
  (at 1643 (image_available img8))
  (at 1651 (not (image_available img8)))
  (at 1462 (image_available img9))
  (at 1470 (not (image_available img9)))
  (at 1616 (image_available img10))
  (at 1624 (not (image_available img10)))
  (at 1654 (image_available img11))
  (at 1662 (not (image_available img11)))
  (at 1475 (image_available img12))
  (at 1483 (not (image_available img12)))
  (at 1566 (image_available img13))
  (at 1574 (not (image_available img13)))
  (at 1516 (image_available img14))
  (at 1524 (not (image_available img14)))
  (at 1576 (image_available img15))
  (at 1584 (not (image_available img15)))
  (at 1559 (image_available img16))
  (at 1567 (not (image_available img16)))
  (at 1499 (image_available img17))
  (at 1507 (not (image_available img17)))
  (at 1589 (image_available img18))
  (at 1597 (not (image_available img18)))
  (at 1761 (image_available img19))
  (at 1769 (not (image_available img19)))
  (at 1682 (image_available img20))
  (at 1690 (not (image_available img20)))
  (at 1711 (image_available img21))
  (at 1719 (not (image_available img21)))
  (at 1730 (image_available img22))
  (at 1738 (not (image_available img22)))
  (at 1694 (image_available img23))
  (at 1702 (not (image_available img23)))
  (at 1766 (image_available img24))
  (at 1774 (not (image_available img24)))
  (at 1482 (image_available img25))
  (at 1490 (not (image_available img25)))
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

  (> (image_score img6) 0)
  (<= (image_score img6) 10)

  (> (image_score img7) 0)
  (<= (image_score img7) 9)

  (> (image_score img11) 0)
  (<= (image_score img11) 1)

  (> (image_score img13) 0)
  (<= (image_score img13) 9)

  (> (image_score img14) 0)
  (<= (image_score img14) 4)

  (> (image_score img15) 0)
  (<= (image_score img15) 6)

  (> (image_score img17) 0)
  (<= (image_score img17) 2)

  (> (image_score img22) 0)
  (<= (image_score img22) 7)

  (> (image_score img23) 0)
  (<= (image_score img23) 8)

  (> (image_score img25) 0)
  (<= (image_score img25) 8)

(>= (total_score) 13)
))
(:metric maximize (+
  (image_score img1)
    (+ (image_score img6)
      (+ (image_score img7)
        (+ (image_score img11)
          (+ (image_score img13)
            (+ (image_score img14)
              (+ (image_score img15)
                (+ (image_score img17)
                  (+ (image_score img22)
                    (+ (image_score img23)
                      (image_score img25)
                    )
                  )
                )
              )
            )
          )
        )
      )
    )
  )
)
)
