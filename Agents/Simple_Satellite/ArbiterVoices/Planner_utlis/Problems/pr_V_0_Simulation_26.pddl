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



  (at 23 (image_available img1))
  (at 31 (not (image_available img1)))
  (at 285 (image_available img2))
  (at 293 (not (image_available img2)))
  (at 140 (image_available img3))
  (at 148 (not (image_available img3)))
  (at 198 (image_available img4))
  (at 206 (not (image_available img4)))
  (at 281 (image_available img5))
  (at 289 (not (image_available img5)))
  (at 34 (image_available img6))
  (at 42 (not (image_available img6)))
  (at 339 (image_available img7))
  (at 347 (not (image_available img7)))
  (at 186 (image_available img8))
  (at 194 (not (image_available img8)))
  (at 203 (image_available img9))
  (at 211 (not (image_available img9)))
  (at 73 (image_available img10))
  (at 81 (not (image_available img10)))
  (at 383 (image_available img1))
  (at 391 (not (image_available img1)))
  (at 645 (image_available img2))
  (at 653 (not (image_available img2)))
  (at 500 (image_available img3))
  (at 508 (not (image_available img3)))
  (at 558 (image_available img4))
  (at 566 (not (image_available img4)))
  (at 641 (image_available img5))
  (at 649 (not (image_available img5)))
  (at 394 (image_available img6))
  (at 402 (not (image_available img6)))
  (at 699 (image_available img7))
  (at 707 (not (image_available img7)))
  (at 546 (image_available img8))
  (at 554 (not (image_available img8)))
  (at 563 (image_available img9))
  (at 571 (not (image_available img9)))
  (at 433 (image_available img10))
  (at 441 (not (image_available img10)))
  (at 743 (image_available img1))
  (at 751 (not (image_available img1)))
  (at 1005 (image_available img2))
  (at 1013 (not (image_available img2)))
  (at 860 (image_available img3))
  (at 868 (not (image_available img3)))
  (at 918 (image_available img4))
  (at 926 (not (image_available img4)))
  (at 1001 (image_available img5))
  (at 1009 (not (image_available img5)))
  (at 754 (image_available img6))
  (at 762 (not (image_available img6)))
  (at 1059 (image_available img7))
  (at 1067 (not (image_available img7)))
  (at 906 (image_available img8))
  (at 914 (not (image_available img8)))
  (at 923 (image_available img9))
  (at 931 (not (image_available img9)))
  (at 793 (image_available img10))
  (at 801 (not (image_available img10)))
  (at 1103 (image_available img1))
  (at 1111 (not (image_available img1)))
  (at 1365 (image_available img2))
  (at 1373 (not (image_available img2)))
  (at 1220 (image_available img3))
  (at 1228 (not (image_available img3)))
  (at 1278 (image_available img4))
  (at 1286 (not (image_available img4)))
  (at 1361 (image_available img5))
  (at 1369 (not (image_available img5)))
  (at 1114 (image_available img6))
  (at 1122 (not (image_available img6)))
  (at 1419 (image_available img7))
  (at 1427 (not (image_available img7)))
  (at 1266 (image_available img8))
  (at 1274 (not (image_available img8)))
  (at 1283 (image_available img9))
  (at 1291 (not (image_available img9)))
  (at 1153 (image_available img10))
  (at 1161 (not (image_available img10)))
  (at 1463 (image_available img1))
  (at 1471 (not (image_available img1)))
  (at 1725 (image_available img2))
  (at 1733 (not (image_available img2)))
  (at 1580 (image_available img3))
  (at 1588 (not (image_available img3)))
  (at 1638 (image_available img4))
  (at 1646 (not (image_available img4)))
  (at 1721 (image_available img5))
  (at 1729 (not (image_available img5)))
  (at 1474 (image_available img6))
  (at 1482 (not (image_available img6)))
  (at 1779 (image_available img7))
  (at 1787 (not (image_available img7)))
  (at 1626 (image_available img8))
  (at 1634 (not (image_available img8)))
  (at 1643 (image_available img9))
  (at 1651 (not (image_available img9)))
  (at 1513 (image_available img10))
  (at 1521 (not (image_available img10)))
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
  (<= (image_score img2) 4)

  (> (image_score img3) 0)
  (<= (image_score img3) 4)

  (> (image_score img5) 0)
  (<= (image_score img5) 4)

  (> (image_score img6) 0)
  (<= (image_score img6) 4)

  (> (image_score img7) 0)
  (<= (image_score img7) 7)

  (> (image_score img9) 0)
  (<= (image_score img9) 4)

(>= (total_score) 6)
))
(:metric maximize (+
  (image_score img2)
    (+ (image_score img3)
      (+ (image_score img5)
        (+ (image_score img6)
          (+ (image_score img7)
            (image_score img9)
          )
        )
      )
    )
  )
)
)
