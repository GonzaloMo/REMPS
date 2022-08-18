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



  (at 127 (image_available img1))
  (at 135 (not (image_available img1)))
  (at 123 (image_available img2))
  (at 131 (not (image_available img2)))
  (at 82 (image_available img3))
  (at 90 (not (image_available img3)))
  (at 44 (image_available img4))
  (at 52 (not (image_available img4)))
  (at 102 (image_available img5))
  (at 110 (not (image_available img5)))
  (at 234 (image_available img6))
  (at 242 (not (image_available img6)))
  (at 244 (image_available img7))
  (at 252 (not (image_available img7)))
  (at 14 (image_available img8))
  (at 22 (not (image_available img8)))
  (at 187 (image_available img9))
  (at 195 (not (image_available img9)))
  (at 179 (image_available img10))
  (at 187 (not (image_available img10)))
  (at 487 (image_available img1))
  (at 495 (not (image_available img1)))
  (at 483 (image_available img2))
  (at 491 (not (image_available img2)))
  (at 442 (image_available img3))
  (at 450 (not (image_available img3)))
  (at 404 (image_available img4))
  (at 412 (not (image_available img4)))
  (at 462 (image_available img5))
  (at 470 (not (image_available img5)))
  (at 594 (image_available img6))
  (at 602 (not (image_available img6)))
  (at 604 (image_available img7))
  (at 612 (not (image_available img7)))
  (at 374 (image_available img8))
  (at 382 (not (image_available img8)))
  (at 547 (image_available img9))
  (at 555 (not (image_available img9)))
  (at 539 (image_available img10))
  (at 547 (not (image_available img10)))
  (at 847 (image_available img1))
  (at 855 (not (image_available img1)))
  (at 843 (image_available img2))
  (at 851 (not (image_available img2)))
  (at 802 (image_available img3))
  (at 810 (not (image_available img3)))
  (at 764 (image_available img4))
  (at 772 (not (image_available img4)))
  (at 822 (image_available img5))
  (at 830 (not (image_available img5)))
  (at 954 (image_available img6))
  (at 962 (not (image_available img6)))
  (at 964 (image_available img7))
  (at 972 (not (image_available img7)))
  (at 734 (image_available img8))
  (at 742 (not (image_available img8)))
  (at 907 (image_available img9))
  (at 915 (not (image_available img9)))
  (at 899 (image_available img10))
  (at 907 (not (image_available img10)))
  (at 1207 (image_available img1))
  (at 1215 (not (image_available img1)))
  (at 1203 (image_available img2))
  (at 1211 (not (image_available img2)))
  (at 1162 (image_available img3))
  (at 1170 (not (image_available img3)))
  (at 1124 (image_available img4))
  (at 1132 (not (image_available img4)))
  (at 1182 (image_available img5))
  (at 1190 (not (image_available img5)))
  (at 1314 (image_available img6))
  (at 1322 (not (image_available img6)))
  (at 1324 (image_available img7))
  (at 1332 (not (image_available img7)))
  (at 1094 (image_available img8))
  (at 1102 (not (image_available img8)))
  (at 1267 (image_available img9))
  (at 1275 (not (image_available img9)))
  (at 1259 (image_available img10))
  (at 1267 (not (image_available img10)))
  (at 1567 (image_available img1))
  (at 1575 (not (image_available img1)))
  (at 1563 (image_available img2))
  (at 1571 (not (image_available img2)))
  (at 1522 (image_available img3))
  (at 1530 (not (image_available img3)))
  (at 1484 (image_available img4))
  (at 1492 (not (image_available img4)))
  (at 1542 (image_available img5))
  (at 1550 (not (image_available img5)))
  (at 1674 (image_available img6))
  (at 1682 (not (image_available img6)))
  (at 1684 (image_available img7))
  (at 1692 (not (image_available img7)))
  (at 1454 (image_available img8))
  (at 1462 (not (image_available img8)))
  (at 1627 (image_available img9))
  (at 1635 (not (image_available img9)))
  (at 1619 (image_available img10))
  (at 1627 (not (image_available img10)))
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
  (<= (image_score img4) 19)

  (> (image_score img5) 0)
  (<= (image_score img5) 4)

  (> (image_score img7) 0)
  (<= (image_score img7) 20)

  (> (image_score img8) 0)
  (<= (image_score img8) 7)

  (> (image_score img9) 0)
  (<= (image_score img9) 16)

  (> (image_score img10) 0)
  (<= (image_score img10) 9)

(>= (total_score) 15)
))
(:metric maximize (+
  (image_score img4)
    (+ (image_score img5)
      (+ (image_score img7)
        (+ (image_score img8)
          (+ (image_score img9)
            (image_score img10)
          )
        )
      )
    )
  )
)
)
