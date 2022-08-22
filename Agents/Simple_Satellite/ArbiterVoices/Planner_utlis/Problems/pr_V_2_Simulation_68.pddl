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

  (memory_free mem4)
  (memory_free mem6)
  (memory_free mem7)
  (memory_free mem8)
  (memory_free mem9)

   (memory_taken mem0 img1)
   (memory_taken mem1 img3)
   (memory_taken mem2 img20)
   (memory_taken mem3 img6)
   (memory_taken mem5 img23)

(image_analysed mem0 img1)
(image_analysed mem1 img3)
(image_analysed mem2 img20)
(image_analysed mem3 img6)
(image_analysed mem5 img23)

  (at 210 (image_available img1))
  (at 218 (not (image_available img1)))
  (at 130 (image_available img2))
  (at 138 (not (image_available img2)))
  (at 4 (image_available img3))
  (at 12 (not (image_available img3)))
  (at 249 (image_available img4))
  (at 257 (not (image_available img4)))
  (at 88 (image_available img5))
  (at 96 (not (image_available img5)))
  (at 174 (image_available img6))
  (at 182 (not (image_available img6)))
  (at 22 (image_available img7))
  (at 30 (not (image_available img7)))
  (at 129 (image_available img9))
  (at 137 (not (image_available img9)))
  (at 145 (image_available img10))
  (at 153 (not (image_available img10)))
  (at 117 (image_available img11))
  (at 125 (not (image_available img11)))
  (at 178 (image_available img12))
  (at 186 (not (image_available img12)))
  (at 111 (image_available img14))
  (at 119 (not (image_available img14)))
  (at 223 (image_available img15))
  (at 231 (not (image_available img15)))
  (at 226 (image_available img16))
  (at 234 (not (image_available img16)))
  (at 78 (image_available img17))
  (at 86 (not (image_available img17)))
  (at 225 (image_available img18))
  (at 233 (not (image_available img18)))
  (at 65 (image_available img20))
  (at 73 (not (image_available img20)))
  (at 18 (image_available img21))
  (at 26 (not (image_available img21)))
  (at 158 (image_available img22))
  (at 166 (not (image_available img22)))
  (at 150 (image_available img24))
  (at 158 (not (image_available img24)))
  (at 236 (image_available img25))
  (at 244 (not (image_available img25)))
  (at 570 (image_available img1))
  (at 578 (not (image_available img1)))
  (at 490 (image_available img2))
  (at 498 (not (image_available img2)))
  (at 364 (image_available img3))
  (at 372 (not (image_available img3)))
  (at 609 (image_available img4))
  (at 617 (not (image_available img4)))
  (at 448 (image_available img5))
  (at 456 (not (image_available img5)))
  (at 534 (image_available img6))
  (at 542 (not (image_available img6)))
  (at 382 (image_available img7))
  (at 390 (not (image_available img7)))
  (at 322 (image_available img8))
  (at 330 (not (image_available img8)))
  (at 489 (image_available img9))
  (at 497 (not (image_available img9)))
  (at 505 (image_available img10))
  (at 513 (not (image_available img10)))
  (at 477 (image_available img11))
  (at 485 (not (image_available img11)))
  (at 538 (image_available img12))
  (at 546 (not (image_available img12)))
  (at 282 (image_available img13))
  (at 290 (not (image_available img13)))
  (at 471 (image_available img14))
  (at 479 (not (image_available img14)))
  (at 583 (image_available img15))
  (at 591 (not (image_available img15)))
  (at 586 (image_available img16))
  (at 594 (not (image_available img16)))
  (at 438 (image_available img17))
  (at 446 (not (image_available img17)))
  (at 585 (image_available img18))
  (at 593 (not (image_available img18)))
  (at 301 (image_available img19))
  (at 309 (not (image_available img19)))
  (at 425 (image_available img20))
  (at 433 (not (image_available img20)))
  (at 378 (image_available img21))
  (at 386 (not (image_available img21)))
  (at 518 (image_available img22))
  (at 526 (not (image_available img22)))
  (at 298 (image_available img23))
  (at 306 (not (image_available img23)))
  (at 510 (image_available img24))
  (at 518 (not (image_available img24)))
  (at 596 (image_available img25))
  (at 604 (not (image_available img25)))
  (at 930 (image_available img1))
  (at 938 (not (image_available img1)))
  (at 850 (image_available img2))
  (at 858 (not (image_available img2)))
  (at 724 (image_available img3))
  (at 732 (not (image_available img3)))
  (at 969 (image_available img4))
  (at 977 (not (image_available img4)))
  (at 808 (image_available img5))
  (at 816 (not (image_available img5)))
  (at 894 (image_available img6))
  (at 902 (not (image_available img6)))
  (at 742 (image_available img7))
  (at 750 (not (image_available img7)))
  (at 682 (image_available img8))
  (at 690 (not (image_available img8)))
  (at 849 (image_available img9))
  (at 857 (not (image_available img9)))
  (at 865 (image_available img10))
  (at 873 (not (image_available img10)))
  (at 837 (image_available img11))
  (at 845 (not (image_available img11)))
  (at 898 (image_available img12))
  (at 906 (not (image_available img12)))
  (at 642 (image_available img13))
  (at 650 (not (image_available img13)))
  (at 831 (image_available img14))
  (at 839 (not (image_available img14)))
  (at 943 (image_available img15))
  (at 951 (not (image_available img15)))
  (at 946 (image_available img16))
  (at 954 (not (image_available img16)))
  (at 798 (image_available img17))
  (at 806 (not (image_available img17)))
  (at 945 (image_available img18))
  (at 953 (not (image_available img18)))
  (at 661 (image_available img19))
  (at 669 (not (image_available img19)))
  (at 785 (image_available img20))
  (at 793 (not (image_available img20)))
  (at 738 (image_available img21))
  (at 746 (not (image_available img21)))
  (at 878 (image_available img22))
  (at 886 (not (image_available img22)))
  (at 658 (image_available img23))
  (at 666 (not (image_available img23)))
  (at 870 (image_available img24))
  (at 878 (not (image_available img24)))
  (at 956 (image_available img25))
  (at 964 (not (image_available img25)))
  (at 1290 (image_available img1))
  (at 1298 (not (image_available img1)))
  (at 1210 (image_available img2))
  (at 1218 (not (image_available img2)))
  (at 1084 (image_available img3))
  (at 1092 (not (image_available img3)))
  (at 1329 (image_available img4))
  (at 1337 (not (image_available img4)))
  (at 1168 (image_available img5))
  (at 1176 (not (image_available img5)))
  (at 1254 (image_available img6))
  (at 1262 (not (image_available img6)))
  (at 1102 (image_available img7))
  (at 1110 (not (image_available img7)))
  (at 1042 (image_available img8))
  (at 1050 (not (image_available img8)))
  (at 1209 (image_available img9))
  (at 1217 (not (image_available img9)))
  (at 1225 (image_available img10))
  (at 1233 (not (image_available img10)))
  (at 1197 (image_available img11))
  (at 1205 (not (image_available img11)))
  (at 1258 (image_available img12))
  (at 1266 (not (image_available img12)))
  (at 1002 (image_available img13))
  (at 1010 (not (image_available img13)))
  (at 1191 (image_available img14))
  (at 1199 (not (image_available img14)))
  (at 1303 (image_available img15))
  (at 1311 (not (image_available img15)))
  (at 1306 (image_available img16))
  (at 1314 (not (image_available img16)))
  (at 1158 (image_available img17))
  (at 1166 (not (image_available img17)))
  (at 1305 (image_available img18))
  (at 1313 (not (image_available img18)))
  (at 1021 (image_available img19))
  (at 1029 (not (image_available img19)))
  (at 1145 (image_available img20))
  (at 1153 (not (image_available img20)))
  (at 1098 (image_available img21))
  (at 1106 (not (image_available img21)))
  (at 1238 (image_available img22))
  (at 1246 (not (image_available img22)))
  (at 1018 (image_available img23))
  (at 1026 (not (image_available img23)))
  (at 1230 (image_available img24))
  (at 1238 (not (image_available img24)))
  (at 1316 (image_available img25))
  (at 1324 (not (image_available img25)))
  (at 1650 (image_available img1))
  (at 1658 (not (image_available img1)))
  (at 1570 (image_available img2))
  (at 1578 (not (image_available img2)))
  (at 1444 (image_available img3))
  (at 1452 (not (image_available img3)))
  (at 1689 (image_available img4))
  (at 1697 (not (image_available img4)))
  (at 1528 (image_available img5))
  (at 1536 (not (image_available img5)))
  (at 1614 (image_available img6))
  (at 1622 (not (image_available img6)))
  (at 1462 (image_available img7))
  (at 1470 (not (image_available img7)))
  (at 1402 (image_available img8))
  (at 1410 (not (image_available img8)))
  (at 1569 (image_available img9))
  (at 1577 (not (image_available img9)))
  (at 1585 (image_available img10))
  (at 1593 (not (image_available img10)))
  (at 1557 (image_available img11))
  (at 1565 (not (image_available img11)))
  (at 1618 (image_available img12))
  (at 1626 (not (image_available img12)))
  (at 1362 (image_available img13))
  (at 1370 (not (image_available img13)))
  (at 1551 (image_available img14))
  (at 1559 (not (image_available img14)))
  (at 1663 (image_available img15))
  (at 1671 (not (image_available img15)))
  (at 1666 (image_available img16))
  (at 1674 (not (image_available img16)))
  (at 1518 (image_available img17))
  (at 1526 (not (image_available img17)))
  (at 1665 (image_available img18))
  (at 1673 (not (image_available img18)))
  (at 1381 (image_available img19))
  (at 1389 (not (image_available img19)))
  (at 1505 (image_available img20))
  (at 1513 (not (image_available img20)))
  (at 1458 (image_available img21))
  (at 1466 (not (image_available img21)))
  (at 1598 (image_available img22))
  (at 1606 (not (image_available img22)))
  (at 1378 (image_available img23))
  (at 1386 (not (image_available img23)))
  (at 1590 (image_available img24))
  (at 1598 (not (image_available img24)))
  (at 1676 (image_available img25))
  (at 1684 (not (image_available img25)))
  (at 1 (dump_available))
  (at 17.0 (not (dump_available)))
  (at 159.0 (dump_available))
  (at 197.0 (not (dump_available)))
  (at 339.0 (dump_available))
  (at 377.0 (not (dump_available)))
  (at 519.0 (dump_available))
  (at 557.0 (not (dump_available)))
  (at 699.0 (dump_available))
  (at 737.0 (not (dump_available)))
  (at 879.0 (dump_available))
  (at 917.0 (not (dump_available)))
  (at 1059.0 (dump_available))
  (at 1097.0 (not (dump_available)))
  (at 1239.0 (dump_available))
  (at 1277.0 (not (dump_available)))
  (at 1419.0 (dump_available))
  (at 1457.0 (not (dump_available)))
  (at 1599.0 (dump_available))
  (at 1637.0 (not (dump_available)))

)
(:goal (and
  (> (image_score img4) 0)
  (<= (image_score img4) 15.0)

  (> (image_score img16) 0)
  (<= (image_score img16) 13.0)

  (> (image_score img25) 0)
  (<= (image_score img25) 15.0)

(>= (total_score) 9)
))
(:metric maximize (+
  (image_score img4)
    (+ (image_score img16)
      (image_score img25)
    )
  )
)
)
