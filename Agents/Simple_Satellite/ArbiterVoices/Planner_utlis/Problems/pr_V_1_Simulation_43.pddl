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



  (at 232 (image_available img1))
  (at 240 (not (image_available img1)))
  (at 187 (image_available img2))
  (at 195 (not (image_available img2)))
  (at 253 (image_available img3))
  (at 261 (not (image_available img3)))
  (at 79 (image_available img4))
  (at 87 (not (image_available img4)))
  (at 93 (image_available img5))
  (at 101 (not (image_available img5)))
  (at 346 (image_available img6))
  (at 354 (not (image_available img6)))
  (at 136 (image_available img7))
  (at 144 (not (image_available img7)))
  (at 91 (image_available img8))
  (at 99 (not (image_available img8)))
  (at 174 (image_available img9))
  (at 182 (not (image_available img9)))
  (at 140 (image_available img10))
  (at 148 (not (image_available img10)))
  (at 22 (image_available img11))
  (at 30 (not (image_available img11)))
  (at 24 (image_available img12))
  (at 32 (not (image_available img12)))
  (at 242 (image_available img13))
  (at 250 (not (image_available img13)))
  (at 210 (image_available img14))
  (at 218 (not (image_available img14)))
  (at 262 (image_available img15))
  (at 270 (not (image_available img15)))
  (at 592 (image_available img1))
  (at 600 (not (image_available img1)))
  (at 547 (image_available img2))
  (at 555 (not (image_available img2)))
  (at 613 (image_available img3))
  (at 621 (not (image_available img3)))
  (at 439 (image_available img4))
  (at 447 (not (image_available img4)))
  (at 453 (image_available img5))
  (at 461 (not (image_available img5)))
  (at 706 (image_available img6))
  (at 714 (not (image_available img6)))
  (at 496 (image_available img7))
  (at 504 (not (image_available img7)))
  (at 451 (image_available img8))
  (at 459 (not (image_available img8)))
  (at 534 (image_available img9))
  (at 542 (not (image_available img9)))
  (at 500 (image_available img10))
  (at 508 (not (image_available img10)))
  (at 382 (image_available img11))
  (at 390 (not (image_available img11)))
  (at 384 (image_available img12))
  (at 392 (not (image_available img12)))
  (at 602 (image_available img13))
  (at 610 (not (image_available img13)))
  (at 570 (image_available img14))
  (at 578 (not (image_available img14)))
  (at 622 (image_available img15))
  (at 630 (not (image_available img15)))
  (at 952 (image_available img1))
  (at 960 (not (image_available img1)))
  (at 907 (image_available img2))
  (at 915 (not (image_available img2)))
  (at 973 (image_available img3))
  (at 981 (not (image_available img3)))
  (at 799 (image_available img4))
  (at 807 (not (image_available img4)))
  (at 813 (image_available img5))
  (at 821 (not (image_available img5)))
  (at 1066 (image_available img6))
  (at 1074 (not (image_available img6)))
  (at 856 (image_available img7))
  (at 864 (not (image_available img7)))
  (at 811 (image_available img8))
  (at 819 (not (image_available img8)))
  (at 894 (image_available img9))
  (at 902 (not (image_available img9)))
  (at 860 (image_available img10))
  (at 868 (not (image_available img10)))
  (at 742 (image_available img11))
  (at 750 (not (image_available img11)))
  (at 744 (image_available img12))
  (at 752 (not (image_available img12)))
  (at 962 (image_available img13))
  (at 970 (not (image_available img13)))
  (at 930 (image_available img14))
  (at 938 (not (image_available img14)))
  (at 982 (image_available img15))
  (at 990 (not (image_available img15)))
  (at 1312 (image_available img1))
  (at 1320 (not (image_available img1)))
  (at 1267 (image_available img2))
  (at 1275 (not (image_available img2)))
  (at 1333 (image_available img3))
  (at 1341 (not (image_available img3)))
  (at 1159 (image_available img4))
  (at 1167 (not (image_available img4)))
  (at 1173 (image_available img5))
  (at 1181 (not (image_available img5)))
  (at 1426 (image_available img6))
  (at 1434 (not (image_available img6)))
  (at 1216 (image_available img7))
  (at 1224 (not (image_available img7)))
  (at 1171 (image_available img8))
  (at 1179 (not (image_available img8)))
  (at 1254 (image_available img9))
  (at 1262 (not (image_available img9)))
  (at 1220 (image_available img10))
  (at 1228 (not (image_available img10)))
  (at 1102 (image_available img11))
  (at 1110 (not (image_available img11)))
  (at 1104 (image_available img12))
  (at 1112 (not (image_available img12)))
  (at 1322 (image_available img13))
  (at 1330 (not (image_available img13)))
  (at 1290 (image_available img14))
  (at 1298 (not (image_available img14)))
  (at 1342 (image_available img15))
  (at 1350 (not (image_available img15)))
  (at 1672 (image_available img1))
  (at 1680 (not (image_available img1)))
  (at 1627 (image_available img2))
  (at 1635 (not (image_available img2)))
  (at 1693 (image_available img3))
  (at 1701 (not (image_available img3)))
  (at 1519 (image_available img4))
  (at 1527 (not (image_available img4)))
  (at 1533 (image_available img5))
  (at 1541 (not (image_available img5)))
  (at 1786 (image_available img6))
  (at 1794 (not (image_available img6)))
  (at 1576 (image_available img7))
  (at 1584 (not (image_available img7)))
  (at 1531 (image_available img8))
  (at 1539 (not (image_available img8)))
  (at 1614 (image_available img9))
  (at 1622 (not (image_available img9)))
  (at 1580 (image_available img10))
  (at 1588 (not (image_available img10)))
  (at 1462 (image_available img11))
  (at 1470 (not (image_available img11)))
  (at 1464 (image_available img12))
  (at 1472 (not (image_available img12)))
  (at 1682 (image_available img13))
  (at 1690 (not (image_available img13)))
  (at 1650 (image_available img14))
  (at 1658 (not (image_available img14)))
  (at 1702 (image_available img15))
  (at 1710 (not (image_available img15)))
  (at 76.0 (dump_available))
  (at 114.0 (not (dump_available)))
  (at 256.0 (dump_available))
  (at 294.0 (not (dump_available)))
  (at 436.0 (dump_available))
  (at 474.0 (not (dump_available)))
  (at 616.0 (dump_available))
  (at 654.0 (not (dump_available)))
  (at 796.0 (dump_available))
  (at 834.0 (not (dump_available)))
  (at 976.0 (dump_available))
  (at 1014.0 (not (dump_available)))
  (at 1156.0 (dump_available))
  (at 1194.0 (not (dump_available)))
  (at 1336.0 (dump_available))
  (at 1374.0 (not (dump_available)))
  (at 1516.0 (dump_available))
  (at 1554.0 (not (dump_available)))
  (at 1696.0 (dump_available))
  (at 1734.0 (not (dump_available)))

)
(:goal (and
  (> (image_score img3) 0)
  (<= (image_score img3) 11)

  (> (image_score img4) 0)
  (<= (image_score img4) 8)

  (> (image_score img9) 0)
  (<= (image_score img9) 5)

  (> (image_score img10) 0)
  (<= (image_score img10) 12)

  (> (image_score img11) 0)
  (<= (image_score img11) 12)

  (> (image_score img13) 0)
  (<= (image_score img13) 1)

  (> (image_score img15) 0)
  (<= (image_score img15) 1)

(>= (total_score) 10)
))
(:metric maximize (+
  (image_score img3)
    (+ (image_score img4)
      (+ (image_score img9)
        (+ (image_score img10)
          (+ (image_score img11)
            (+ (image_score img13)
              (image_score img15)
            )
          )
        )
      )
    )
  )
)
)
