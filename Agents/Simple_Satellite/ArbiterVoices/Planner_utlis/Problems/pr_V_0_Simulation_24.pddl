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



  (at 282 (image_available img1))
  (at 290 (not (image_available img1)))
  (at 96 (image_available img2))
  (at 104 (not (image_available img2)))
  (at 87 (image_available img3))
  (at 95 (not (image_available img3)))
  (at 278 (image_available img4))
  (at 286 (not (image_available img4)))
  (at 37 (image_available img5))
  (at 45 (not (image_available img5)))
  (at 91 (image_available img6))
  (at 99 (not (image_available img6)))
  (at 349 (image_available img7))
  (at 357 (not (image_available img7)))
  (at 345 (image_available img8))
  (at 353 (not (image_available img8)))
  (at 293 (image_available img9))
  (at 301 (not (image_available img9)))
  (at 35 (image_available img10))
  (at 43 (not (image_available img10)))
  (at 642 (image_available img1))
  (at 650 (not (image_available img1)))
  (at 456 (image_available img2))
  (at 464 (not (image_available img2)))
  (at 447 (image_available img3))
  (at 455 (not (image_available img3)))
  (at 638 (image_available img4))
  (at 646 (not (image_available img4)))
  (at 397 (image_available img5))
  (at 405 (not (image_available img5)))
  (at 451 (image_available img6))
  (at 459 (not (image_available img6)))
  (at 709 (image_available img7))
  (at 717 (not (image_available img7)))
  (at 705 (image_available img8))
  (at 713 (not (image_available img8)))
  (at 653 (image_available img9))
  (at 661 (not (image_available img9)))
  (at 395 (image_available img10))
  (at 403 (not (image_available img10)))
  (at 1002 (image_available img1))
  (at 1010 (not (image_available img1)))
  (at 816 (image_available img2))
  (at 824 (not (image_available img2)))
  (at 807 (image_available img3))
  (at 815 (not (image_available img3)))
  (at 998 (image_available img4))
  (at 1006 (not (image_available img4)))
  (at 757 (image_available img5))
  (at 765 (not (image_available img5)))
  (at 811 (image_available img6))
  (at 819 (not (image_available img6)))
  (at 1069 (image_available img7))
  (at 1077 (not (image_available img7)))
  (at 1065 (image_available img8))
  (at 1073 (not (image_available img8)))
  (at 1013 (image_available img9))
  (at 1021 (not (image_available img9)))
  (at 755 (image_available img10))
  (at 763 (not (image_available img10)))
  (at 1362 (image_available img1))
  (at 1370 (not (image_available img1)))
  (at 1176 (image_available img2))
  (at 1184 (not (image_available img2)))
  (at 1167 (image_available img3))
  (at 1175 (not (image_available img3)))
  (at 1358 (image_available img4))
  (at 1366 (not (image_available img4)))
  (at 1117 (image_available img5))
  (at 1125 (not (image_available img5)))
  (at 1171 (image_available img6))
  (at 1179 (not (image_available img6)))
  (at 1429 (image_available img7))
  (at 1437 (not (image_available img7)))
  (at 1425 (image_available img8))
  (at 1433 (not (image_available img8)))
  (at 1373 (image_available img9))
  (at 1381 (not (image_available img9)))
  (at 1115 (image_available img10))
  (at 1123 (not (image_available img10)))
  (at 1722 (image_available img1))
  (at 1730 (not (image_available img1)))
  (at 1536 (image_available img2))
  (at 1544 (not (image_available img2)))
  (at 1527 (image_available img3))
  (at 1535 (not (image_available img3)))
  (at 1718 (image_available img4))
  (at 1726 (not (image_available img4)))
  (at 1477 (image_available img5))
  (at 1485 (not (image_available img5)))
  (at 1531 (image_available img6))
  (at 1539 (not (image_available img6)))
  (at 1789 (image_available img7))
  (at 1797 (not (image_available img7)))
  (at 1785 (image_available img8))
  (at 1793 (not (image_available img8)))
  (at 1733 (image_available img9))
  (at 1741 (not (image_available img9)))
  (at 1475 (image_available img10))
  (at 1483 (not (image_available img10)))
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
  (<= (image_score img1) 14.0)

  (> (image_score img8) 0)
  (<= (image_score img8) 10.0)

(>= (total_score) 5)
))
(:metric maximize (+
  (image_score img1)
    (image_score img8)
  )
)
)
