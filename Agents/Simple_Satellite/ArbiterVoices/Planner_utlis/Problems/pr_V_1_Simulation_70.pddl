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



  (at 267 (image_available img1))
  (at 275 (not (image_available img1)))
  (at 350 (image_available img2))
  (at 358 (not (image_available img2)))
  (at 155 (image_available img3))
  (at 163 (not (image_available img3)))
  (at 254 (image_available img4))
  (at 262 (not (image_available img4)))
  (at 190 (image_available img5))
  (at 198 (not (image_available img5)))
  (at 8 (image_available img6))
  (at 16 (not (image_available img6)))
  (at 168 (image_available img7))
  (at 176 (not (image_available img7)))
  (at 237 (image_available img8))
  (at 245 (not (image_available img8)))
  (at 80 (image_available img9))
  (at 88 (not (image_available img9)))
  (at 168 (image_available img10))
  (at 176 (not (image_available img10)))
  (at 76 (image_available img11))
  (at 84 (not (image_available img11)))
  (at 321 (image_available img12))
  (at 329 (not (image_available img12)))
  (at 129 (image_available img13))
  (at 137 (not (image_available img13)))
  (at 145 (image_available img14))
  (at 153 (not (image_available img14)))
  (at 304 (image_available img15))
  (at 312 (not (image_available img15)))
  (at 71 (image_available img16))
  (at 79 (not (image_available img16)))
  (at 121 (image_available img17))
  (at 129 (not (image_available img17)))
  (at 348 (image_available img18))
  (at 356 (not (image_available img18)))
  (at 341 (image_available img19))
  (at 349 (not (image_available img19)))
  (at 279 (image_available img20))
  (at 287 (not (image_available img20)))
  (at 333 (image_available img21))
  (at 341 (not (image_available img21)))
  (at 349 (image_available img22))
  (at 357 (not (image_available img22)))
  (at 347 (image_available img23))
  (at 355 (not (image_available img23)))
  (at 166 (image_available img24))
  (at 174 (not (image_available img24)))
  (at 303 (image_available img25))
  (at 311 (not (image_available img25)))
  (at 627 (image_available img1))
  (at 635 (not (image_available img1)))
  (at 710 (image_available img2))
  (at 718 (not (image_available img2)))
  (at 515 (image_available img3))
  (at 523 (not (image_available img3)))
  (at 614 (image_available img4))
  (at 622 (not (image_available img4)))
  (at 550 (image_available img5))
  (at 558 (not (image_available img5)))
  (at 368 (image_available img6))
  (at 376 (not (image_available img6)))
  (at 528 (image_available img7))
  (at 536 (not (image_available img7)))
  (at 597 (image_available img8))
  (at 605 (not (image_available img8)))
  (at 440 (image_available img9))
  (at 448 (not (image_available img9)))
  (at 528 (image_available img10))
  (at 536 (not (image_available img10)))
  (at 436 (image_available img11))
  (at 444 (not (image_available img11)))
  (at 681 (image_available img12))
  (at 689 (not (image_available img12)))
  (at 489 (image_available img13))
  (at 497 (not (image_available img13)))
  (at 505 (image_available img14))
  (at 513 (not (image_available img14)))
  (at 664 (image_available img15))
  (at 672 (not (image_available img15)))
  (at 431 (image_available img16))
  (at 439 (not (image_available img16)))
  (at 481 (image_available img17))
  (at 489 (not (image_available img17)))
  (at 708 (image_available img18))
  (at 716 (not (image_available img18)))
  (at 701 (image_available img19))
  (at 709 (not (image_available img19)))
  (at 639 (image_available img20))
  (at 647 (not (image_available img20)))
  (at 693 (image_available img21))
  (at 701 (not (image_available img21)))
  (at 709 (image_available img22))
  (at 717 (not (image_available img22)))
  (at 707 (image_available img23))
  (at 715 (not (image_available img23)))
  (at 526 (image_available img24))
  (at 534 (not (image_available img24)))
  (at 663 (image_available img25))
  (at 671 (not (image_available img25)))
  (at 987 (image_available img1))
  (at 995 (not (image_available img1)))
  (at 1070 (image_available img2))
  (at 1078 (not (image_available img2)))
  (at 875 (image_available img3))
  (at 883 (not (image_available img3)))
  (at 974 (image_available img4))
  (at 982 (not (image_available img4)))
  (at 910 (image_available img5))
  (at 918 (not (image_available img5)))
  (at 728 (image_available img6))
  (at 736 (not (image_available img6)))
  (at 888 (image_available img7))
  (at 896 (not (image_available img7)))
  (at 957 (image_available img8))
  (at 965 (not (image_available img8)))
  (at 800 (image_available img9))
  (at 808 (not (image_available img9)))
  (at 888 (image_available img10))
  (at 896 (not (image_available img10)))
  (at 796 (image_available img11))
  (at 804 (not (image_available img11)))
  (at 1041 (image_available img12))
  (at 1049 (not (image_available img12)))
  (at 849 (image_available img13))
  (at 857 (not (image_available img13)))
  (at 865 (image_available img14))
  (at 873 (not (image_available img14)))
  (at 1024 (image_available img15))
  (at 1032 (not (image_available img15)))
  (at 791 (image_available img16))
  (at 799 (not (image_available img16)))
  (at 841 (image_available img17))
  (at 849 (not (image_available img17)))
  (at 1068 (image_available img18))
  (at 1076 (not (image_available img18)))
  (at 1061 (image_available img19))
  (at 1069 (not (image_available img19)))
  (at 999 (image_available img20))
  (at 1007 (not (image_available img20)))
  (at 1053 (image_available img21))
  (at 1061 (not (image_available img21)))
  (at 1069 (image_available img22))
  (at 1077 (not (image_available img22)))
  (at 1067 (image_available img23))
  (at 1075 (not (image_available img23)))
  (at 886 (image_available img24))
  (at 894 (not (image_available img24)))
  (at 1023 (image_available img25))
  (at 1031 (not (image_available img25)))
  (at 1347 (image_available img1))
  (at 1355 (not (image_available img1)))
  (at 1430 (image_available img2))
  (at 1438 (not (image_available img2)))
  (at 1235 (image_available img3))
  (at 1243 (not (image_available img3)))
  (at 1334 (image_available img4))
  (at 1342 (not (image_available img4)))
  (at 1270 (image_available img5))
  (at 1278 (not (image_available img5)))
  (at 1088 (image_available img6))
  (at 1096 (not (image_available img6)))
  (at 1248 (image_available img7))
  (at 1256 (not (image_available img7)))
  (at 1317 (image_available img8))
  (at 1325 (not (image_available img8)))
  (at 1160 (image_available img9))
  (at 1168 (not (image_available img9)))
  (at 1248 (image_available img10))
  (at 1256 (not (image_available img10)))
  (at 1156 (image_available img11))
  (at 1164 (not (image_available img11)))
  (at 1401 (image_available img12))
  (at 1409 (not (image_available img12)))
  (at 1209 (image_available img13))
  (at 1217 (not (image_available img13)))
  (at 1225 (image_available img14))
  (at 1233 (not (image_available img14)))
  (at 1384 (image_available img15))
  (at 1392 (not (image_available img15)))
  (at 1151 (image_available img16))
  (at 1159 (not (image_available img16)))
  (at 1201 (image_available img17))
  (at 1209 (not (image_available img17)))
  (at 1428 (image_available img18))
  (at 1436 (not (image_available img18)))
  (at 1421 (image_available img19))
  (at 1429 (not (image_available img19)))
  (at 1359 (image_available img20))
  (at 1367 (not (image_available img20)))
  (at 1413 (image_available img21))
  (at 1421 (not (image_available img21)))
  (at 1429 (image_available img22))
  (at 1437 (not (image_available img22)))
  (at 1427 (image_available img23))
  (at 1435 (not (image_available img23)))
  (at 1246 (image_available img24))
  (at 1254 (not (image_available img24)))
  (at 1383 (image_available img25))
  (at 1391 (not (image_available img25)))
  (at 1707 (image_available img1))
  (at 1715 (not (image_available img1)))
  (at 1790 (image_available img2))
  (at 1798 (not (image_available img2)))
  (at 1595 (image_available img3))
  (at 1603 (not (image_available img3)))
  (at 1694 (image_available img4))
  (at 1702 (not (image_available img4)))
  (at 1630 (image_available img5))
  (at 1638 (not (image_available img5)))
  (at 1448 (image_available img6))
  (at 1456 (not (image_available img6)))
  (at 1608 (image_available img7))
  (at 1616 (not (image_available img7)))
  (at 1677 (image_available img8))
  (at 1685 (not (image_available img8)))
  (at 1520 (image_available img9))
  (at 1528 (not (image_available img9)))
  (at 1608 (image_available img10))
  (at 1616 (not (image_available img10)))
  (at 1516 (image_available img11))
  (at 1524 (not (image_available img11)))
  (at 1761 (image_available img12))
  (at 1769 (not (image_available img12)))
  (at 1569 (image_available img13))
  (at 1577 (not (image_available img13)))
  (at 1585 (image_available img14))
  (at 1593 (not (image_available img14)))
  (at 1744 (image_available img15))
  (at 1752 (not (image_available img15)))
  (at 1511 (image_available img16))
  (at 1519 (not (image_available img16)))
  (at 1561 (image_available img17))
  (at 1569 (not (image_available img17)))
  (at 1788 (image_available img18))
  (at 1796 (not (image_available img18)))
  (at 1781 (image_available img19))
  (at 1789 (not (image_available img19)))
  (at 1719 (image_available img20))
  (at 1727 (not (image_available img20)))
  (at 1773 (image_available img21))
  (at 1781 (not (image_available img21)))
  (at 1789 (image_available img22))
  (at 1797 (not (image_available img22)))
  (at 1787 (image_available img23))
  (at 1795 (not (image_available img23)))
  (at 1606 (image_available img24))
  (at 1614 (not (image_available img24)))
  (at 1743 (image_available img25))
  (at 1751 (not (image_available img25)))
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

  (> (image_score img7) 0)
  (<= (image_score img7) 6)

  (> (image_score img8) 0)
  (<= (image_score img8) 5)

  (> (image_score img9) 0)
  (<= (image_score img9) 2)

  (> (image_score img11) 0)
  (<= (image_score img11) 3)

  (> (image_score img13) 0)
  (<= (image_score img13) 9)

  (> (image_score img14) 0)
  (<= (image_score img14) 8)

  (> (image_score img19) 0)
  (<= (image_score img19) 3)

  (> (image_score img24) 0)
  (<= (image_score img24) 8)

  (> (image_score img25) 0)
  (<= (image_score img25) 1)

(>= (total_score) 10)
))
(:metric maximize (+
  (image_score img2)
    (+ (image_score img7)
      (+ (image_score img8)
        (+ (image_score img9)
          (+ (image_score img11)
            (+ (image_score img13)
              (+ (image_score img14)
                (+ (image_score img19)
                  (+ (image_score img24)
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
