(define(problem satprob)
(:domain SimpleSatellite)
(:objects
  mem0 mem1 mem2 mem3 mem4 mem5 mem6 mem7 mem8 mem9 - memory
 img1 img2 img3 img4 img5 img6 img7 img8 img9 img10 img11 img12 img13 img14 img15 - image
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



  (at 243 (image_available img1))
  (at 251 (not (image_available img1)))
  (at 295 (image_available img2))
  (at 303 (not (image_available img2)))
  (at 84 (image_available img3))
  (at 92 (not (image_available img3)))
  (at 114 (image_available img4))
  (at 122 (not (image_available img4)))
  (at 150 (image_available img5))
  (at 158 (not (image_available img5)))
  (at 158 (image_available img6))
  (at 166 (not (image_available img6)))
  (at 147 (image_available img7))
  (at 155 (not (image_available img7)))
  (at 196 (image_available img8))
  (at 204 (not (image_available img8)))
  (at 302 (image_available img9))
  (at 310 (not (image_available img9)))
  (at 252 (image_available img10))
  (at 260 (not (image_available img10)))
  (at 307 (image_available img11))
  (at 315 (not (image_available img11)))
  (at 306 (image_available img12))
  (at 314 (not (image_available img12)))
  (at 283 (image_available img13))
  (at 291 (not (image_available img13)))
  (at 38 (image_available img14))
  (at 46 (not (image_available img14)))
  (at 37 (image_available img15))
  (at 45 (not (image_available img15)))
  (at 603 (image_available img1))
  (at 611 (not (image_available img1)))
  (at 655 (image_available img2))
  (at 663 (not (image_available img2)))
  (at 444 (image_available img3))
  (at 452 (not (image_available img3)))
  (at 474 (image_available img4))
  (at 482 (not (image_available img4)))
  (at 510 (image_available img5))
  (at 518 (not (image_available img5)))
  (at 518 (image_available img6))
  (at 526 (not (image_available img6)))
  (at 507 (image_available img7))
  (at 515 (not (image_available img7)))
  (at 556 (image_available img8))
  (at 564 (not (image_available img8)))
  (at 662 (image_available img9))
  (at 670 (not (image_available img9)))
  (at 612 (image_available img10))
  (at 620 (not (image_available img10)))
  (at 667 (image_available img11))
  (at 675 (not (image_available img11)))
  (at 666 (image_available img12))
  (at 674 (not (image_available img12)))
  (at 643 (image_available img13))
  (at 651 (not (image_available img13)))
  (at 398 (image_available img14))
  (at 406 (not (image_available img14)))
  (at 397 (image_available img15))
  (at 405 (not (image_available img15)))
  (at 963 (image_available img1))
  (at 971 (not (image_available img1)))
  (at 1015 (image_available img2))
  (at 1023 (not (image_available img2)))
  (at 804 (image_available img3))
  (at 812 (not (image_available img3)))
  (at 834 (image_available img4))
  (at 842 (not (image_available img4)))
  (at 870 (image_available img5))
  (at 878 (not (image_available img5)))
  (at 878 (image_available img6))
  (at 886 (not (image_available img6)))
  (at 867 (image_available img7))
  (at 875 (not (image_available img7)))
  (at 916 (image_available img8))
  (at 924 (not (image_available img8)))
  (at 1022 (image_available img9))
  (at 1030 (not (image_available img9)))
  (at 972 (image_available img10))
  (at 980 (not (image_available img10)))
  (at 1027 (image_available img11))
  (at 1035 (not (image_available img11)))
  (at 1026 (image_available img12))
  (at 1034 (not (image_available img12)))
  (at 1003 (image_available img13))
  (at 1011 (not (image_available img13)))
  (at 758 (image_available img14))
  (at 766 (not (image_available img14)))
  (at 757 (image_available img15))
  (at 765 (not (image_available img15)))
  (at 1323 (image_available img1))
  (at 1331 (not (image_available img1)))
  (at 1375 (image_available img2))
  (at 1383 (not (image_available img2)))
  (at 1164 (image_available img3))
  (at 1172 (not (image_available img3)))
  (at 1194 (image_available img4))
  (at 1202 (not (image_available img4)))
  (at 1230 (image_available img5))
  (at 1238 (not (image_available img5)))
  (at 1238 (image_available img6))
  (at 1246 (not (image_available img6)))
  (at 1227 (image_available img7))
  (at 1235 (not (image_available img7)))
  (at 1276 (image_available img8))
  (at 1284 (not (image_available img8)))
  (at 1382 (image_available img9))
  (at 1390 (not (image_available img9)))
  (at 1332 (image_available img10))
  (at 1340 (not (image_available img10)))
  (at 1387 (image_available img11))
  (at 1395 (not (image_available img11)))
  (at 1386 (image_available img12))
  (at 1394 (not (image_available img12)))
  (at 1363 (image_available img13))
  (at 1371 (not (image_available img13)))
  (at 1118 (image_available img14))
  (at 1126 (not (image_available img14)))
  (at 1117 (image_available img15))
  (at 1125 (not (image_available img15)))
  (at 1683 (image_available img1))
  (at 1691 (not (image_available img1)))
  (at 1735 (image_available img2))
  (at 1743 (not (image_available img2)))
  (at 1524 (image_available img3))
  (at 1532 (not (image_available img3)))
  (at 1554 (image_available img4))
  (at 1562 (not (image_available img4)))
  (at 1590 (image_available img5))
  (at 1598 (not (image_available img5)))
  (at 1598 (image_available img6))
  (at 1606 (not (image_available img6)))
  (at 1587 (image_available img7))
  (at 1595 (not (image_available img7)))
  (at 1636 (image_available img8))
  (at 1644 (not (image_available img8)))
  (at 1742 (image_available img9))
  (at 1750 (not (image_available img9)))
  (at 1692 (image_available img10))
  (at 1700 (not (image_available img10)))
  (at 1747 (image_available img11))
  (at 1755 (not (image_available img11)))
  (at 1746 (image_available img12))
  (at 1754 (not (image_available img12)))
  (at 1723 (image_available img13))
  (at 1731 (not (image_available img13)))
  (at 1478 (image_available img14))
  (at 1486 (not (image_available img14)))
  (at 1477 (image_available img15))
  (at 1485 (not (image_available img15)))
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
  (<= (image_score img3) 15)

  (> (image_score img6) 0)
  (<= (image_score img6) 14)

  (> (image_score img7) 0)
  (<= (image_score img7) 10)

  (> (image_score img11) 0)
  (<= (image_score img11) 11)

  (> (image_score img12) 0)
  (<= (image_score img12) 12)

  (> (image_score img13) 0)
  (<= (image_score img13) 17)

(>= (total_score) 16)
))
(:metric maximize (+
  (image_score img3)
    (+ (image_score img6)
      (+ (image_score img7)
        (+ (image_score img11)
          (+ (image_score img12)
            (image_score img13)
          )
        )
      )
    )
  )
)
)