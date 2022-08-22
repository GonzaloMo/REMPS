(define(problem satprob)
(:domain SimpleSatellite)
(:objects
  mem0 mem1 mem2 mem3 mem4 mem5 mem6 mem7 mem8 mem9 - memory
 img1 img2 img3 img4 img5 img6 img7 img8 img9 img10 img11 img12 img13 img14 img15 - image
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
  (= (image_score img11) 0)
  (= (image_score img12) 0)
  (= (image_score img13) 0)
  (= (image_score img14) 0)
  (= (image_score img15) 0)
  (= (total_score) 0)

  (memory_free mem4)
  (memory_free mem5)
  (memory_free mem6)
  (memory_free mem7)
  (memory_free mem8)
  (memory_free mem9)

   (memory_taken mem0 img11)
   (memory_taken mem1 img7)
   (memory_taken mem2 img8)
   (memory_taken mem3 img4)

(image_analysed mem0 img11)
(image_analysed mem1 img7)
(image_analysed mem2 img8)
(image_analysed mem3 img4)

  (at 89 (image_available img5))
  (at 97 (not (image_available img5)))
  (at 90 (image_available img6))
  (at 98 (not (image_available img6)))
  (at 90 (image_available img10))
  (at 98 (not (image_available img10)))
  (at 42 (image_available img13))
  (at 50 (not (image_available img13)))
  (at 20 (image_available img14))
  (at 28 (not (image_available img14)))
  (at 149 (image_available img1))
  (at 157 (not (image_available img1)))
  (at 147 (image_available img2))
  (at 155 (not (image_available img2)))
  (at 288 (image_available img3))
  (at 296 (not (image_available img3)))
  (at 346 (image_available img4))
  (at 354 (not (image_available img4)))
  (at 449 (image_available img5))
  (at 457 (not (image_available img5)))
  (at 450 (image_available img6))
  (at 458 (not (image_available img6)))
  (at 296 (image_available img7))
  (at 304 (not (image_available img7)))
  (at 293 (image_available img8))
  (at 301 (not (image_available img8)))
  (at 226 (image_available img9))
  (at 234 (not (image_available img9)))
  (at 450 (image_available img10))
  (at 458 (not (image_available img10)))
  (at 211 (image_available img11))
  (at 219 (not (image_available img11)))
  (at 335 (image_available img12))
  (at 343 (not (image_available img12)))
  (at 402 (image_available img13))
  (at 410 (not (image_available img13)))
  (at 380 (image_available img14))
  (at 388 (not (image_available img14)))
  (at 231 (image_available img15))
  (at 239 (not (image_available img15)))
  (at 509 (image_available img1))
  (at 517 (not (image_available img1)))
  (at 507 (image_available img2))
  (at 515 (not (image_available img2)))
  (at 648 (image_available img3))
  (at 656 (not (image_available img3)))
  (at 706 (image_available img4))
  (at 714 (not (image_available img4)))
  (at 809 (image_available img5))
  (at 817 (not (image_available img5)))
  (at 810 (image_available img6))
  (at 818 (not (image_available img6)))
  (at 656 (image_available img7))
  (at 664 (not (image_available img7)))
  (at 653 (image_available img8))
  (at 661 (not (image_available img8)))
  (at 586 (image_available img9))
  (at 594 (not (image_available img9)))
  (at 810 (image_available img10))
  (at 818 (not (image_available img10)))
  (at 571 (image_available img11))
  (at 579 (not (image_available img11)))
  (at 695 (image_available img12))
  (at 703 (not (image_available img12)))
  (at 762 (image_available img13))
  (at 770 (not (image_available img13)))
  (at 740 (image_available img14))
  (at 748 (not (image_available img14)))
  (at 591 (image_available img15))
  (at 599 (not (image_available img15)))
  (at 869 (image_available img1))
  (at 877 (not (image_available img1)))
  (at 867 (image_available img2))
  (at 875 (not (image_available img2)))
  (at 1008 (image_available img3))
  (at 1016 (not (image_available img3)))
  (at 1066 (image_available img4))
  (at 1074 (not (image_available img4)))
  (at 1169 (image_available img5))
  (at 1177 (not (image_available img5)))
  (at 1170 (image_available img6))
  (at 1178 (not (image_available img6)))
  (at 1016 (image_available img7))
  (at 1024 (not (image_available img7)))
  (at 1013 (image_available img8))
  (at 1021 (not (image_available img8)))
  (at 946 (image_available img9))
  (at 954 (not (image_available img9)))
  (at 1170 (image_available img10))
  (at 1178 (not (image_available img10)))
  (at 931 (image_available img11))
  (at 939 (not (image_available img11)))
  (at 1055 (image_available img12))
  (at 1063 (not (image_available img12)))
  (at 1122 (image_available img13))
  (at 1130 (not (image_available img13)))
  (at 1100 (image_available img14))
  (at 1108 (not (image_available img14)))
  (at 951 (image_available img15))
  (at 959 (not (image_available img15)))
  (at 1229 (image_available img1))
  (at 1237 (not (image_available img1)))
  (at 1227 (image_available img2))
  (at 1235 (not (image_available img2)))
  (at 1368 (image_available img3))
  (at 1376 (not (image_available img3)))
  (at 1426 (image_available img4))
  (at 1434 (not (image_available img4)))
  (at 1529 (image_available img5))
  (at 1537 (not (image_available img5)))
  (at 1530 (image_available img6))
  (at 1538 (not (image_available img6)))
  (at 1376 (image_available img7))
  (at 1384 (not (image_available img7)))
  (at 1373 (image_available img8))
  (at 1381 (not (image_available img8)))
  (at 1306 (image_available img9))
  (at 1314 (not (image_available img9)))
  (at 1530 (image_available img10))
  (at 1538 (not (image_available img10)))
  (at 1291 (image_available img11))
  (at 1299 (not (image_available img11)))
  (at 1415 (image_available img12))
  (at 1423 (not (image_available img12)))
  (at 1482 (image_available img13))
  (at 1490 (not (image_available img13)))
  (at 1460 (image_available img14))
  (at 1468 (not (image_available img14)))
  (at 1311 (image_available img15))
  (at 1319 (not (image_available img15)))
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
  (> (image_score img3) 0)
  (<= (image_score img3) 14.0)

  (> (image_score img5) 0)
  (<= (image_score img5) 3.0)

  (> (image_score img8) 0)
  (<= (image_score img8) 12.0)

  (> (image_score img12) 0)
  (<= (image_score img12) 13.0)

(>= (total_score) 9)
))
(:metric maximize (+
  (image_score img3)
    (+ (image_score img5)
      (+ (image_score img8)
        (image_score img12)
      )
    )
  )
)
)
