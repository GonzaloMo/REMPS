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



  (at 302 (image_available img1))
  (at 310 (not (image_available img1)))
  (at 243 (image_available img2))
  (at 251 (not (image_available img2)))
  (at 66 (image_available img3))
  (at 74 (not (image_available img3)))
  (at 145 (image_available img4))
  (at 153 (not (image_available img4)))
  (at 172 (image_available img5))
  (at 180 (not (image_available img5)))
  (at 204 (image_available img6))
  (at 212 (not (image_available img6)))
  (at 333 (image_available img7))
  (at 341 (not (image_available img7)))
  (at 89 (image_available img8))
  (at 97 (not (image_available img8)))
  (at 135 (image_available img9))
  (at 143 (not (image_available img9)))
  (at 304 (image_available img10))
  (at 312 (not (image_available img10)))
  (at 74 (image_available img11))
  (at 82 (not (image_available img11)))
  (at 167 (image_available img12))
  (at 175 (not (image_available img12)))
  (at 113 (image_available img13))
  (at 121 (not (image_available img13)))
  (at 272 (image_available img14))
  (at 280 (not (image_available img14)))
  (at 244 (image_available img15))
  (at 252 (not (image_available img15)))
  (at 283 (image_available img16))
  (at 291 (not (image_available img16)))
  (at 24 (image_available img17))
  (at 32 (not (image_available img17)))
  (at 110 (image_available img18))
  (at 118 (not (image_available img18)))
  (at 293 (image_available img19))
  (at 301 (not (image_available img19)))
  (at 100 (image_available img20))
  (at 108 (not (image_available img20)))
  (at 662 (image_available img1))
  (at 670 (not (image_available img1)))
  (at 603 (image_available img2))
  (at 611 (not (image_available img2)))
  (at 426 (image_available img3))
  (at 434 (not (image_available img3)))
  (at 505 (image_available img4))
  (at 513 (not (image_available img4)))
  (at 532 (image_available img5))
  (at 540 (not (image_available img5)))
  (at 564 (image_available img6))
  (at 572 (not (image_available img6)))
  (at 693 (image_available img7))
  (at 701 (not (image_available img7)))
  (at 449 (image_available img8))
  (at 457 (not (image_available img8)))
  (at 495 (image_available img9))
  (at 503 (not (image_available img9)))
  (at 664 (image_available img10))
  (at 672 (not (image_available img10)))
  (at 434 (image_available img11))
  (at 442 (not (image_available img11)))
  (at 527 (image_available img12))
  (at 535 (not (image_available img12)))
  (at 473 (image_available img13))
  (at 481 (not (image_available img13)))
  (at 632 (image_available img14))
  (at 640 (not (image_available img14)))
  (at 604 (image_available img15))
  (at 612 (not (image_available img15)))
  (at 643 (image_available img16))
  (at 651 (not (image_available img16)))
  (at 384 (image_available img17))
  (at 392 (not (image_available img17)))
  (at 470 (image_available img18))
  (at 478 (not (image_available img18)))
  (at 653 (image_available img19))
  (at 661 (not (image_available img19)))
  (at 460 (image_available img20))
  (at 468 (not (image_available img20)))
  (at 1022 (image_available img1))
  (at 1030 (not (image_available img1)))
  (at 963 (image_available img2))
  (at 971 (not (image_available img2)))
  (at 786 (image_available img3))
  (at 794 (not (image_available img3)))
  (at 865 (image_available img4))
  (at 873 (not (image_available img4)))
  (at 892 (image_available img5))
  (at 900 (not (image_available img5)))
  (at 924 (image_available img6))
  (at 932 (not (image_available img6)))
  (at 1053 (image_available img7))
  (at 1061 (not (image_available img7)))
  (at 809 (image_available img8))
  (at 817 (not (image_available img8)))
  (at 855 (image_available img9))
  (at 863 (not (image_available img9)))
  (at 1024 (image_available img10))
  (at 1032 (not (image_available img10)))
  (at 794 (image_available img11))
  (at 802 (not (image_available img11)))
  (at 887 (image_available img12))
  (at 895 (not (image_available img12)))
  (at 833 (image_available img13))
  (at 841 (not (image_available img13)))
  (at 992 (image_available img14))
  (at 1000 (not (image_available img14)))
  (at 964 (image_available img15))
  (at 972 (not (image_available img15)))
  (at 1003 (image_available img16))
  (at 1011 (not (image_available img16)))
  (at 744 (image_available img17))
  (at 752 (not (image_available img17)))
  (at 830 (image_available img18))
  (at 838 (not (image_available img18)))
  (at 1013 (image_available img19))
  (at 1021 (not (image_available img19)))
  (at 820 (image_available img20))
  (at 828 (not (image_available img20)))
  (at 1382 (image_available img1))
  (at 1390 (not (image_available img1)))
  (at 1323 (image_available img2))
  (at 1331 (not (image_available img2)))
  (at 1146 (image_available img3))
  (at 1154 (not (image_available img3)))
  (at 1225 (image_available img4))
  (at 1233 (not (image_available img4)))
  (at 1252 (image_available img5))
  (at 1260 (not (image_available img5)))
  (at 1284 (image_available img6))
  (at 1292 (not (image_available img6)))
  (at 1413 (image_available img7))
  (at 1421 (not (image_available img7)))
  (at 1169 (image_available img8))
  (at 1177 (not (image_available img8)))
  (at 1215 (image_available img9))
  (at 1223 (not (image_available img9)))
  (at 1384 (image_available img10))
  (at 1392 (not (image_available img10)))
  (at 1154 (image_available img11))
  (at 1162 (not (image_available img11)))
  (at 1247 (image_available img12))
  (at 1255 (not (image_available img12)))
  (at 1193 (image_available img13))
  (at 1201 (not (image_available img13)))
  (at 1352 (image_available img14))
  (at 1360 (not (image_available img14)))
  (at 1324 (image_available img15))
  (at 1332 (not (image_available img15)))
  (at 1363 (image_available img16))
  (at 1371 (not (image_available img16)))
  (at 1104 (image_available img17))
  (at 1112 (not (image_available img17)))
  (at 1190 (image_available img18))
  (at 1198 (not (image_available img18)))
  (at 1373 (image_available img19))
  (at 1381 (not (image_available img19)))
  (at 1180 (image_available img20))
  (at 1188 (not (image_available img20)))
  (at 1742 (image_available img1))
  (at 1750 (not (image_available img1)))
  (at 1683 (image_available img2))
  (at 1691 (not (image_available img2)))
  (at 1506 (image_available img3))
  (at 1514 (not (image_available img3)))
  (at 1585 (image_available img4))
  (at 1593 (not (image_available img4)))
  (at 1612 (image_available img5))
  (at 1620 (not (image_available img5)))
  (at 1644 (image_available img6))
  (at 1652 (not (image_available img6)))
  (at 1773 (image_available img7))
  (at 1781 (not (image_available img7)))
  (at 1529 (image_available img8))
  (at 1537 (not (image_available img8)))
  (at 1575 (image_available img9))
  (at 1583 (not (image_available img9)))
  (at 1744 (image_available img10))
  (at 1752 (not (image_available img10)))
  (at 1514 (image_available img11))
  (at 1522 (not (image_available img11)))
  (at 1607 (image_available img12))
  (at 1615 (not (image_available img12)))
  (at 1553 (image_available img13))
  (at 1561 (not (image_available img13)))
  (at 1712 (image_available img14))
  (at 1720 (not (image_available img14)))
  (at 1684 (image_available img15))
  (at 1692 (not (image_available img15)))
  (at 1723 (image_available img16))
  (at 1731 (not (image_available img16)))
  (at 1464 (image_available img17))
  (at 1472 (not (image_available img17)))
  (at 1550 (image_available img18))
  (at 1558 (not (image_available img18)))
  (at 1733 (image_available img19))
  (at 1741 (not (image_available img19)))
  (at 1540 (image_available img20))
  (at 1548 (not (image_available img20)))
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
  (<= (image_score img1) 5)

  (> (image_score img2) 0)
  (<= (image_score img2) 14)

  (> (image_score img4) 0)
  (<= (image_score img4) 2)

  (> (image_score img5) 0)
  (<= (image_score img5) 7)

  (> (image_score img8) 0)
  (<= (image_score img8) 13)

  (> (image_score img10) 0)
  (<= (image_score img10) 13)

  (> (image_score img11) 0)
  (<= (image_score img11) 13)

  (> (image_score img12) 0)
  (<= (image_score img12) 6)

  (> (image_score img14) 0)
  (<= (image_score img14) 6)

  (> (image_score img17) 0)
  (<= (image_score img17) 8)

  (> (image_score img18) 0)
  (<= (image_score img18) 11)

  (> (image_score img20) 0)
  (<= (image_score img20) 8)

(>= (total_score) 22)
))
(:metric maximize (+
  (image_score img1)
    (+ (image_score img2)
      (+ (image_score img4)
        (+ (image_score img5)
          (+ (image_score img8)
            (+ (image_score img10)
              (+ (image_score img11)
                (+ (image_score img12)
                  (+ (image_score img14)
                    (+ (image_score img17)
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
)