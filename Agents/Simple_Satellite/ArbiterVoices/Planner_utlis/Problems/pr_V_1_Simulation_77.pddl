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



  (at 284 (image_available img1))
  (at 292 (not (image_available img1)))
  (at 300 (image_available img2))
  (at 308 (not (image_available img2)))
  (at 64 (image_available img3))
  (at 72 (not (image_available img3)))
  (at 167 (image_available img4))
  (at 175 (not (image_available img4)))
  (at 164 (image_available img5))
  (at 172 (not (image_available img5)))
  (at 345 (image_available img6))
  (at 353 (not (image_available img6)))
  (at 297 (image_available img7))
  (at 305 (not (image_available img7)))
  (at 231 (image_available img8))
  (at 239 (not (image_available img8)))
  (at 38 (image_available img9))
  (at 46 (not (image_available img9)))
  (at 255 (image_available img10))
  (at 263 (not (image_available img10)))
  (at 48 (image_available img11))
  (at 56 (not (image_available img11)))
  (at 4 (image_available img12))
  (at 12 (not (image_available img12)))
  (at 23 (image_available img13))
  (at 31 (not (image_available img13)))
  (at 195 (image_available img14))
  (at 203 (not (image_available img14)))
  (at 155 (image_available img15))
  (at 163 (not (image_available img15)))
  (at 210 (image_available img16))
  (at 218 (not (image_available img16)))
  (at 195 (image_available img17))
  (at 203 (not (image_available img17)))
  (at 313 (image_available img18))
  (at 321 (not (image_available img18)))
  (at 223 (image_available img19))
  (at 231 (not (image_available img19)))
  (at 346 (image_available img20))
  (at 354 (not (image_available img20)))
  (at 197 (image_available img21))
  (at 205 (not (image_available img21)))
  (at 158 (image_available img22))
  (at 166 (not (image_available img22)))
  (at 144 (image_available img23))
  (at 152 (not (image_available img23)))
  (at 293 (image_available img24))
  (at 301 (not (image_available img24)))
  (at 134 (image_available img25))
  (at 142 (not (image_available img25)))
  (at 644 (image_available img1))
  (at 652 (not (image_available img1)))
  (at 660 (image_available img2))
  (at 668 (not (image_available img2)))
  (at 424 (image_available img3))
  (at 432 (not (image_available img3)))
  (at 527 (image_available img4))
  (at 535 (not (image_available img4)))
  (at 524 (image_available img5))
  (at 532 (not (image_available img5)))
  (at 705 (image_available img6))
  (at 713 (not (image_available img6)))
  (at 657 (image_available img7))
  (at 665 (not (image_available img7)))
  (at 591 (image_available img8))
  (at 599 (not (image_available img8)))
  (at 398 (image_available img9))
  (at 406 (not (image_available img9)))
  (at 615 (image_available img10))
  (at 623 (not (image_available img10)))
  (at 408 (image_available img11))
  (at 416 (not (image_available img11)))
  (at 364 (image_available img12))
  (at 372 (not (image_available img12)))
  (at 383 (image_available img13))
  (at 391 (not (image_available img13)))
  (at 555 (image_available img14))
  (at 563 (not (image_available img14)))
  (at 515 (image_available img15))
  (at 523 (not (image_available img15)))
  (at 570 (image_available img16))
  (at 578 (not (image_available img16)))
  (at 555 (image_available img17))
  (at 563 (not (image_available img17)))
  (at 673 (image_available img18))
  (at 681 (not (image_available img18)))
  (at 583 (image_available img19))
  (at 591 (not (image_available img19)))
  (at 706 (image_available img20))
  (at 714 (not (image_available img20)))
  (at 557 (image_available img21))
  (at 565 (not (image_available img21)))
  (at 518 (image_available img22))
  (at 526 (not (image_available img22)))
  (at 504 (image_available img23))
  (at 512 (not (image_available img23)))
  (at 653 (image_available img24))
  (at 661 (not (image_available img24)))
  (at 494 (image_available img25))
  (at 502 (not (image_available img25)))
  (at 1004 (image_available img1))
  (at 1012 (not (image_available img1)))
  (at 1020 (image_available img2))
  (at 1028 (not (image_available img2)))
  (at 784 (image_available img3))
  (at 792 (not (image_available img3)))
  (at 887 (image_available img4))
  (at 895 (not (image_available img4)))
  (at 884 (image_available img5))
  (at 892 (not (image_available img5)))
  (at 1065 (image_available img6))
  (at 1073 (not (image_available img6)))
  (at 1017 (image_available img7))
  (at 1025 (not (image_available img7)))
  (at 951 (image_available img8))
  (at 959 (not (image_available img8)))
  (at 758 (image_available img9))
  (at 766 (not (image_available img9)))
  (at 975 (image_available img10))
  (at 983 (not (image_available img10)))
  (at 768 (image_available img11))
  (at 776 (not (image_available img11)))
  (at 724 (image_available img12))
  (at 732 (not (image_available img12)))
  (at 743 (image_available img13))
  (at 751 (not (image_available img13)))
  (at 915 (image_available img14))
  (at 923 (not (image_available img14)))
  (at 875 (image_available img15))
  (at 883 (not (image_available img15)))
  (at 930 (image_available img16))
  (at 938 (not (image_available img16)))
  (at 915 (image_available img17))
  (at 923 (not (image_available img17)))
  (at 1033 (image_available img18))
  (at 1041 (not (image_available img18)))
  (at 943 (image_available img19))
  (at 951 (not (image_available img19)))
  (at 1066 (image_available img20))
  (at 1074 (not (image_available img20)))
  (at 917 (image_available img21))
  (at 925 (not (image_available img21)))
  (at 878 (image_available img22))
  (at 886 (not (image_available img22)))
  (at 864 (image_available img23))
  (at 872 (not (image_available img23)))
  (at 1013 (image_available img24))
  (at 1021 (not (image_available img24)))
  (at 854 (image_available img25))
  (at 862 (not (image_available img25)))
  (at 1364 (image_available img1))
  (at 1372 (not (image_available img1)))
  (at 1380 (image_available img2))
  (at 1388 (not (image_available img2)))
  (at 1144 (image_available img3))
  (at 1152 (not (image_available img3)))
  (at 1247 (image_available img4))
  (at 1255 (not (image_available img4)))
  (at 1244 (image_available img5))
  (at 1252 (not (image_available img5)))
  (at 1425 (image_available img6))
  (at 1433 (not (image_available img6)))
  (at 1377 (image_available img7))
  (at 1385 (not (image_available img7)))
  (at 1311 (image_available img8))
  (at 1319 (not (image_available img8)))
  (at 1118 (image_available img9))
  (at 1126 (not (image_available img9)))
  (at 1335 (image_available img10))
  (at 1343 (not (image_available img10)))
  (at 1128 (image_available img11))
  (at 1136 (not (image_available img11)))
  (at 1084 (image_available img12))
  (at 1092 (not (image_available img12)))
  (at 1103 (image_available img13))
  (at 1111 (not (image_available img13)))
  (at 1275 (image_available img14))
  (at 1283 (not (image_available img14)))
  (at 1235 (image_available img15))
  (at 1243 (not (image_available img15)))
  (at 1290 (image_available img16))
  (at 1298 (not (image_available img16)))
  (at 1275 (image_available img17))
  (at 1283 (not (image_available img17)))
  (at 1393 (image_available img18))
  (at 1401 (not (image_available img18)))
  (at 1303 (image_available img19))
  (at 1311 (not (image_available img19)))
  (at 1426 (image_available img20))
  (at 1434 (not (image_available img20)))
  (at 1277 (image_available img21))
  (at 1285 (not (image_available img21)))
  (at 1238 (image_available img22))
  (at 1246 (not (image_available img22)))
  (at 1224 (image_available img23))
  (at 1232 (not (image_available img23)))
  (at 1373 (image_available img24))
  (at 1381 (not (image_available img24)))
  (at 1214 (image_available img25))
  (at 1222 (not (image_available img25)))
  (at 1724 (image_available img1))
  (at 1732 (not (image_available img1)))
  (at 1740 (image_available img2))
  (at 1748 (not (image_available img2)))
  (at 1504 (image_available img3))
  (at 1512 (not (image_available img3)))
  (at 1607 (image_available img4))
  (at 1615 (not (image_available img4)))
  (at 1604 (image_available img5))
  (at 1612 (not (image_available img5)))
  (at 1785 (image_available img6))
  (at 1793 (not (image_available img6)))
  (at 1737 (image_available img7))
  (at 1745 (not (image_available img7)))
  (at 1671 (image_available img8))
  (at 1679 (not (image_available img8)))
  (at 1478 (image_available img9))
  (at 1486 (not (image_available img9)))
  (at 1695 (image_available img10))
  (at 1703 (not (image_available img10)))
  (at 1488 (image_available img11))
  (at 1496 (not (image_available img11)))
  (at 1444 (image_available img12))
  (at 1452 (not (image_available img12)))
  (at 1463 (image_available img13))
  (at 1471 (not (image_available img13)))
  (at 1635 (image_available img14))
  (at 1643 (not (image_available img14)))
  (at 1595 (image_available img15))
  (at 1603 (not (image_available img15)))
  (at 1650 (image_available img16))
  (at 1658 (not (image_available img16)))
  (at 1635 (image_available img17))
  (at 1643 (not (image_available img17)))
  (at 1753 (image_available img18))
  (at 1761 (not (image_available img18)))
  (at 1663 (image_available img19))
  (at 1671 (not (image_available img19)))
  (at 1786 (image_available img20))
  (at 1794 (not (image_available img20)))
  (at 1637 (image_available img21))
  (at 1645 (not (image_available img21)))
  (at 1598 (image_available img22))
  (at 1606 (not (image_available img22)))
  (at 1584 (image_available img23))
  (at 1592 (not (image_available img23)))
  (at 1733 (image_available img24))
  (at 1741 (not (image_available img24)))
  (at 1574 (image_available img25))
  (at 1582 (not (image_available img25)))
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
  (<= (image_score img2) 5)

  (> (image_score img3) 0)
  (<= (image_score img3) 4)

  (> (image_score img4) 0)
  (<= (image_score img4) 4)

  (> (image_score img5) 0)
  (<= (image_score img5) 2)

  (> (image_score img8) 0)
  (<= (image_score img8) 3)

  (> (image_score img9) 0)
  (<= (image_score img9) 5)

  (> (image_score img11) 0)
  (<= (image_score img11) 4)

  (> (image_score img12) 0)
  (<= (image_score img12) 1)

  (> (image_score img14) 0)
  (<= (image_score img14) 5)

  (> (image_score img15) 0)
  (<= (image_score img15) 5)

  (> (image_score img17) 0)
  (<= (image_score img17) 4)

  (> (image_score img18) 0)
  (<= (image_score img18) 4)

  (> (image_score img19) 0)
  (<= (image_score img19) 2)

  (> (image_score img20) 0)
  (<= (image_score img20) 4)

  (> (image_score img21) 0)
  (<= (image_score img21) 4)

  (> (image_score img25) 0)
  (<= (image_score img25) 5)

(>= (total_score) 13)
))
(:metric maximize (+
  (image_score img2)
    (+ (image_score img3)
      (+ (image_score img4)
        (+ (image_score img5)
          (+ (image_score img8)
            (+ (image_score img9)
              (+ (image_score img11)
                (+ (image_score img12)
                  (+ (image_score img14)
                    (+ (image_score img15)
                      (+ (image_score img17)
                        (+ (image_score img18)
                          (+ (image_score img19)
                            (+ (image_score img20)
                              (+ (image_score img21)
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
      )
    )
  )
)
)
