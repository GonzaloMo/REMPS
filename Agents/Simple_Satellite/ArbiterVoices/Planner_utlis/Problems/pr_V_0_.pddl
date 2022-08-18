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



  (at 43 (image_available img4))
  (at 51 (not (image_available img4)))
  (at 50 (image_available img10))
  (at 58 (not (image_available img10)))
  (at 320 (image_available img1))
  (at 328 (not (image_available img1)))
  (at 205 (image_available img2))
  (at 213 (not (image_available img2)))
  (at 120 (image_available img3))
  (at 128 (not (image_available img3)))
  (at 403 (image_available img4))
  (at 411 (not (image_available img4)))
  (at 211 (image_available img5))
  (at 219 (not (image_available img5)))
  (at 262 (image_available img6))
  (at 270 (not (image_available img6)))
  (at 284 (image_available img7))
  (at 292 (not (image_available img7)))
  (at 238 (image_available img8))
  (at 246 (not (image_available img8)))
  (at 323 (image_available img9))
  (at 331 (not (image_available img9)))
  (at 410 (image_available img10))
  (at 418 (not (image_available img10)))
  (at 680 (image_available img1))
  (at 688 (not (image_available img1)))
  (at 565 (image_available img2))
  (at 573 (not (image_available img2)))
  (at 480 (image_available img3))
  (at 488 (not (image_available img3)))
  (at 763 (image_available img4))
  (at 771 (not (image_available img4)))
  (at 571 (image_available img5))
  (at 579 (not (image_available img5)))
  (at 622 (image_available img6))
  (at 630 (not (image_available img6)))
  (at 644 (image_available img7))
  (at 652 (not (image_available img7)))
  (at 598 (image_available img8))
  (at 606 (not (image_available img8)))
  (at 683 (image_available img9))
  (at 691 (not (image_available img9)))
  (at 770 (image_available img10))
  (at 778 (not (image_available img10)))
  (at 1040 (image_available img1))
  (at 1048 (not (image_available img1)))
  (at 925 (image_available img2))
  (at 933 (not (image_available img2)))
  (at 840 (image_available img3))
  (at 848 (not (image_available img3)))
  (at 1123 (image_available img4))
  (at 1131 (not (image_available img4)))
  (at 931 (image_available img5))
  (at 939 (not (image_available img5)))
  (at 982 (image_available img6))
  (at 990 (not (image_available img6)))
  (at 1004 (image_available img7))
  (at 1012 (not (image_available img7)))
  (at 958 (image_available img8))
  (at 966 (not (image_available img8)))
  (at 1043 (image_available img9))
  (at 1051 (not (image_available img9)))
  (at 1130 (image_available img10))
  (at 1138 (not (image_available img10)))
  (at 1400 (image_available img1))
  (at 1408 (not (image_available img1)))
  (at 1285 (image_available img2))
  (at 1293 (not (image_available img2)))
  (at 1200 (image_available img3))
  (at 1208 (not (image_available img3)))
  (at 1483 (image_available img4))
  (at 1491 (not (image_available img4)))
  (at 1291 (image_available img5))
  (at 1299 (not (image_available img5)))
  (at 1342 (image_available img6))
  (at 1350 (not (image_available img6)))
  (at 1364 (image_available img7))
  (at 1372 (not (image_available img7)))
  (at 1318 (image_available img8))
  (at 1326 (not (image_available img8)))
  (at 1403 (image_available img9))
  (at 1411 (not (image_available img9)))
  (at 1490 (image_available img10))
  (at 1498 (not (image_available img10)))
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

)
(:goal (and
  (>= (image_score img7) 0)
  (<= (image_score img7) 2)

  (>= (image_score img8) 0)
  (<= (image_score img8) 1)

  (>= (image_score img9) 0)
  (<= (image_score img9) 6)

(>= (total_score) 2)
))
(:metric maximize (+
  (image_score img7)
    (+ (image_score img8)
      (image_score img9)
    )
  )
)
)