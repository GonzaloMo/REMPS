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
  (memory_free mem4)
  (memory_free mem5)
  (memory_free mem6)
  (memory_free mem7)
  (memory_free mem8)
  (memory_free mem9)

   (memory_taken mem1 img9)
   (memory_taken mem2 img8)
   (memory_taken mem3 img13)

(image_analysed mem1 img9)
(image_analysed mem3 img13)

  (at 259 (image_available img1))
  (at 267 (not (image_available img1)))
  (at 171 (image_available img2))
  (at 179 (not (image_available img2)))
  (at 190 (image_available img3))
  (at 198 (not (image_available img3)))
  (at 0 (image_available img4))
  (at 0 (not (image_available img4)))
  (at 43 (image_available img5))
  (at 51 (not (image_available img5)))
  (at 80 (image_available img6))
  (at 88 (not (image_available img6)))
  (at 0 (image_available img7))
  (at 5 (not (image_available img7)))
  (at 132 (image_available img8))
  (at 140 (not (image_available img8)))
  (at 74 (image_available img9))
  (at 82 (not (image_available img9)))
  (at 152 (image_available img10))
  (at 160 (not (image_available img10)))
  (at 9 (image_available img11))
  (at 17 (not (image_available img11)))
  (at 95 (image_available img12))
  (at 103 (not (image_available img12)))
  (at 253 (image_available img13))
  (at 261 (not (image_available img13)))
  (at 147 (image_available img14))
  (at 155 (not (image_available img14)))
  (at 8 (image_available img15))
  (at 16 (not (image_available img15)))
  (at 619 (image_available img1))
  (at 627 (not (image_available img1)))
  (at 531 (image_available img2))
  (at 539 (not (image_available img2)))
  (at 550 (image_available img3))
  (at 558 (not (image_available img3)))
  (at 352 (image_available img4))
  (at 360 (not (image_available img4)))
  (at 403 (image_available img5))
  (at 411 (not (image_available img5)))
  (at 440 (image_available img6))
  (at 448 (not (image_available img6)))
  (at 357 (image_available img7))
  (at 365 (not (image_available img7)))
  (at 492 (image_available img8))
  (at 500 (not (image_available img8)))
  (at 434 (image_available img9))
  (at 442 (not (image_available img9)))
  (at 512 (image_available img10))
  (at 520 (not (image_available img10)))
  (at 369 (image_available img11))
  (at 377 (not (image_available img11)))
  (at 455 (image_available img12))
  (at 463 (not (image_available img12)))
  (at 613 (image_available img13))
  (at 621 (not (image_available img13)))
  (at 507 (image_available img14))
  (at 515 (not (image_available img14)))
  (at 368 (image_available img15))
  (at 376 (not (image_available img15)))
  (at 979 (image_available img1))
  (at 987 (not (image_available img1)))
  (at 891 (image_available img2))
  (at 899 (not (image_available img2)))
  (at 910 (image_available img3))
  (at 918 (not (image_available img3)))
  (at 712 (image_available img4))
  (at 720 (not (image_available img4)))
  (at 763 (image_available img5))
  (at 771 (not (image_available img5)))
  (at 800 (image_available img6))
  (at 808 (not (image_available img6)))
  (at 717 (image_available img7))
  (at 725 (not (image_available img7)))
  (at 852 (image_available img8))
  (at 860 (not (image_available img8)))
  (at 794 (image_available img9))
  (at 802 (not (image_available img9)))
  (at 872 (image_available img10))
  (at 880 (not (image_available img10)))
  (at 729 (image_available img11))
  (at 737 (not (image_available img11)))
  (at 815 (image_available img12))
  (at 823 (not (image_available img12)))
  (at 973 (image_available img13))
  (at 981 (not (image_available img13)))
  (at 867 (image_available img14))
  (at 875 (not (image_available img14)))
  (at 728 (image_available img15))
  (at 736 (not (image_available img15)))
  (at 1339 (image_available img1))
  (at 1347 (not (image_available img1)))
  (at 1251 (image_available img2))
  (at 1259 (not (image_available img2)))
  (at 1270 (image_available img3))
  (at 1278 (not (image_available img3)))
  (at 1072 (image_available img4))
  (at 1080 (not (image_available img4)))
  (at 1123 (image_available img5))
  (at 1131 (not (image_available img5)))
  (at 1160 (image_available img6))
  (at 1168 (not (image_available img6)))
  (at 1077 (image_available img7))
  (at 1085 (not (image_available img7)))
  (at 1212 (image_available img8))
  (at 1220 (not (image_available img8)))
  (at 1154 (image_available img9))
  (at 1162 (not (image_available img9)))
  (at 1232 (image_available img10))
  (at 1240 (not (image_available img10)))
  (at 1089 (image_available img11))
  (at 1097 (not (image_available img11)))
  (at 1175 (image_available img12))
  (at 1183 (not (image_available img12)))
  (at 1333 (image_available img13))
  (at 1341 (not (image_available img13)))
  (at 1227 (image_available img14))
  (at 1235 (not (image_available img14)))
  (at 1088 (image_available img15))
  (at 1096 (not (image_available img15)))
  (at 1699 (image_available img1))
  (at 1707 (not (image_available img1)))
  (at 1611 (image_available img2))
  (at 1619 (not (image_available img2)))
  (at 1630 (image_available img3))
  (at 1638 (not (image_available img3)))
  (at 1432 (image_available img4))
  (at 1440 (not (image_available img4)))
  (at 1483 (image_available img5))
  (at 1491 (not (image_available img5)))
  (at 1520 (image_available img6))
  (at 1528 (not (image_available img6)))
  (at 1437 (image_available img7))
  (at 1445 (not (image_available img7)))
  (at 1572 (image_available img8))
  (at 1580 (not (image_available img8)))
  (at 1514 (image_available img9))
  (at 1522 (not (image_available img9)))
  (at 1592 (image_available img10))
  (at 1600 (not (image_available img10)))
  (at 1449 (image_available img11))
  (at 1457 (not (image_available img11)))
  (at 1535 (image_available img12))
  (at 1543 (not (image_available img12)))
  (at 1693 (image_available img13))
  (at 1701 (not (image_available img13)))
  (at 1587 (image_available img14))
  (at 1595 (not (image_available img14)))
  (at 1448 (image_available img15))
  (at 1456 (not (image_available img15)))
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
  (at 1618.0 (dump_available))
  (at 1656.0 (not (dump_available)))

)
(:goal (and
  (> (image_score img6) 0)
  (<= (image_score img6) 14.0)

  (> (image_score img7) 0)
  (<= (image_score img7) 2.0)

  (> (image_score img10) 0)
  (<= (image_score img10) 14.0)

  (> (image_score img14) 0)
  (<= (image_score img14) 5.0)

(>= (total_score) 7)
))
(:metric maximize (+
  (image_score img6)
    (+ (image_score img7)
      (+ (image_score img10)
        (image_score img14)
      )
    )
  )
)
)