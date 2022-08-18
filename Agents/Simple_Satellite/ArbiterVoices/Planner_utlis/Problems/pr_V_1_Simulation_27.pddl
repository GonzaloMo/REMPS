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



  (at 39 (image_available img1))
  (at 47 (not (image_available img1)))
  (at 55 (image_available img2))
  (at 63 (not (image_available img2)))
  (at 218 (image_available img3))
  (at 226 (not (image_available img3)))
  (at 105 (image_available img4))
  (at 113 (not (image_available img4)))
  (at 53 (image_available img5))
  (at 61 (not (image_available img5)))
  (at 196 (image_available img6))
  (at 204 (not (image_available img6)))
  (at 303 (image_available img7))
  (at 311 (not (image_available img7)))
  (at 64 (image_available img8))
  (at 72 (not (image_available img8)))
  (at 231 (image_available img9))
  (at 239 (not (image_available img9)))
  (at 146 (image_available img10))
  (at 154 (not (image_available img10)))
  (at 399 (image_available img1))
  (at 407 (not (image_available img1)))
  (at 415 (image_available img2))
  (at 423 (not (image_available img2)))
  (at 578 (image_available img3))
  (at 586 (not (image_available img3)))
  (at 465 (image_available img4))
  (at 473 (not (image_available img4)))
  (at 413 (image_available img5))
  (at 421 (not (image_available img5)))
  (at 556 (image_available img6))
  (at 564 (not (image_available img6)))
  (at 663 (image_available img7))
  (at 671 (not (image_available img7)))
  (at 424 (image_available img8))
  (at 432 (not (image_available img8)))
  (at 591 (image_available img9))
  (at 599 (not (image_available img9)))
  (at 506 (image_available img10))
  (at 514 (not (image_available img10)))
  (at 759 (image_available img1))
  (at 767 (not (image_available img1)))
  (at 775 (image_available img2))
  (at 783 (not (image_available img2)))
  (at 938 (image_available img3))
  (at 946 (not (image_available img3)))
  (at 825 (image_available img4))
  (at 833 (not (image_available img4)))
  (at 773 (image_available img5))
  (at 781 (not (image_available img5)))
  (at 916 (image_available img6))
  (at 924 (not (image_available img6)))
  (at 1023 (image_available img7))
  (at 1031 (not (image_available img7)))
  (at 784 (image_available img8))
  (at 792 (not (image_available img8)))
  (at 951 (image_available img9))
  (at 959 (not (image_available img9)))
  (at 866 (image_available img10))
  (at 874 (not (image_available img10)))
  (at 1119 (image_available img1))
  (at 1127 (not (image_available img1)))
  (at 1135 (image_available img2))
  (at 1143 (not (image_available img2)))
  (at 1298 (image_available img3))
  (at 1306 (not (image_available img3)))
  (at 1185 (image_available img4))
  (at 1193 (not (image_available img4)))
  (at 1133 (image_available img5))
  (at 1141 (not (image_available img5)))
  (at 1276 (image_available img6))
  (at 1284 (not (image_available img6)))
  (at 1383 (image_available img7))
  (at 1391 (not (image_available img7)))
  (at 1144 (image_available img8))
  (at 1152 (not (image_available img8)))
  (at 1311 (image_available img9))
  (at 1319 (not (image_available img9)))
  (at 1226 (image_available img10))
  (at 1234 (not (image_available img10)))
  (at 1479 (image_available img1))
  (at 1487 (not (image_available img1)))
  (at 1495 (image_available img2))
  (at 1503 (not (image_available img2)))
  (at 1658 (image_available img3))
  (at 1666 (not (image_available img3)))
  (at 1545 (image_available img4))
  (at 1553 (not (image_available img4)))
  (at 1493 (image_available img5))
  (at 1501 (not (image_available img5)))
  (at 1636 (image_available img6))
  (at 1644 (not (image_available img6)))
  (at 1743 (image_available img7))
  (at 1751 (not (image_available img7)))
  (at 1504 (image_available img8))
  (at 1512 (not (image_available img8)))
  (at 1671 (image_available img9))
  (at 1679 (not (image_available img9)))
  (at 1586 (image_available img10))
  (at 1594 (not (image_available img10)))
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
  (<= (image_score img1) 3)

  (> (image_score img6) 0)
  (<= (image_score img6) 2)

  (> (image_score img8) 0)
  (<= (image_score img8) 7)

  (> (image_score img9) 0)
  (<= (image_score img9) 5)

  (> (image_score img10) 0)
  (<= (image_score img10) 3)

(>= (total_score) 4)
))
(:metric maximize (+
  (image_score img1)
    (+ (image_score img6)
      (+ (image_score img8)
        (+ (image_score img9)
          (image_score img10)
        )
      )
    )
  )
)
)
