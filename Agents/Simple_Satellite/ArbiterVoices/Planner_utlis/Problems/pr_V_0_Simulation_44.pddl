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



  (at 235 (image_available img1))
  (at 243 (not (image_available img1)))
  (at 79 (image_available img2))
  (at 87 (not (image_available img2)))
  (at 147 (image_available img3))
  (at 155 (not (image_available img3)))
  (at 40 (image_available img4))
  (at 48 (not (image_available img4)))
  (at 54 (image_available img5))
  (at 62 (not (image_available img5)))
  (at 328 (image_available img6))
  (at 336 (not (image_available img6)))
  (at 16 (image_available img7))
  (at 24 (not (image_available img7)))
  (at 279 (image_available img8))
  (at 287 (not (image_available img8)))
  (at 201 (image_available img9))
  (at 209 (not (image_available img9)))
  (at 220 (image_available img10))
  (at 228 (not (image_available img10)))
  (at 150 (image_available img11))
  (at 158 (not (image_available img11)))
  (at 278 (image_available img12))
  (at 286 (not (image_available img12)))
  (at 200 (image_available img13))
  (at 208 (not (image_available img13)))
  (at 255 (image_available img14))
  (at 263 (not (image_available img14)))
  (at 291 (image_available img15))
  (at 299 (not (image_available img15)))
  (at 595 (image_available img1))
  (at 603 (not (image_available img1)))
  (at 439 (image_available img2))
  (at 447 (not (image_available img2)))
  (at 507 (image_available img3))
  (at 515 (not (image_available img3)))
  (at 400 (image_available img4))
  (at 408 (not (image_available img4)))
  (at 414 (image_available img5))
  (at 422 (not (image_available img5)))
  (at 688 (image_available img6))
  (at 696 (not (image_available img6)))
  (at 376 (image_available img7))
  (at 384 (not (image_available img7)))
  (at 639 (image_available img8))
  (at 647 (not (image_available img8)))
  (at 561 (image_available img9))
  (at 569 (not (image_available img9)))
  (at 580 (image_available img10))
  (at 588 (not (image_available img10)))
  (at 510 (image_available img11))
  (at 518 (not (image_available img11)))
  (at 638 (image_available img12))
  (at 646 (not (image_available img12)))
  (at 560 (image_available img13))
  (at 568 (not (image_available img13)))
  (at 615 (image_available img14))
  (at 623 (not (image_available img14)))
  (at 651 (image_available img15))
  (at 659 (not (image_available img15)))
  (at 955 (image_available img1))
  (at 963 (not (image_available img1)))
  (at 799 (image_available img2))
  (at 807 (not (image_available img2)))
  (at 867 (image_available img3))
  (at 875 (not (image_available img3)))
  (at 760 (image_available img4))
  (at 768 (not (image_available img4)))
  (at 774 (image_available img5))
  (at 782 (not (image_available img5)))
  (at 1048 (image_available img6))
  (at 1056 (not (image_available img6)))
  (at 736 (image_available img7))
  (at 744 (not (image_available img7)))
  (at 999 (image_available img8))
  (at 1007 (not (image_available img8)))
  (at 921 (image_available img9))
  (at 929 (not (image_available img9)))
  (at 940 (image_available img10))
  (at 948 (not (image_available img10)))
  (at 870 (image_available img11))
  (at 878 (not (image_available img11)))
  (at 998 (image_available img12))
  (at 1006 (not (image_available img12)))
  (at 920 (image_available img13))
  (at 928 (not (image_available img13)))
  (at 975 (image_available img14))
  (at 983 (not (image_available img14)))
  (at 1011 (image_available img15))
  (at 1019 (not (image_available img15)))
  (at 1315 (image_available img1))
  (at 1323 (not (image_available img1)))
  (at 1159 (image_available img2))
  (at 1167 (not (image_available img2)))
  (at 1227 (image_available img3))
  (at 1235 (not (image_available img3)))
  (at 1120 (image_available img4))
  (at 1128 (not (image_available img4)))
  (at 1134 (image_available img5))
  (at 1142 (not (image_available img5)))
  (at 1408 (image_available img6))
  (at 1416 (not (image_available img6)))
  (at 1096 (image_available img7))
  (at 1104 (not (image_available img7)))
  (at 1359 (image_available img8))
  (at 1367 (not (image_available img8)))
  (at 1281 (image_available img9))
  (at 1289 (not (image_available img9)))
  (at 1300 (image_available img10))
  (at 1308 (not (image_available img10)))
  (at 1230 (image_available img11))
  (at 1238 (not (image_available img11)))
  (at 1358 (image_available img12))
  (at 1366 (not (image_available img12)))
  (at 1280 (image_available img13))
  (at 1288 (not (image_available img13)))
  (at 1335 (image_available img14))
  (at 1343 (not (image_available img14)))
  (at 1371 (image_available img15))
  (at 1379 (not (image_available img15)))
  (at 1675 (image_available img1))
  (at 1683 (not (image_available img1)))
  (at 1519 (image_available img2))
  (at 1527 (not (image_available img2)))
  (at 1587 (image_available img3))
  (at 1595 (not (image_available img3)))
  (at 1480 (image_available img4))
  (at 1488 (not (image_available img4)))
  (at 1494 (image_available img5))
  (at 1502 (not (image_available img5)))
  (at 1768 (image_available img6))
  (at 1776 (not (image_available img6)))
  (at 1456 (image_available img7))
  (at 1464 (not (image_available img7)))
  (at 1719 (image_available img8))
  (at 1727 (not (image_available img8)))
  (at 1641 (image_available img9))
  (at 1649 (not (image_available img9)))
  (at 1660 (image_available img10))
  (at 1668 (not (image_available img10)))
  (at 1590 (image_available img11))
  (at 1598 (not (image_available img11)))
  (at 1718 (image_available img12))
  (at 1726 (not (image_available img12)))
  (at 1640 (image_available img13))
  (at 1648 (not (image_available img13)))
  (at 1695 (image_available img14))
  (at 1703 (not (image_available img14)))
  (at 1731 (image_available img15))
  (at 1739 (not (image_available img15)))
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
  (<= (image_score img1) 13.0)

  (> (image_score img10) 0)
  (<= (image_score img10) 19.0)

  (> (image_score img13) 0)
  (<= (image_score img13) 3.0)

(>= (total_score) 7)
))
(:metric maximize (+
  (image_score img1)
    (+ (image_score img10)
      (image_score img13)
    )
  )
)
)
