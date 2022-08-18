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
  (memory_free mem2)
  (memory_free mem3)
  (memory_free mem4)
  (memory_free mem5)
  (memory_free mem6)
  (memory_free mem7)
  (memory_free mem8)
  (memory_free mem9)

   (memory_taken mem1 img11)


  (at 26 (image_available img5))
  (at 34 (not (image_available img5)))
  (at 73 (image_available img9))
  (at 81 (not (image_available img9)))
  (at 75 (image_available img13))
  (at 83 (not (image_available img13)))
  (at 273 (image_available img1))
  (at 281 (not (image_available img1)))
  (at 226 (image_available img2))
  (at 234 (not (image_available img2)))
  (at 301 (image_available img3))
  (at 309 (not (image_available img3)))
  (at 158 (image_available img4))
  (at 166 (not (image_available img4)))
  (at 386 (image_available img5))
  (at 394 (not (image_available img5)))
  (at 236 (image_available img6))
  (at 244 (not (image_available img6)))
  (at 207 (image_available img7))
  (at 215 (not (image_available img7)))
  (at 149 (image_available img8))
  (at 157 (not (image_available img8)))
  (at 433 (image_available img9))
  (at 441 (not (image_available img9)))
  (at 205 (image_available img10))
  (at 213 (not (image_available img10)))
  (at 174 (image_available img11))
  (at 182 (not (image_available img11)))
  (at 128 (image_available img12))
  (at 136 (not (image_available img12)))
  (at 435 (image_available img13))
  (at 443 (not (image_available img13)))
  (at 289 (image_available img14))
  (at 297 (not (image_available img14)))
  (at 144 (image_available img15))
  (at 152 (not (image_available img15)))
  (at 633 (image_available img1))
  (at 641 (not (image_available img1)))
  (at 586 (image_available img2))
  (at 594 (not (image_available img2)))
  (at 661 (image_available img3))
  (at 669 (not (image_available img3)))
  (at 518 (image_available img4))
  (at 526 (not (image_available img4)))
  (at 746 (image_available img5))
  (at 754 (not (image_available img5)))
  (at 596 (image_available img6))
  (at 604 (not (image_available img6)))
  (at 567 (image_available img7))
  (at 575 (not (image_available img7)))
  (at 509 (image_available img8))
  (at 517 (not (image_available img8)))
  (at 793 (image_available img9))
  (at 801 (not (image_available img9)))
  (at 565 (image_available img10))
  (at 573 (not (image_available img10)))
  (at 534 (image_available img11))
  (at 542 (not (image_available img11)))
  (at 488 (image_available img12))
  (at 496 (not (image_available img12)))
  (at 795 (image_available img13))
  (at 803 (not (image_available img13)))
  (at 649 (image_available img14))
  (at 657 (not (image_available img14)))
  (at 504 (image_available img15))
  (at 512 (not (image_available img15)))
  (at 993 (image_available img1))
  (at 1001 (not (image_available img1)))
  (at 946 (image_available img2))
  (at 954 (not (image_available img2)))
  (at 1021 (image_available img3))
  (at 1029 (not (image_available img3)))
  (at 878 (image_available img4))
  (at 886 (not (image_available img4)))
  (at 1106 (image_available img5))
  (at 1114 (not (image_available img5)))
  (at 956 (image_available img6))
  (at 964 (not (image_available img6)))
  (at 927 (image_available img7))
  (at 935 (not (image_available img7)))
  (at 869 (image_available img8))
  (at 877 (not (image_available img8)))
  (at 1153 (image_available img9))
  (at 1161 (not (image_available img9)))
  (at 925 (image_available img10))
  (at 933 (not (image_available img10)))
  (at 894 (image_available img11))
  (at 902 (not (image_available img11)))
  (at 848 (image_available img12))
  (at 856 (not (image_available img12)))
  (at 1155 (image_available img13))
  (at 1163 (not (image_available img13)))
  (at 1009 (image_available img14))
  (at 1017 (not (image_available img14)))
  (at 864 (image_available img15))
  (at 872 (not (image_available img15)))
  (at 1353 (image_available img1))
  (at 1361 (not (image_available img1)))
  (at 1306 (image_available img2))
  (at 1314 (not (image_available img2)))
  (at 1381 (image_available img3))
  (at 1389 (not (image_available img3)))
  (at 1238 (image_available img4))
  (at 1246 (not (image_available img4)))
  (at 1466 (image_available img5))
  (at 1474 (not (image_available img5)))
  (at 1316 (image_available img6))
  (at 1324 (not (image_available img6)))
  (at 1287 (image_available img7))
  (at 1295 (not (image_available img7)))
  (at 1229 (image_available img8))
  (at 1237 (not (image_available img8)))
  (at 1513 (image_available img9))
  (at 1521 (not (image_available img9)))
  (at 1285 (image_available img10))
  (at 1293 (not (image_available img10)))
  (at 1254 (image_available img11))
  (at 1262 (not (image_available img11)))
  (at 1208 (image_available img12))
  (at 1216 (not (image_available img12)))
  (at 1515 (image_available img13))
  (at 1523 (not (image_available img13)))
  (at 1369 (image_available img14))
  (at 1377 (not (image_available img14)))
  (at 1224 (image_available img15))
  (at 1232 (not (image_available img15)))
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
  (>= (image_score img2) 0)
  (<= (image_score img2) 3)

  (>= (image_score img7) 0)
  (<= (image_score img7) 5)

  (>= (image_score img9) 0)
  (<= (image_score img9) 7)

  (>= (image_score img11) 0)
  (<= (image_score img11) 7)

(>= (total_score) 5)
))
(:metric maximize (+
  (image_score img2)
    (+ (image_score img7)
      (+ (image_score img9)
        (image_score img11)
      )
    )
  )
)
)