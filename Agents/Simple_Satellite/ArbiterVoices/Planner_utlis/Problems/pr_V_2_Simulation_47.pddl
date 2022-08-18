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



  (at 81 (image_available img1))
  (at 89 (not (image_available img1)))
  (at 181 (image_available img2))
  (at 189 (not (image_available img2)))
  (at 187 (image_available img3))
  (at 195 (not (image_available img3)))
  (at 337 (image_available img4))
  (at 345 (not (image_available img4)))
  (at 189 (image_available img5))
  (at 197 (not (image_available img5)))
  (at 101 (image_available img6))
  (at 109 (not (image_available img6)))
  (at 103 (image_available img7))
  (at 111 (not (image_available img7)))
  (at 206 (image_available img8))
  (at 214 (not (image_available img8)))
  (at 293 (image_available img9))
  (at 301 (not (image_available img9)))
  (at 163 (image_available img10))
  (at 171 (not (image_available img10)))
  (at 26 (image_available img11))
  (at 34 (not (image_available img11)))
  (at 41 (image_available img12))
  (at 49 (not (image_available img12)))
  (at 34 (image_available img13))
  (at 42 (not (image_available img13)))
  (at 199 (image_available img14))
  (at 207 (not (image_available img14)))
  (at 14 (image_available img15))
  (at 22 (not (image_available img15)))
  (at 441 (image_available img1))
  (at 449 (not (image_available img1)))
  (at 541 (image_available img2))
  (at 549 (not (image_available img2)))
  (at 547 (image_available img3))
  (at 555 (not (image_available img3)))
  (at 697 (image_available img4))
  (at 705 (not (image_available img4)))
  (at 549 (image_available img5))
  (at 557 (not (image_available img5)))
  (at 461 (image_available img6))
  (at 469 (not (image_available img6)))
  (at 463 (image_available img7))
  (at 471 (not (image_available img7)))
  (at 566 (image_available img8))
  (at 574 (not (image_available img8)))
  (at 653 (image_available img9))
  (at 661 (not (image_available img9)))
  (at 523 (image_available img10))
  (at 531 (not (image_available img10)))
  (at 386 (image_available img11))
  (at 394 (not (image_available img11)))
  (at 401 (image_available img12))
  (at 409 (not (image_available img12)))
  (at 394 (image_available img13))
  (at 402 (not (image_available img13)))
  (at 559 (image_available img14))
  (at 567 (not (image_available img14)))
  (at 374 (image_available img15))
  (at 382 (not (image_available img15)))
  (at 801 (image_available img1))
  (at 809 (not (image_available img1)))
  (at 901 (image_available img2))
  (at 909 (not (image_available img2)))
  (at 907 (image_available img3))
  (at 915 (not (image_available img3)))
  (at 1057 (image_available img4))
  (at 1065 (not (image_available img4)))
  (at 909 (image_available img5))
  (at 917 (not (image_available img5)))
  (at 821 (image_available img6))
  (at 829 (not (image_available img6)))
  (at 823 (image_available img7))
  (at 831 (not (image_available img7)))
  (at 926 (image_available img8))
  (at 934 (not (image_available img8)))
  (at 1013 (image_available img9))
  (at 1021 (not (image_available img9)))
  (at 883 (image_available img10))
  (at 891 (not (image_available img10)))
  (at 746 (image_available img11))
  (at 754 (not (image_available img11)))
  (at 761 (image_available img12))
  (at 769 (not (image_available img12)))
  (at 754 (image_available img13))
  (at 762 (not (image_available img13)))
  (at 919 (image_available img14))
  (at 927 (not (image_available img14)))
  (at 734 (image_available img15))
  (at 742 (not (image_available img15)))
  (at 1161 (image_available img1))
  (at 1169 (not (image_available img1)))
  (at 1261 (image_available img2))
  (at 1269 (not (image_available img2)))
  (at 1267 (image_available img3))
  (at 1275 (not (image_available img3)))
  (at 1417 (image_available img4))
  (at 1425 (not (image_available img4)))
  (at 1269 (image_available img5))
  (at 1277 (not (image_available img5)))
  (at 1181 (image_available img6))
  (at 1189 (not (image_available img6)))
  (at 1183 (image_available img7))
  (at 1191 (not (image_available img7)))
  (at 1286 (image_available img8))
  (at 1294 (not (image_available img8)))
  (at 1373 (image_available img9))
  (at 1381 (not (image_available img9)))
  (at 1243 (image_available img10))
  (at 1251 (not (image_available img10)))
  (at 1106 (image_available img11))
  (at 1114 (not (image_available img11)))
  (at 1121 (image_available img12))
  (at 1129 (not (image_available img12)))
  (at 1114 (image_available img13))
  (at 1122 (not (image_available img13)))
  (at 1279 (image_available img14))
  (at 1287 (not (image_available img14)))
  (at 1094 (image_available img15))
  (at 1102 (not (image_available img15)))
  (at 1521 (image_available img1))
  (at 1529 (not (image_available img1)))
  (at 1621 (image_available img2))
  (at 1629 (not (image_available img2)))
  (at 1627 (image_available img3))
  (at 1635 (not (image_available img3)))
  (at 1777 (image_available img4))
  (at 1785 (not (image_available img4)))
  (at 1629 (image_available img5))
  (at 1637 (not (image_available img5)))
  (at 1541 (image_available img6))
  (at 1549 (not (image_available img6)))
  (at 1543 (image_available img7))
  (at 1551 (not (image_available img7)))
  (at 1646 (image_available img8))
  (at 1654 (not (image_available img8)))
  (at 1733 (image_available img9))
  (at 1741 (not (image_available img9)))
  (at 1603 (image_available img10))
  (at 1611 (not (image_available img10)))
  (at 1466 (image_available img11))
  (at 1474 (not (image_available img11)))
  (at 1481 (image_available img12))
  (at 1489 (not (image_available img12)))
  (at 1474 (image_available img13))
  (at 1482 (not (image_available img13)))
  (at 1639 (image_available img14))
  (at 1647 (not (image_available img14)))
  (at 1454 (image_available img15))
  (at 1462 (not (image_available img15)))
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
  (>= (image_score img1) 0)
  (<= (image_score img1) 4)

  (>= (image_score img3) 0)
  (<= (image_score img3) 3)

  (>= (image_score img5) 0)
  (<= (image_score img5) 10)

  (>= (image_score img6) 0)
  (<= (image_score img6) 9)

  (>= (image_score img7) 0)
  (<= (image_score img7) 3)

  (>= (image_score img9) 0)
  (<= (image_score img9) 4)

  (>= (image_score img11) 0)
  (<= (image_score img11) 6)

  (>= (image_score img14) 0)
  (<= (image_score img14) 8)

  (>= (image_score img15) 0)
  (<= (image_score img15) 8)

(>= (total_score) 11)
))
(:metric maximize (+
  (image_score img1)
    (+ (image_score img3)
      (+ (image_score img5)
        (+ (image_score img6)
          (+ (image_score img7)
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
)
)
