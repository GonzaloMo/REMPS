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



  (at 183 (image_available img1))
  (at 191 (not (image_available img1)))
  (at 202 (image_available img2))
  (at 210 (not (image_available img2)))
  (at 150 (image_available img3))
  (at 158 (not (image_available img3)))
  (at 93 (image_available img4))
  (at 101 (not (image_available img4)))
  (at 17 (image_available img5))
  (at 25 (not (image_available img5)))
  (at 85 (image_available img6))
  (at 93 (not (image_available img6)))
  (at 47 (image_available img7))
  (at 55 (not (image_available img7)))
  (at 75 (image_available img8))
  (at 83 (not (image_available img8)))
  (at 66 (image_available img9))
  (at 74 (not (image_available img9)))
  (at 194 (image_available img10))
  (at 202 (not (image_available img10)))
  (at 350 (image_available img11))
  (at 358 (not (image_available img11)))
  (at 141 (image_available img12))
  (at 149 (not (image_available img12)))
  (at 180 (image_available img13))
  (at 188 (not (image_available img13)))
  (at 128 (image_available img14))
  (at 136 (not (image_available img14)))
  (at 347 (image_available img15))
  (at 355 (not (image_available img15)))
  (at 333 (image_available img16))
  (at 341 (not (image_available img16)))
  (at 22 (image_available img17))
  (at 30 (not (image_available img17)))
  (at 200 (image_available img18))
  (at 208 (not (image_available img18)))
  (at 301 (image_available img19))
  (at 309 (not (image_available img19)))
  (at 146 (image_available img20))
  (at 154 (not (image_available img20)))
  (at 185 (image_available img21))
  (at 193 (not (image_available img21)))
  (at 294 (image_available img22))
  (at 302 (not (image_available img22)))
  (at 211 (image_available img23))
  (at 219 (not (image_available img23)))
  (at 119 (image_available img24))
  (at 127 (not (image_available img24)))
  (at 333 (image_available img25))
  (at 341 (not (image_available img25)))
  (at 543 (image_available img1))
  (at 551 (not (image_available img1)))
  (at 562 (image_available img2))
  (at 570 (not (image_available img2)))
  (at 510 (image_available img3))
  (at 518 (not (image_available img3)))
  (at 453 (image_available img4))
  (at 461 (not (image_available img4)))
  (at 377 (image_available img5))
  (at 385 (not (image_available img5)))
  (at 445 (image_available img6))
  (at 453 (not (image_available img6)))
  (at 407 (image_available img7))
  (at 415 (not (image_available img7)))
  (at 435 (image_available img8))
  (at 443 (not (image_available img8)))
  (at 426 (image_available img9))
  (at 434 (not (image_available img9)))
  (at 554 (image_available img10))
  (at 562 (not (image_available img10)))
  (at 710 (image_available img11))
  (at 718 (not (image_available img11)))
  (at 501 (image_available img12))
  (at 509 (not (image_available img12)))
  (at 540 (image_available img13))
  (at 548 (not (image_available img13)))
  (at 488 (image_available img14))
  (at 496 (not (image_available img14)))
  (at 707 (image_available img15))
  (at 715 (not (image_available img15)))
  (at 693 (image_available img16))
  (at 701 (not (image_available img16)))
  (at 382 (image_available img17))
  (at 390 (not (image_available img17)))
  (at 560 (image_available img18))
  (at 568 (not (image_available img18)))
  (at 661 (image_available img19))
  (at 669 (not (image_available img19)))
  (at 506 (image_available img20))
  (at 514 (not (image_available img20)))
  (at 545 (image_available img21))
  (at 553 (not (image_available img21)))
  (at 654 (image_available img22))
  (at 662 (not (image_available img22)))
  (at 571 (image_available img23))
  (at 579 (not (image_available img23)))
  (at 479 (image_available img24))
  (at 487 (not (image_available img24)))
  (at 693 (image_available img25))
  (at 701 (not (image_available img25)))
  (at 903 (image_available img1))
  (at 911 (not (image_available img1)))
  (at 922 (image_available img2))
  (at 930 (not (image_available img2)))
  (at 870 (image_available img3))
  (at 878 (not (image_available img3)))
  (at 813 (image_available img4))
  (at 821 (not (image_available img4)))
  (at 737 (image_available img5))
  (at 745 (not (image_available img5)))
  (at 805 (image_available img6))
  (at 813 (not (image_available img6)))
  (at 767 (image_available img7))
  (at 775 (not (image_available img7)))
  (at 795 (image_available img8))
  (at 803 (not (image_available img8)))
  (at 786 (image_available img9))
  (at 794 (not (image_available img9)))
  (at 914 (image_available img10))
  (at 922 (not (image_available img10)))
  (at 1070 (image_available img11))
  (at 1078 (not (image_available img11)))
  (at 861 (image_available img12))
  (at 869 (not (image_available img12)))
  (at 900 (image_available img13))
  (at 908 (not (image_available img13)))
  (at 848 (image_available img14))
  (at 856 (not (image_available img14)))
  (at 1067 (image_available img15))
  (at 1075 (not (image_available img15)))
  (at 1053 (image_available img16))
  (at 1061 (not (image_available img16)))
  (at 742 (image_available img17))
  (at 750 (not (image_available img17)))
  (at 920 (image_available img18))
  (at 928 (not (image_available img18)))
  (at 1021 (image_available img19))
  (at 1029 (not (image_available img19)))
  (at 866 (image_available img20))
  (at 874 (not (image_available img20)))
  (at 905 (image_available img21))
  (at 913 (not (image_available img21)))
  (at 1014 (image_available img22))
  (at 1022 (not (image_available img22)))
  (at 931 (image_available img23))
  (at 939 (not (image_available img23)))
  (at 839 (image_available img24))
  (at 847 (not (image_available img24)))
  (at 1053 (image_available img25))
  (at 1061 (not (image_available img25)))
  (at 1263 (image_available img1))
  (at 1271 (not (image_available img1)))
  (at 1282 (image_available img2))
  (at 1290 (not (image_available img2)))
  (at 1230 (image_available img3))
  (at 1238 (not (image_available img3)))
  (at 1173 (image_available img4))
  (at 1181 (not (image_available img4)))
  (at 1097 (image_available img5))
  (at 1105 (not (image_available img5)))
  (at 1165 (image_available img6))
  (at 1173 (not (image_available img6)))
  (at 1127 (image_available img7))
  (at 1135 (not (image_available img7)))
  (at 1155 (image_available img8))
  (at 1163 (not (image_available img8)))
  (at 1146 (image_available img9))
  (at 1154 (not (image_available img9)))
  (at 1274 (image_available img10))
  (at 1282 (not (image_available img10)))
  (at 1430 (image_available img11))
  (at 1438 (not (image_available img11)))
  (at 1221 (image_available img12))
  (at 1229 (not (image_available img12)))
  (at 1260 (image_available img13))
  (at 1268 (not (image_available img13)))
  (at 1208 (image_available img14))
  (at 1216 (not (image_available img14)))
  (at 1427 (image_available img15))
  (at 1435 (not (image_available img15)))
  (at 1413 (image_available img16))
  (at 1421 (not (image_available img16)))
  (at 1102 (image_available img17))
  (at 1110 (not (image_available img17)))
  (at 1280 (image_available img18))
  (at 1288 (not (image_available img18)))
  (at 1381 (image_available img19))
  (at 1389 (not (image_available img19)))
  (at 1226 (image_available img20))
  (at 1234 (not (image_available img20)))
  (at 1265 (image_available img21))
  (at 1273 (not (image_available img21)))
  (at 1374 (image_available img22))
  (at 1382 (not (image_available img22)))
  (at 1291 (image_available img23))
  (at 1299 (not (image_available img23)))
  (at 1199 (image_available img24))
  (at 1207 (not (image_available img24)))
  (at 1413 (image_available img25))
  (at 1421 (not (image_available img25)))
  (at 1623 (image_available img1))
  (at 1631 (not (image_available img1)))
  (at 1642 (image_available img2))
  (at 1650 (not (image_available img2)))
  (at 1590 (image_available img3))
  (at 1598 (not (image_available img3)))
  (at 1533 (image_available img4))
  (at 1541 (not (image_available img4)))
  (at 1457 (image_available img5))
  (at 1465 (not (image_available img5)))
  (at 1525 (image_available img6))
  (at 1533 (not (image_available img6)))
  (at 1487 (image_available img7))
  (at 1495 (not (image_available img7)))
  (at 1515 (image_available img8))
  (at 1523 (not (image_available img8)))
  (at 1506 (image_available img9))
  (at 1514 (not (image_available img9)))
  (at 1634 (image_available img10))
  (at 1642 (not (image_available img10)))
  (at 1790 (image_available img11))
  (at 1798 (not (image_available img11)))
  (at 1581 (image_available img12))
  (at 1589 (not (image_available img12)))
  (at 1620 (image_available img13))
  (at 1628 (not (image_available img13)))
  (at 1568 (image_available img14))
  (at 1576 (not (image_available img14)))
  (at 1787 (image_available img15))
  (at 1795 (not (image_available img15)))
  (at 1773 (image_available img16))
  (at 1781 (not (image_available img16)))
  (at 1462 (image_available img17))
  (at 1470 (not (image_available img17)))
  (at 1640 (image_available img18))
  (at 1648 (not (image_available img18)))
  (at 1741 (image_available img19))
  (at 1749 (not (image_available img19)))
  (at 1586 (image_available img20))
  (at 1594 (not (image_available img20)))
  (at 1625 (image_available img21))
  (at 1633 (not (image_available img21)))
  (at 1734 (image_available img22))
  (at 1742 (not (image_available img22)))
  (at 1651 (image_available img23))
  (at 1659 (not (image_available img23)))
  (at 1559 (image_available img24))
  (at 1567 (not (image_available img24)))
  (at 1773 (image_available img25))
  (at 1781 (not (image_available img25)))
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
  (>= (image_score img1) 0)
  (<= (image_score img1) 13)

  (>= (image_score img3) 0)
  (<= (image_score img3) 10)

  (>= (image_score img7) 0)
  (<= (image_score img7) 14)

  (>= (image_score img8) 0)
  (<= (image_score img8) 21)

  (>= (image_score img9) 0)
  (<= (image_score img9) 16)

  (>= (image_score img12) 0)
  (<= (image_score img12) 5)

  (>= (image_score img14) 0)
  (<= (image_score img14) 15)

  (>= (image_score img16) 0)
  (<= (image_score img16) 15)

  (>= (image_score img21) 0)
  (<= (image_score img21) 9)

  (>= (image_score img24) 0)
  (<= (image_score img24) 17)

(>= (total_score) 27)
))
(:metric maximize (+
  (image_score img1)
    (+ (image_score img3)
      (+ (image_score img7)
        (+ (image_score img8)
          (+ (image_score img9)
            (+ (image_score img12)
              (+ (image_score img14)
                (+ (image_score img16)
                  (+ (image_score img21)
                    (image_score img24)
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