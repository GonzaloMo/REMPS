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
  (memory_free mem4)
  (memory_free mem5)
  (memory_free mem6)
  (memory_free mem7)
  (memory_free mem8)
  (memory_free mem9)

   (memory_taken mem2 img10)
   (memory_taken mem3 img14)

(image_analysed mem2 img10)

  (at 12 (image_available img2))
  (at 20 (not (image_available img2)))
  (at 58 (image_available img5))
  (at 66 (not (image_available img5)))
  (at 68 (image_available img8))
  (at 76 (not (image_available img8)))
  (at 38 (image_available img10))
  (at 46 (not (image_available img10)))
  (at 58 (image_available img15))
  (at 66 (not (image_available img15)))
  (at 301 (image_available img1))
  (at 309 (not (image_available img1)))
  (at 372 (image_available img2))
  (at 380 (not (image_available img2)))
  (at 282 (image_available img3))
  (at 290 (not (image_available img3)))
  (at 208 (image_available img4))
  (at 216 (not (image_available img4)))
  (at 418 (image_available img5))
  (at 426 (not (image_available img5)))
  (at 175 (image_available img6))
  (at 183 (not (image_available img6)))
  (at 111 (image_available img7))
  (at 119 (not (image_available img7)))
  (at 428 (image_available img8))
  (at 436 (not (image_available img8)))
  (at 254 (image_available img9))
  (at 262 (not (image_available img9)))
  (at 398 (image_available img10))
  (at 406 (not (image_available img10)))
  (at 259 (image_available img11))
  (at 267 (not (image_available img11)))
  (at 225 (image_available img12))
  (at 233 (not (image_available img12)))
  (at 182 (image_available img13))
  (at 190 (not (image_available img13)))
  (at 341 (image_available img14))
  (at 349 (not (image_available img14)))
  (at 418 (image_available img15))
  (at 426 (not (image_available img15)))
  (at 661 (image_available img1))
  (at 669 (not (image_available img1)))
  (at 732 (image_available img2))
  (at 740 (not (image_available img2)))
  (at 642 (image_available img3))
  (at 650 (not (image_available img3)))
  (at 568 (image_available img4))
  (at 576 (not (image_available img4)))
  (at 778 (image_available img5))
  (at 786 (not (image_available img5)))
  (at 535 (image_available img6))
  (at 543 (not (image_available img6)))
  (at 471 (image_available img7))
  (at 479 (not (image_available img7)))
  (at 788 (image_available img8))
  (at 796 (not (image_available img8)))
  (at 614 (image_available img9))
  (at 622 (not (image_available img9)))
  (at 758 (image_available img10))
  (at 766 (not (image_available img10)))
  (at 619 (image_available img11))
  (at 627 (not (image_available img11)))
  (at 585 (image_available img12))
  (at 593 (not (image_available img12)))
  (at 542 (image_available img13))
  (at 550 (not (image_available img13)))
  (at 701 (image_available img14))
  (at 709 (not (image_available img14)))
  (at 778 (image_available img15))
  (at 786 (not (image_available img15)))
  (at 1021 (image_available img1))
  (at 1029 (not (image_available img1)))
  (at 1092 (image_available img2))
  (at 1100 (not (image_available img2)))
  (at 1002 (image_available img3))
  (at 1010 (not (image_available img3)))
  (at 928 (image_available img4))
  (at 936 (not (image_available img4)))
  (at 1138 (image_available img5))
  (at 1146 (not (image_available img5)))
  (at 895 (image_available img6))
  (at 903 (not (image_available img6)))
  (at 831 (image_available img7))
  (at 839 (not (image_available img7)))
  (at 1148 (image_available img8))
  (at 1156 (not (image_available img8)))
  (at 974 (image_available img9))
  (at 982 (not (image_available img9)))
  (at 1118 (image_available img10))
  (at 1126 (not (image_available img10)))
  (at 979 (image_available img11))
  (at 987 (not (image_available img11)))
  (at 945 (image_available img12))
  (at 953 (not (image_available img12)))
  (at 902 (image_available img13))
  (at 910 (not (image_available img13)))
  (at 1061 (image_available img14))
  (at 1069 (not (image_available img14)))
  (at 1138 (image_available img15))
  (at 1146 (not (image_available img15)))
  (at 1381 (image_available img1))
  (at 1389 (not (image_available img1)))
  (at 1452 (image_available img2))
  (at 1460 (not (image_available img2)))
  (at 1362 (image_available img3))
  (at 1370 (not (image_available img3)))
  (at 1288 (image_available img4))
  (at 1296 (not (image_available img4)))
  (at 1498 (image_available img5))
  (at 1506 (not (image_available img5)))
  (at 1255 (image_available img6))
  (at 1263 (not (image_available img6)))
  (at 1191 (image_available img7))
  (at 1199 (not (image_available img7)))
  (at 1508 (image_available img8))
  (at 1516 (not (image_available img8)))
  (at 1334 (image_available img9))
  (at 1342 (not (image_available img9)))
  (at 1478 (image_available img10))
  (at 1486 (not (image_available img10)))
  (at 1339 (image_available img11))
  (at 1347 (not (image_available img11)))
  (at 1305 (image_available img12))
  (at 1313 (not (image_available img12)))
  (at 1262 (image_available img13))
  (at 1270 (not (image_available img13)))
  (at 1421 (image_available img14))
  (at 1429 (not (image_available img14)))
  (at 1498 (image_available img15))
  (at 1506 (not (image_available img15)))
  (at 1 (dump_available))
  (at 24.0 (not (dump_available)))
  (at 166.0 (dump_available))
  (at 204.0 (not (dump_available)))
  (at 346.0 (dump_available))
  (at 384.0 (not (dump_available)))
  (at 526.0 (dump_available))
  (at 564.0 (not (dump_available)))
  (at 706.0 (dump_available))
  (at 744.0 (not (dump_available)))
  (at 886.0 (dump_available))
  (at 924.0 (not (dump_available)))
  (at 1066.0 (dump_available))
  (at 1104.0 (not (dump_available)))
  (at 1246.0 (dump_available))
  (at 1284.0 (not (dump_available)))
  (at 1426.0 (dump_available))
  (at 1464.0 (not (dump_available)))

)
(:goal (and
  (> (image_score img10) 0)
  (<= (image_score img10) 1)

(>= (total_score) 1)
))
(:metric maximize 
  (image_score img10)
)
)
