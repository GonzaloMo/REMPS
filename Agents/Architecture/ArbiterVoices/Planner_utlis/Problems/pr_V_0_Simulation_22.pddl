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

  (memory_free mem3)
  (memory_free mem4)
  (memory_free mem5)
  (memory_free mem6)
  (memory_free mem7)
  (memory_free mem8)
  (memory_free mem9)

   (memory_taken mem0 img8)
   (memory_taken mem1 img4)
   (memory_taken mem2 img10)

(image_analysed mem0 img8)
(image_analysed mem1 img4)
(image_analysed mem2 img10)

  (at 10 (image_available img1))
  (at 18 (not (image_available img1)))
  (at 34 (image_available img2))
  (at 42 (not (image_available img2)))
  (at 5 (image_available img8))
  (at 13 (not (image_available img8)))
  (at 370 (image_available img1))
  (at 378 (not (image_available img1)))
  (at 394 (image_available img2))
  (at 402 (not (image_available img2)))
  (at 350 (image_available img3))
  (at 358 (not (image_available img3)))
  (at 226 (image_available img4))
  (at 234 (not (image_available img4)))
  (at 142 (image_available img5))
  (at 150 (not (image_available img5)))
  (at 149 (image_available img6))
  (at 157 (not (image_available img6)))
  (at 309 (image_available img7))
  (at 317 (not (image_available img7)))
  (at 365 (image_available img8))
  (at 373 (not (image_available img8)))
  (at 329 (image_available img9))
  (at 337 (not (image_available img9)))
  (at 312 (image_available img10))
  (at 320 (not (image_available img10)))
  (at 730 (image_available img1))
  (at 738 (not (image_available img1)))
  (at 754 (image_available img2))
  (at 762 (not (image_available img2)))
  (at 710 (image_available img3))
  (at 718 (not (image_available img3)))
  (at 586 (image_available img4))
  (at 594 (not (image_available img4)))
  (at 502 (image_available img5))
  (at 510 (not (image_available img5)))
  (at 509 (image_available img6))
  (at 517 (not (image_available img6)))
  (at 669 (image_available img7))
  (at 677 (not (image_available img7)))
  (at 725 (image_available img8))
  (at 733 (not (image_available img8)))
  (at 689 (image_available img9))
  (at 697 (not (image_available img9)))
  (at 672 (image_available img10))
  (at 680 (not (image_available img10)))
  (at 1090 (image_available img1))
  (at 1098 (not (image_available img1)))
  (at 1114 (image_available img2))
  (at 1122 (not (image_available img2)))
  (at 1070 (image_available img3))
  (at 1078 (not (image_available img3)))
  (at 946 (image_available img4))
  (at 954 (not (image_available img4)))
  (at 862 (image_available img5))
  (at 870 (not (image_available img5)))
  (at 869 (image_available img6))
  (at 877 (not (image_available img6)))
  (at 1029 (image_available img7))
  (at 1037 (not (image_available img7)))
  (at 1085 (image_available img8))
  (at 1093 (not (image_available img8)))
  (at 1049 (image_available img9))
  (at 1057 (not (image_available img9)))
  (at 1032 (image_available img10))
  (at 1040 (not (image_available img10)))
  (at 1450 (image_available img1))
  (at 1458 (not (image_available img1)))
  (at 1474 (image_available img2))
  (at 1482 (not (image_available img2)))
  (at 1430 (image_available img3))
  (at 1438 (not (image_available img3)))
  (at 1306 (image_available img4))
  (at 1314 (not (image_available img4)))
  (at 1222 (image_available img5))
  (at 1230 (not (image_available img5)))
  (at 1229 (image_available img6))
  (at 1237 (not (image_available img6)))
  (at 1389 (image_available img7))
  (at 1397 (not (image_available img7)))
  (at 1445 (image_available img8))
  (at 1453 (not (image_available img8)))
  (at 1409 (image_available img9))
  (at 1417 (not (image_available img9)))
  (at 1392 (image_available img10))
  (at 1400 (not (image_available img10)))
  (at 1 (dump_available))
  (at 3.0 (not (dump_available)))
  (at 145.0 (dump_available))
  (at 183.0 (not (dump_available)))
  (at 325.0 (dump_available))
  (at 363.0 (not (dump_available)))
  (at 505.0 (dump_available))
  (at 543.0 (not (dump_available)))
  (at 685.0 (dump_available))
  (at 723.0 (not (dump_available)))
  (at 865.0 (dump_available))
  (at 903.0 (not (dump_available)))
  (at 1045.0 (dump_available))
  (at 1083.0 (not (dump_available)))
  (at 1225.0 (dump_available))
  (at 1263.0 (not (dump_available)))
  (at 1405.0 (dump_available))
  (at 1443.0 (not (dump_available)))

)
(:goal (and
  (> (image_score img4) 0)
  (<= (image_score img4) 3)

  (> (image_score img7) 0)
  (<= (image_score img7) 1)

  (> (image_score img10) 0)
  (<= (image_score img10) 4)

(>= (total_score) 2)
))
(:metric maximize (+
  (image_score img4)
    (+ (image_score img7)
      (image_score img10)
    )
  )
)
)