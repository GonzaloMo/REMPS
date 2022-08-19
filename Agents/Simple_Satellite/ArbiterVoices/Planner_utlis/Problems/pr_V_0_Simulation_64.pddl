(define(problem satprob)
(:domain SimpleSatellite)
(:objects
  mem0 mem1 mem2 mem3 mem4 mem5 mem6 mem7 mem8 mem9 - memory
 img1 img2 img3 img4 img5 img6 img7 img8 img9 img10 img11 img12 img13 img14 img15 img16 img17 img18 img19 img20 - image
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
  (= (image_score img16) 0)
  (= (image_score img17) 0)
  (= (image_score img18) 0)
  (= (image_score img19) 0)
  (= (image_score img20) 0)
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



  (at 318 (image_available img1))
  (at 326 (not (image_available img1)))
  (at 40 (image_available img2))
  (at 48 (not (image_available img2)))
  (at 31 (image_available img3))
  (at 39 (not (image_available img3)))
  (at 227 (image_available img4))
  (at 235 (not (image_available img4)))
  (at 215 (image_available img5))
  (at 223 (not (image_available img5)))
  (at 17 (image_available img6))
  (at 25 (not (image_available img6)))
  (at 320 (image_available img7))
  (at 328 (not (image_available img7)))
  (at 106 (image_available img8))
  (at 114 (not (image_available img8)))
  (at 144 (image_available img9))
  (at 152 (not (image_available img9)))
  (at 302 (image_available img10))
  (at 310 (not (image_available img10)))
  (at 17 (image_available img11))
  (at 25 (not (image_available img11)))
  (at 61 (image_available img12))
  (at 69 (not (image_available img12)))
  (at 155 (image_available img13))
  (at 163 (not (image_available img13)))
  (at 54 (image_available img14))
  (at 62 (not (image_available img14)))
  (at 216 (image_available img15))
  (at 224 (not (image_available img15)))
  (at 140 (image_available img16))
  (at 148 (not (image_available img16)))
  (at 223 (image_available img17))
  (at 231 (not (image_available img17)))
  (at 194 (image_available img18))
  (at 202 (not (image_available img18)))
  (at 194 (image_available img19))
  (at 202 (not (image_available img19)))
  (at 224 (image_available img20))
  (at 232 (not (image_available img20)))
  (at 678 (image_available img1))
  (at 686 (not (image_available img1)))
  (at 400 (image_available img2))
  (at 408 (not (image_available img2)))
  (at 391 (image_available img3))
  (at 399 (not (image_available img3)))
  (at 587 (image_available img4))
  (at 595 (not (image_available img4)))
  (at 575 (image_available img5))
  (at 583 (not (image_available img5)))
  (at 377 (image_available img6))
  (at 385 (not (image_available img6)))
  (at 680 (image_available img7))
  (at 688 (not (image_available img7)))
  (at 466 (image_available img8))
  (at 474 (not (image_available img8)))
  (at 504 (image_available img9))
  (at 512 (not (image_available img9)))
  (at 662 (image_available img10))
  (at 670 (not (image_available img10)))
  (at 377 (image_available img11))
  (at 385 (not (image_available img11)))
  (at 421 (image_available img12))
  (at 429 (not (image_available img12)))
  (at 515 (image_available img13))
  (at 523 (not (image_available img13)))
  (at 414 (image_available img14))
  (at 422 (not (image_available img14)))
  (at 576 (image_available img15))
  (at 584 (not (image_available img15)))
  (at 500 (image_available img16))
  (at 508 (not (image_available img16)))
  (at 583 (image_available img17))
  (at 591 (not (image_available img17)))
  (at 554 (image_available img18))
  (at 562 (not (image_available img18)))
  (at 554 (image_available img19))
  (at 562 (not (image_available img19)))
  (at 584 (image_available img20))
  (at 592 (not (image_available img20)))
  (at 1038 (image_available img1))
  (at 1046 (not (image_available img1)))
  (at 760 (image_available img2))
  (at 768 (not (image_available img2)))
  (at 751 (image_available img3))
  (at 759 (not (image_available img3)))
  (at 947 (image_available img4))
  (at 955 (not (image_available img4)))
  (at 935 (image_available img5))
  (at 943 (not (image_available img5)))
  (at 737 (image_available img6))
  (at 745 (not (image_available img6)))
  (at 1040 (image_available img7))
  (at 1048 (not (image_available img7)))
  (at 826 (image_available img8))
  (at 834 (not (image_available img8)))
  (at 864 (image_available img9))
  (at 872 (not (image_available img9)))
  (at 1022 (image_available img10))
  (at 1030 (not (image_available img10)))
  (at 737 (image_available img11))
  (at 745 (not (image_available img11)))
  (at 781 (image_available img12))
  (at 789 (not (image_available img12)))
  (at 875 (image_available img13))
  (at 883 (not (image_available img13)))
  (at 774 (image_available img14))
  (at 782 (not (image_available img14)))
  (at 936 (image_available img15))
  (at 944 (not (image_available img15)))
  (at 860 (image_available img16))
  (at 868 (not (image_available img16)))
  (at 943 (image_available img17))
  (at 951 (not (image_available img17)))
  (at 914 (image_available img18))
  (at 922 (not (image_available img18)))
  (at 914 (image_available img19))
  (at 922 (not (image_available img19)))
  (at 944 (image_available img20))
  (at 952 (not (image_available img20)))
  (at 1398 (image_available img1))
  (at 1406 (not (image_available img1)))
  (at 1120 (image_available img2))
  (at 1128 (not (image_available img2)))
  (at 1111 (image_available img3))
  (at 1119 (not (image_available img3)))
  (at 1307 (image_available img4))
  (at 1315 (not (image_available img4)))
  (at 1295 (image_available img5))
  (at 1303 (not (image_available img5)))
  (at 1097 (image_available img6))
  (at 1105 (not (image_available img6)))
  (at 1400 (image_available img7))
  (at 1408 (not (image_available img7)))
  (at 1186 (image_available img8))
  (at 1194 (not (image_available img8)))
  (at 1224 (image_available img9))
  (at 1232 (not (image_available img9)))
  (at 1382 (image_available img10))
  (at 1390 (not (image_available img10)))
  (at 1097 (image_available img11))
  (at 1105 (not (image_available img11)))
  (at 1141 (image_available img12))
  (at 1149 (not (image_available img12)))
  (at 1235 (image_available img13))
  (at 1243 (not (image_available img13)))
  (at 1134 (image_available img14))
  (at 1142 (not (image_available img14)))
  (at 1296 (image_available img15))
  (at 1304 (not (image_available img15)))
  (at 1220 (image_available img16))
  (at 1228 (not (image_available img16)))
  (at 1303 (image_available img17))
  (at 1311 (not (image_available img17)))
  (at 1274 (image_available img18))
  (at 1282 (not (image_available img18)))
  (at 1274 (image_available img19))
  (at 1282 (not (image_available img19)))
  (at 1304 (image_available img20))
  (at 1312 (not (image_available img20)))
  (at 1758 (image_available img1))
  (at 1766 (not (image_available img1)))
  (at 1480 (image_available img2))
  (at 1488 (not (image_available img2)))
  (at 1471 (image_available img3))
  (at 1479 (not (image_available img3)))
  (at 1667 (image_available img4))
  (at 1675 (not (image_available img4)))
  (at 1655 (image_available img5))
  (at 1663 (not (image_available img5)))
  (at 1457 (image_available img6))
  (at 1465 (not (image_available img6)))
  (at 1760 (image_available img7))
  (at 1768 (not (image_available img7)))
  (at 1546 (image_available img8))
  (at 1554 (not (image_available img8)))
  (at 1584 (image_available img9))
  (at 1592 (not (image_available img9)))
  (at 1742 (image_available img10))
  (at 1750 (not (image_available img10)))
  (at 1457 (image_available img11))
  (at 1465 (not (image_available img11)))
  (at 1501 (image_available img12))
  (at 1509 (not (image_available img12)))
  (at 1595 (image_available img13))
  (at 1603 (not (image_available img13)))
  (at 1494 (image_available img14))
  (at 1502 (not (image_available img14)))
  (at 1656 (image_available img15))
  (at 1664 (not (image_available img15)))
  (at 1580 (image_available img16))
  (at 1588 (not (image_available img16)))
  (at 1663 (image_available img17))
  (at 1671 (not (image_available img17)))
  (at 1634 (image_available img18))
  (at 1642 (not (image_available img18)))
  (at 1634 (image_available img19))
  (at 1642 (not (image_available img19)))
  (at 1664 (image_available img20))
  (at 1672 (not (image_available img20)))
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
  (> (image_score img2) 0)
  (<= (image_score img2) 2)

  (> (image_score img4) 0)
  (<= (image_score img4) 13)

  (> (image_score img5) 0)
  (<= (image_score img5) 8)

  (> (image_score img7) 0)
  (<= (image_score img7) 14)

  (> (image_score img8) 0)
  (<= (image_score img8) 19)

  (> (image_score img9) 0)
  (<= (image_score img9) 5)

  (> (image_score img11) 0)
  (<= (image_score img11) 19)

  (> (image_score img12) 0)
  (<= (image_score img12) 10)

  (> (image_score img14) 0)
  (<= (image_score img14) 17)

  (> (image_score img18) 0)
  (<= (image_score img18) 1)

  (> (image_score img20) 0)
  (<= (image_score img20) 9)

(>= (total_score) 24)
))
(:metric maximize (+
  (image_score img2)
    (+ (image_score img4)
      (+ (image_score img5)
        (+ (image_score img7)
          (+ (image_score img8)
            (+ (image_score img9)
              (+ (image_score img11)
                (+ (image_score img12)
                  (+ (image_score img14)
                    (+ (image_score img18)
                      (image_score img20)
                    )
                  )
                )
              )
            )
          )
        )
      )
    )
  )
)
)
