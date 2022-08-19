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

  (memory_free mem2)
  (memory_free mem3)
  (memory_free mem4)
  (memory_free mem5)
  (memory_free mem6)
  (memory_free mem7)
  (memory_free mem8)
  (memory_free mem9)

   (memory_taken mem0 img15)
   (memory_taken mem1 img4)

(image_analysed mem0 img15)
(image_analysed mem1 img4)

  (at 93 (image_available img1))
  (at 101 (not (image_available img1)))
  (at 36 (image_available img4))
  (at 44 (not (image_available img4)))
  (at 232 (image_available img5))
  (at 240 (not (image_available img5)))
  (at 223 (image_available img6))
  (at 231 (not (image_available img6)))
  (at 194 (image_available img8))
  (at 202 (not (image_available img8)))
  (at 59 (image_available img10))
  (at 67 (not (image_available img10)))
  (at 40 (image_available img12))
  (at 48 (not (image_available img12)))
  (at 164 (image_available img13))
  (at 172 (not (image_available img13)))
  (at 80 (image_available img14))
  (at 88 (not (image_available img14)))
  (at 453 (image_available img1))
  (at 461 (not (image_available img1)))
  (at 322 (image_available img2))
  (at 330 (not (image_available img2)))
  (at 335 (image_available img3))
  (at 343 (not (image_available img3)))
  (at 396 (image_available img4))
  (at 404 (not (image_available img4)))
  (at 592 (image_available img5))
  (at 600 (not (image_available img5)))
  (at 583 (image_available img6))
  (at 591 (not (image_available img6)))
  (at 323 (image_available img7))
  (at 331 (not (image_available img7)))
  (at 554 (image_available img8))
  (at 562 (not (image_available img8)))
  (at 312 (image_available img9))
  (at 320 (not (image_available img9)))
  (at 419 (image_available img10))
  (at 427 (not (image_available img10)))
  (at 309 (image_available img11))
  (at 317 (not (image_available img11)))
  (at 400 (image_available img12))
  (at 408 (not (image_available img12)))
  (at 524 (image_available img13))
  (at 532 (not (image_available img13)))
  (at 440 (image_available img14))
  (at 448 (not (image_available img14)))
  (at 282 (image_available img15))
  (at 290 (not (image_available img15)))
  (at 813 (image_available img1))
  (at 821 (not (image_available img1)))
  (at 682 (image_available img2))
  (at 690 (not (image_available img2)))
  (at 695 (image_available img3))
  (at 703 (not (image_available img3)))
  (at 756 (image_available img4))
  (at 764 (not (image_available img4)))
  (at 952 (image_available img5))
  (at 960 (not (image_available img5)))
  (at 943 (image_available img6))
  (at 951 (not (image_available img6)))
  (at 683 (image_available img7))
  (at 691 (not (image_available img7)))
  (at 914 (image_available img8))
  (at 922 (not (image_available img8)))
  (at 672 (image_available img9))
  (at 680 (not (image_available img9)))
  (at 779 (image_available img10))
  (at 787 (not (image_available img10)))
  (at 669 (image_available img11))
  (at 677 (not (image_available img11)))
  (at 760 (image_available img12))
  (at 768 (not (image_available img12)))
  (at 884 (image_available img13))
  (at 892 (not (image_available img13)))
  (at 800 (image_available img14))
  (at 808 (not (image_available img14)))
  (at 642 (image_available img15))
  (at 650 (not (image_available img15)))
  (at 1173 (image_available img1))
  (at 1181 (not (image_available img1)))
  (at 1042 (image_available img2))
  (at 1050 (not (image_available img2)))
  (at 1055 (image_available img3))
  (at 1063 (not (image_available img3)))
  (at 1116 (image_available img4))
  (at 1124 (not (image_available img4)))
  (at 1312 (image_available img5))
  (at 1320 (not (image_available img5)))
  (at 1303 (image_available img6))
  (at 1311 (not (image_available img6)))
  (at 1043 (image_available img7))
  (at 1051 (not (image_available img7)))
  (at 1274 (image_available img8))
  (at 1282 (not (image_available img8)))
  (at 1032 (image_available img9))
  (at 1040 (not (image_available img9)))
  (at 1139 (image_available img10))
  (at 1147 (not (image_available img10)))
  (at 1029 (image_available img11))
  (at 1037 (not (image_available img11)))
  (at 1120 (image_available img12))
  (at 1128 (not (image_available img12)))
  (at 1244 (image_available img13))
  (at 1252 (not (image_available img13)))
  (at 1160 (image_available img14))
  (at 1168 (not (image_available img14)))
  (at 1002 (image_available img15))
  (at 1010 (not (image_available img15)))
  (at 1533 (image_available img1))
  (at 1541 (not (image_available img1)))
  (at 1402 (image_available img2))
  (at 1410 (not (image_available img2)))
  (at 1415 (image_available img3))
  (at 1423 (not (image_available img3)))
  (at 1476 (image_available img4))
  (at 1484 (not (image_available img4)))
  (at 1672 (image_available img5))
  (at 1680 (not (image_available img5)))
  (at 1663 (image_available img6))
  (at 1671 (not (image_available img6)))
  (at 1403 (image_available img7))
  (at 1411 (not (image_available img7)))
  (at 1634 (image_available img8))
  (at 1642 (not (image_available img8)))
  (at 1392 (image_available img9))
  (at 1400 (not (image_available img9)))
  (at 1499 (image_available img10))
  (at 1507 (not (image_available img10)))
  (at 1389 (image_available img11))
  (at 1397 (not (image_available img11)))
  (at 1480 (image_available img12))
  (at 1488 (not (image_available img12)))
  (at 1604 (image_available img13))
  (at 1612 (not (image_available img13)))
  (at 1520 (image_available img14))
  (at 1528 (not (image_available img14)))
  (at 1362 (image_available img15))
  (at 1370 (not (image_available img15)))
  (at 1 (dump_available))
  (at 32.0 (not (dump_available)))
  (at 174.0 (dump_available))
  (at 212.0 (not (dump_available)))
  (at 354.0 (dump_available))
  (at 392.0 (not (dump_available)))
  (at 534.0 (dump_available))
  (at 572.0 (not (dump_available)))
  (at 714.0 (dump_available))
  (at 752.0 (not (dump_available)))
  (at 894.0 (dump_available))
  (at 932.0 (not (dump_available)))
  (at 1074.0 (dump_available))
  (at 1112.0 (not (dump_available)))
  (at 1254.0 (dump_available))
  (at 1292.0 (not (dump_available)))
  (at 1434.0 (dump_available))
  (at 1472.0 (not (dump_available)))
  (at 1614.0 (dump_available))
  (at 1652.0 (not (dump_available)))

)
(:goal (and
  (> (image_score img7) 0)
  (<= (image_score img7) 1)

(>= (total_score) 1)
))
(:metric maximize 
  (image_score img7)
)
)
