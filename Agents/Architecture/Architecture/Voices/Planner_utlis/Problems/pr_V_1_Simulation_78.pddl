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



  (at 281 (image_available img1))
  (at 289 (not (image_available img1)))
  (at 32 (image_available img2))
  (at 40 (not (image_available img2)))
  (at 51 (image_available img3))
  (at 59 (not (image_available img3)))
  (at 7 (image_available img4))
  (at 15 (not (image_available img4)))
  (at 29 (image_available img5))
  (at 37 (not (image_available img5)))
  (at 259 (image_available img6))
  (at 267 (not (image_available img6)))
  (at 125 (image_available img7))
  (at 133 (not (image_available img7)))
  (at 320 (image_available img8))
  (at 328 (not (image_available img8)))
  (at 232 (image_available img9))
  (at 240 (not (image_available img9)))
  (at 65 (image_available img10))
  (at 73 (not (image_available img10)))
  (at 230 (image_available img11))
  (at 238 (not (image_available img11)))
  (at 175 (image_available img12))
  (at 183 (not (image_available img12)))
  (at 256 (image_available img13))
  (at 264 (not (image_available img13)))
  (at 132 (image_available img14))
  (at 140 (not (image_available img14)))
  (at 213 (image_available img15))
  (at 221 (not (image_available img15)))
  (at 336 (image_available img16))
  (at 344 (not (image_available img16)))
  (at 236 (image_available img17))
  (at 244 (not (image_available img17)))
  (at 60 (image_available img18))
  (at 68 (not (image_available img18)))
  (at 19 (image_available img19))
  (at 27 (not (image_available img19)))
  (at 98 (image_available img20))
  (at 106 (not (image_available img20)))
  (at 28 (image_available img21))
  (at 36 (not (image_available img21)))
  (at 51 (image_available img22))
  (at 59 (not (image_available img22)))
  (at 165 (image_available img23))
  (at 173 (not (image_available img23)))
  (at 73 (image_available img24))
  (at 81 (not (image_available img24)))
  (at 289 (image_available img25))
  (at 297 (not (image_available img25)))
  (at 641 (image_available img1))
  (at 649 (not (image_available img1)))
  (at 392 (image_available img2))
  (at 400 (not (image_available img2)))
  (at 411 (image_available img3))
  (at 419 (not (image_available img3)))
  (at 367 (image_available img4))
  (at 375 (not (image_available img4)))
  (at 389 (image_available img5))
  (at 397 (not (image_available img5)))
  (at 619 (image_available img6))
  (at 627 (not (image_available img6)))
  (at 485 (image_available img7))
  (at 493 (not (image_available img7)))
  (at 680 (image_available img8))
  (at 688 (not (image_available img8)))
  (at 592 (image_available img9))
  (at 600 (not (image_available img9)))
  (at 425 (image_available img10))
  (at 433 (not (image_available img10)))
  (at 590 (image_available img11))
  (at 598 (not (image_available img11)))
  (at 535 (image_available img12))
  (at 543 (not (image_available img12)))
  (at 616 (image_available img13))
  (at 624 (not (image_available img13)))
  (at 492 (image_available img14))
  (at 500 (not (image_available img14)))
  (at 573 (image_available img15))
  (at 581 (not (image_available img15)))
  (at 696 (image_available img16))
  (at 704 (not (image_available img16)))
  (at 596 (image_available img17))
  (at 604 (not (image_available img17)))
  (at 420 (image_available img18))
  (at 428 (not (image_available img18)))
  (at 379 (image_available img19))
  (at 387 (not (image_available img19)))
  (at 458 (image_available img20))
  (at 466 (not (image_available img20)))
  (at 388 (image_available img21))
  (at 396 (not (image_available img21)))
  (at 411 (image_available img22))
  (at 419 (not (image_available img22)))
  (at 525 (image_available img23))
  (at 533 (not (image_available img23)))
  (at 433 (image_available img24))
  (at 441 (not (image_available img24)))
  (at 649 (image_available img25))
  (at 657 (not (image_available img25)))
  (at 1001 (image_available img1))
  (at 1009 (not (image_available img1)))
  (at 752 (image_available img2))
  (at 760 (not (image_available img2)))
  (at 771 (image_available img3))
  (at 779 (not (image_available img3)))
  (at 727 (image_available img4))
  (at 735 (not (image_available img4)))
  (at 749 (image_available img5))
  (at 757 (not (image_available img5)))
  (at 979 (image_available img6))
  (at 987 (not (image_available img6)))
  (at 845 (image_available img7))
  (at 853 (not (image_available img7)))
  (at 1040 (image_available img8))
  (at 1048 (not (image_available img8)))
  (at 952 (image_available img9))
  (at 960 (not (image_available img9)))
  (at 785 (image_available img10))
  (at 793 (not (image_available img10)))
  (at 950 (image_available img11))
  (at 958 (not (image_available img11)))
  (at 895 (image_available img12))
  (at 903 (not (image_available img12)))
  (at 976 (image_available img13))
  (at 984 (not (image_available img13)))
  (at 852 (image_available img14))
  (at 860 (not (image_available img14)))
  (at 933 (image_available img15))
  (at 941 (not (image_available img15)))
  (at 1056 (image_available img16))
  (at 1064 (not (image_available img16)))
  (at 956 (image_available img17))
  (at 964 (not (image_available img17)))
  (at 780 (image_available img18))
  (at 788 (not (image_available img18)))
  (at 739 (image_available img19))
  (at 747 (not (image_available img19)))
  (at 818 (image_available img20))
  (at 826 (not (image_available img20)))
  (at 748 (image_available img21))
  (at 756 (not (image_available img21)))
  (at 771 (image_available img22))
  (at 779 (not (image_available img22)))
  (at 885 (image_available img23))
  (at 893 (not (image_available img23)))
  (at 793 (image_available img24))
  (at 801 (not (image_available img24)))
  (at 1009 (image_available img25))
  (at 1017 (not (image_available img25)))
  (at 1361 (image_available img1))
  (at 1369 (not (image_available img1)))
  (at 1112 (image_available img2))
  (at 1120 (not (image_available img2)))
  (at 1131 (image_available img3))
  (at 1139 (not (image_available img3)))
  (at 1087 (image_available img4))
  (at 1095 (not (image_available img4)))
  (at 1109 (image_available img5))
  (at 1117 (not (image_available img5)))
  (at 1339 (image_available img6))
  (at 1347 (not (image_available img6)))
  (at 1205 (image_available img7))
  (at 1213 (not (image_available img7)))
  (at 1400 (image_available img8))
  (at 1408 (not (image_available img8)))
  (at 1312 (image_available img9))
  (at 1320 (not (image_available img9)))
  (at 1145 (image_available img10))
  (at 1153 (not (image_available img10)))
  (at 1310 (image_available img11))
  (at 1318 (not (image_available img11)))
  (at 1255 (image_available img12))
  (at 1263 (not (image_available img12)))
  (at 1336 (image_available img13))
  (at 1344 (not (image_available img13)))
  (at 1212 (image_available img14))
  (at 1220 (not (image_available img14)))
  (at 1293 (image_available img15))
  (at 1301 (not (image_available img15)))
  (at 1416 (image_available img16))
  (at 1424 (not (image_available img16)))
  (at 1316 (image_available img17))
  (at 1324 (not (image_available img17)))
  (at 1140 (image_available img18))
  (at 1148 (not (image_available img18)))
  (at 1099 (image_available img19))
  (at 1107 (not (image_available img19)))
  (at 1178 (image_available img20))
  (at 1186 (not (image_available img20)))
  (at 1108 (image_available img21))
  (at 1116 (not (image_available img21)))
  (at 1131 (image_available img22))
  (at 1139 (not (image_available img22)))
  (at 1245 (image_available img23))
  (at 1253 (not (image_available img23)))
  (at 1153 (image_available img24))
  (at 1161 (not (image_available img24)))
  (at 1369 (image_available img25))
  (at 1377 (not (image_available img25)))
  (at 1721 (image_available img1))
  (at 1729 (not (image_available img1)))
  (at 1472 (image_available img2))
  (at 1480 (not (image_available img2)))
  (at 1491 (image_available img3))
  (at 1499 (not (image_available img3)))
  (at 1447 (image_available img4))
  (at 1455 (not (image_available img4)))
  (at 1469 (image_available img5))
  (at 1477 (not (image_available img5)))
  (at 1699 (image_available img6))
  (at 1707 (not (image_available img6)))
  (at 1565 (image_available img7))
  (at 1573 (not (image_available img7)))
  (at 1760 (image_available img8))
  (at 1768 (not (image_available img8)))
  (at 1672 (image_available img9))
  (at 1680 (not (image_available img9)))
  (at 1505 (image_available img10))
  (at 1513 (not (image_available img10)))
  (at 1670 (image_available img11))
  (at 1678 (not (image_available img11)))
  (at 1615 (image_available img12))
  (at 1623 (not (image_available img12)))
  (at 1696 (image_available img13))
  (at 1704 (not (image_available img13)))
  (at 1572 (image_available img14))
  (at 1580 (not (image_available img14)))
  (at 1653 (image_available img15))
  (at 1661 (not (image_available img15)))
  (at 1776 (image_available img16))
  (at 1784 (not (image_available img16)))
  (at 1676 (image_available img17))
  (at 1684 (not (image_available img17)))
  (at 1500 (image_available img18))
  (at 1508 (not (image_available img18)))
  (at 1459 (image_available img19))
  (at 1467 (not (image_available img19)))
  (at 1538 (image_available img20))
  (at 1546 (not (image_available img20)))
  (at 1468 (image_available img21))
  (at 1476 (not (image_available img21)))
  (at 1491 (image_available img22))
  (at 1499 (not (image_available img22)))
  (at 1605 (image_available img23))
  (at 1613 (not (image_available img23)))
  (at 1513 (image_available img24))
  (at 1521 (not (image_available img24)))
  (at 1729 (image_available img25))
  (at 1737 (not (image_available img25)))
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
  (<= (image_score img1) 9.0)

  (> (image_score img3) 0)
  (<= (image_score img3) 3.0)

  (> (image_score img5) 0)
  (<= (image_score img5) 1.0)

  (> (image_score img11) 0)
  (<= (image_score img11) 8.0)

  (> (image_score img13) 0)
  (<= (image_score img13) 2.0)

  (> (image_score img15) 0)
  (<= (image_score img15) 5.0)

  (> (image_score img16) 0)
  (<= (image_score img16) 5.0)

  (> (image_score img17) 0)
  (<= (image_score img17) 4.0)

  (> (image_score img21) 0)
  (<= (image_score img21) 10.0)

  (> (image_score img23) 0)
  (<= (image_score img23) 1.0)

  (> (image_score img25) 0)
  (<= (image_score img25) 9.0)

(>= (total_score) 12)
))
(:metric maximize (+
  (image_score img1)
    (+ (image_score img3)
      (+ (image_score img5)
        (+ (image_score img11)
          (+ (image_score img13)
            (+ (image_score img15)
              (+ (image_score img16)
                (+ (image_score img17)
                  (+ (image_score img21)
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
