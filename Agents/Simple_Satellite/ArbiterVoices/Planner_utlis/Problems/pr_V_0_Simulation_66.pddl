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



  (at 95 (image_available img1))
  (at 103 (not (image_available img1)))
  (at 160 (image_available img2))
  (at 168 (not (image_available img2)))
  (at 243 (image_available img3))
  (at 251 (not (image_available img3)))
  (at 298 (image_available img4))
  (at 306 (not (image_available img4)))
  (at 114 (image_available img5))
  (at 122 (not (image_available img5)))
  (at 17 (image_available img6))
  (at 25 (not (image_available img6)))
  (at 241 (image_available img7))
  (at 249 (not (image_available img7)))
  (at 157 (image_available img8))
  (at 165 (not (image_available img8)))
  (at 93 (image_available img9))
  (at 101 (not (image_available img9)))
  (at 338 (image_available img10))
  (at 346 (not (image_available img10)))
  (at 147 (image_available img11))
  (at 155 (not (image_available img11)))
  (at 198 (image_available img12))
  (at 206 (not (image_available img12)))
  (at 301 (image_available img13))
  (at 309 (not (image_available img13)))
  (at 117 (image_available img14))
  (at 125 (not (image_available img14)))
  (at 64 (image_available img15))
  (at 72 (not (image_available img15)))
  (at 327 (image_available img16))
  (at 335 (not (image_available img16)))
  (at 264 (image_available img17))
  (at 272 (not (image_available img17)))
  (at 122 (image_available img18))
  (at 130 (not (image_available img18)))
  (at 166 (image_available img19))
  (at 174 (not (image_available img19)))
  (at 281 (image_available img20))
  (at 289 (not (image_available img20)))
  (at 227 (image_available img21))
  (at 235 (not (image_available img21)))
  (at 44 (image_available img22))
  (at 52 (not (image_available img22)))
  (at 179 (image_available img23))
  (at 187 (not (image_available img23)))
  (at 59 (image_available img24))
  (at 67 (not (image_available img24)))
  (at 239 (image_available img25))
  (at 247 (not (image_available img25)))
  (at 455 (image_available img1))
  (at 463 (not (image_available img1)))
  (at 520 (image_available img2))
  (at 528 (not (image_available img2)))
  (at 603 (image_available img3))
  (at 611 (not (image_available img3)))
  (at 658 (image_available img4))
  (at 666 (not (image_available img4)))
  (at 474 (image_available img5))
  (at 482 (not (image_available img5)))
  (at 377 (image_available img6))
  (at 385 (not (image_available img6)))
  (at 601 (image_available img7))
  (at 609 (not (image_available img7)))
  (at 517 (image_available img8))
  (at 525 (not (image_available img8)))
  (at 453 (image_available img9))
  (at 461 (not (image_available img9)))
  (at 698 (image_available img10))
  (at 706 (not (image_available img10)))
  (at 507 (image_available img11))
  (at 515 (not (image_available img11)))
  (at 558 (image_available img12))
  (at 566 (not (image_available img12)))
  (at 661 (image_available img13))
  (at 669 (not (image_available img13)))
  (at 477 (image_available img14))
  (at 485 (not (image_available img14)))
  (at 424 (image_available img15))
  (at 432 (not (image_available img15)))
  (at 687 (image_available img16))
  (at 695 (not (image_available img16)))
  (at 624 (image_available img17))
  (at 632 (not (image_available img17)))
  (at 482 (image_available img18))
  (at 490 (not (image_available img18)))
  (at 526 (image_available img19))
  (at 534 (not (image_available img19)))
  (at 641 (image_available img20))
  (at 649 (not (image_available img20)))
  (at 587 (image_available img21))
  (at 595 (not (image_available img21)))
  (at 404 (image_available img22))
  (at 412 (not (image_available img22)))
  (at 539 (image_available img23))
  (at 547 (not (image_available img23)))
  (at 419 (image_available img24))
  (at 427 (not (image_available img24)))
  (at 599 (image_available img25))
  (at 607 (not (image_available img25)))
  (at 815 (image_available img1))
  (at 823 (not (image_available img1)))
  (at 880 (image_available img2))
  (at 888 (not (image_available img2)))
  (at 963 (image_available img3))
  (at 971 (not (image_available img3)))
  (at 1018 (image_available img4))
  (at 1026 (not (image_available img4)))
  (at 834 (image_available img5))
  (at 842 (not (image_available img5)))
  (at 737 (image_available img6))
  (at 745 (not (image_available img6)))
  (at 961 (image_available img7))
  (at 969 (not (image_available img7)))
  (at 877 (image_available img8))
  (at 885 (not (image_available img8)))
  (at 813 (image_available img9))
  (at 821 (not (image_available img9)))
  (at 1058 (image_available img10))
  (at 1066 (not (image_available img10)))
  (at 867 (image_available img11))
  (at 875 (not (image_available img11)))
  (at 918 (image_available img12))
  (at 926 (not (image_available img12)))
  (at 1021 (image_available img13))
  (at 1029 (not (image_available img13)))
  (at 837 (image_available img14))
  (at 845 (not (image_available img14)))
  (at 784 (image_available img15))
  (at 792 (not (image_available img15)))
  (at 1047 (image_available img16))
  (at 1055 (not (image_available img16)))
  (at 984 (image_available img17))
  (at 992 (not (image_available img17)))
  (at 842 (image_available img18))
  (at 850 (not (image_available img18)))
  (at 886 (image_available img19))
  (at 894 (not (image_available img19)))
  (at 1001 (image_available img20))
  (at 1009 (not (image_available img20)))
  (at 947 (image_available img21))
  (at 955 (not (image_available img21)))
  (at 764 (image_available img22))
  (at 772 (not (image_available img22)))
  (at 899 (image_available img23))
  (at 907 (not (image_available img23)))
  (at 779 (image_available img24))
  (at 787 (not (image_available img24)))
  (at 959 (image_available img25))
  (at 967 (not (image_available img25)))
  (at 1175 (image_available img1))
  (at 1183 (not (image_available img1)))
  (at 1240 (image_available img2))
  (at 1248 (not (image_available img2)))
  (at 1323 (image_available img3))
  (at 1331 (not (image_available img3)))
  (at 1378 (image_available img4))
  (at 1386 (not (image_available img4)))
  (at 1194 (image_available img5))
  (at 1202 (not (image_available img5)))
  (at 1097 (image_available img6))
  (at 1105 (not (image_available img6)))
  (at 1321 (image_available img7))
  (at 1329 (not (image_available img7)))
  (at 1237 (image_available img8))
  (at 1245 (not (image_available img8)))
  (at 1173 (image_available img9))
  (at 1181 (not (image_available img9)))
  (at 1418 (image_available img10))
  (at 1426 (not (image_available img10)))
  (at 1227 (image_available img11))
  (at 1235 (not (image_available img11)))
  (at 1278 (image_available img12))
  (at 1286 (not (image_available img12)))
  (at 1381 (image_available img13))
  (at 1389 (not (image_available img13)))
  (at 1197 (image_available img14))
  (at 1205 (not (image_available img14)))
  (at 1144 (image_available img15))
  (at 1152 (not (image_available img15)))
  (at 1407 (image_available img16))
  (at 1415 (not (image_available img16)))
  (at 1344 (image_available img17))
  (at 1352 (not (image_available img17)))
  (at 1202 (image_available img18))
  (at 1210 (not (image_available img18)))
  (at 1246 (image_available img19))
  (at 1254 (not (image_available img19)))
  (at 1361 (image_available img20))
  (at 1369 (not (image_available img20)))
  (at 1307 (image_available img21))
  (at 1315 (not (image_available img21)))
  (at 1124 (image_available img22))
  (at 1132 (not (image_available img22)))
  (at 1259 (image_available img23))
  (at 1267 (not (image_available img23)))
  (at 1139 (image_available img24))
  (at 1147 (not (image_available img24)))
  (at 1319 (image_available img25))
  (at 1327 (not (image_available img25)))
  (at 1535 (image_available img1))
  (at 1543 (not (image_available img1)))
  (at 1600 (image_available img2))
  (at 1608 (not (image_available img2)))
  (at 1683 (image_available img3))
  (at 1691 (not (image_available img3)))
  (at 1738 (image_available img4))
  (at 1746 (not (image_available img4)))
  (at 1554 (image_available img5))
  (at 1562 (not (image_available img5)))
  (at 1457 (image_available img6))
  (at 1465 (not (image_available img6)))
  (at 1681 (image_available img7))
  (at 1689 (not (image_available img7)))
  (at 1597 (image_available img8))
  (at 1605 (not (image_available img8)))
  (at 1533 (image_available img9))
  (at 1541 (not (image_available img9)))
  (at 1778 (image_available img10))
  (at 1786 (not (image_available img10)))
  (at 1587 (image_available img11))
  (at 1595 (not (image_available img11)))
  (at 1638 (image_available img12))
  (at 1646 (not (image_available img12)))
  (at 1741 (image_available img13))
  (at 1749 (not (image_available img13)))
  (at 1557 (image_available img14))
  (at 1565 (not (image_available img14)))
  (at 1504 (image_available img15))
  (at 1512 (not (image_available img15)))
  (at 1767 (image_available img16))
  (at 1775 (not (image_available img16)))
  (at 1704 (image_available img17))
  (at 1712 (not (image_available img17)))
  (at 1562 (image_available img18))
  (at 1570 (not (image_available img18)))
  (at 1606 (image_available img19))
  (at 1614 (not (image_available img19)))
  (at 1721 (image_available img20))
  (at 1729 (not (image_available img20)))
  (at 1667 (image_available img21))
  (at 1675 (not (image_available img21)))
  (at 1484 (image_available img22))
  (at 1492 (not (image_available img22)))
  (at 1619 (image_available img23))
  (at 1627 (not (image_available img23)))
  (at 1499 (image_available img24))
  (at 1507 (not (image_available img24)))
  (at 1679 (image_available img25))
  (at 1687 (not (image_available img25)))
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
  (> (image_score img12) 0)
  (<= (image_score img12) 5)

  (> (image_score img13) 0)
  (<= (image_score img13) 7)

  (> (image_score img17) 0)
  (<= (image_score img17) 8)

  (> (image_score img18) 0)
  (<= (image_score img18) 4)

(>= (total_score) 5)
))
(:metric maximize (+
  (image_score img12)
    (+ (image_score img13)
      (+ (image_score img17)
        (image_score img18)
      )
    )
  )
)
)
