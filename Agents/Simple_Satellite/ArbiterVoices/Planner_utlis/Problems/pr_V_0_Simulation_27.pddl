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



  (at 59 (image_available img1))
  (at 67 (not (image_available img1)))
  (at 107 (image_available img2))
  (at 115 (not (image_available img2)))
  (at 11 (image_available img3))
  (at 19 (not (image_available img3)))
  (at 239 (image_available img4))
  (at 247 (not (image_available img4)))
  (at 73 (image_available img5))
  (at 81 (not (image_available img5)))
  (at 129 (image_available img6))
  (at 137 (not (image_available img6)))
  (at 166 (image_available img7))
  (at 174 (not (image_available img7)))
  (at 337 (image_available img8))
  (at 345 (not (image_available img8)))
  (at 307 (image_available img9))
  (at 315 (not (image_available img9)))
  (at 213 (image_available img10))
  (at 221 (not (image_available img10)))
  (at 419 (image_available img1))
  (at 427 (not (image_available img1)))
  (at 467 (image_available img2))
  (at 475 (not (image_available img2)))
  (at 371 (image_available img3))
  (at 379 (not (image_available img3)))
  (at 599 (image_available img4))
  (at 607 (not (image_available img4)))
  (at 433 (image_available img5))
  (at 441 (not (image_available img5)))
  (at 489 (image_available img6))
  (at 497 (not (image_available img6)))
  (at 526 (image_available img7))
  (at 534 (not (image_available img7)))
  (at 697 (image_available img8))
  (at 705 (not (image_available img8)))
  (at 667 (image_available img9))
  (at 675 (not (image_available img9)))
  (at 573 (image_available img10))
  (at 581 (not (image_available img10)))
  (at 779 (image_available img1))
  (at 787 (not (image_available img1)))
  (at 827 (image_available img2))
  (at 835 (not (image_available img2)))
  (at 731 (image_available img3))
  (at 739 (not (image_available img3)))
  (at 959 (image_available img4))
  (at 967 (not (image_available img4)))
  (at 793 (image_available img5))
  (at 801 (not (image_available img5)))
  (at 849 (image_available img6))
  (at 857 (not (image_available img6)))
  (at 886 (image_available img7))
  (at 894 (not (image_available img7)))
  (at 1057 (image_available img8))
  (at 1065 (not (image_available img8)))
  (at 1027 (image_available img9))
  (at 1035 (not (image_available img9)))
  (at 933 (image_available img10))
  (at 941 (not (image_available img10)))
  (at 1139 (image_available img1))
  (at 1147 (not (image_available img1)))
  (at 1187 (image_available img2))
  (at 1195 (not (image_available img2)))
  (at 1091 (image_available img3))
  (at 1099 (not (image_available img3)))
  (at 1319 (image_available img4))
  (at 1327 (not (image_available img4)))
  (at 1153 (image_available img5))
  (at 1161 (not (image_available img5)))
  (at 1209 (image_available img6))
  (at 1217 (not (image_available img6)))
  (at 1246 (image_available img7))
  (at 1254 (not (image_available img7)))
  (at 1417 (image_available img8))
  (at 1425 (not (image_available img8)))
  (at 1387 (image_available img9))
  (at 1395 (not (image_available img9)))
  (at 1293 (image_available img10))
  (at 1301 (not (image_available img10)))
  (at 1499 (image_available img1))
  (at 1507 (not (image_available img1)))
  (at 1547 (image_available img2))
  (at 1555 (not (image_available img2)))
  (at 1451 (image_available img3))
  (at 1459 (not (image_available img3)))
  (at 1679 (image_available img4))
  (at 1687 (not (image_available img4)))
  (at 1513 (image_available img5))
  (at 1521 (not (image_available img5)))
  (at 1569 (image_available img6))
  (at 1577 (not (image_available img6)))
  (at 1606 (image_available img7))
  (at 1614 (not (image_available img7)))
  (at 1777 (image_available img8))
  (at 1785 (not (image_available img8)))
  (at 1747 (image_available img9))
  (at 1755 (not (image_available img9)))
  (at 1653 (image_available img10))
  (at 1661 (not (image_available img10)))
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
  (<= (image_score img4) 3)

  (> (image_score img6) 0)
  (<= (image_score img6) 12)

  (> (image_score img7) 0)
  (<= (image_score img7) 15)

  (> (image_score img10) 0)
  (<= (image_score img10) 11)

(>= (total_score) 9)
))
(:metric maximize (+
  (image_score img4)
    (+ (image_score img6)
      (+ (image_score img7)
        (image_score img10)
      )
    )
  )
)
)
