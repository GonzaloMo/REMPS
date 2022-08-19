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



  (at 66 (image_available img1))
  (at 74 (not (image_available img1)))
  (at 162 (image_available img2))
  (at 170 (not (image_available img2)))
  (at 77 (image_available img3))
  (at 85 (not (image_available img3)))
  (at 111 (image_available img4))
  (at 119 (not (image_available img4)))
  (at 26 (image_available img5))
  (at 34 (not (image_available img5)))
  (at 144 (image_available img6))
  (at 152 (not (image_available img6)))
  (at 212 (image_available img7))
  (at 220 (not (image_available img7)))
  (at 132 (image_available img8))
  (at 140 (not (image_available img8)))
  (at 1 (image_available img9))
  (at 9 (not (image_available img9)))
  (at 207 (image_available img10))
  (at 215 (not (image_available img10)))
  (at 55 (image_available img11))
  (at 63 (not (image_available img11)))
  (at 36 (image_available img12))
  (at 44 (not (image_available img12)))
  (at 110 (image_available img13))
  (at 118 (not (image_available img13)))
  (at 71 (image_available img14))
  (at 79 (not (image_available img14)))
  (at 333 (image_available img15))
  (at 341 (not (image_available img15)))
  (at 321 (image_available img16))
  (at 329 (not (image_available img16)))
  (at 187 (image_available img17))
  (at 195 (not (image_available img17)))
  (at 8 (image_available img18))
  (at 16 (not (image_available img18)))
  (at 197 (image_available img19))
  (at 205 (not (image_available img19)))
  (at 198 (image_available img20))
  (at 206 (not (image_available img20)))
  (at 325 (image_available img21))
  (at 333 (not (image_available img21)))
  (at 206 (image_available img22))
  (at 214 (not (image_available img22)))
  (at 3 (image_available img23))
  (at 11 (not (image_available img23)))
  (at 10 (image_available img24))
  (at 18 (not (image_available img24)))
  (at 339 (image_available img25))
  (at 347 (not (image_available img25)))
  (at 426 (image_available img1))
  (at 434 (not (image_available img1)))
  (at 522 (image_available img2))
  (at 530 (not (image_available img2)))
  (at 437 (image_available img3))
  (at 445 (not (image_available img3)))
  (at 471 (image_available img4))
  (at 479 (not (image_available img4)))
  (at 386 (image_available img5))
  (at 394 (not (image_available img5)))
  (at 504 (image_available img6))
  (at 512 (not (image_available img6)))
  (at 572 (image_available img7))
  (at 580 (not (image_available img7)))
  (at 492 (image_available img8))
  (at 500 (not (image_available img8)))
  (at 361 (image_available img9))
  (at 369 (not (image_available img9)))
  (at 567 (image_available img10))
  (at 575 (not (image_available img10)))
  (at 415 (image_available img11))
  (at 423 (not (image_available img11)))
  (at 396 (image_available img12))
  (at 404 (not (image_available img12)))
  (at 470 (image_available img13))
  (at 478 (not (image_available img13)))
  (at 431 (image_available img14))
  (at 439 (not (image_available img14)))
  (at 693 (image_available img15))
  (at 701 (not (image_available img15)))
  (at 681 (image_available img16))
  (at 689 (not (image_available img16)))
  (at 547 (image_available img17))
  (at 555 (not (image_available img17)))
  (at 368 (image_available img18))
  (at 376 (not (image_available img18)))
  (at 557 (image_available img19))
  (at 565 (not (image_available img19)))
  (at 558 (image_available img20))
  (at 566 (not (image_available img20)))
  (at 685 (image_available img21))
  (at 693 (not (image_available img21)))
  (at 566 (image_available img22))
  (at 574 (not (image_available img22)))
  (at 363 (image_available img23))
  (at 371 (not (image_available img23)))
  (at 370 (image_available img24))
  (at 378 (not (image_available img24)))
  (at 699 (image_available img25))
  (at 707 (not (image_available img25)))
  (at 786 (image_available img1))
  (at 794 (not (image_available img1)))
  (at 882 (image_available img2))
  (at 890 (not (image_available img2)))
  (at 797 (image_available img3))
  (at 805 (not (image_available img3)))
  (at 831 (image_available img4))
  (at 839 (not (image_available img4)))
  (at 746 (image_available img5))
  (at 754 (not (image_available img5)))
  (at 864 (image_available img6))
  (at 872 (not (image_available img6)))
  (at 932 (image_available img7))
  (at 940 (not (image_available img7)))
  (at 852 (image_available img8))
  (at 860 (not (image_available img8)))
  (at 721 (image_available img9))
  (at 729 (not (image_available img9)))
  (at 927 (image_available img10))
  (at 935 (not (image_available img10)))
  (at 775 (image_available img11))
  (at 783 (not (image_available img11)))
  (at 756 (image_available img12))
  (at 764 (not (image_available img12)))
  (at 830 (image_available img13))
  (at 838 (not (image_available img13)))
  (at 791 (image_available img14))
  (at 799 (not (image_available img14)))
  (at 1053 (image_available img15))
  (at 1061 (not (image_available img15)))
  (at 1041 (image_available img16))
  (at 1049 (not (image_available img16)))
  (at 907 (image_available img17))
  (at 915 (not (image_available img17)))
  (at 728 (image_available img18))
  (at 736 (not (image_available img18)))
  (at 917 (image_available img19))
  (at 925 (not (image_available img19)))
  (at 918 (image_available img20))
  (at 926 (not (image_available img20)))
  (at 1045 (image_available img21))
  (at 1053 (not (image_available img21)))
  (at 926 (image_available img22))
  (at 934 (not (image_available img22)))
  (at 723 (image_available img23))
  (at 731 (not (image_available img23)))
  (at 730 (image_available img24))
  (at 738 (not (image_available img24)))
  (at 1059 (image_available img25))
  (at 1067 (not (image_available img25)))
  (at 1146 (image_available img1))
  (at 1154 (not (image_available img1)))
  (at 1242 (image_available img2))
  (at 1250 (not (image_available img2)))
  (at 1157 (image_available img3))
  (at 1165 (not (image_available img3)))
  (at 1191 (image_available img4))
  (at 1199 (not (image_available img4)))
  (at 1106 (image_available img5))
  (at 1114 (not (image_available img5)))
  (at 1224 (image_available img6))
  (at 1232 (not (image_available img6)))
  (at 1292 (image_available img7))
  (at 1300 (not (image_available img7)))
  (at 1212 (image_available img8))
  (at 1220 (not (image_available img8)))
  (at 1081 (image_available img9))
  (at 1089 (not (image_available img9)))
  (at 1287 (image_available img10))
  (at 1295 (not (image_available img10)))
  (at 1135 (image_available img11))
  (at 1143 (not (image_available img11)))
  (at 1116 (image_available img12))
  (at 1124 (not (image_available img12)))
  (at 1190 (image_available img13))
  (at 1198 (not (image_available img13)))
  (at 1151 (image_available img14))
  (at 1159 (not (image_available img14)))
  (at 1413 (image_available img15))
  (at 1421 (not (image_available img15)))
  (at 1401 (image_available img16))
  (at 1409 (not (image_available img16)))
  (at 1267 (image_available img17))
  (at 1275 (not (image_available img17)))
  (at 1088 (image_available img18))
  (at 1096 (not (image_available img18)))
  (at 1277 (image_available img19))
  (at 1285 (not (image_available img19)))
  (at 1278 (image_available img20))
  (at 1286 (not (image_available img20)))
  (at 1405 (image_available img21))
  (at 1413 (not (image_available img21)))
  (at 1286 (image_available img22))
  (at 1294 (not (image_available img22)))
  (at 1083 (image_available img23))
  (at 1091 (not (image_available img23)))
  (at 1090 (image_available img24))
  (at 1098 (not (image_available img24)))
  (at 1419 (image_available img25))
  (at 1427 (not (image_available img25)))
  (at 1506 (image_available img1))
  (at 1514 (not (image_available img1)))
  (at 1602 (image_available img2))
  (at 1610 (not (image_available img2)))
  (at 1517 (image_available img3))
  (at 1525 (not (image_available img3)))
  (at 1551 (image_available img4))
  (at 1559 (not (image_available img4)))
  (at 1466 (image_available img5))
  (at 1474 (not (image_available img5)))
  (at 1584 (image_available img6))
  (at 1592 (not (image_available img6)))
  (at 1652 (image_available img7))
  (at 1660 (not (image_available img7)))
  (at 1572 (image_available img8))
  (at 1580 (not (image_available img8)))
  (at 1441 (image_available img9))
  (at 1449 (not (image_available img9)))
  (at 1647 (image_available img10))
  (at 1655 (not (image_available img10)))
  (at 1495 (image_available img11))
  (at 1503 (not (image_available img11)))
  (at 1476 (image_available img12))
  (at 1484 (not (image_available img12)))
  (at 1550 (image_available img13))
  (at 1558 (not (image_available img13)))
  (at 1511 (image_available img14))
  (at 1519 (not (image_available img14)))
  (at 1773 (image_available img15))
  (at 1781 (not (image_available img15)))
  (at 1761 (image_available img16))
  (at 1769 (not (image_available img16)))
  (at 1627 (image_available img17))
  (at 1635 (not (image_available img17)))
  (at 1448 (image_available img18))
  (at 1456 (not (image_available img18)))
  (at 1637 (image_available img19))
  (at 1645 (not (image_available img19)))
  (at 1638 (image_available img20))
  (at 1646 (not (image_available img20)))
  (at 1765 (image_available img21))
  (at 1773 (not (image_available img21)))
  (at 1646 (image_available img22))
  (at 1654 (not (image_available img22)))
  (at 1443 (image_available img23))
  (at 1451 (not (image_available img23)))
  (at 1450 (image_available img24))
  (at 1458 (not (image_available img24)))
  (at 1779 (image_available img25))
  (at 1787 (not (image_available img25)))
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

  (> (image_score img2) 0)
  (<= (image_score img2) 5)

  (> (image_score img4) 0)
  (<= (image_score img4) 2)

  (> (image_score img5) 0)
  (<= (image_score img5) 5)

  (> (image_score img8) 0)
  (<= (image_score img8) 4)

  (> (image_score img9) 0)
  (<= (image_score img9) 2)

  (> (image_score img10) 0)
  (<= (image_score img10) 5)

  (> (image_score img11) 0)
  (<= (image_score img11) 2)

  (> (image_score img12) 0)
  (<= (image_score img12) 5)

  (> (image_score img13) 0)
  (<= (image_score img13) 5)

  (> (image_score img16) 0)
  (<= (image_score img16) 3)

  (> (image_score img17) 0)
  (<= (image_score img17) 2)

  (> (image_score img21) 0)
  (<= (image_score img21) 2)

  (> (image_score img22) 0)
  (<= (image_score img22) 1)

  (> (image_score img23) 0)
  (<= (image_score img23) 5)

  (> (image_score img25) 0)
  (<= (image_score img25) 4)

(>= (total_score) 11)
))
(:metric maximize (+
  (image_score img1)
    (+ (image_score img2)
      (+ (image_score img4)
        (+ (image_score img5)
          (+ (image_score img8)
            (+ (image_score img9)
              (+ (image_score img10)
                (+ (image_score img11)
                  (+ (image_score img12)
                    (+ (image_score img13)
                      (+ (image_score img16)
                        (+ (image_score img17)
                          (+ (image_score img21)
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
      )
    )
  )
)
)
