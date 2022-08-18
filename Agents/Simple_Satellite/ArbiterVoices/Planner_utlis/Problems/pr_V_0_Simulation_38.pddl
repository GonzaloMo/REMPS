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



  (at 1 (image_available img1))
  (at 9 (not (image_available img1)))
  (at 59 (image_available img2))
  (at 67 (not (image_available img2)))
  (at 145 (image_available img3))
  (at 153 (not (image_available img3)))
  (at 59 (image_available img4))
  (at 67 (not (image_available img4)))
  (at 191 (image_available img5))
  (at 199 (not (image_available img5)))
  (at 39 (image_available img6))
  (at 47 (not (image_available img6)))
  (at 227 (image_available img7))
  (at 235 (not (image_available img7)))
  (at 252 (image_available img8))
  (at 260 (not (image_available img8)))
  (at 157 (image_available img9))
  (at 165 (not (image_available img9)))
  (at 99 (image_available img10))
  (at 107 (not (image_available img10)))
  (at 139 (image_available img11))
  (at 147 (not (image_available img11)))
  (at 292 (image_available img12))
  (at 300 (not (image_available img12)))
  (at 188 (image_available img13))
  (at 196 (not (image_available img13)))
  (at 46 (image_available img14))
  (at 54 (not (image_available img14)))
  (at 293 (image_available img15))
  (at 301 (not (image_available img15)))
  (at 361 (image_available img1))
  (at 369 (not (image_available img1)))
  (at 419 (image_available img2))
  (at 427 (not (image_available img2)))
  (at 505 (image_available img3))
  (at 513 (not (image_available img3)))
  (at 419 (image_available img4))
  (at 427 (not (image_available img4)))
  (at 551 (image_available img5))
  (at 559 (not (image_available img5)))
  (at 399 (image_available img6))
  (at 407 (not (image_available img6)))
  (at 587 (image_available img7))
  (at 595 (not (image_available img7)))
  (at 612 (image_available img8))
  (at 620 (not (image_available img8)))
  (at 517 (image_available img9))
  (at 525 (not (image_available img9)))
  (at 459 (image_available img10))
  (at 467 (not (image_available img10)))
  (at 499 (image_available img11))
  (at 507 (not (image_available img11)))
  (at 652 (image_available img12))
  (at 660 (not (image_available img12)))
  (at 548 (image_available img13))
  (at 556 (not (image_available img13)))
  (at 406 (image_available img14))
  (at 414 (not (image_available img14)))
  (at 653 (image_available img15))
  (at 661 (not (image_available img15)))
  (at 721 (image_available img1))
  (at 729 (not (image_available img1)))
  (at 779 (image_available img2))
  (at 787 (not (image_available img2)))
  (at 865 (image_available img3))
  (at 873 (not (image_available img3)))
  (at 779 (image_available img4))
  (at 787 (not (image_available img4)))
  (at 911 (image_available img5))
  (at 919 (not (image_available img5)))
  (at 759 (image_available img6))
  (at 767 (not (image_available img6)))
  (at 947 (image_available img7))
  (at 955 (not (image_available img7)))
  (at 972 (image_available img8))
  (at 980 (not (image_available img8)))
  (at 877 (image_available img9))
  (at 885 (not (image_available img9)))
  (at 819 (image_available img10))
  (at 827 (not (image_available img10)))
  (at 859 (image_available img11))
  (at 867 (not (image_available img11)))
  (at 1012 (image_available img12))
  (at 1020 (not (image_available img12)))
  (at 908 (image_available img13))
  (at 916 (not (image_available img13)))
  (at 766 (image_available img14))
  (at 774 (not (image_available img14)))
  (at 1013 (image_available img15))
  (at 1021 (not (image_available img15)))
  (at 1081 (image_available img1))
  (at 1089 (not (image_available img1)))
  (at 1139 (image_available img2))
  (at 1147 (not (image_available img2)))
  (at 1225 (image_available img3))
  (at 1233 (not (image_available img3)))
  (at 1139 (image_available img4))
  (at 1147 (not (image_available img4)))
  (at 1271 (image_available img5))
  (at 1279 (not (image_available img5)))
  (at 1119 (image_available img6))
  (at 1127 (not (image_available img6)))
  (at 1307 (image_available img7))
  (at 1315 (not (image_available img7)))
  (at 1332 (image_available img8))
  (at 1340 (not (image_available img8)))
  (at 1237 (image_available img9))
  (at 1245 (not (image_available img9)))
  (at 1179 (image_available img10))
  (at 1187 (not (image_available img10)))
  (at 1219 (image_available img11))
  (at 1227 (not (image_available img11)))
  (at 1372 (image_available img12))
  (at 1380 (not (image_available img12)))
  (at 1268 (image_available img13))
  (at 1276 (not (image_available img13)))
  (at 1126 (image_available img14))
  (at 1134 (not (image_available img14)))
  (at 1373 (image_available img15))
  (at 1381 (not (image_available img15)))
  (at 1441 (image_available img1))
  (at 1449 (not (image_available img1)))
  (at 1499 (image_available img2))
  (at 1507 (not (image_available img2)))
  (at 1585 (image_available img3))
  (at 1593 (not (image_available img3)))
  (at 1499 (image_available img4))
  (at 1507 (not (image_available img4)))
  (at 1631 (image_available img5))
  (at 1639 (not (image_available img5)))
  (at 1479 (image_available img6))
  (at 1487 (not (image_available img6)))
  (at 1667 (image_available img7))
  (at 1675 (not (image_available img7)))
  (at 1692 (image_available img8))
  (at 1700 (not (image_available img8)))
  (at 1597 (image_available img9))
  (at 1605 (not (image_available img9)))
  (at 1539 (image_available img10))
  (at 1547 (not (image_available img10)))
  (at 1579 (image_available img11))
  (at 1587 (not (image_available img11)))
  (at 1732 (image_available img12))
  (at 1740 (not (image_available img12)))
  (at 1628 (image_available img13))
  (at 1636 (not (image_available img13)))
  (at 1486 (image_available img14))
  (at 1494 (not (image_available img14)))
  (at 1733 (image_available img15))
  (at 1741 (not (image_available img15)))
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
  (<= (image_score img3) 3)

  (> (image_score img4) 0)
  (<= (image_score img4) 8)

  (> (image_score img6) 0)
  (<= (image_score img6) 2)

  (> (image_score img9) 0)
  (<= (image_score img9) 7)

  (> (image_score img11) 0)
  (<= (image_score img11) 7)

  (> (image_score img14) 0)
  (<= (image_score img14) 8)

  (> (image_score img15) 0)
  (<= (image_score img15) 8)

(>= (total_score) 9)
))
(:metric maximize (+
  (image_score img3)
    (+ (image_score img4)
      (+ (image_score img6)
        (+ (image_score img9)
          (+ (image_score img11)
            (+ (image_score img14)
              (image_score img15)
            )
          )
        )
      )
    )
  )
)
)
