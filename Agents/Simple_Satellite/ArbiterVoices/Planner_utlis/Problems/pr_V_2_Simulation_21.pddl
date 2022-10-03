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

  (memory_free mem2)
  (memory_free mem5)
  (memory_free mem6)
  (memory_free mem7)
  (memory_free mem8)
  (memory_free mem9)

   (memory_taken mem0 img2)
   (memory_taken mem1 img1)
   (memory_taken mem3 img6)
   (memory_taken mem4 img5)

(image_analysed mem0 img2)
(image_analysed mem1 img1)
(image_analysed mem3 img6)
(image_analysed mem4 img5)

  (at 46 (image_available img3))
  (at 54 (not (image_available img3)))
  (at 22 (image_available img6))
  (at 30 (not (image_available img6)))
  (at 254 (image_available img1))
  (at 262 (not (image_available img1)))
  (at 99 (image_available img2))
  (at 107 (not (image_available img2)))
  (at 406 (image_available img3))
  (at 414 (not (image_available img3)))
  (at 300 (image_available img4))
  (at 308 (not (image_available img4)))
  (at 312 (image_available img5))
  (at 320 (not (image_available img5)))
  (at 382 (image_available img6))
  (at 390 (not (image_available img6)))
  (at 121 (image_available img7))
  (at 129 (not (image_available img7)))
  (at 309 (image_available img8))
  (at 317 (not (image_available img8)))
  (at 340 (image_available img9))
  (at 348 (not (image_available img9)))
  (at 144 (image_available img10))
  (at 152 (not (image_available img10)))
  (at 614 (image_available img1))
  (at 622 (not (image_available img1)))
  (at 459 (image_available img2))
  (at 467 (not (image_available img2)))
  (at 766 (image_available img3))
  (at 774 (not (image_available img3)))
  (at 660 (image_available img4))
  (at 668 (not (image_available img4)))
  (at 672 (image_available img5))
  (at 680 (not (image_available img5)))
  (at 742 (image_available img6))
  (at 750 (not (image_available img6)))
  (at 481 (image_available img7))
  (at 489 (not (image_available img7)))
  (at 669 (image_available img8))
  (at 677 (not (image_available img8)))
  (at 700 (image_available img9))
  (at 708 (not (image_available img9)))
  (at 504 (image_available img10))
  (at 512 (not (image_available img10)))
  (at 974 (image_available img1))
  (at 982 (not (image_available img1)))
  (at 819 (image_available img2))
  (at 827 (not (image_available img2)))
  (at 1126 (image_available img3))
  (at 1134 (not (image_available img3)))
  (at 1020 (image_available img4))
  (at 1028 (not (image_available img4)))
  (at 1032 (image_available img5))
  (at 1040 (not (image_available img5)))
  (at 1102 (image_available img6))
  (at 1110 (not (image_available img6)))
  (at 841 (image_available img7))
  (at 849 (not (image_available img7)))
  (at 1029 (image_available img8))
  (at 1037 (not (image_available img8)))
  (at 1060 (image_available img9))
  (at 1068 (not (image_available img9)))
  (at 864 (image_available img10))
  (at 872 (not (image_available img10)))
  (at 1334 (image_available img1))
  (at 1342 (not (image_available img1)))
  (at 1179 (image_available img2))
  (at 1187 (not (image_available img2)))
  (at 1486 (image_available img3))
  (at 1494 (not (image_available img3)))
  (at 1380 (image_available img4))
  (at 1388 (not (image_available img4)))
  (at 1392 (image_available img5))
  (at 1400 (not (image_available img5)))
  (at 1462 (image_available img6))
  (at 1470 (not (image_available img6)))
  (at 1201 (image_available img7))
  (at 1209 (not (image_available img7)))
  (at 1389 (image_available img8))
  (at 1397 (not (image_available img8)))
  (at 1420 (image_available img9))
  (at 1428 (not (image_available img9)))
  (at 1224 (image_available img10))
  (at 1232 (not (image_available img10)))
  (at 1 (dump_available))
  (at 16.0 (not (dump_available)))
  (at 158.0 (dump_available))
  (at 196.0 (not (dump_available)))
  (at 338.0 (dump_available))
  (at 376.0 (not (dump_available)))
  (at 518.0 (dump_available))
  (at 556.0 (not (dump_available)))
  (at 698.0 (dump_available))
  (at 736.0 (not (dump_available)))
  (at 878.0 (dump_available))
  (at 916.0 (not (dump_available)))
  (at 1058.0 (dump_available))
  (at 1096.0 (not (dump_available)))
  (at 1238.0 (dump_available))
  (at 1276.0 (not (dump_available)))
  (at 1418.0 (dump_available))
  (at 1456.0 (not (dump_available)))

)
(:goal (and
  (> (image_score img2) 0)
  (<= (image_score img2) 5)

  (> (image_score img5) 0)
  (<= (image_score img5) 2)

  (> (image_score img6) 0)
  (<= (image_score img6) 4)

  (> (image_score img8) 0)
  (<= (image_score img8) 3)

(>= (total_score) 3)
))
(:metric maximize (+
  (image_score img2)
    (+ (image_score img5)
      (+ (image_score img6)
        (image_score img8)
      )
    )
  )
)
)
