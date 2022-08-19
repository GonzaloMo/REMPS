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

  (memory_free mem1)
  (memory_free mem2)
  (memory_free mem3)
  (memory_free mem4)
  (memory_free mem5)
  (memory_free mem6)
  (memory_free mem7)
  (memory_free mem8)
  (memory_free mem9)

   (memory_taken mem0 img7)

(image_analysed mem0 img7)

  (at 97 (image_available img1))
  (at 105 (not (image_available img1)))
  (at 258 (image_available img2))
  (at 266 (not (image_available img2)))
  (at 84 (image_available img3))
  (at 92 (not (image_available img3)))
  (at 133 (image_available img5))
  (at 141 (not (image_available img5)))
  (at 208 (image_available img6))
  (at 216 (not (image_available img6)))
  (at 41 (image_available img7))
  (at 49 (not (image_available img7)))
  (at 136 (image_available img8))
  (at 144 (not (image_available img8)))
  (at 45 (image_available img9))
  (at 53 (not (image_available img9)))
  (at 457 (image_available img1))
  (at 465 (not (image_available img1)))
  (at 618 (image_available img2))
  (at 626 (not (image_available img2)))
  (at 444 (image_available img3))
  (at 452 (not (image_available img3)))
  (at 308 (image_available img4))
  (at 316 (not (image_available img4)))
  (at 493 (image_available img5))
  (at 501 (not (image_available img5)))
  (at 568 (image_available img6))
  (at 576 (not (image_available img6)))
  (at 401 (image_available img7))
  (at 409 (not (image_available img7)))
  (at 496 (image_available img8))
  (at 504 (not (image_available img8)))
  (at 405 (image_available img9))
  (at 413 (not (image_available img9)))
  (at 305 (image_available img10))
  (at 313 (not (image_available img10)))
  (at 817 (image_available img1))
  (at 825 (not (image_available img1)))
  (at 978 (image_available img2))
  (at 986 (not (image_available img2)))
  (at 804 (image_available img3))
  (at 812 (not (image_available img3)))
  (at 668 (image_available img4))
  (at 676 (not (image_available img4)))
  (at 853 (image_available img5))
  (at 861 (not (image_available img5)))
  (at 928 (image_available img6))
  (at 936 (not (image_available img6)))
  (at 761 (image_available img7))
  (at 769 (not (image_available img7)))
  (at 856 (image_available img8))
  (at 864 (not (image_available img8)))
  (at 765 (image_available img9))
  (at 773 (not (image_available img9)))
  (at 665 (image_available img10))
  (at 673 (not (image_available img10)))
  (at 1177 (image_available img1))
  (at 1185 (not (image_available img1)))
  (at 1338 (image_available img2))
  (at 1346 (not (image_available img2)))
  (at 1164 (image_available img3))
  (at 1172 (not (image_available img3)))
  (at 1028 (image_available img4))
  (at 1036 (not (image_available img4)))
  (at 1213 (image_available img5))
  (at 1221 (not (image_available img5)))
  (at 1288 (image_available img6))
  (at 1296 (not (image_available img6)))
  (at 1121 (image_available img7))
  (at 1129 (not (image_available img7)))
  (at 1216 (image_available img8))
  (at 1224 (not (image_available img8)))
  (at 1125 (image_available img9))
  (at 1133 (not (image_available img9)))
  (at 1025 (image_available img10))
  (at 1033 (not (image_available img10)))
  (at 1537 (image_available img1))
  (at 1545 (not (image_available img1)))
  (at 1698 (image_available img2))
  (at 1706 (not (image_available img2)))
  (at 1524 (image_available img3))
  (at 1532 (not (image_available img3)))
  (at 1388 (image_available img4))
  (at 1396 (not (image_available img4)))
  (at 1573 (image_available img5))
  (at 1581 (not (image_available img5)))
  (at 1648 (image_available img6))
  (at 1656 (not (image_available img6)))
  (at 1481 (image_available img7))
  (at 1489 (not (image_available img7)))
  (at 1576 (image_available img8))
  (at 1584 (not (image_available img8)))
  (at 1485 (image_available img9))
  (at 1493 (not (image_available img9)))
  (at 1385 (image_available img10))
  (at 1393 (not (image_available img10)))
  (at 1 (dump_available))
  (at 36.0 (not (dump_available)))
  (at 178.0 (dump_available))
  (at 216.0 (not (dump_available)))
  (at 358.0 (dump_available))
  (at 396.0 (not (dump_available)))
  (at 538.0 (dump_available))
  (at 576.0 (not (dump_available)))
  (at 718.0 (dump_available))
  (at 756.0 (not (dump_available)))
  (at 898.0 (dump_available))
  (at 936.0 (not (dump_available)))
  (at 1078.0 (dump_available))
  (at 1116.0 (not (dump_available)))
  (at 1258.0 (dump_available))
  (at 1296.0 (not (dump_available)))
  (at 1438.0 (dump_available))
  (at 1476.0 (not (dump_available)))
  (at 1618.0 (dump_available))
  (at 1656.0 (not (dump_available)))

)
(:goal (and
  (> (image_score img4) 0)
  (<= (image_score img4) 7)

  (> (image_score img5) 0)
  (<= (image_score img5) 13)

  (> (image_score img8) 0)
  (<= (image_score img8) 4)

  (> (image_score img9) 0)
  (<= (image_score img9) 5)

(>= (total_score) 6)
))
(:metric maximize (+
  (image_score img4)
    (+ (image_score img5)
      (+ (image_score img8)
        (image_score img9)
      )
    )
  )
)
)
