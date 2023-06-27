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
  (memory_free mem4)
  (memory_free mem5)
  (memory_free mem6)
  (memory_free mem7)
  (memory_free mem8)
  (memory_free mem9)



  (at 23 (image_available img7))
  (at 31 (not (image_available img7)))
  (at 83 (image_available img8))
  (at 91 (not (image_available img8)))
  (at 76 (image_available img12))
  (at 84 (not (image_available img12)))
  (at 16 (image_available img13))
  (at 24 (not (image_available img13)))
  (at 2 (image_available img15))
  (at 10 (not (image_available img15)))
  (at 321 (image_available img1))
  (at 329 (not (image_available img1)))
  (at 217 (image_available img2))
  (at 225 (not (image_available img2)))
  (at 158 (image_available img3))
  (at 166 (not (image_available img3)))
  (at 166 (image_available img4))
  (at 174 (not (image_available img4)))
  (at 153 (image_available img5))
  (at 161 (not (image_available img5)))
  (at 254 (image_available img6))
  (at 262 (not (image_available img6)))
  (at 383 (image_available img7))
  (at 391 (not (image_available img7)))
  (at 443 (image_available img8))
  (at 451 (not (image_available img8)))
  (at 199 (image_available img9))
  (at 207 (not (image_available img9)))
  (at 312 (image_available img10))
  (at 320 (not (image_available img10)))
  (at 311 (image_available img11))
  (at 319 (not (image_available img11)))
  (at 436 (image_available img12))
  (at 444 (not (image_available img12)))
  (at 376 (image_available img13))
  (at 384 (not (image_available img13)))
  (at 134 (image_available img14))
  (at 142 (not (image_available img14)))
  (at 362 (image_available img15))
  (at 370 (not (image_available img15)))
  (at 681 (image_available img1))
  (at 689 (not (image_available img1)))
  (at 577 (image_available img2))
  (at 585 (not (image_available img2)))
  (at 518 (image_available img3))
  (at 526 (not (image_available img3)))
  (at 526 (image_available img4))
  (at 534 (not (image_available img4)))
  (at 513 (image_available img5))
  (at 521 (not (image_available img5)))
  (at 614 (image_available img6))
  (at 622 (not (image_available img6)))
  (at 743 (image_available img7))
  (at 751 (not (image_available img7)))
  (at 803 (image_available img8))
  (at 811 (not (image_available img8)))
  (at 559 (image_available img9))
  (at 567 (not (image_available img9)))
  (at 672 (image_available img10))
  (at 680 (not (image_available img10)))
  (at 671 (image_available img11))
  (at 679 (not (image_available img11)))
  (at 796 (image_available img12))
  (at 804 (not (image_available img12)))
  (at 736 (image_available img13))
  (at 744 (not (image_available img13)))
  (at 494 (image_available img14))
  (at 502 (not (image_available img14)))
  (at 722 (image_available img15))
  (at 730 (not (image_available img15)))
  (at 1041 (image_available img1))
  (at 1049 (not (image_available img1)))
  (at 937 (image_available img2))
  (at 945 (not (image_available img2)))
  (at 878 (image_available img3))
  (at 886 (not (image_available img3)))
  (at 886 (image_available img4))
  (at 894 (not (image_available img4)))
  (at 873 (image_available img5))
  (at 881 (not (image_available img5)))
  (at 974 (image_available img6))
  (at 982 (not (image_available img6)))
  (at 1103 (image_available img7))
  (at 1111 (not (image_available img7)))
  (at 1163 (image_available img8))
  (at 1171 (not (image_available img8)))
  (at 919 (image_available img9))
  (at 927 (not (image_available img9)))
  (at 1032 (image_available img10))
  (at 1040 (not (image_available img10)))
  (at 1031 (image_available img11))
  (at 1039 (not (image_available img11)))
  (at 1156 (image_available img12))
  (at 1164 (not (image_available img12)))
  (at 1096 (image_available img13))
  (at 1104 (not (image_available img13)))
  (at 854 (image_available img14))
  (at 862 (not (image_available img14)))
  (at 1082 (image_available img15))
  (at 1090 (not (image_available img15)))
  (at 1401 (image_available img1))
  (at 1409 (not (image_available img1)))
  (at 1297 (image_available img2))
  (at 1305 (not (image_available img2)))
  (at 1238 (image_available img3))
  (at 1246 (not (image_available img3)))
  (at 1246 (image_available img4))
  (at 1254 (not (image_available img4)))
  (at 1233 (image_available img5))
  (at 1241 (not (image_available img5)))
  (at 1334 (image_available img6))
  (at 1342 (not (image_available img6)))
  (at 1463 (image_available img7))
  (at 1471 (not (image_available img7)))
  (at 1523 (image_available img8))
  (at 1531 (not (image_available img8)))
  (at 1279 (image_available img9))
  (at 1287 (not (image_available img9)))
  (at 1392 (image_available img10))
  (at 1400 (not (image_available img10)))
  (at 1391 (image_available img11))
  (at 1399 (not (image_available img11)))
  (at 1516 (image_available img12))
  (at 1524 (not (image_available img12)))
  (at 1456 (image_available img13))
  (at 1464 (not (image_available img13)))
  (at 1214 (image_available img14))
  (at 1222 (not (image_available img14)))
  (at 1442 (image_available img15))
  (at 1450 (not (image_available img15)))
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
  (> (image_score img9) 0)
  (<= (image_score img9) 2)

(>= (total_score) 1)
))
(:metric maximize 
  (image_score img9)
)
)