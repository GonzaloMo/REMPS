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

  (memory_free mem3)
  (memory_free mem6)
  (memory_free mem7)
  (memory_free mem9)

   (memory_taken mem0 img2)
   (memory_taken mem1 img10)
   (memory_taken mem2 img8)
   (memory_taken mem4 img7)
   (memory_taken mem5 img4)
   (memory_taken mem8 img1)

(image_analysed mem0 img2)
(image_analysed mem1 img10)
(image_analysed mem4 img7)
(image_analysed mem5 img4)
(image_analysed mem8 img1)

  (at 28 (image_available img10))
  (at 36 (not (image_available img10)))
  (at 15 (image_available img14))
  (at 23 (not (image_available img14)))
  (at 301 (image_available img1))
  (at 309 (not (image_available img1)))
  (at 175 (image_available img2))
  (at 183 (not (image_available img2)))
  (at 255 (image_available img3))
  (at 263 (not (image_available img3)))
  (at 131 (image_available img4))
  (at 139 (not (image_available img4)))
  (at 225 (image_available img5))
  (at 233 (not (image_available img5)))
  (at 130 (image_available img6))
  (at 138 (not (image_available img6)))
  (at 332 (image_available img7))
  (at 340 (not (image_available img7)))
  (at 287 (image_available img8))
  (at 295 (not (image_available img8)))
  (at 117 (image_available img9))
  (at 125 (not (image_available img9)))
  (at 388 (image_available img10))
  (at 396 (not (image_available img10)))
  (at 333 (image_available img11))
  (at 341 (not (image_available img11)))
  (at 234 (image_available img12))
  (at 242 (not (image_available img12)))
  (at 237 (image_available img13))
  (at 245 (not (image_available img13)))
  (at 375 (image_available img14))
  (at 383 (not (image_available img14)))
  (at 148 (image_available img15))
  (at 156 (not (image_available img15)))
  (at 661 (image_available img1))
  (at 669 (not (image_available img1)))
  (at 535 (image_available img2))
  (at 543 (not (image_available img2)))
  (at 615 (image_available img3))
  (at 623 (not (image_available img3)))
  (at 491 (image_available img4))
  (at 499 (not (image_available img4)))
  (at 585 (image_available img5))
  (at 593 (not (image_available img5)))
  (at 490 (image_available img6))
  (at 498 (not (image_available img6)))
  (at 692 (image_available img7))
  (at 700 (not (image_available img7)))
  (at 647 (image_available img8))
  (at 655 (not (image_available img8)))
  (at 477 (image_available img9))
  (at 485 (not (image_available img9)))
  (at 748 (image_available img10))
  (at 756 (not (image_available img10)))
  (at 693 (image_available img11))
  (at 701 (not (image_available img11)))
  (at 594 (image_available img12))
  (at 602 (not (image_available img12)))
  (at 597 (image_available img13))
  (at 605 (not (image_available img13)))
  (at 735 (image_available img14))
  (at 743 (not (image_available img14)))
  (at 508 (image_available img15))
  (at 516 (not (image_available img15)))
  (at 1021 (image_available img1))
  (at 1029 (not (image_available img1)))
  (at 895 (image_available img2))
  (at 903 (not (image_available img2)))
  (at 975 (image_available img3))
  (at 983 (not (image_available img3)))
  (at 851 (image_available img4))
  (at 859 (not (image_available img4)))
  (at 945 (image_available img5))
  (at 953 (not (image_available img5)))
  (at 850 (image_available img6))
  (at 858 (not (image_available img6)))
  (at 1052 (image_available img7))
  (at 1060 (not (image_available img7)))
  (at 1007 (image_available img8))
  (at 1015 (not (image_available img8)))
  (at 837 (image_available img9))
  (at 845 (not (image_available img9)))
  (at 1108 (image_available img10))
  (at 1116 (not (image_available img10)))
  (at 1053 (image_available img11))
  (at 1061 (not (image_available img11)))
  (at 954 (image_available img12))
  (at 962 (not (image_available img12)))
  (at 957 (image_available img13))
  (at 965 (not (image_available img13)))
  (at 1095 (image_available img14))
  (at 1103 (not (image_available img14)))
  (at 868 (image_available img15))
  (at 876 (not (image_available img15)))
  (at 1381 (image_available img1))
  (at 1389 (not (image_available img1)))
  (at 1255 (image_available img2))
  (at 1263 (not (image_available img2)))
  (at 1335 (image_available img3))
  (at 1343 (not (image_available img3)))
  (at 1211 (image_available img4))
  (at 1219 (not (image_available img4)))
  (at 1305 (image_available img5))
  (at 1313 (not (image_available img5)))
  (at 1210 (image_available img6))
  (at 1218 (not (image_available img6)))
  (at 1412 (image_available img7))
  (at 1420 (not (image_available img7)))
  (at 1367 (image_available img8))
  (at 1375 (not (image_available img8)))
  (at 1197 (image_available img9))
  (at 1205 (not (image_available img9)))
  (at 1468 (image_available img10))
  (at 1476 (not (image_available img10)))
  (at 1413 (image_available img11))
  (at 1421 (not (image_available img11)))
  (at 1314 (image_available img12))
  (at 1322 (not (image_available img12)))
  (at 1317 (image_available img13))
  (at 1325 (not (image_available img13)))
  (at 1455 (image_available img14))
  (at 1463 (not (image_available img14)))
  (at 1228 (image_available img15))
  (at 1236 (not (image_available img15)))
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
  (> (image_score img2) 0)
  (<= (image_score img2) 10)

  (> (image_score img3) 0)
  (<= (image_score img3) 7)

  (> (image_score img4) 0)
  (<= (image_score img4) 2)

  (> (image_score img7) 0)
  (<= (image_score img7) 5)

  (> (image_score img9) 0)
  (<= (image_score img9) 6)

  (> (image_score img10) 0)
  (<= (image_score img10) 1)

  (> (image_score img11) 0)
  (<= (image_score img11) 1)

  (> (image_score img15) 0)
  (<= (image_score img15) 7)

(>= (total_score) 8)
))
(:metric maximize (+
  (image_score img2)
    (+ (image_score img3)
      (+ (image_score img4)
        (+ (image_score img7)
          (+ (image_score img9)
            (+ (image_score img10)
              (+ (image_score img11)
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
