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



  (at 123 (image_available img1))
  (at 131 (not (image_available img1)))
  (at 18 (image_available img2))
  (at 26 (not (image_available img2)))
  (at 142 (image_available img3))
  (at 150 (not (image_available img3)))
  (at 48 (image_available img4))
  (at 56 (not (image_available img4)))
  (at 76 (image_available img5))
  (at 84 (not (image_available img5)))
  (at 241 (image_available img6))
  (at 249 (not (image_available img6)))
  (at 82 (image_available img7))
  (at 90 (not (image_available img7)))
  (at 188 (image_available img8))
  (at 196 (not (image_available img8)))
  (at 112 (image_available img9))
  (at 120 (not (image_available img9)))
  (at 28 (image_available img10))
  (at 36 (not (image_available img10)))
  (at 325 (image_available img11))
  (at 333 (not (image_available img11)))
  (at 337 (image_available img12))
  (at 345 (not (image_available img12)))
  (at 192 (image_available img13))
  (at 200 (not (image_available img13)))
  (at 198 (image_available img14))
  (at 206 (not (image_available img14)))
  (at 247 (image_available img15))
  (at 255 (not (image_available img15)))
  (at 483 (image_available img1))
  (at 491 (not (image_available img1)))
  (at 378 (image_available img2))
  (at 386 (not (image_available img2)))
  (at 502 (image_available img3))
  (at 510 (not (image_available img3)))
  (at 408 (image_available img4))
  (at 416 (not (image_available img4)))
  (at 436 (image_available img5))
  (at 444 (not (image_available img5)))
  (at 601 (image_available img6))
  (at 609 (not (image_available img6)))
  (at 442 (image_available img7))
  (at 450 (not (image_available img7)))
  (at 548 (image_available img8))
  (at 556 (not (image_available img8)))
  (at 472 (image_available img9))
  (at 480 (not (image_available img9)))
  (at 388 (image_available img10))
  (at 396 (not (image_available img10)))
  (at 685 (image_available img11))
  (at 693 (not (image_available img11)))
  (at 697 (image_available img12))
  (at 705 (not (image_available img12)))
  (at 552 (image_available img13))
  (at 560 (not (image_available img13)))
  (at 558 (image_available img14))
  (at 566 (not (image_available img14)))
  (at 607 (image_available img15))
  (at 615 (not (image_available img15)))
  (at 843 (image_available img1))
  (at 851 (not (image_available img1)))
  (at 738 (image_available img2))
  (at 746 (not (image_available img2)))
  (at 862 (image_available img3))
  (at 870 (not (image_available img3)))
  (at 768 (image_available img4))
  (at 776 (not (image_available img4)))
  (at 796 (image_available img5))
  (at 804 (not (image_available img5)))
  (at 961 (image_available img6))
  (at 969 (not (image_available img6)))
  (at 802 (image_available img7))
  (at 810 (not (image_available img7)))
  (at 908 (image_available img8))
  (at 916 (not (image_available img8)))
  (at 832 (image_available img9))
  (at 840 (not (image_available img9)))
  (at 748 (image_available img10))
  (at 756 (not (image_available img10)))
  (at 1045 (image_available img11))
  (at 1053 (not (image_available img11)))
  (at 1057 (image_available img12))
  (at 1065 (not (image_available img12)))
  (at 912 (image_available img13))
  (at 920 (not (image_available img13)))
  (at 918 (image_available img14))
  (at 926 (not (image_available img14)))
  (at 967 (image_available img15))
  (at 975 (not (image_available img15)))
  (at 1203 (image_available img1))
  (at 1211 (not (image_available img1)))
  (at 1098 (image_available img2))
  (at 1106 (not (image_available img2)))
  (at 1222 (image_available img3))
  (at 1230 (not (image_available img3)))
  (at 1128 (image_available img4))
  (at 1136 (not (image_available img4)))
  (at 1156 (image_available img5))
  (at 1164 (not (image_available img5)))
  (at 1321 (image_available img6))
  (at 1329 (not (image_available img6)))
  (at 1162 (image_available img7))
  (at 1170 (not (image_available img7)))
  (at 1268 (image_available img8))
  (at 1276 (not (image_available img8)))
  (at 1192 (image_available img9))
  (at 1200 (not (image_available img9)))
  (at 1108 (image_available img10))
  (at 1116 (not (image_available img10)))
  (at 1405 (image_available img11))
  (at 1413 (not (image_available img11)))
  (at 1417 (image_available img12))
  (at 1425 (not (image_available img12)))
  (at 1272 (image_available img13))
  (at 1280 (not (image_available img13)))
  (at 1278 (image_available img14))
  (at 1286 (not (image_available img14)))
  (at 1327 (image_available img15))
  (at 1335 (not (image_available img15)))
  (at 1563 (image_available img1))
  (at 1571 (not (image_available img1)))
  (at 1458 (image_available img2))
  (at 1466 (not (image_available img2)))
  (at 1582 (image_available img3))
  (at 1590 (not (image_available img3)))
  (at 1488 (image_available img4))
  (at 1496 (not (image_available img4)))
  (at 1516 (image_available img5))
  (at 1524 (not (image_available img5)))
  (at 1681 (image_available img6))
  (at 1689 (not (image_available img6)))
  (at 1522 (image_available img7))
  (at 1530 (not (image_available img7)))
  (at 1628 (image_available img8))
  (at 1636 (not (image_available img8)))
  (at 1552 (image_available img9))
  (at 1560 (not (image_available img9)))
  (at 1468 (image_available img10))
  (at 1476 (not (image_available img10)))
  (at 1765 (image_available img11))
  (at 1773 (not (image_available img11)))
  (at 1777 (image_available img12))
  (at 1785 (not (image_available img12)))
  (at 1632 (image_available img13))
  (at 1640 (not (image_available img13)))
  (at 1638 (image_available img14))
  (at 1646 (not (image_available img14)))
  (at 1687 (image_available img15))
  (at 1695 (not (image_available img15)))
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
  (> (image_score img4) 0)
  (<= (image_score img4) 2)

  (> (image_score img5) 0)
  (<= (image_score img5) 8)

  (> (image_score img7) 0)
  (<= (image_score img7) 14)

(>= (total_score) 5)
))
(:metric maximize (+
  (image_score img4)
    (+ (image_score img5)
      (image_score img7)
    )
  )
)
)