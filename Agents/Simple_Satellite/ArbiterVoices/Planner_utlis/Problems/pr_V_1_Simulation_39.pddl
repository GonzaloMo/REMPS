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

   (memory_taken mem0 img13)
   (memory_taken mem1 img10)
   (memory_taken mem2 img4)
   (memory_taken mem3 img2)

(image_analysed mem0 img13)
(image_analysed mem1 img10)
(image_analysed mem3 img2)

  (at 96 (image_available img1))
  (at 104 (not (image_available img1)))
  (at 42 (image_available img2))
  (at 50 (not (image_available img2)))
  (at 79 (image_available img3))
  (at 87 (not (image_available img3)))
  (at 0 (image_available img4))
  (at 2 (not (image_available img4)))
  (at 111 (image_available img5))
  (at 119 (not (image_available img5)))
  (at 44 (image_available img6))
  (at 52 (not (image_available img6)))
  (at 236 (image_available img7))
  (at 244 (not (image_available img7)))
  (at 218 (image_available img8))
  (at 226 (not (image_available img8)))
  (at 109 (image_available img11))
  (at 117 (not (image_available img11)))
  (at 223 (image_available img13))
  (at 231 (not (image_available img13)))
  (at 222 (image_available img14))
  (at 230 (not (image_available img14)))
  (at 153 (image_available img15))
  (at 161 (not (image_available img15)))
  (at 456 (image_available img1))
  (at 464 (not (image_available img1)))
  (at 402 (image_available img2))
  (at 410 (not (image_available img2)))
  (at 439 (image_available img3))
  (at 447 (not (image_available img3)))
  (at 354 (image_available img4))
  (at 362 (not (image_available img4)))
  (at 471 (image_available img5))
  (at 479 (not (image_available img5)))
  (at 404 (image_available img6))
  (at 412 (not (image_available img6)))
  (at 596 (image_available img7))
  (at 604 (not (image_available img7)))
  (at 578 (image_available img8))
  (at 586 (not (image_available img8)))
  (at 284 (image_available img9))
  (at 292 (not (image_available img9)))
  (at 312 (image_available img10))
  (at 320 (not (image_available img10)))
  (at 469 (image_available img11))
  (at 477 (not (image_available img11)))
  (at 305 (image_available img12))
  (at 313 (not (image_available img12)))
  (at 583 (image_available img13))
  (at 591 (not (image_available img13)))
  (at 582 (image_available img14))
  (at 590 (not (image_available img14)))
  (at 513 (image_available img15))
  (at 521 (not (image_available img15)))
  (at 816 (image_available img1))
  (at 824 (not (image_available img1)))
  (at 762 (image_available img2))
  (at 770 (not (image_available img2)))
  (at 799 (image_available img3))
  (at 807 (not (image_available img3)))
  (at 714 (image_available img4))
  (at 722 (not (image_available img4)))
  (at 831 (image_available img5))
  (at 839 (not (image_available img5)))
  (at 764 (image_available img6))
  (at 772 (not (image_available img6)))
  (at 956 (image_available img7))
  (at 964 (not (image_available img7)))
  (at 938 (image_available img8))
  (at 946 (not (image_available img8)))
  (at 644 (image_available img9))
  (at 652 (not (image_available img9)))
  (at 672 (image_available img10))
  (at 680 (not (image_available img10)))
  (at 829 (image_available img11))
  (at 837 (not (image_available img11)))
  (at 665 (image_available img12))
  (at 673 (not (image_available img12)))
  (at 943 (image_available img13))
  (at 951 (not (image_available img13)))
  (at 942 (image_available img14))
  (at 950 (not (image_available img14)))
  (at 873 (image_available img15))
  (at 881 (not (image_available img15)))
  (at 1176 (image_available img1))
  (at 1184 (not (image_available img1)))
  (at 1122 (image_available img2))
  (at 1130 (not (image_available img2)))
  (at 1159 (image_available img3))
  (at 1167 (not (image_available img3)))
  (at 1074 (image_available img4))
  (at 1082 (not (image_available img4)))
  (at 1191 (image_available img5))
  (at 1199 (not (image_available img5)))
  (at 1124 (image_available img6))
  (at 1132 (not (image_available img6)))
  (at 1316 (image_available img7))
  (at 1324 (not (image_available img7)))
  (at 1298 (image_available img8))
  (at 1306 (not (image_available img8)))
  (at 1004 (image_available img9))
  (at 1012 (not (image_available img9)))
  (at 1032 (image_available img10))
  (at 1040 (not (image_available img10)))
  (at 1189 (image_available img11))
  (at 1197 (not (image_available img11)))
  (at 1025 (image_available img12))
  (at 1033 (not (image_available img12)))
  (at 1303 (image_available img13))
  (at 1311 (not (image_available img13)))
  (at 1302 (image_available img14))
  (at 1310 (not (image_available img14)))
  (at 1233 (image_available img15))
  (at 1241 (not (image_available img15)))
  (at 1536 (image_available img1))
  (at 1544 (not (image_available img1)))
  (at 1482 (image_available img2))
  (at 1490 (not (image_available img2)))
  (at 1519 (image_available img3))
  (at 1527 (not (image_available img3)))
  (at 1434 (image_available img4))
  (at 1442 (not (image_available img4)))
  (at 1551 (image_available img5))
  (at 1559 (not (image_available img5)))
  (at 1484 (image_available img6))
  (at 1492 (not (image_available img6)))
  (at 1676 (image_available img7))
  (at 1684 (not (image_available img7)))
  (at 1658 (image_available img8))
  (at 1666 (not (image_available img8)))
  (at 1364 (image_available img9))
  (at 1372 (not (image_available img9)))
  (at 1392 (image_available img10))
  (at 1400 (not (image_available img10)))
  (at 1549 (image_available img11))
  (at 1557 (not (image_available img11)))
  (at 1385 (image_available img12))
  (at 1393 (not (image_available img12)))
  (at 1663 (image_available img13))
  (at 1671 (not (image_available img13)))
  (at 1662 (image_available img14))
  (at 1670 (not (image_available img14)))
  (at 1593 (image_available img15))
  (at 1601 (not (image_available img15)))
  (at 1 (dump_available))
  (at 7.0 (not (dump_available)))
  (at 149.0 (dump_available))
  (at 187.0 (not (dump_available)))
  (at 329.0 (dump_available))
  (at 367.0 (not (dump_available)))
  (at 509.0 (dump_available))
  (at 547.0 (not (dump_available)))
  (at 689.0 (dump_available))
  (at 727.0 (not (dump_available)))
  (at 869.0 (dump_available))
  (at 907.0 (not (dump_available)))
  (at 1049.0 (dump_available))
  (at 1087.0 (not (dump_available)))
  (at 1229.0 (dump_available))
  (at 1267.0 (not (dump_available)))
  (at 1409.0 (dump_available))
  (at 1447.0 (not (dump_available)))
  (at 1589.0 (dump_available))
  (at 1627.0 (not (dump_available)))

)
(:goal (and
  (> (image_score img9) 0)
  (<= (image_score img9) 5)

  (> (image_score img10) 0)
  (<= (image_score img10) 8)

  (> (image_score img13) 0)
  (<= (image_score img13) 6)

  (> (image_score img14) 0)
  (<= (image_score img14) 4)

  (> (image_score img15) 0)
  (<= (image_score img15) 9)

(>= (total_score) 7)
))
(:metric maximize (+
  (image_score img9)
    (+ (image_score img10)
      (+ (image_score img13)
        (+ (image_score img14)
          (image_score img15)
        )
      )
    )
  )
)
)
