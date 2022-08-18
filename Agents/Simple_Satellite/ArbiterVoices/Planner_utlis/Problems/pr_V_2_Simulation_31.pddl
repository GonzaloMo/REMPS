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



  (at 145 (image_available img1))
  (at 153 (not (image_available img1)))
  (at 189 (image_available img2))
  (at 197 (not (image_available img2)))
  (at 59 (image_available img3))
  (at 67 (not (image_available img3)))
  (at 302 (image_available img4))
  (at 310 (not (image_available img4)))
  (at 161 (image_available img5))
  (at 169 (not (image_available img5)))
  (at 39 (image_available img6))
  (at 47 (not (image_available img6)))
  (at 337 (image_available img7))
  (at 345 (not (image_available img7)))
  (at 185 (image_available img8))
  (at 193 (not (image_available img8)))
  (at 305 (image_available img9))
  (at 313 (not (image_available img9)))
  (at 170 (image_available img10))
  (at 178 (not (image_available img10)))
  (at 505 (image_available img1))
  (at 513 (not (image_available img1)))
  (at 549 (image_available img2))
  (at 557 (not (image_available img2)))
  (at 419 (image_available img3))
  (at 427 (not (image_available img3)))
  (at 662 (image_available img4))
  (at 670 (not (image_available img4)))
  (at 521 (image_available img5))
  (at 529 (not (image_available img5)))
  (at 399 (image_available img6))
  (at 407 (not (image_available img6)))
  (at 697 (image_available img7))
  (at 705 (not (image_available img7)))
  (at 545 (image_available img8))
  (at 553 (not (image_available img8)))
  (at 665 (image_available img9))
  (at 673 (not (image_available img9)))
  (at 530 (image_available img10))
  (at 538 (not (image_available img10)))
  (at 865 (image_available img1))
  (at 873 (not (image_available img1)))
  (at 909 (image_available img2))
  (at 917 (not (image_available img2)))
  (at 779 (image_available img3))
  (at 787 (not (image_available img3)))
  (at 1022 (image_available img4))
  (at 1030 (not (image_available img4)))
  (at 881 (image_available img5))
  (at 889 (not (image_available img5)))
  (at 759 (image_available img6))
  (at 767 (not (image_available img6)))
  (at 1057 (image_available img7))
  (at 1065 (not (image_available img7)))
  (at 905 (image_available img8))
  (at 913 (not (image_available img8)))
  (at 1025 (image_available img9))
  (at 1033 (not (image_available img9)))
  (at 890 (image_available img10))
  (at 898 (not (image_available img10)))
  (at 1225 (image_available img1))
  (at 1233 (not (image_available img1)))
  (at 1269 (image_available img2))
  (at 1277 (not (image_available img2)))
  (at 1139 (image_available img3))
  (at 1147 (not (image_available img3)))
  (at 1382 (image_available img4))
  (at 1390 (not (image_available img4)))
  (at 1241 (image_available img5))
  (at 1249 (not (image_available img5)))
  (at 1119 (image_available img6))
  (at 1127 (not (image_available img6)))
  (at 1417 (image_available img7))
  (at 1425 (not (image_available img7)))
  (at 1265 (image_available img8))
  (at 1273 (not (image_available img8)))
  (at 1385 (image_available img9))
  (at 1393 (not (image_available img9)))
  (at 1250 (image_available img10))
  (at 1258 (not (image_available img10)))
  (at 1585 (image_available img1))
  (at 1593 (not (image_available img1)))
  (at 1629 (image_available img2))
  (at 1637 (not (image_available img2)))
  (at 1499 (image_available img3))
  (at 1507 (not (image_available img3)))
  (at 1742 (image_available img4))
  (at 1750 (not (image_available img4)))
  (at 1601 (image_available img5))
  (at 1609 (not (image_available img5)))
  (at 1479 (image_available img6))
  (at 1487 (not (image_available img6)))
  (at 1777 (image_available img7))
  (at 1785 (not (image_available img7)))
  (at 1625 (image_available img8))
  (at 1633 (not (image_available img8)))
  (at 1745 (image_available img9))
  (at 1753 (not (image_available img9)))
  (at 1610 (image_available img10))
  (at 1618 (not (image_available img10)))
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
  (<= (image_score img1) 14)

  (> (image_score img5) 0)
  (<= (image_score img5) 4)

  (> (image_score img6) 0)
  (<= (image_score img6) 15)

  (> (image_score img7) 0)
  (<= (image_score img7) 14)

  (> (image_score img8) 0)
  (<= (image_score img8) 6)

  (> (image_score img9) 0)
  (<= (image_score img9) 12)

(>= (total_score) 13)
))
(:metric maximize (+
  (image_score img1)
    (+ (image_score img5)
      (+ (image_score img6)
        (+ (image_score img7)
          (+ (image_score img8)
            (image_score img9)
          )
        )
      )
    )
  )
)
)
