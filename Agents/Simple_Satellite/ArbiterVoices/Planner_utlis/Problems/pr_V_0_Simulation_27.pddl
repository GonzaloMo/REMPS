(define(problem satprob)
(:domain SimpleSatellite)
(:objects
  mem0 mem1 mem2 mem3 mem4 mem5 mem6 mem7 mem8 mem9 - memory
 img1 img2 img3 img4 img5 img6 img7 img8 img9 img10 - image
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



  (at 36 (image_available img1))
  (at 44 (not (image_available img1)))
  (at 297 (image_available img2))
  (at 305 (not (image_available img2)))
  (at 25 (image_available img3))
  (at 33 (not (image_available img3)))
  (at 213 (image_available img4))
  (at 221 (not (image_available img4)))
  (at 342 (image_available img5))
  (at 350 (not (image_available img5)))
  (at 159 (image_available img6))
  (at 167 (not (image_available img6)))
  (at 296 (image_available img7))
  (at 304 (not (image_available img7)))
  (at 325 (image_available img8))
  (at 333 (not (image_available img8)))
  (at 274 (image_available img9))
  (at 282 (not (image_available img9)))
  (at 290 (image_available img10))
  (at 298 (not (image_available img10)))
  (at 396 (image_available img1))
  (at 404 (not (image_available img1)))
  (at 657 (image_available img2))
  (at 665 (not (image_available img2)))
  (at 385 (image_available img3))
  (at 393 (not (image_available img3)))
  (at 573 (image_available img4))
  (at 581 (not (image_available img4)))
  (at 702 (image_available img5))
  (at 710 (not (image_available img5)))
  (at 519 (image_available img6))
  (at 527 (not (image_available img6)))
  (at 656 (image_available img7))
  (at 664 (not (image_available img7)))
  (at 685 (image_available img8))
  (at 693 (not (image_available img8)))
  (at 634 (image_available img9))
  (at 642 (not (image_available img9)))
  (at 650 (image_available img10))
  (at 658 (not (image_available img10)))
  (at 756 (image_available img1))
  (at 764 (not (image_available img1)))
  (at 1017 (image_available img2))
  (at 1025 (not (image_available img2)))
  (at 745 (image_available img3))
  (at 753 (not (image_available img3)))
  (at 933 (image_available img4))
  (at 941 (not (image_available img4)))
  (at 1062 (image_available img5))
  (at 1070 (not (image_available img5)))
  (at 879 (image_available img6))
  (at 887 (not (image_available img6)))
  (at 1016 (image_available img7))
  (at 1024 (not (image_available img7)))
  (at 1045 (image_available img8))
  (at 1053 (not (image_available img8)))
  (at 994 (image_available img9))
  (at 1002 (not (image_available img9)))
  (at 1010 (image_available img10))
  (at 1018 (not (image_available img10)))
  (at 1116 (image_available img1))
  (at 1124 (not (image_available img1)))
  (at 1377 (image_available img2))
  (at 1385 (not (image_available img2)))
  (at 1105 (image_available img3))
  (at 1113 (not (image_available img3)))
  (at 1293 (image_available img4))
  (at 1301 (not (image_available img4)))
  (at 1422 (image_available img5))
  (at 1430 (not (image_available img5)))
  (at 1239 (image_available img6))
  (at 1247 (not (image_available img6)))
  (at 1376 (image_available img7))
  (at 1384 (not (image_available img7)))
  (at 1405 (image_available img8))
  (at 1413 (not (image_available img8)))
  (at 1354 (image_available img9))
  (at 1362 (not (image_available img9)))
  (at 1370 (image_available img10))
  (at 1378 (not (image_available img10)))
  (at 1476 (image_available img1))
  (at 1484 (not (image_available img1)))
  (at 1737 (image_available img2))
  (at 1745 (not (image_available img2)))
  (at 1465 (image_available img3))
  (at 1473 (not (image_available img3)))
  (at 1653 (image_available img4))
  (at 1661 (not (image_available img4)))
  (at 1782 (image_available img5))
  (at 1790 (not (image_available img5)))
  (at 1599 (image_available img6))
  (at 1607 (not (image_available img6)))
  (at 1736 (image_available img7))
  (at 1744 (not (image_available img7)))
  (at 1765 (image_available img8))
  (at 1773 (not (image_available img8)))
  (at 1714 (image_available img9))
  (at 1722 (not (image_available img9)))
  (at 1730 (image_available img10))
  (at 1738 (not (image_available img10)))
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
  (<= (image_score img2) 5)

  (> (image_score img5) 0)
  (<= (image_score img5) 12)

  (> (image_score img7) 0)
  (<= (image_score img7) 6)

  (> (image_score img8) 0)
  (<= (image_score img8) 10)

  (> (image_score img10) 0)
  (<= (image_score img10) 1)

(>= (total_score) 7)
))
(:metric maximize (+
  (image_score img2)
    (+ (image_score img5)
      (+ (image_score img7)
        (+ (image_score img8)
          (image_score img10)
        )
      )
    )
  )
)
)
