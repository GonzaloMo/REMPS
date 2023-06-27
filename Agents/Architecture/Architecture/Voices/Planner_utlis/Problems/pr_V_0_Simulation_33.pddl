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

  (memory_free mem1)
  (memory_free mem3)
  (memory_free mem5)
  (memory_free mem6)
  (memory_free mem7)
  (memory_free mem8)
  (memory_free mem9)

   (memory_taken mem0 img12)
   (memory_taken mem2 img11)
   (memory_taken mem4 img10)

(image_analysed mem0 img12)
(image_analysed mem2 img11)
(image_analysed mem4 img10)

  (at 4 (image_available img2))
  (at 12 (not (image_available img2)))
  (at 28 (image_available img3))
  (at 36 (not (image_available img3)))
  (at 69 (image_available img8))
  (at 77 (not (image_available img8)))
  (at 58 (image_available img15))
  (at 66 (not (image_available img15)))
  (at 263 (image_available img1))
  (at 271 (not (image_available img1)))
  (at 364 (image_available img2))
  (at 372 (not (image_available img2)))
  (at 388 (image_available img3))
  (at 396 (not (image_available img3)))
  (at 198 (image_available img4))
  (at 206 (not (image_available img4)))
  (at 251 (image_available img5))
  (at 259 (not (image_available img5)))
  (at 245 (image_available img6))
  (at 253 (not (image_available img6)))
  (at 305 (image_available img7))
  (at 313 (not (image_available img7)))
  (at 429 (image_available img8))
  (at 437 (not (image_available img8)))
  (at 342 (image_available img9))
  (at 350 (not (image_available img9)))
  (at 161 (image_available img10))
  (at 169 (not (image_available img10)))
  (at 296 (image_available img11))
  (at 304 (not (image_available img11)))
  (at 131 (image_available img12))
  (at 139 (not (image_available img12)))
  (at 153 (image_available img13))
  (at 161 (not (image_available img13)))
  (at 278 (image_available img14))
  (at 286 (not (image_available img14)))
  (at 418 (image_available img15))
  (at 426 (not (image_available img15)))
  (at 623 (image_available img1))
  (at 631 (not (image_available img1)))
  (at 724 (image_available img2))
  (at 732 (not (image_available img2)))
  (at 748 (image_available img3))
  (at 756 (not (image_available img3)))
  (at 558 (image_available img4))
  (at 566 (not (image_available img4)))
  (at 611 (image_available img5))
  (at 619 (not (image_available img5)))
  (at 605 (image_available img6))
  (at 613 (not (image_available img6)))
  (at 665 (image_available img7))
  (at 673 (not (image_available img7)))
  (at 789 (image_available img8))
  (at 797 (not (image_available img8)))
  (at 702 (image_available img9))
  (at 710 (not (image_available img9)))
  (at 521 (image_available img10))
  (at 529 (not (image_available img10)))
  (at 656 (image_available img11))
  (at 664 (not (image_available img11)))
  (at 491 (image_available img12))
  (at 499 (not (image_available img12)))
  (at 513 (image_available img13))
  (at 521 (not (image_available img13)))
  (at 638 (image_available img14))
  (at 646 (not (image_available img14)))
  (at 778 (image_available img15))
  (at 786 (not (image_available img15)))
  (at 983 (image_available img1))
  (at 991 (not (image_available img1)))
  (at 1084 (image_available img2))
  (at 1092 (not (image_available img2)))
  (at 1108 (image_available img3))
  (at 1116 (not (image_available img3)))
  (at 918 (image_available img4))
  (at 926 (not (image_available img4)))
  (at 971 (image_available img5))
  (at 979 (not (image_available img5)))
  (at 965 (image_available img6))
  (at 973 (not (image_available img6)))
  (at 1025 (image_available img7))
  (at 1033 (not (image_available img7)))
  (at 1149 (image_available img8))
  (at 1157 (not (image_available img8)))
  (at 1062 (image_available img9))
  (at 1070 (not (image_available img9)))
  (at 881 (image_available img10))
  (at 889 (not (image_available img10)))
  (at 1016 (image_available img11))
  (at 1024 (not (image_available img11)))
  (at 851 (image_available img12))
  (at 859 (not (image_available img12)))
  (at 873 (image_available img13))
  (at 881 (not (image_available img13)))
  (at 998 (image_available img14))
  (at 1006 (not (image_available img14)))
  (at 1138 (image_available img15))
  (at 1146 (not (image_available img15)))
  (at 1343 (image_available img1))
  (at 1351 (not (image_available img1)))
  (at 1444 (image_available img2))
  (at 1452 (not (image_available img2)))
  (at 1468 (image_available img3))
  (at 1476 (not (image_available img3)))
  (at 1278 (image_available img4))
  (at 1286 (not (image_available img4)))
  (at 1331 (image_available img5))
  (at 1339 (not (image_available img5)))
  (at 1325 (image_available img6))
  (at 1333 (not (image_available img6)))
  (at 1385 (image_available img7))
  (at 1393 (not (image_available img7)))
  (at 1509 (image_available img8))
  (at 1517 (not (image_available img8)))
  (at 1422 (image_available img9))
  (at 1430 (not (image_available img9)))
  (at 1241 (image_available img10))
  (at 1249 (not (image_available img10)))
  (at 1376 (image_available img11))
  (at 1384 (not (image_available img11)))
  (at 1211 (image_available img12))
  (at 1219 (not (image_available img12)))
  (at 1233 (image_available img13))
  (at 1241 (not (image_available img13)))
  (at 1358 (image_available img14))
  (at 1366 (not (image_available img14)))
  (at 1498 (image_available img15))
  (at 1506 (not (image_available img15)))
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
  (> (image_score img1) 0)
  (<= (image_score img1) 5)

  (> (image_score img6) 0)
  (<= (image_score img6) 3)

  (> (image_score img7) 0)
  (<= (image_score img7) 2)

(>= (total_score) 2)
))
(:metric maximize (+
  (image_score img1)
    (+ (image_score img6)
      (image_score img7)
    )
  )
)
)