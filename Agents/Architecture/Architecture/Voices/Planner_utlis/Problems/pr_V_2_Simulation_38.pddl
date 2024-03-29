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



  (at 298 (image_available img1))
  (at 306 (not (image_available img1)))
  (at 9 (image_available img2))
  (at 17 (not (image_available img2)))
  (at 237 (image_available img3))
  (at 245 (not (image_available img3)))
  (at 167 (image_available img4))
  (at 175 (not (image_available img4)))
  (at 293 (image_available img5))
  (at 301 (not (image_available img5)))
  (at 37 (image_available img6))
  (at 45 (not (image_available img6)))
  (at 22 (image_available img7))
  (at 30 (not (image_available img7)))
  (at 34 (image_available img8))
  (at 42 (not (image_available img8)))
  (at 144 (image_available img9))
  (at 152 (not (image_available img9)))
  (at 303 (image_available img10))
  (at 311 (not (image_available img10)))
  (at 94 (image_available img11))
  (at 102 (not (image_available img11)))
  (at 161 (image_available img12))
  (at 169 (not (image_available img12)))
  (at 123 (image_available img13))
  (at 131 (not (image_available img13)))
  (at 198 (image_available img14))
  (at 206 (not (image_available img14)))
  (at 256 (image_available img15))
  (at 264 (not (image_available img15)))
  (at 658 (image_available img1))
  (at 666 (not (image_available img1)))
  (at 369 (image_available img2))
  (at 377 (not (image_available img2)))
  (at 597 (image_available img3))
  (at 605 (not (image_available img3)))
  (at 527 (image_available img4))
  (at 535 (not (image_available img4)))
  (at 653 (image_available img5))
  (at 661 (not (image_available img5)))
  (at 397 (image_available img6))
  (at 405 (not (image_available img6)))
  (at 382 (image_available img7))
  (at 390 (not (image_available img7)))
  (at 394 (image_available img8))
  (at 402 (not (image_available img8)))
  (at 504 (image_available img9))
  (at 512 (not (image_available img9)))
  (at 663 (image_available img10))
  (at 671 (not (image_available img10)))
  (at 454 (image_available img11))
  (at 462 (not (image_available img11)))
  (at 521 (image_available img12))
  (at 529 (not (image_available img12)))
  (at 483 (image_available img13))
  (at 491 (not (image_available img13)))
  (at 558 (image_available img14))
  (at 566 (not (image_available img14)))
  (at 616 (image_available img15))
  (at 624 (not (image_available img15)))
  (at 1018 (image_available img1))
  (at 1026 (not (image_available img1)))
  (at 729 (image_available img2))
  (at 737 (not (image_available img2)))
  (at 957 (image_available img3))
  (at 965 (not (image_available img3)))
  (at 887 (image_available img4))
  (at 895 (not (image_available img4)))
  (at 1013 (image_available img5))
  (at 1021 (not (image_available img5)))
  (at 757 (image_available img6))
  (at 765 (not (image_available img6)))
  (at 742 (image_available img7))
  (at 750 (not (image_available img7)))
  (at 754 (image_available img8))
  (at 762 (not (image_available img8)))
  (at 864 (image_available img9))
  (at 872 (not (image_available img9)))
  (at 1023 (image_available img10))
  (at 1031 (not (image_available img10)))
  (at 814 (image_available img11))
  (at 822 (not (image_available img11)))
  (at 881 (image_available img12))
  (at 889 (not (image_available img12)))
  (at 843 (image_available img13))
  (at 851 (not (image_available img13)))
  (at 918 (image_available img14))
  (at 926 (not (image_available img14)))
  (at 976 (image_available img15))
  (at 984 (not (image_available img15)))
  (at 1378 (image_available img1))
  (at 1386 (not (image_available img1)))
  (at 1089 (image_available img2))
  (at 1097 (not (image_available img2)))
  (at 1317 (image_available img3))
  (at 1325 (not (image_available img3)))
  (at 1247 (image_available img4))
  (at 1255 (not (image_available img4)))
  (at 1373 (image_available img5))
  (at 1381 (not (image_available img5)))
  (at 1117 (image_available img6))
  (at 1125 (not (image_available img6)))
  (at 1102 (image_available img7))
  (at 1110 (not (image_available img7)))
  (at 1114 (image_available img8))
  (at 1122 (not (image_available img8)))
  (at 1224 (image_available img9))
  (at 1232 (not (image_available img9)))
  (at 1383 (image_available img10))
  (at 1391 (not (image_available img10)))
  (at 1174 (image_available img11))
  (at 1182 (not (image_available img11)))
  (at 1241 (image_available img12))
  (at 1249 (not (image_available img12)))
  (at 1203 (image_available img13))
  (at 1211 (not (image_available img13)))
  (at 1278 (image_available img14))
  (at 1286 (not (image_available img14)))
  (at 1336 (image_available img15))
  (at 1344 (not (image_available img15)))
  (at 1738 (image_available img1))
  (at 1746 (not (image_available img1)))
  (at 1449 (image_available img2))
  (at 1457 (not (image_available img2)))
  (at 1677 (image_available img3))
  (at 1685 (not (image_available img3)))
  (at 1607 (image_available img4))
  (at 1615 (not (image_available img4)))
  (at 1733 (image_available img5))
  (at 1741 (not (image_available img5)))
  (at 1477 (image_available img6))
  (at 1485 (not (image_available img6)))
  (at 1462 (image_available img7))
  (at 1470 (not (image_available img7)))
  (at 1474 (image_available img8))
  (at 1482 (not (image_available img8)))
  (at 1584 (image_available img9))
  (at 1592 (not (image_available img9)))
  (at 1743 (image_available img10))
  (at 1751 (not (image_available img10)))
  (at 1534 (image_available img11))
  (at 1542 (not (image_available img11)))
  (at 1601 (image_available img12))
  (at 1609 (not (image_available img12)))
  (at 1563 (image_available img13))
  (at 1571 (not (image_available img13)))
  (at 1638 (image_available img14))
  (at 1646 (not (image_available img14)))
  (at 1696 (image_available img15))
  (at 1704 (not (image_available img15)))
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
  (<= (image_score img2) 9)

  (> (image_score img7) 0)
  (<= (image_score img7) 6)

  (> (image_score img12) 0)
  (<= (image_score img12) 5)

  (> (image_score img13) 0)
  (<= (image_score img13) 7)

  (> (image_score img15) 0)
  (<= (image_score img15) 8)

(>= (total_score) 7)
))
(:metric maximize (+
  (image_score img2)
    (+ (image_score img7)
      (+ (image_score img12)
        (+ (image_score img13)
          (image_score img15)
        )
      )
    )
  )
)
)
