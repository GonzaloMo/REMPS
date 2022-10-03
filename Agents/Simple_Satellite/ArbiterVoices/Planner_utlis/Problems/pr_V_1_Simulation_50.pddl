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



  (at 48 (image_available img1))
  (at 56 (not (image_available img1)))
  (at 130 (image_available img2))
  (at 138 (not (image_available img2)))
  (at 206 (image_available img3))
  (at 214 (not (image_available img3)))
  (at 64 (image_available img4))
  (at 72 (not (image_available img4)))
  (at 175 (image_available img5))
  (at 183 (not (image_available img5)))
  (at 282 (image_available img6))
  (at 290 (not (image_available img6)))
  (at 3 (image_available img7))
  (at 11 (not (image_available img7)))
  (at 290 (image_available img8))
  (at 298 (not (image_available img8)))
  (at 296 (image_available img9))
  (at 304 (not (image_available img9)))
  (at 342 (image_available img10))
  (at 350 (not (image_available img10)))
  (at 312 (image_available img11))
  (at 320 (not (image_available img11)))
  (at 251 (image_available img12))
  (at 259 (not (image_available img12)))
  (at 142 (image_available img13))
  (at 150 (not (image_available img13)))
  (at 235 (image_available img14))
  (at 243 (not (image_available img14)))
  (at 48 (image_available img15))
  (at 56 (not (image_available img15)))
  (at 239 (image_available img16))
  (at 247 (not (image_available img16)))
  (at 71 (image_available img17))
  (at 79 (not (image_available img17)))
  (at 347 (image_available img18))
  (at 355 (not (image_available img18)))
  (at 27 (image_available img19))
  (at 35 (not (image_available img19)))
  (at 194 (image_available img20))
  (at 202 (not (image_available img20)))
  (at 408 (image_available img1))
  (at 416 (not (image_available img1)))
  (at 490 (image_available img2))
  (at 498 (not (image_available img2)))
  (at 566 (image_available img3))
  (at 574 (not (image_available img3)))
  (at 424 (image_available img4))
  (at 432 (not (image_available img4)))
  (at 535 (image_available img5))
  (at 543 (not (image_available img5)))
  (at 642 (image_available img6))
  (at 650 (not (image_available img6)))
  (at 363 (image_available img7))
  (at 371 (not (image_available img7)))
  (at 650 (image_available img8))
  (at 658 (not (image_available img8)))
  (at 656 (image_available img9))
  (at 664 (not (image_available img9)))
  (at 702 (image_available img10))
  (at 710 (not (image_available img10)))
  (at 672 (image_available img11))
  (at 680 (not (image_available img11)))
  (at 611 (image_available img12))
  (at 619 (not (image_available img12)))
  (at 502 (image_available img13))
  (at 510 (not (image_available img13)))
  (at 595 (image_available img14))
  (at 603 (not (image_available img14)))
  (at 408 (image_available img15))
  (at 416 (not (image_available img15)))
  (at 599 (image_available img16))
  (at 607 (not (image_available img16)))
  (at 431 (image_available img17))
  (at 439 (not (image_available img17)))
  (at 707 (image_available img18))
  (at 715 (not (image_available img18)))
  (at 387 (image_available img19))
  (at 395 (not (image_available img19)))
  (at 554 (image_available img20))
  (at 562 (not (image_available img20)))
  (at 768 (image_available img1))
  (at 776 (not (image_available img1)))
  (at 850 (image_available img2))
  (at 858 (not (image_available img2)))
  (at 926 (image_available img3))
  (at 934 (not (image_available img3)))
  (at 784 (image_available img4))
  (at 792 (not (image_available img4)))
  (at 895 (image_available img5))
  (at 903 (not (image_available img5)))
  (at 1002 (image_available img6))
  (at 1010 (not (image_available img6)))
  (at 723 (image_available img7))
  (at 731 (not (image_available img7)))
  (at 1010 (image_available img8))
  (at 1018 (not (image_available img8)))
  (at 1016 (image_available img9))
  (at 1024 (not (image_available img9)))
  (at 1062 (image_available img10))
  (at 1070 (not (image_available img10)))
  (at 1032 (image_available img11))
  (at 1040 (not (image_available img11)))
  (at 971 (image_available img12))
  (at 979 (not (image_available img12)))
  (at 862 (image_available img13))
  (at 870 (not (image_available img13)))
  (at 955 (image_available img14))
  (at 963 (not (image_available img14)))
  (at 768 (image_available img15))
  (at 776 (not (image_available img15)))
  (at 959 (image_available img16))
  (at 967 (not (image_available img16)))
  (at 791 (image_available img17))
  (at 799 (not (image_available img17)))
  (at 1067 (image_available img18))
  (at 1075 (not (image_available img18)))
  (at 747 (image_available img19))
  (at 755 (not (image_available img19)))
  (at 914 (image_available img20))
  (at 922 (not (image_available img20)))
  (at 1128 (image_available img1))
  (at 1136 (not (image_available img1)))
  (at 1210 (image_available img2))
  (at 1218 (not (image_available img2)))
  (at 1286 (image_available img3))
  (at 1294 (not (image_available img3)))
  (at 1144 (image_available img4))
  (at 1152 (not (image_available img4)))
  (at 1255 (image_available img5))
  (at 1263 (not (image_available img5)))
  (at 1362 (image_available img6))
  (at 1370 (not (image_available img6)))
  (at 1083 (image_available img7))
  (at 1091 (not (image_available img7)))
  (at 1370 (image_available img8))
  (at 1378 (not (image_available img8)))
  (at 1376 (image_available img9))
  (at 1384 (not (image_available img9)))
  (at 1422 (image_available img10))
  (at 1430 (not (image_available img10)))
  (at 1392 (image_available img11))
  (at 1400 (not (image_available img11)))
  (at 1331 (image_available img12))
  (at 1339 (not (image_available img12)))
  (at 1222 (image_available img13))
  (at 1230 (not (image_available img13)))
  (at 1315 (image_available img14))
  (at 1323 (not (image_available img14)))
  (at 1128 (image_available img15))
  (at 1136 (not (image_available img15)))
  (at 1319 (image_available img16))
  (at 1327 (not (image_available img16)))
  (at 1151 (image_available img17))
  (at 1159 (not (image_available img17)))
  (at 1427 (image_available img18))
  (at 1435 (not (image_available img18)))
  (at 1107 (image_available img19))
  (at 1115 (not (image_available img19)))
  (at 1274 (image_available img20))
  (at 1282 (not (image_available img20)))
  (at 1488 (image_available img1))
  (at 1496 (not (image_available img1)))
  (at 1570 (image_available img2))
  (at 1578 (not (image_available img2)))
  (at 1646 (image_available img3))
  (at 1654 (not (image_available img3)))
  (at 1504 (image_available img4))
  (at 1512 (not (image_available img4)))
  (at 1615 (image_available img5))
  (at 1623 (not (image_available img5)))
  (at 1722 (image_available img6))
  (at 1730 (not (image_available img6)))
  (at 1443 (image_available img7))
  (at 1451 (not (image_available img7)))
  (at 1730 (image_available img8))
  (at 1738 (not (image_available img8)))
  (at 1736 (image_available img9))
  (at 1744 (not (image_available img9)))
  (at 1782 (image_available img10))
  (at 1790 (not (image_available img10)))
  (at 1752 (image_available img11))
  (at 1760 (not (image_available img11)))
  (at 1691 (image_available img12))
  (at 1699 (not (image_available img12)))
  (at 1582 (image_available img13))
  (at 1590 (not (image_available img13)))
  (at 1675 (image_available img14))
  (at 1683 (not (image_available img14)))
  (at 1488 (image_available img15))
  (at 1496 (not (image_available img15)))
  (at 1679 (image_available img16))
  (at 1687 (not (image_available img16)))
  (at 1511 (image_available img17))
  (at 1519 (not (image_available img17)))
  (at 1787 (image_available img18))
  (at 1795 (not (image_available img18)))
  (at 1467 (image_available img19))
  (at 1475 (not (image_available img19)))
  (at 1634 (image_available img20))
  (at 1642 (not (image_available img20)))
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
  (> (image_score img3) 0)
  (<= (image_score img3) 6)

  (> (image_score img4) 0)
  (<= (image_score img4) 9)

  (> (image_score img8) 0)
  (<= (image_score img8) 6)

  (> (image_score img12) 0)
  (<= (image_score img12) 2)

  (> (image_score img18) 0)
  (<= (image_score img18) 2)

(>= (total_score) 5)
))
(:metric maximize (+
  (image_score img3)
    (+ (image_score img4)
      (+ (image_score img8)
        (+ (image_score img12)
          (image_score img18)
        )
      )
    )
  )
)
)
