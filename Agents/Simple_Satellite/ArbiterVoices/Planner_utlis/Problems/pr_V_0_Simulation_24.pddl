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



  (at 249 (image_available img1))
  (at 257 (not (image_available img1)))
  (at 140 (image_available img2))
  (at 148 (not (image_available img2)))
  (at 121 (image_available img3))
  (at 129 (not (image_available img3)))
  (at 61 (image_available img4))
  (at 69 (not (image_available img4)))
  (at 75 (image_available img5))
  (at 83 (not (image_available img5)))
  (at 200 (image_available img6))
  (at 208 (not (image_available img6)))
  (at 70 (image_available img7))
  (at 78 (not (image_available img7)))
  (at 287 (image_available img8))
  (at 295 (not (image_available img8)))
  (at 26 (image_available img9))
  (at 34 (not (image_available img9)))
  (at 321 (image_available img10))
  (at 329 (not (image_available img10)))
  (at 609 (image_available img1))
  (at 617 (not (image_available img1)))
  (at 500 (image_available img2))
  (at 508 (not (image_available img2)))
  (at 481 (image_available img3))
  (at 489 (not (image_available img3)))
  (at 421 (image_available img4))
  (at 429 (not (image_available img4)))
  (at 435 (image_available img5))
  (at 443 (not (image_available img5)))
  (at 560 (image_available img6))
  (at 568 (not (image_available img6)))
  (at 430 (image_available img7))
  (at 438 (not (image_available img7)))
  (at 647 (image_available img8))
  (at 655 (not (image_available img8)))
  (at 386 (image_available img9))
  (at 394 (not (image_available img9)))
  (at 681 (image_available img10))
  (at 689 (not (image_available img10)))
  (at 969 (image_available img1))
  (at 977 (not (image_available img1)))
  (at 860 (image_available img2))
  (at 868 (not (image_available img2)))
  (at 841 (image_available img3))
  (at 849 (not (image_available img3)))
  (at 781 (image_available img4))
  (at 789 (not (image_available img4)))
  (at 795 (image_available img5))
  (at 803 (not (image_available img5)))
  (at 920 (image_available img6))
  (at 928 (not (image_available img6)))
  (at 790 (image_available img7))
  (at 798 (not (image_available img7)))
  (at 1007 (image_available img8))
  (at 1015 (not (image_available img8)))
  (at 746 (image_available img9))
  (at 754 (not (image_available img9)))
  (at 1041 (image_available img10))
  (at 1049 (not (image_available img10)))
  (at 1329 (image_available img1))
  (at 1337 (not (image_available img1)))
  (at 1220 (image_available img2))
  (at 1228 (not (image_available img2)))
  (at 1201 (image_available img3))
  (at 1209 (not (image_available img3)))
  (at 1141 (image_available img4))
  (at 1149 (not (image_available img4)))
  (at 1155 (image_available img5))
  (at 1163 (not (image_available img5)))
  (at 1280 (image_available img6))
  (at 1288 (not (image_available img6)))
  (at 1150 (image_available img7))
  (at 1158 (not (image_available img7)))
  (at 1367 (image_available img8))
  (at 1375 (not (image_available img8)))
  (at 1106 (image_available img9))
  (at 1114 (not (image_available img9)))
  (at 1401 (image_available img10))
  (at 1409 (not (image_available img10)))
  (at 1689 (image_available img1))
  (at 1697 (not (image_available img1)))
  (at 1580 (image_available img2))
  (at 1588 (not (image_available img2)))
  (at 1561 (image_available img3))
  (at 1569 (not (image_available img3)))
  (at 1501 (image_available img4))
  (at 1509 (not (image_available img4)))
  (at 1515 (image_available img5))
  (at 1523 (not (image_available img5)))
  (at 1640 (image_available img6))
  (at 1648 (not (image_available img6)))
  (at 1510 (image_available img7))
  (at 1518 (not (image_available img7)))
  (at 1727 (image_available img8))
  (at 1735 (not (image_available img8)))
  (at 1466 (image_available img9))
  (at 1474 (not (image_available img9)))
  (at 1761 (image_available img10))
  (at 1769 (not (image_available img10)))
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
  (<= (image_score img2) 8)

  (> (image_score img4) 0)
  (<= (image_score img4) 16)

  (> (image_score img5) 0)
  (<= (image_score img5) 4)

  (> (image_score img8) 0)
  (<= (image_score img8) 10)

  (> (image_score img10) 0)
  (<= (image_score img10) 5)

(>= (total_score) 9)
))
(:metric maximize (+
  (image_score img2)
    (+ (image_score img4)
      (+ (image_score img5)
        (+ (image_score img8)
          (image_score img10)
        )
      )
    )
  )
)
)