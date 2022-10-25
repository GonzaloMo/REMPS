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



  (at 108 (image_available img1))
  (at 116 (not (image_available img1)))
  (at 55 (image_available img2))
  (at 63 (not (image_available img2)))
  (at 273 (image_available img3))
  (at 281 (not (image_available img3)))
  (at 162 (image_available img4))
  (at 170 (not (image_available img4)))
  (at 123 (image_available img5))
  (at 131 (not (image_available img5)))
  (at 321 (image_available img6))
  (at 329 (not (image_available img6)))
  (at 178 (image_available img7))
  (at 186 (not (image_available img7)))
  (at 273 (image_available img8))
  (at 281 (not (image_available img8)))
  (at 5 (image_available img9))
  (at 13 (not (image_available img9)))
  (at 299 (image_available img10))
  (at 307 (not (image_available img10)))
  (at 248 (image_available img11))
  (at 256 (not (image_available img11)))
  (at 191 (image_available img12))
  (at 199 (not (image_available img12)))
  (at 53 (image_available img13))
  (at 61 (not (image_available img13)))
  (at 14 (image_available img14))
  (at 22 (not (image_available img14)))
  (at 94 (image_available img15))
  (at 102 (not (image_available img15)))
  (at 468 (image_available img1))
  (at 476 (not (image_available img1)))
  (at 415 (image_available img2))
  (at 423 (not (image_available img2)))
  (at 633 (image_available img3))
  (at 641 (not (image_available img3)))
  (at 522 (image_available img4))
  (at 530 (not (image_available img4)))
  (at 483 (image_available img5))
  (at 491 (not (image_available img5)))
  (at 681 (image_available img6))
  (at 689 (not (image_available img6)))
  (at 538 (image_available img7))
  (at 546 (not (image_available img7)))
  (at 633 (image_available img8))
  (at 641 (not (image_available img8)))
  (at 365 (image_available img9))
  (at 373 (not (image_available img9)))
  (at 659 (image_available img10))
  (at 667 (not (image_available img10)))
  (at 608 (image_available img11))
  (at 616 (not (image_available img11)))
  (at 551 (image_available img12))
  (at 559 (not (image_available img12)))
  (at 413 (image_available img13))
  (at 421 (not (image_available img13)))
  (at 374 (image_available img14))
  (at 382 (not (image_available img14)))
  (at 454 (image_available img15))
  (at 462 (not (image_available img15)))
  (at 828 (image_available img1))
  (at 836 (not (image_available img1)))
  (at 775 (image_available img2))
  (at 783 (not (image_available img2)))
  (at 993 (image_available img3))
  (at 1001 (not (image_available img3)))
  (at 882 (image_available img4))
  (at 890 (not (image_available img4)))
  (at 843 (image_available img5))
  (at 851 (not (image_available img5)))
  (at 1041 (image_available img6))
  (at 1049 (not (image_available img6)))
  (at 898 (image_available img7))
  (at 906 (not (image_available img7)))
  (at 993 (image_available img8))
  (at 1001 (not (image_available img8)))
  (at 725 (image_available img9))
  (at 733 (not (image_available img9)))
  (at 1019 (image_available img10))
  (at 1027 (not (image_available img10)))
  (at 968 (image_available img11))
  (at 976 (not (image_available img11)))
  (at 911 (image_available img12))
  (at 919 (not (image_available img12)))
  (at 773 (image_available img13))
  (at 781 (not (image_available img13)))
  (at 734 (image_available img14))
  (at 742 (not (image_available img14)))
  (at 814 (image_available img15))
  (at 822 (not (image_available img15)))
  (at 1188 (image_available img1))
  (at 1196 (not (image_available img1)))
  (at 1135 (image_available img2))
  (at 1143 (not (image_available img2)))
  (at 1353 (image_available img3))
  (at 1361 (not (image_available img3)))
  (at 1242 (image_available img4))
  (at 1250 (not (image_available img4)))
  (at 1203 (image_available img5))
  (at 1211 (not (image_available img5)))
  (at 1401 (image_available img6))
  (at 1409 (not (image_available img6)))
  (at 1258 (image_available img7))
  (at 1266 (not (image_available img7)))
  (at 1353 (image_available img8))
  (at 1361 (not (image_available img8)))
  (at 1085 (image_available img9))
  (at 1093 (not (image_available img9)))
  (at 1379 (image_available img10))
  (at 1387 (not (image_available img10)))
  (at 1328 (image_available img11))
  (at 1336 (not (image_available img11)))
  (at 1271 (image_available img12))
  (at 1279 (not (image_available img12)))
  (at 1133 (image_available img13))
  (at 1141 (not (image_available img13)))
  (at 1094 (image_available img14))
  (at 1102 (not (image_available img14)))
  (at 1174 (image_available img15))
  (at 1182 (not (image_available img15)))
  (at 1548 (image_available img1))
  (at 1556 (not (image_available img1)))
  (at 1495 (image_available img2))
  (at 1503 (not (image_available img2)))
  (at 1713 (image_available img3))
  (at 1721 (not (image_available img3)))
  (at 1602 (image_available img4))
  (at 1610 (not (image_available img4)))
  (at 1563 (image_available img5))
  (at 1571 (not (image_available img5)))
  (at 1761 (image_available img6))
  (at 1769 (not (image_available img6)))
  (at 1618 (image_available img7))
  (at 1626 (not (image_available img7)))
  (at 1713 (image_available img8))
  (at 1721 (not (image_available img8)))
  (at 1445 (image_available img9))
  (at 1453 (not (image_available img9)))
  (at 1739 (image_available img10))
  (at 1747 (not (image_available img10)))
  (at 1688 (image_available img11))
  (at 1696 (not (image_available img11)))
  (at 1631 (image_available img12))
  (at 1639 (not (image_available img12)))
  (at 1493 (image_available img13))
  (at 1501 (not (image_available img13)))
  (at 1454 (image_available img14))
  (at 1462 (not (image_available img14)))
  (at 1534 (image_available img15))
  (at 1542 (not (image_available img15)))
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
  (<= (image_score img3) 4)

  (> (image_score img4) 0)
  (<= (image_score img4) 2)

  (> (image_score img8) 0)
  (<= (image_score img8) 3)

  (> (image_score img9) 0)
  (<= (image_score img9) 5)

  (> (image_score img10) 0)
  (<= (image_score img10) 5)

  (> (image_score img14) 0)
  (<= (image_score img14) 1)

(>= (total_score) 4)
))
(:metric maximize (+
  (image_score img3)
    (+ (image_score img4)
      (+ (image_score img8)
        (+ (image_score img9)
          (+ (image_score img10)
            (image_score img14)
          )
        )
      )
    )
  )
)
)
