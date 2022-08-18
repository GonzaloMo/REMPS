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



  (at 31 (image_available img1))
  (at 39 (not (image_available img1)))
  (at 189 (image_available img2))
  (at 197 (not (image_available img2)))
  (at 49 (image_available img3))
  (at 57 (not (image_available img3)))
  (at 158 (image_available img4))
  (at 166 (not (image_available img4)))
  (at 100 (image_available img5))
  (at 108 (not (image_available img5)))
  (at 145 (image_available img6))
  (at 153 (not (image_available img6)))
  (at 236 (image_available img7))
  (at 244 (not (image_available img7)))
  (at 255 (image_available img8))
  (at 263 (not (image_available img8)))
  (at 219 (image_available img9))
  (at 227 (not (image_available img9)))
  (at 350 (image_available img10))
  (at 358 (not (image_available img10)))
  (at 301 (image_available img11))
  (at 309 (not (image_available img11)))
  (at 105 (image_available img12))
  (at 113 (not (image_available img12)))
  (at 238 (image_available img13))
  (at 246 (not (image_available img13)))
  (at 229 (image_available img14))
  (at 237 (not (image_available img14)))
  (at 216 (image_available img15))
  (at 224 (not (image_available img15)))
  (at 391 (image_available img1))
  (at 399 (not (image_available img1)))
  (at 549 (image_available img2))
  (at 557 (not (image_available img2)))
  (at 409 (image_available img3))
  (at 417 (not (image_available img3)))
  (at 518 (image_available img4))
  (at 526 (not (image_available img4)))
  (at 460 (image_available img5))
  (at 468 (not (image_available img5)))
  (at 505 (image_available img6))
  (at 513 (not (image_available img6)))
  (at 596 (image_available img7))
  (at 604 (not (image_available img7)))
  (at 615 (image_available img8))
  (at 623 (not (image_available img8)))
  (at 579 (image_available img9))
  (at 587 (not (image_available img9)))
  (at 710 (image_available img10))
  (at 718 (not (image_available img10)))
  (at 661 (image_available img11))
  (at 669 (not (image_available img11)))
  (at 465 (image_available img12))
  (at 473 (not (image_available img12)))
  (at 598 (image_available img13))
  (at 606 (not (image_available img13)))
  (at 589 (image_available img14))
  (at 597 (not (image_available img14)))
  (at 576 (image_available img15))
  (at 584 (not (image_available img15)))
  (at 751 (image_available img1))
  (at 759 (not (image_available img1)))
  (at 909 (image_available img2))
  (at 917 (not (image_available img2)))
  (at 769 (image_available img3))
  (at 777 (not (image_available img3)))
  (at 878 (image_available img4))
  (at 886 (not (image_available img4)))
  (at 820 (image_available img5))
  (at 828 (not (image_available img5)))
  (at 865 (image_available img6))
  (at 873 (not (image_available img6)))
  (at 956 (image_available img7))
  (at 964 (not (image_available img7)))
  (at 975 (image_available img8))
  (at 983 (not (image_available img8)))
  (at 939 (image_available img9))
  (at 947 (not (image_available img9)))
  (at 1070 (image_available img10))
  (at 1078 (not (image_available img10)))
  (at 1021 (image_available img11))
  (at 1029 (not (image_available img11)))
  (at 825 (image_available img12))
  (at 833 (not (image_available img12)))
  (at 958 (image_available img13))
  (at 966 (not (image_available img13)))
  (at 949 (image_available img14))
  (at 957 (not (image_available img14)))
  (at 936 (image_available img15))
  (at 944 (not (image_available img15)))
  (at 1111 (image_available img1))
  (at 1119 (not (image_available img1)))
  (at 1269 (image_available img2))
  (at 1277 (not (image_available img2)))
  (at 1129 (image_available img3))
  (at 1137 (not (image_available img3)))
  (at 1238 (image_available img4))
  (at 1246 (not (image_available img4)))
  (at 1180 (image_available img5))
  (at 1188 (not (image_available img5)))
  (at 1225 (image_available img6))
  (at 1233 (not (image_available img6)))
  (at 1316 (image_available img7))
  (at 1324 (not (image_available img7)))
  (at 1335 (image_available img8))
  (at 1343 (not (image_available img8)))
  (at 1299 (image_available img9))
  (at 1307 (not (image_available img9)))
  (at 1430 (image_available img10))
  (at 1438 (not (image_available img10)))
  (at 1381 (image_available img11))
  (at 1389 (not (image_available img11)))
  (at 1185 (image_available img12))
  (at 1193 (not (image_available img12)))
  (at 1318 (image_available img13))
  (at 1326 (not (image_available img13)))
  (at 1309 (image_available img14))
  (at 1317 (not (image_available img14)))
  (at 1296 (image_available img15))
  (at 1304 (not (image_available img15)))
  (at 1471 (image_available img1))
  (at 1479 (not (image_available img1)))
  (at 1629 (image_available img2))
  (at 1637 (not (image_available img2)))
  (at 1489 (image_available img3))
  (at 1497 (not (image_available img3)))
  (at 1598 (image_available img4))
  (at 1606 (not (image_available img4)))
  (at 1540 (image_available img5))
  (at 1548 (not (image_available img5)))
  (at 1585 (image_available img6))
  (at 1593 (not (image_available img6)))
  (at 1676 (image_available img7))
  (at 1684 (not (image_available img7)))
  (at 1695 (image_available img8))
  (at 1703 (not (image_available img8)))
  (at 1659 (image_available img9))
  (at 1667 (not (image_available img9)))
  (at 1790 (image_available img10))
  (at 1798 (not (image_available img10)))
  (at 1741 (image_available img11))
  (at 1749 (not (image_available img11)))
  (at 1545 (image_available img12))
  (at 1553 (not (image_available img12)))
  (at 1678 (image_available img13))
  (at 1686 (not (image_available img13)))
  (at 1669 (image_available img14))
  (at 1677 (not (image_available img14)))
  (at 1656 (image_available img15))
  (at 1664 (not (image_available img15)))
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
  (> (image_score img1) 0)
  (<= (image_score img1) 14)

  (> (image_score img4) 0)
  (<= (image_score img4) 4)

  (> (image_score img7) 0)
  (<= (image_score img7) 14)

  (> (image_score img9) 0)
  (<= (image_score img9) 3)

  (> (image_score img12) 0)
  (<= (image_score img12) 4)

  (> (image_score img13) 0)
  (<= (image_score img13) 14)

  (> (image_score img15) 0)
  (<= (image_score img15) 12)

(>= (total_score) 13)
))
(:metric maximize (+
  (image_score img1)
    (+ (image_score img4)
      (+ (image_score img7)
        (+ (image_score img9)
          (+ (image_score img12)
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
