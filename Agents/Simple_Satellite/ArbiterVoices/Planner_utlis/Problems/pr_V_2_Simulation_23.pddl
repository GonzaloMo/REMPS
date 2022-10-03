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



  (at 316 (image_available img1))
  (at 324 (not (image_available img1)))
  (at 235 (image_available img2))
  (at 243 (not (image_available img2)))
  (at 213 (image_available img3))
  (at 221 (not (image_available img3)))
  (at 159 (image_available img4))
  (at 167 (not (image_available img4)))
  (at 213 (image_available img5))
  (at 221 (not (image_available img5)))
  (at 249 (image_available img6))
  (at 257 (not (image_available img6)))
  (at 139 (image_available img7))
  (at 147 (not (image_available img7)))
  (at 160 (image_available img8))
  (at 168 (not (image_available img8)))
  (at 242 (image_available img9))
  (at 250 (not (image_available img9)))
  (at 116 (image_available img10))
  (at 124 (not (image_available img10)))
  (at 676 (image_available img1))
  (at 684 (not (image_available img1)))
  (at 595 (image_available img2))
  (at 603 (not (image_available img2)))
  (at 573 (image_available img3))
  (at 581 (not (image_available img3)))
  (at 519 (image_available img4))
  (at 527 (not (image_available img4)))
  (at 573 (image_available img5))
  (at 581 (not (image_available img5)))
  (at 609 (image_available img6))
  (at 617 (not (image_available img6)))
  (at 499 (image_available img7))
  (at 507 (not (image_available img7)))
  (at 520 (image_available img8))
  (at 528 (not (image_available img8)))
  (at 602 (image_available img9))
  (at 610 (not (image_available img9)))
  (at 476 (image_available img10))
  (at 484 (not (image_available img10)))
  (at 1036 (image_available img1))
  (at 1044 (not (image_available img1)))
  (at 955 (image_available img2))
  (at 963 (not (image_available img2)))
  (at 933 (image_available img3))
  (at 941 (not (image_available img3)))
  (at 879 (image_available img4))
  (at 887 (not (image_available img4)))
  (at 933 (image_available img5))
  (at 941 (not (image_available img5)))
  (at 969 (image_available img6))
  (at 977 (not (image_available img6)))
  (at 859 (image_available img7))
  (at 867 (not (image_available img7)))
  (at 880 (image_available img8))
  (at 888 (not (image_available img8)))
  (at 962 (image_available img9))
  (at 970 (not (image_available img9)))
  (at 836 (image_available img10))
  (at 844 (not (image_available img10)))
  (at 1396 (image_available img1))
  (at 1404 (not (image_available img1)))
  (at 1315 (image_available img2))
  (at 1323 (not (image_available img2)))
  (at 1293 (image_available img3))
  (at 1301 (not (image_available img3)))
  (at 1239 (image_available img4))
  (at 1247 (not (image_available img4)))
  (at 1293 (image_available img5))
  (at 1301 (not (image_available img5)))
  (at 1329 (image_available img6))
  (at 1337 (not (image_available img6)))
  (at 1219 (image_available img7))
  (at 1227 (not (image_available img7)))
  (at 1240 (image_available img8))
  (at 1248 (not (image_available img8)))
  (at 1322 (image_available img9))
  (at 1330 (not (image_available img9)))
  (at 1196 (image_available img10))
  (at 1204 (not (image_available img10)))
  (at 1756 (image_available img1))
  (at 1764 (not (image_available img1)))
  (at 1675 (image_available img2))
  (at 1683 (not (image_available img2)))
  (at 1653 (image_available img3))
  (at 1661 (not (image_available img3)))
  (at 1599 (image_available img4))
  (at 1607 (not (image_available img4)))
  (at 1653 (image_available img5))
  (at 1661 (not (image_available img5)))
  (at 1689 (image_available img6))
  (at 1697 (not (image_available img6)))
  (at 1579 (image_available img7))
  (at 1587 (not (image_available img7)))
  (at 1600 (image_available img8))
  (at 1608 (not (image_available img8)))
  (at 1682 (image_available img9))
  (at 1690 (not (image_available img9)))
  (at 1556 (image_available img10))
  (at 1564 (not (image_available img10)))
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
  (<= (image_score img2) 15.0)

  (> (image_score img8) 0)
  (<= (image_score img8) 13.0)

  (> (image_score img9) 0)
  (<= (image_score img9) 10.0)

(>= (total_score) 8)
))
(:metric maximize (+
  (image_score img2)
    (+ (image_score img8)
      (image_score img9)
    )
  )
)
)
