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

  (memory_free mem0)
  (memory_free mem1)
  (memory_free mem2)
  (memory_free mem3)
  (memory_free mem5)
  (memory_free mem6)
  (memory_free mem7)
  (memory_free mem8)
  (memory_free mem9)

   (memory_taken mem4 img7)

(image_analysed mem4 img7)

  (at 10 (image_available img4))
  (at 18 (not (image_available img4)))
  (at 11 (image_available img6))
  (at 19 (not (image_available img6)))
  (at 67 (image_available img8))
  (at 75 (not (image_available img8)))
  (at 41 (image_available img9))
  (at 49 (not (image_available img9)))
  (at 11 (image_available img10))
  (at 19 (not (image_available img10)))
  (at 0 (image_available img15))
  (at 2 (not (image_available img15)))
  (at 223 (image_available img1))
  (at 231 (not (image_available img1)))
  (at 350 (image_available img2))
  (at 358 (not (image_available img2)))
  (at 156 (image_available img3))
  (at 164 (not (image_available img3)))
  (at 370 (image_available img4))
  (at 378 (not (image_available img4)))
  (at 107 (image_available img5))
  (at 115 (not (image_available img5)))
  (at 371 (image_available img6))
  (at 379 (not (image_available img6)))
  (at 169 (image_available img7))
  (at 177 (not (image_available img7)))
  (at 427 (image_available img8))
  (at 435 (not (image_available img8)))
  (at 401 (image_available img9))
  (at 409 (not (image_available img9)))
  (at 371 (image_available img10))
  (at 379 (not (image_available img10)))
  (at 92 (image_available img11))
  (at 100 (not (image_available img11)))
  (at 182 (image_available img12))
  (at 190 (not (image_available img12)))
  (at 149 (image_available img13))
  (at 157 (not (image_available img13)))
  (at 348 (image_available img14))
  (at 356 (not (image_available img14)))
  (at 354 (image_available img15))
  (at 362 (not (image_available img15)))
  (at 583 (image_available img1))
  (at 591 (not (image_available img1)))
  (at 710 (image_available img2))
  (at 718 (not (image_available img2)))
  (at 516 (image_available img3))
  (at 524 (not (image_available img3)))
  (at 730 (image_available img4))
  (at 738 (not (image_available img4)))
  (at 467 (image_available img5))
  (at 475 (not (image_available img5)))
  (at 731 (image_available img6))
  (at 739 (not (image_available img6)))
  (at 529 (image_available img7))
  (at 537 (not (image_available img7)))
  (at 787 (image_available img8))
  (at 795 (not (image_available img8)))
  (at 761 (image_available img9))
  (at 769 (not (image_available img9)))
  (at 731 (image_available img10))
  (at 739 (not (image_available img10)))
  (at 452 (image_available img11))
  (at 460 (not (image_available img11)))
  (at 542 (image_available img12))
  (at 550 (not (image_available img12)))
  (at 509 (image_available img13))
  (at 517 (not (image_available img13)))
  (at 708 (image_available img14))
  (at 716 (not (image_available img14)))
  (at 714 (image_available img15))
  (at 722 (not (image_available img15)))
  (at 943 (image_available img1))
  (at 951 (not (image_available img1)))
  (at 1070 (image_available img2))
  (at 1078 (not (image_available img2)))
  (at 876 (image_available img3))
  (at 884 (not (image_available img3)))
  (at 1090 (image_available img4))
  (at 1098 (not (image_available img4)))
  (at 827 (image_available img5))
  (at 835 (not (image_available img5)))
  (at 1091 (image_available img6))
  (at 1099 (not (image_available img6)))
  (at 889 (image_available img7))
  (at 897 (not (image_available img7)))
  (at 1147 (image_available img8))
  (at 1155 (not (image_available img8)))
  (at 1121 (image_available img9))
  (at 1129 (not (image_available img9)))
  (at 1091 (image_available img10))
  (at 1099 (not (image_available img10)))
  (at 812 (image_available img11))
  (at 820 (not (image_available img11)))
  (at 902 (image_available img12))
  (at 910 (not (image_available img12)))
  (at 869 (image_available img13))
  (at 877 (not (image_available img13)))
  (at 1068 (image_available img14))
  (at 1076 (not (image_available img14)))
  (at 1074 (image_available img15))
  (at 1082 (not (image_available img15)))
  (at 1303 (image_available img1))
  (at 1311 (not (image_available img1)))
  (at 1430 (image_available img2))
  (at 1438 (not (image_available img2)))
  (at 1236 (image_available img3))
  (at 1244 (not (image_available img3)))
  (at 1450 (image_available img4))
  (at 1458 (not (image_available img4)))
  (at 1187 (image_available img5))
  (at 1195 (not (image_available img5)))
  (at 1451 (image_available img6))
  (at 1459 (not (image_available img6)))
  (at 1249 (image_available img7))
  (at 1257 (not (image_available img7)))
  (at 1507 (image_available img8))
  (at 1515 (not (image_available img8)))
  (at 1481 (image_available img9))
  (at 1489 (not (image_available img9)))
  (at 1451 (image_available img10))
  (at 1459 (not (image_available img10)))
  (at 1172 (image_available img11))
  (at 1180 (not (image_available img11)))
  (at 1262 (image_available img12))
  (at 1270 (not (image_available img12)))
  (at 1229 (image_available img13))
  (at 1237 (not (image_available img13)))
  (at 1428 (image_available img14))
  (at 1436 (not (image_available img14)))
  (at 1434 (image_available img15))
  (at 1442 (not (image_available img15)))
  (at 1 (dump_available))
  (at 22.0 (not (dump_available)))
  (at 164.0 (dump_available))
  (at 202.0 (not (dump_available)))
  (at 344.0 (dump_available))
  (at 382.0 (not (dump_available)))
  (at 524.0 (dump_available))
  (at 562.0 (not (dump_available)))
  (at 704.0 (dump_available))
  (at 742.0 (not (dump_available)))
  (at 884.0 (dump_available))
  (at 922.0 (not (dump_available)))
  (at 1064.0 (dump_available))
  (at 1102.0 (not (dump_available)))
  (at 1244.0 (dump_available))
  (at 1282.0 (not (dump_available)))
  (at 1424.0 (dump_available))
  (at 1462.0 (not (dump_available)))

)
(:goal (and
  (> (image_score img1) 0)
  (<= (image_score img1) 3)

  (> (image_score img2) 0)
  (<= (image_score img2) 2)

  (> (image_score img3) 0)
  (<= (image_score img3) 3)

  (> (image_score img4) 0)
  (<= (image_score img4) 1)

  (> (image_score img5) 0)
  (<= (image_score img5) 4)

  (> (image_score img7) 0)
  (<= (image_score img7) 3)

  (> (image_score img8) 0)
  (<= (image_score img8) 2)

  (> (image_score img10) 0)
  (<= (image_score img10) 2)

  (> (image_score img15) 0)
  (<= (image_score img15) 3)

(>= (total_score) 5)
))
(:metric maximize (+
  (image_score img1)
    (+ (image_score img2)
      (+ (image_score img3)
        (+ (image_score img4)
          (+ (image_score img5)
            (+ (image_score img7)
              (+ (image_score img8)
                (+ (image_score img10)
                  (image_score img15)
                )
              )
            )
          )
        )
      )
    )
  )
)
)
