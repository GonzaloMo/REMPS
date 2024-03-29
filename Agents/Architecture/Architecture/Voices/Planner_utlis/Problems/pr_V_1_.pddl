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



  (at 22 (image_available img1))
  (at 30 (not (image_available img1)))
  (at 315 (image_available img2))
  (at 323 (not (image_available img2)))
  (at 22 (image_available img3))
  (at 30 (not (image_available img3)))
  (at 186 (image_available img4))
  (at 194 (not (image_available img4)))
  (at 23 (image_available img5))
  (at 31 (not (image_available img5)))
  (at 108 (image_available img6))
  (at 116 (not (image_available img6)))
  (at 117 (image_available img7))
  (at 125 (not (image_available img7)))
  (at 25 (image_available img8))
  (at 33 (not (image_available img8)))
  (at 347 (image_available img9))
  (at 355 (not (image_available img9)))
  (at 89 (image_available img10))
  (at 97 (not (image_available img10)))
  (at 382 (image_available img1))
  (at 390 (not (image_available img1)))
  (at 675 (image_available img2))
  (at 683 (not (image_available img2)))
  (at 382 (image_available img3))
  (at 390 (not (image_available img3)))
  (at 546 (image_available img4))
  (at 554 (not (image_available img4)))
  (at 383 (image_available img5))
  (at 391 (not (image_available img5)))
  (at 468 (image_available img6))
  (at 476 (not (image_available img6)))
  (at 477 (image_available img7))
  (at 485 (not (image_available img7)))
  (at 385 (image_available img8))
  (at 393 (not (image_available img8)))
  (at 707 (image_available img9))
  (at 715 (not (image_available img9)))
  (at 449 (image_available img10))
  (at 457 (not (image_available img10)))
  (at 742 (image_available img1))
  (at 750 (not (image_available img1)))
  (at 1035 (image_available img2))
  (at 1043 (not (image_available img2)))
  (at 742 (image_available img3))
  (at 750 (not (image_available img3)))
  (at 906 (image_available img4))
  (at 914 (not (image_available img4)))
  (at 743 (image_available img5))
  (at 751 (not (image_available img5)))
  (at 828 (image_available img6))
  (at 836 (not (image_available img6)))
  (at 837 (image_available img7))
  (at 845 (not (image_available img7)))
  (at 745 (image_available img8))
  (at 753 (not (image_available img8)))
  (at 1067 (image_available img9))
  (at 1075 (not (image_available img9)))
  (at 809 (image_available img10))
  (at 817 (not (image_available img10)))
  (at 1102 (image_available img1))
  (at 1110 (not (image_available img1)))
  (at 1395 (image_available img2))
  (at 1403 (not (image_available img2)))
  (at 1102 (image_available img3))
  (at 1110 (not (image_available img3)))
  (at 1266 (image_available img4))
  (at 1274 (not (image_available img4)))
  (at 1103 (image_available img5))
  (at 1111 (not (image_available img5)))
  (at 1188 (image_available img6))
  (at 1196 (not (image_available img6)))
  (at 1197 (image_available img7))
  (at 1205 (not (image_available img7)))
  (at 1105 (image_available img8))
  (at 1113 (not (image_available img8)))
  (at 1427 (image_available img9))
  (at 1435 (not (image_available img9)))
  (at 1169 (image_available img10))
  (at 1177 (not (image_available img10)))
  (at 1462 (image_available img1))
  (at 1470 (not (image_available img1)))
  (at 1755 (image_available img2))
  (at 1763 (not (image_available img2)))
  (at 1462 (image_available img3))
  (at 1470 (not (image_available img3)))
  (at 1626 (image_available img4))
  (at 1634 (not (image_available img4)))
  (at 1463 (image_available img5))
  (at 1471 (not (image_available img5)))
  (at 1548 (image_available img6))
  (at 1556 (not (image_available img6)))
  (at 1557 (image_available img7))
  (at 1565 (not (image_available img7)))
  (at 1465 (image_available img8))
  (at 1473 (not (image_available img8)))
  (at 1787 (image_available img9))
  (at 1795 (not (image_available img9)))
  (at 1529 (image_available img10))
  (at 1537 (not (image_available img10)))
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
  (<= (image_score img2) 5.0)

  (> (image_score img6) 0)
  (<= (image_score img6) 18.0)

  (> (image_score img7) 0)
  (<= (image_score img7) 7.0)

(>= (total_score) 6)
))
(:metric maximize (+
  (image_score img2)
    (+ (image_score img6)
      (image_score img7)
    )
  )
)
)
