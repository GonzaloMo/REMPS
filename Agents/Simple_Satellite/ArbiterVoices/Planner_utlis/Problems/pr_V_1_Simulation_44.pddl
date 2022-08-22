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

  (memory_free mem5)
  (memory_free mem6)
  (memory_free mem7)
  (memory_free mem8)
  (memory_free mem9)

   (memory_taken mem0 img6)
   (memory_taken mem1 img10)
   (memory_taken mem2 img11)
   (memory_taken mem3 img1)
   (memory_taken mem4 img15)

(image_analysed mem0 img6)
(image_analysed mem2 img11)
(image_analysed mem3 img1)
(image_analysed mem4 img15)

  (at 157 (image_available img1))
  (at 165 (not (image_available img1)))
  (at 1 (image_available img2))
  (at 9 (not (image_available img2)))
  (at 69 (image_available img3))
  (at 77 (not (image_available img3)))
  (at 250 (image_available img6))
  (at 258 (not (image_available img6)))
  (at 201 (image_available img8))
  (at 209 (not (image_available img8)))
  (at 123 (image_available img9))
  (at 131 (not (image_available img9)))
  (at 142 (image_available img10))
  (at 150 (not (image_available img10)))
  (at 72 (image_available img11))
  (at 80 (not (image_available img11)))
  (at 200 (image_available img12))
  (at 208 (not (image_available img12)))
  (at 122 (image_available img13))
  (at 130 (not (image_available img13)))
  (at 177 (image_available img14))
  (at 185 (not (image_available img14)))
  (at 213 (image_available img15))
  (at 221 (not (image_available img15)))
  (at 517 (image_available img1))
  (at 525 (not (image_available img1)))
  (at 361 (image_available img2))
  (at 369 (not (image_available img2)))
  (at 429 (image_available img3))
  (at 437 (not (image_available img3)))
  (at 322 (image_available img4))
  (at 330 (not (image_available img4)))
  (at 336 (image_available img5))
  (at 344 (not (image_available img5)))
  (at 610 (image_available img6))
  (at 618 (not (image_available img6)))
  (at 298 (image_available img7))
  (at 306 (not (image_available img7)))
  (at 561 (image_available img8))
  (at 569 (not (image_available img8)))
  (at 483 (image_available img9))
  (at 491 (not (image_available img9)))
  (at 502 (image_available img10))
  (at 510 (not (image_available img10)))
  (at 432 (image_available img11))
  (at 440 (not (image_available img11)))
  (at 560 (image_available img12))
  (at 568 (not (image_available img12)))
  (at 482 (image_available img13))
  (at 490 (not (image_available img13)))
  (at 537 (image_available img14))
  (at 545 (not (image_available img14)))
  (at 573 (image_available img15))
  (at 581 (not (image_available img15)))
  (at 877 (image_available img1))
  (at 885 (not (image_available img1)))
  (at 721 (image_available img2))
  (at 729 (not (image_available img2)))
  (at 789 (image_available img3))
  (at 797 (not (image_available img3)))
  (at 682 (image_available img4))
  (at 690 (not (image_available img4)))
  (at 696 (image_available img5))
  (at 704 (not (image_available img5)))
  (at 970 (image_available img6))
  (at 978 (not (image_available img6)))
  (at 658 (image_available img7))
  (at 666 (not (image_available img7)))
  (at 921 (image_available img8))
  (at 929 (not (image_available img8)))
  (at 843 (image_available img9))
  (at 851 (not (image_available img9)))
  (at 862 (image_available img10))
  (at 870 (not (image_available img10)))
  (at 792 (image_available img11))
  (at 800 (not (image_available img11)))
  (at 920 (image_available img12))
  (at 928 (not (image_available img12)))
  (at 842 (image_available img13))
  (at 850 (not (image_available img13)))
  (at 897 (image_available img14))
  (at 905 (not (image_available img14)))
  (at 933 (image_available img15))
  (at 941 (not (image_available img15)))
  (at 1237 (image_available img1))
  (at 1245 (not (image_available img1)))
  (at 1081 (image_available img2))
  (at 1089 (not (image_available img2)))
  (at 1149 (image_available img3))
  (at 1157 (not (image_available img3)))
  (at 1042 (image_available img4))
  (at 1050 (not (image_available img4)))
  (at 1056 (image_available img5))
  (at 1064 (not (image_available img5)))
  (at 1330 (image_available img6))
  (at 1338 (not (image_available img6)))
  (at 1018 (image_available img7))
  (at 1026 (not (image_available img7)))
  (at 1281 (image_available img8))
  (at 1289 (not (image_available img8)))
  (at 1203 (image_available img9))
  (at 1211 (not (image_available img9)))
  (at 1222 (image_available img10))
  (at 1230 (not (image_available img10)))
  (at 1152 (image_available img11))
  (at 1160 (not (image_available img11)))
  (at 1280 (image_available img12))
  (at 1288 (not (image_available img12)))
  (at 1202 (image_available img13))
  (at 1210 (not (image_available img13)))
  (at 1257 (image_available img14))
  (at 1265 (not (image_available img14)))
  (at 1293 (image_available img15))
  (at 1301 (not (image_available img15)))
  (at 1597 (image_available img1))
  (at 1605 (not (image_available img1)))
  (at 1441 (image_available img2))
  (at 1449 (not (image_available img2)))
  (at 1509 (image_available img3))
  (at 1517 (not (image_available img3)))
  (at 1402 (image_available img4))
  (at 1410 (not (image_available img4)))
  (at 1416 (image_available img5))
  (at 1424 (not (image_available img5)))
  (at 1690 (image_available img6))
  (at 1698 (not (image_available img6)))
  (at 1378 (image_available img7))
  (at 1386 (not (image_available img7)))
  (at 1641 (image_available img8))
  (at 1649 (not (image_available img8)))
  (at 1563 (image_available img9))
  (at 1571 (not (image_available img9)))
  (at 1582 (image_available img10))
  (at 1590 (not (image_available img10)))
  (at 1512 (image_available img11))
  (at 1520 (not (image_available img11)))
  (at 1640 (image_available img12))
  (at 1648 (not (image_available img12)))
  (at 1562 (image_available img13))
  (at 1570 (not (image_available img13)))
  (at 1617 (image_available img14))
  (at 1625 (not (image_available img14)))
  (at 1653 (image_available img15))
  (at 1661 (not (image_available img15)))
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
  (> (image_score img1) 0)
  (<= (image_score img1) 11)

  (> (image_score img7) 0)
  (<= (image_score img7) 15)

  (> (image_score img8) 0)
  (<= (image_score img8) 8)

  (> (image_score img9) 0)
  (<= (image_score img9) 10)

  (> (image_score img10) 0)
  (<= (image_score img10) 3)

  (> (image_score img12) 0)
  (<= (image_score img12) 3)

  (> (image_score img14) 0)
  (<= (image_score img14) 3)

(>= (total_score) 11)
))
(:metric maximize (+
  (image_score img1)
    (+ (image_score img7)
      (+ (image_score img8)
        (+ (image_score img9)
          (+ (image_score img10)
            (+ (image_score img12)
              (image_score img14)
            )
          )
        )
      )
    )
  )
)
)
