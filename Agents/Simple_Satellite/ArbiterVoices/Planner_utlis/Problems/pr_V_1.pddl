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



  (at 172 (image_available img1))
  (at 180 (not (image_available img1)))
  (at 341 (image_available img2))
  (at 349 (not (image_available img2)))
  (at 152 (image_available img3))
  (at 160 (not (image_available img3)))
  (at 118 (image_available img4))
  (at 126 (not (image_available img4)))
  (at 181 (image_available img5))
  (at 189 (not (image_available img5)))
  (at 258 (image_available img6))
  (at 266 (not (image_available img6)))
  (at 123 (image_available img7))
  (at 131 (not (image_available img7)))
  (at 115 (image_available img8))
  (at 123 (not (image_available img8)))
  (at 98 (image_available img9))
  (at 106 (not (image_available img9)))
  (at 349 (image_available img10))
  (at 357 (not (image_available img10)))
  (at 532 (image_available img1))
  (at 540 (not (image_available img1)))
  (at 701 (image_available img2))
  (at 709 (not (image_available img2)))
  (at 512 (image_available img3))
  (at 520 (not (image_available img3)))
  (at 478 (image_available img4))
  (at 486 (not (image_available img4)))
  (at 541 (image_available img5))
  (at 549 (not (image_available img5)))
  (at 618 (image_available img6))
  (at 626 (not (image_available img6)))
  (at 483 (image_available img7))
  (at 491 (not (image_available img7)))
  (at 475 (image_available img8))
  (at 483 (not (image_available img8)))
  (at 458 (image_available img9))
  (at 466 (not (image_available img9)))
  (at 709 (image_available img10))
  (at 717 (not (image_available img10)))
  (at 892 (image_available img1))
  (at 900 (not (image_available img1)))
  (at 1061 (image_available img2))
  (at 1069 (not (image_available img2)))
  (at 872 (image_available img3))
  (at 880 (not (image_available img3)))
  (at 838 (image_available img4))
  (at 846 (not (image_available img4)))
  (at 901 (image_available img5))
  (at 909 (not (image_available img5)))
  (at 978 (image_available img6))
  (at 986 (not (image_available img6)))
  (at 843 (image_available img7))
  (at 851 (not (image_available img7)))
  (at 835 (image_available img8))
  (at 843 (not (image_available img8)))
  (at 818 (image_available img9))
  (at 826 (not (image_available img9)))
  (at 1069 (image_available img10))
  (at 1077 (not (image_available img10)))
  (at 1252 (image_available img1))
  (at 1260 (not (image_available img1)))
  (at 1421 (image_available img2))
  (at 1429 (not (image_available img2)))
  (at 1232 (image_available img3))
  (at 1240 (not (image_available img3)))
  (at 1198 (image_available img4))
  (at 1206 (not (image_available img4)))
  (at 1261 (image_available img5))
  (at 1269 (not (image_available img5)))
  (at 1338 (image_available img6))
  (at 1346 (not (image_available img6)))
  (at 1203 (image_available img7))
  (at 1211 (not (image_available img7)))
  (at 1195 (image_available img8))
  (at 1203 (not (image_available img8)))
  (at 1178 (image_available img9))
  (at 1186 (not (image_available img9)))
  (at 1429 (image_available img10))
  (at 1437 (not (image_available img10)))
  (at 1612 (image_available img1))
  (at 1620 (not (image_available img1)))
  (at 1781 (image_available img2))
  (at 1789 (not (image_available img2)))
  (at 1592 (image_available img3))
  (at 1600 (not (image_available img3)))
  (at 1558 (image_available img4))
  (at 1566 (not (image_available img4)))
  (at 1621 (image_available img5))
  (at 1629 (not (image_available img5)))
  (at 1698 (image_available img6))
  (at 1706 (not (image_available img6)))
  (at 1563 (image_available img7))
  (at 1571 (not (image_available img7)))
  (at 1555 (image_available img8))
  (at 1563 (not (image_available img8)))
  (at 1538 (image_available img9))
  (at 1546 (not (image_available img9)))
  (at 1789 (image_available img10))
  (at 1797 (not (image_available img10)))
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
  (>= (image_score img2) 0)
  (<= (image_score img2) 10)

  (>= (image_score img3) 0)
  (<= (image_score img3) 17)

  (>= (image_score img4) 0)
  (<= (image_score img4) 10)

  (>= (image_score img7) 0)
  (<= (image_score img7) 13)

(>= (total_score) 10)
))
(:metric maximize (+
  (image_score img2)
    (+ (image_score img3)
      (+ (image_score img4)
        (image_score img7)
      )
    )
  )
)
)
