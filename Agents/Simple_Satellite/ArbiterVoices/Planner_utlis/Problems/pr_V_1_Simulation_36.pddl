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



  (at 50 (image_available img1))
  (at 58 (not (image_available img1)))
  (at 92 (image_available img2))
  (at 100 (not (image_available img2)))
  (at 213 (image_available img3))
  (at 221 (not (image_available img3)))
  (at 282 (image_available img4))
  (at 290 (not (image_available img4)))
  (at 58 (image_available img5))
  (at 66 (not (image_available img5)))
  (at 67 (image_available img6))
  (at 75 (not (image_available img6)))
  (at 4 (image_available img7))
  (at 12 (not (image_available img7)))
  (at 70 (image_available img8))
  (at 78 (not (image_available img8)))
  (at 13 (image_available img9))
  (at 21 (not (image_available img9)))
  (at 268 (image_available img10))
  (at 276 (not (image_available img10)))
  (at 267 (image_available img11))
  (at 275 (not (image_available img11)))
  (at 118 (image_available img12))
  (at 126 (not (image_available img12)))
  (at 53 (image_available img13))
  (at 61 (not (image_available img13)))
  (at 279 (image_available img14))
  (at 287 (not (image_available img14)))
  (at 250 (image_available img15))
  (at 258 (not (image_available img15)))
  (at 410 (image_available img1))
  (at 418 (not (image_available img1)))
  (at 452 (image_available img2))
  (at 460 (not (image_available img2)))
  (at 573 (image_available img3))
  (at 581 (not (image_available img3)))
  (at 642 (image_available img4))
  (at 650 (not (image_available img4)))
  (at 418 (image_available img5))
  (at 426 (not (image_available img5)))
  (at 427 (image_available img6))
  (at 435 (not (image_available img6)))
  (at 364 (image_available img7))
  (at 372 (not (image_available img7)))
  (at 430 (image_available img8))
  (at 438 (not (image_available img8)))
  (at 373 (image_available img9))
  (at 381 (not (image_available img9)))
  (at 628 (image_available img10))
  (at 636 (not (image_available img10)))
  (at 627 (image_available img11))
  (at 635 (not (image_available img11)))
  (at 478 (image_available img12))
  (at 486 (not (image_available img12)))
  (at 413 (image_available img13))
  (at 421 (not (image_available img13)))
  (at 639 (image_available img14))
  (at 647 (not (image_available img14)))
  (at 610 (image_available img15))
  (at 618 (not (image_available img15)))
  (at 770 (image_available img1))
  (at 778 (not (image_available img1)))
  (at 812 (image_available img2))
  (at 820 (not (image_available img2)))
  (at 933 (image_available img3))
  (at 941 (not (image_available img3)))
  (at 1002 (image_available img4))
  (at 1010 (not (image_available img4)))
  (at 778 (image_available img5))
  (at 786 (not (image_available img5)))
  (at 787 (image_available img6))
  (at 795 (not (image_available img6)))
  (at 724 (image_available img7))
  (at 732 (not (image_available img7)))
  (at 790 (image_available img8))
  (at 798 (not (image_available img8)))
  (at 733 (image_available img9))
  (at 741 (not (image_available img9)))
  (at 988 (image_available img10))
  (at 996 (not (image_available img10)))
  (at 987 (image_available img11))
  (at 995 (not (image_available img11)))
  (at 838 (image_available img12))
  (at 846 (not (image_available img12)))
  (at 773 (image_available img13))
  (at 781 (not (image_available img13)))
  (at 999 (image_available img14))
  (at 1007 (not (image_available img14)))
  (at 970 (image_available img15))
  (at 978 (not (image_available img15)))
  (at 1130 (image_available img1))
  (at 1138 (not (image_available img1)))
  (at 1172 (image_available img2))
  (at 1180 (not (image_available img2)))
  (at 1293 (image_available img3))
  (at 1301 (not (image_available img3)))
  (at 1362 (image_available img4))
  (at 1370 (not (image_available img4)))
  (at 1138 (image_available img5))
  (at 1146 (not (image_available img5)))
  (at 1147 (image_available img6))
  (at 1155 (not (image_available img6)))
  (at 1084 (image_available img7))
  (at 1092 (not (image_available img7)))
  (at 1150 (image_available img8))
  (at 1158 (not (image_available img8)))
  (at 1093 (image_available img9))
  (at 1101 (not (image_available img9)))
  (at 1348 (image_available img10))
  (at 1356 (not (image_available img10)))
  (at 1347 (image_available img11))
  (at 1355 (not (image_available img11)))
  (at 1198 (image_available img12))
  (at 1206 (not (image_available img12)))
  (at 1133 (image_available img13))
  (at 1141 (not (image_available img13)))
  (at 1359 (image_available img14))
  (at 1367 (not (image_available img14)))
  (at 1330 (image_available img15))
  (at 1338 (not (image_available img15)))
  (at 1490 (image_available img1))
  (at 1498 (not (image_available img1)))
  (at 1532 (image_available img2))
  (at 1540 (not (image_available img2)))
  (at 1653 (image_available img3))
  (at 1661 (not (image_available img3)))
  (at 1722 (image_available img4))
  (at 1730 (not (image_available img4)))
  (at 1498 (image_available img5))
  (at 1506 (not (image_available img5)))
  (at 1507 (image_available img6))
  (at 1515 (not (image_available img6)))
  (at 1444 (image_available img7))
  (at 1452 (not (image_available img7)))
  (at 1510 (image_available img8))
  (at 1518 (not (image_available img8)))
  (at 1453 (image_available img9))
  (at 1461 (not (image_available img9)))
  (at 1708 (image_available img10))
  (at 1716 (not (image_available img10)))
  (at 1707 (image_available img11))
  (at 1715 (not (image_available img11)))
  (at 1558 (image_available img12))
  (at 1566 (not (image_available img12)))
  (at 1493 (image_available img13))
  (at 1501 (not (image_available img13)))
  (at 1719 (image_available img14))
  (at 1727 (not (image_available img14)))
  (at 1690 (image_available img15))
  (at 1698 (not (image_available img15)))
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
  (<= (image_score img3) 2)

  (> (image_score img11) 0)
  (<= (image_score img11) 13)

  (> (image_score img14) 0)
  (<= (image_score img14) 9)

(>= (total_score) 5)
))
(:metric maximize (+
  (image_score img3)
    (+ (image_score img11)
      (image_score img14)
    )
  )
)
)
