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



  (at 343 (image_available img1))
  (at 351 (not (image_available img1)))
  (at 284 (image_available img2))
  (at 292 (not (image_available img2)))
  (at 212 (image_available img3))
  (at 220 (not (image_available img3)))
  (at 234 (image_available img4))
  (at 242 (not (image_available img4)))
  (at 6 (image_available img5))
  (at 14 (not (image_available img5)))
  (at 259 (image_available img6))
  (at 267 (not (image_available img6)))
  (at 18 (image_available img7))
  (at 26 (not (image_available img7)))
  (at 230 (image_available img8))
  (at 238 (not (image_available img8)))
  (at 139 (image_available img9))
  (at 147 (not (image_available img9)))
  (at 295 (image_available img10))
  (at 303 (not (image_available img10)))
  (at 83 (image_available img11))
  (at 91 (not (image_available img11)))
  (at 114 (image_available img12))
  (at 122 (not (image_available img12)))
  (at 61 (image_available img13))
  (at 69 (not (image_available img13)))
  (at 79 (image_available img14))
  (at 87 (not (image_available img14)))
  (at 301 (image_available img15))
  (at 309 (not (image_available img15)))
  (at 278 (image_available img16))
  (at 286 (not (image_available img16)))
  (at 342 (image_available img17))
  (at 350 (not (image_available img17)))
  (at 3 (image_available img18))
  (at 11 (not (image_available img18)))
  (at 22 (image_available img19))
  (at 30 (not (image_available img19)))
  (at 11 (image_available img20))
  (at 19 (not (image_available img20)))
  (at 164 (image_available img21))
  (at 172 (not (image_available img21)))
  (at 88 (image_available img22))
  (at 96 (not (image_available img22)))
  (at 133 (image_available img23))
  (at 141 (not (image_available img23)))
  (at 102 (image_available img24))
  (at 110 (not (image_available img24)))
  (at 286 (image_available img25))
  (at 294 (not (image_available img25)))
  (at 703 (image_available img1))
  (at 711 (not (image_available img1)))
  (at 644 (image_available img2))
  (at 652 (not (image_available img2)))
  (at 572 (image_available img3))
  (at 580 (not (image_available img3)))
  (at 594 (image_available img4))
  (at 602 (not (image_available img4)))
  (at 366 (image_available img5))
  (at 374 (not (image_available img5)))
  (at 619 (image_available img6))
  (at 627 (not (image_available img6)))
  (at 378 (image_available img7))
  (at 386 (not (image_available img7)))
  (at 590 (image_available img8))
  (at 598 (not (image_available img8)))
  (at 499 (image_available img9))
  (at 507 (not (image_available img9)))
  (at 655 (image_available img10))
  (at 663 (not (image_available img10)))
  (at 443 (image_available img11))
  (at 451 (not (image_available img11)))
  (at 474 (image_available img12))
  (at 482 (not (image_available img12)))
  (at 421 (image_available img13))
  (at 429 (not (image_available img13)))
  (at 439 (image_available img14))
  (at 447 (not (image_available img14)))
  (at 661 (image_available img15))
  (at 669 (not (image_available img15)))
  (at 638 (image_available img16))
  (at 646 (not (image_available img16)))
  (at 702 (image_available img17))
  (at 710 (not (image_available img17)))
  (at 363 (image_available img18))
  (at 371 (not (image_available img18)))
  (at 382 (image_available img19))
  (at 390 (not (image_available img19)))
  (at 371 (image_available img20))
  (at 379 (not (image_available img20)))
  (at 524 (image_available img21))
  (at 532 (not (image_available img21)))
  (at 448 (image_available img22))
  (at 456 (not (image_available img22)))
  (at 493 (image_available img23))
  (at 501 (not (image_available img23)))
  (at 462 (image_available img24))
  (at 470 (not (image_available img24)))
  (at 646 (image_available img25))
  (at 654 (not (image_available img25)))
  (at 1063 (image_available img1))
  (at 1071 (not (image_available img1)))
  (at 1004 (image_available img2))
  (at 1012 (not (image_available img2)))
  (at 932 (image_available img3))
  (at 940 (not (image_available img3)))
  (at 954 (image_available img4))
  (at 962 (not (image_available img4)))
  (at 726 (image_available img5))
  (at 734 (not (image_available img5)))
  (at 979 (image_available img6))
  (at 987 (not (image_available img6)))
  (at 738 (image_available img7))
  (at 746 (not (image_available img7)))
  (at 950 (image_available img8))
  (at 958 (not (image_available img8)))
  (at 859 (image_available img9))
  (at 867 (not (image_available img9)))
  (at 1015 (image_available img10))
  (at 1023 (not (image_available img10)))
  (at 803 (image_available img11))
  (at 811 (not (image_available img11)))
  (at 834 (image_available img12))
  (at 842 (not (image_available img12)))
  (at 781 (image_available img13))
  (at 789 (not (image_available img13)))
  (at 799 (image_available img14))
  (at 807 (not (image_available img14)))
  (at 1021 (image_available img15))
  (at 1029 (not (image_available img15)))
  (at 998 (image_available img16))
  (at 1006 (not (image_available img16)))
  (at 1062 (image_available img17))
  (at 1070 (not (image_available img17)))
  (at 723 (image_available img18))
  (at 731 (not (image_available img18)))
  (at 742 (image_available img19))
  (at 750 (not (image_available img19)))
  (at 731 (image_available img20))
  (at 739 (not (image_available img20)))
  (at 884 (image_available img21))
  (at 892 (not (image_available img21)))
  (at 808 (image_available img22))
  (at 816 (not (image_available img22)))
  (at 853 (image_available img23))
  (at 861 (not (image_available img23)))
  (at 822 (image_available img24))
  (at 830 (not (image_available img24)))
  (at 1006 (image_available img25))
  (at 1014 (not (image_available img25)))
  (at 1423 (image_available img1))
  (at 1431 (not (image_available img1)))
  (at 1364 (image_available img2))
  (at 1372 (not (image_available img2)))
  (at 1292 (image_available img3))
  (at 1300 (not (image_available img3)))
  (at 1314 (image_available img4))
  (at 1322 (not (image_available img4)))
  (at 1086 (image_available img5))
  (at 1094 (not (image_available img5)))
  (at 1339 (image_available img6))
  (at 1347 (not (image_available img6)))
  (at 1098 (image_available img7))
  (at 1106 (not (image_available img7)))
  (at 1310 (image_available img8))
  (at 1318 (not (image_available img8)))
  (at 1219 (image_available img9))
  (at 1227 (not (image_available img9)))
  (at 1375 (image_available img10))
  (at 1383 (not (image_available img10)))
  (at 1163 (image_available img11))
  (at 1171 (not (image_available img11)))
  (at 1194 (image_available img12))
  (at 1202 (not (image_available img12)))
  (at 1141 (image_available img13))
  (at 1149 (not (image_available img13)))
  (at 1159 (image_available img14))
  (at 1167 (not (image_available img14)))
  (at 1381 (image_available img15))
  (at 1389 (not (image_available img15)))
  (at 1358 (image_available img16))
  (at 1366 (not (image_available img16)))
  (at 1422 (image_available img17))
  (at 1430 (not (image_available img17)))
  (at 1083 (image_available img18))
  (at 1091 (not (image_available img18)))
  (at 1102 (image_available img19))
  (at 1110 (not (image_available img19)))
  (at 1091 (image_available img20))
  (at 1099 (not (image_available img20)))
  (at 1244 (image_available img21))
  (at 1252 (not (image_available img21)))
  (at 1168 (image_available img22))
  (at 1176 (not (image_available img22)))
  (at 1213 (image_available img23))
  (at 1221 (not (image_available img23)))
  (at 1182 (image_available img24))
  (at 1190 (not (image_available img24)))
  (at 1366 (image_available img25))
  (at 1374 (not (image_available img25)))
  (at 1783 (image_available img1))
  (at 1791 (not (image_available img1)))
  (at 1724 (image_available img2))
  (at 1732 (not (image_available img2)))
  (at 1652 (image_available img3))
  (at 1660 (not (image_available img3)))
  (at 1674 (image_available img4))
  (at 1682 (not (image_available img4)))
  (at 1446 (image_available img5))
  (at 1454 (not (image_available img5)))
  (at 1699 (image_available img6))
  (at 1707 (not (image_available img6)))
  (at 1458 (image_available img7))
  (at 1466 (not (image_available img7)))
  (at 1670 (image_available img8))
  (at 1678 (not (image_available img8)))
  (at 1579 (image_available img9))
  (at 1587 (not (image_available img9)))
  (at 1735 (image_available img10))
  (at 1743 (not (image_available img10)))
  (at 1523 (image_available img11))
  (at 1531 (not (image_available img11)))
  (at 1554 (image_available img12))
  (at 1562 (not (image_available img12)))
  (at 1501 (image_available img13))
  (at 1509 (not (image_available img13)))
  (at 1519 (image_available img14))
  (at 1527 (not (image_available img14)))
  (at 1741 (image_available img15))
  (at 1749 (not (image_available img15)))
  (at 1718 (image_available img16))
  (at 1726 (not (image_available img16)))
  (at 1782 (image_available img17))
  (at 1790 (not (image_available img17)))
  (at 1443 (image_available img18))
  (at 1451 (not (image_available img18)))
  (at 1462 (image_available img19))
  (at 1470 (not (image_available img19)))
  (at 1451 (image_available img20))
  (at 1459 (not (image_available img20)))
  (at 1604 (image_available img21))
  (at 1612 (not (image_available img21)))
  (at 1528 (image_available img22))
  (at 1536 (not (image_available img22)))
  (at 1573 (image_available img23))
  (at 1581 (not (image_available img23)))
  (at 1542 (image_available img24))
  (at 1550 (not (image_available img24)))
  (at 1726 (image_available img25))
  (at 1734 (not (image_available img25)))
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
  (<= (image_score img2) 2)

  (> (image_score img3) 0)
  (<= (image_score img3) 11)

  (> (image_score img7) 0)
  (<= (image_score img7) 8)

  (> (image_score img8) 0)
  (<= (image_score img8) 7)

  (> (image_score img9) 0)
  (<= (image_score img9) 3)

  (> (image_score img10) 0)
  (<= (image_score img10) 2)

  (> (image_score img15) 0)
  (<= (image_score img15) 6)

  (> (image_score img22) 0)
  (<= (image_score img22) 15)

(>= (total_score) 11)
))
(:metric maximize (+
  (image_score img2)
    (+ (image_score img3)
      (+ (image_score img7)
        (+ (image_score img8)
          (+ (image_score img9)
            (+ (image_score img10)
              (+ (image_score img15)
                (image_score img22)
              )
            )
          )
        )
      )
    )
  )
)
)
