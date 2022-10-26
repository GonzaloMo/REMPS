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



  (at 0 (image_available img1))
  (at 4 (not (image_available img1)))
  (at 93 (image_available img3))
  (at 101 (not (image_available img3)))
  (at 34 (image_available img8))
  (at 42 (not (image_available img8)))
  (at 29 (image_available img19))
  (at 37 (not (image_available img19)))
  (at 356 (image_available img1))
  (at 364 (not (image_available img1)))
  (at 205 (image_available img2))
  (at 213 (not (image_available img2)))
  (at 453 (image_available img3))
  (at 461 (not (image_available img3)))
  (at 204 (image_available img4))
  (at 212 (not (image_available img4)))
  (at 244 (image_available img5))
  (at 252 (not (image_available img5)))
  (at 154 (image_available img6))
  (at 162 (not (image_available img6)))
  (at 156 (image_available img7))
  (at 164 (not (image_available img7)))
  (at 394 (image_available img8))
  (at 402 (not (image_available img8)))
  (at 276 (image_available img9))
  (at 284 (not (image_available img9)))
  (at 184 (image_available img10))
  (at 192 (not (image_available img10)))
  (at 112 (image_available img11))
  (at 120 (not (image_available img11)))
  (at 188 (image_available img12))
  (at 196 (not (image_available img12)))
  (at 120 (image_available img13))
  (at 128 (not (image_available img13)))
  (at 125 (image_available img14))
  (at 133 (not (image_available img14)))
  (at 320 (image_available img15))
  (at 328 (not (image_available img15)))
  (at 225 (image_available img16))
  (at 233 (not (image_available img16)))
  (at 180 (image_available img17))
  (at 188 (not (image_available img17)))
  (at 253 (image_available img18))
  (at 261 (not (image_available img18)))
  (at 389 (image_available img19))
  (at 397 (not (image_available img19)))
  (at 285 (image_available img20))
  (at 293 (not (image_available img20)))
  (at 716 (image_available img1))
  (at 724 (not (image_available img1)))
  (at 565 (image_available img2))
  (at 573 (not (image_available img2)))
  (at 813 (image_available img3))
  (at 821 (not (image_available img3)))
  (at 564 (image_available img4))
  (at 572 (not (image_available img4)))
  (at 604 (image_available img5))
  (at 612 (not (image_available img5)))
  (at 514 (image_available img6))
  (at 522 (not (image_available img6)))
  (at 516 (image_available img7))
  (at 524 (not (image_available img7)))
  (at 754 (image_available img8))
  (at 762 (not (image_available img8)))
  (at 636 (image_available img9))
  (at 644 (not (image_available img9)))
  (at 544 (image_available img10))
  (at 552 (not (image_available img10)))
  (at 472 (image_available img11))
  (at 480 (not (image_available img11)))
  (at 548 (image_available img12))
  (at 556 (not (image_available img12)))
  (at 480 (image_available img13))
  (at 488 (not (image_available img13)))
  (at 485 (image_available img14))
  (at 493 (not (image_available img14)))
  (at 680 (image_available img15))
  (at 688 (not (image_available img15)))
  (at 585 (image_available img16))
  (at 593 (not (image_available img16)))
  (at 540 (image_available img17))
  (at 548 (not (image_available img17)))
  (at 613 (image_available img18))
  (at 621 (not (image_available img18)))
  (at 749 (image_available img19))
  (at 757 (not (image_available img19)))
  (at 645 (image_available img20))
  (at 653 (not (image_available img20)))
  (at 1076 (image_available img1))
  (at 1084 (not (image_available img1)))
  (at 925 (image_available img2))
  (at 933 (not (image_available img2)))
  (at 1173 (image_available img3))
  (at 1181 (not (image_available img3)))
  (at 924 (image_available img4))
  (at 932 (not (image_available img4)))
  (at 964 (image_available img5))
  (at 972 (not (image_available img5)))
  (at 874 (image_available img6))
  (at 882 (not (image_available img6)))
  (at 876 (image_available img7))
  (at 884 (not (image_available img7)))
  (at 1114 (image_available img8))
  (at 1122 (not (image_available img8)))
  (at 996 (image_available img9))
  (at 1004 (not (image_available img9)))
  (at 904 (image_available img10))
  (at 912 (not (image_available img10)))
  (at 832 (image_available img11))
  (at 840 (not (image_available img11)))
  (at 908 (image_available img12))
  (at 916 (not (image_available img12)))
  (at 840 (image_available img13))
  (at 848 (not (image_available img13)))
  (at 845 (image_available img14))
  (at 853 (not (image_available img14)))
  (at 1040 (image_available img15))
  (at 1048 (not (image_available img15)))
  (at 945 (image_available img16))
  (at 953 (not (image_available img16)))
  (at 900 (image_available img17))
  (at 908 (not (image_available img17)))
  (at 973 (image_available img18))
  (at 981 (not (image_available img18)))
  (at 1109 (image_available img19))
  (at 1117 (not (image_available img19)))
  (at 1005 (image_available img20))
  (at 1013 (not (image_available img20)))
  (at 1436 (image_available img1))
  (at 1444 (not (image_available img1)))
  (at 1285 (image_available img2))
  (at 1293 (not (image_available img2)))
  (at 1533 (image_available img3))
  (at 1541 (not (image_available img3)))
  (at 1284 (image_available img4))
  (at 1292 (not (image_available img4)))
  (at 1324 (image_available img5))
  (at 1332 (not (image_available img5)))
  (at 1234 (image_available img6))
  (at 1242 (not (image_available img6)))
  (at 1236 (image_available img7))
  (at 1244 (not (image_available img7)))
  (at 1474 (image_available img8))
  (at 1482 (not (image_available img8)))
  (at 1356 (image_available img9))
  (at 1364 (not (image_available img9)))
  (at 1264 (image_available img10))
  (at 1272 (not (image_available img10)))
  (at 1192 (image_available img11))
  (at 1200 (not (image_available img11)))
  (at 1268 (image_available img12))
  (at 1276 (not (image_available img12)))
  (at 1200 (image_available img13))
  (at 1208 (not (image_available img13)))
  (at 1205 (image_available img14))
  (at 1213 (not (image_available img14)))
  (at 1400 (image_available img15))
  (at 1408 (not (image_available img15)))
  (at 1305 (image_available img16))
  (at 1313 (not (image_available img16)))
  (at 1260 (image_available img17))
  (at 1268 (not (image_available img17)))
  (at 1333 (image_available img18))
  (at 1341 (not (image_available img18)))
  (at 1469 (image_available img19))
  (at 1477 (not (image_available img19)))
  (at 1365 (image_available img20))
  (at 1373 (not (image_available img20)))
  (at 1796 (image_available img1))
  (at 1804 (not (image_available img1)))
  (at 1645 (image_available img2))
  (at 1653 (not (image_available img2)))
  (at 1893 (image_available img3))
  (at 1901 (not (image_available img3)))
  (at 1644 (image_available img4))
  (at 1652 (not (image_available img4)))
  (at 1684 (image_available img5))
  (at 1692 (not (image_available img5)))
  (at 1594 (image_available img6))
  (at 1602 (not (image_available img6)))
  (at 1596 (image_available img7))
  (at 1604 (not (image_available img7)))
  (at 1834 (image_available img8))
  (at 1842 (not (image_available img8)))
  (at 1716 (image_available img9))
  (at 1724 (not (image_available img9)))
  (at 1624 (image_available img10))
  (at 1632 (not (image_available img10)))
  (at 1552 (image_available img11))
  (at 1560 (not (image_available img11)))
  (at 1628 (image_available img12))
  (at 1636 (not (image_available img12)))
  (at 1560 (image_available img13))
  (at 1568 (not (image_available img13)))
  (at 1565 (image_available img14))
  (at 1573 (not (image_available img14)))
  (at 1760 (image_available img15))
  (at 1768 (not (image_available img15)))
  (at 1665 (image_available img16))
  (at 1673 (not (image_available img16)))
  (at 1620 (image_available img17))
  (at 1628 (not (image_available img17)))
  (at 1693 (image_available img18))
  (at 1701 (not (image_available img18)))
  (at 1829 (image_available img19))
  (at 1837 (not (image_available img19)))
  (at 1725 (image_available img20))
  (at 1733 (not (image_available img20)))
  (at 2156 (image_available img1))
  (at 2164 (not (image_available img1)))
  (at 2005 (image_available img2))
  (at 2013 (not (image_available img2)))
  (at 2253 (image_available img3))
  (at 2261 (not (image_available img3)))
  (at 2004 (image_available img4))
  (at 2012 (not (image_available img4)))
  (at 2044 (image_available img5))
  (at 2052 (not (image_available img5)))
  (at 1954 (image_available img6))
  (at 1962 (not (image_available img6)))
  (at 1956 (image_available img7))
  (at 1964 (not (image_available img7)))
  (at 2194 (image_available img8))
  (at 2202 (not (image_available img8)))
  (at 2076 (image_available img9))
  (at 2084 (not (image_available img9)))
  (at 1984 (image_available img10))
  (at 1992 (not (image_available img10)))
  (at 1912 (image_available img11))
  (at 1920 (not (image_available img11)))
  (at 1988 (image_available img12))
  (at 1996 (not (image_available img12)))
  (at 1920 (image_available img13))
  (at 1928 (not (image_available img13)))
  (at 1925 (image_available img14))
  (at 1933 (not (image_available img14)))
  (at 2120 (image_available img15))
  (at 2128 (not (image_available img15)))
  (at 2025 (image_available img16))
  (at 2033 (not (image_available img16)))
  (at 1980 (image_available img17))
  (at 1988 (not (image_available img17)))
  (at 2053 (image_available img18))
  (at 2061 (not (image_available img18)))
  (at 2189 (image_available img19))
  (at 2197 (not (image_available img19)))
  (at 2085 (image_available img20))
  (at 2093 (not (image_available img20)))
  (at 2516 (image_available img1))
  (at 2524 (not (image_available img1)))
  (at 2365 (image_available img2))
  (at 2373 (not (image_available img2)))
  (at 2613 (image_available img3))
  (at 2621 (not (image_available img3)))
  (at 2364 (image_available img4))
  (at 2372 (not (image_available img4)))
  (at 2404 (image_available img5))
  (at 2412 (not (image_available img5)))
  (at 2314 (image_available img6))
  (at 2322 (not (image_available img6)))
  (at 2316 (image_available img7))
  (at 2324 (not (image_available img7)))
  (at 2554 (image_available img8))
  (at 2562 (not (image_available img8)))
  (at 2436 (image_available img9))
  (at 2444 (not (image_available img9)))
  (at 2344 (image_available img10))
  (at 2352 (not (image_available img10)))
  (at 2272 (image_available img11))
  (at 2280 (not (image_available img11)))
  (at 2348 (image_available img12))
  (at 2356 (not (image_available img12)))
  (at 2280 (image_available img13))
  (at 2288 (not (image_available img13)))
  (at 2285 (image_available img14))
  (at 2293 (not (image_available img14)))
  (at 2480 (image_available img15))
  (at 2488 (not (image_available img15)))
  (at 2385 (image_available img16))
  (at 2393 (not (image_available img16)))
  (at 2340 (image_available img17))
  (at 2348 (not (image_available img17)))
  (at 2413 (image_available img18))
  (at 2421 (not (image_available img18)))
  (at 2549 (image_available img19))
  (at 2557 (not (image_available img19)))
  (at 2445 (image_available img20))
  (at 2453 (not (image_available img20)))
  (at 1 (dump_available))
  (at 37.0 (not (dump_available)))
  (at 179.0 (dump_available))
  (at 217.0 (not (dump_available)))
  (at 359.0 (dump_available))
  (at 397.0 (not (dump_available)))
  (at 539.0 (dump_available))
  (at 577.0 (not (dump_available)))
  (at 719.0 (dump_available))
  (at 757.0 (not (dump_available)))
  (at 899.0 (dump_available))
  (at 937.0 (not (dump_available)))
  (at 1079.0 (dump_available))
  (at 1117.0 (not (dump_available)))
  (at 1259.0 (dump_available))
  (at 1297.0 (not (dump_available)))
  (at 1439.0 (dump_available))
  (at 1477.0 (not (dump_available)))
  (at 1619.0 (dump_available))
  (at 1657.0 (not (dump_available)))
  (at 1799.0 (dump_available))
  (at 1837.0 (not (dump_available)))
  (at 1979.0 (dump_available))
  (at 2017.0 (not (dump_available)))
  (at 2159.0 (dump_available))
  (at 2197.0 (not (dump_available)))
  (at 2339.0 (dump_available))
  (at 2377.0 (not (dump_available)))
  (at 2519.0 (dump_available))
  (at 2557.0 (not (dump_available)))

)
(:goal (and
  (> (image_score img4) 0)
  (<= (image_score img4) 1)

(>= (total_score) 1)
))
(:metric maximize 
  (image_score img4)
)
)