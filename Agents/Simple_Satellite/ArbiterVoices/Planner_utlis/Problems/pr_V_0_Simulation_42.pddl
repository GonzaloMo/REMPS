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



  (at 171 (image_available img1))
  (at 179 (not (image_available img1)))
  (at 154 (image_available img2))
  (at 162 (not (image_available img2)))
  (at 135 (image_available img3))
  (at 143 (not (image_available img3)))
  (at 89 (image_available img4))
  (at 97 (not (image_available img4)))
  (at 270 (image_available img5))
  (at 278 (not (image_available img5)))
  (at 46 (image_available img6))
  (at 54 (not (image_available img6)))
  (at 96 (image_available img7))
  (at 104 (not (image_available img7)))
  (at 293 (image_available img8))
  (at 301 (not (image_available img8)))
  (at 68 (image_available img9))
  (at 76 (not (image_available img9)))
  (at 12 (image_available img10))
  (at 20 (not (image_available img10)))
  (at 313 (image_available img11))
  (at 321 (not (image_available img11)))
  (at 5 (image_available img12))
  (at 13 (not (image_available img12)))
  (at 3 (image_available img13))
  (at 11 (not (image_available img13)))
  (at 106 (image_available img14))
  (at 114 (not (image_available img14)))
  (at 48 (image_available img15))
  (at 56 (not (image_available img15)))
  (at 531 (image_available img1))
  (at 539 (not (image_available img1)))
  (at 514 (image_available img2))
  (at 522 (not (image_available img2)))
  (at 495 (image_available img3))
  (at 503 (not (image_available img3)))
  (at 449 (image_available img4))
  (at 457 (not (image_available img4)))
  (at 630 (image_available img5))
  (at 638 (not (image_available img5)))
  (at 406 (image_available img6))
  (at 414 (not (image_available img6)))
  (at 456 (image_available img7))
  (at 464 (not (image_available img7)))
  (at 653 (image_available img8))
  (at 661 (not (image_available img8)))
  (at 428 (image_available img9))
  (at 436 (not (image_available img9)))
  (at 372 (image_available img10))
  (at 380 (not (image_available img10)))
  (at 673 (image_available img11))
  (at 681 (not (image_available img11)))
  (at 365 (image_available img12))
  (at 373 (not (image_available img12)))
  (at 363 (image_available img13))
  (at 371 (not (image_available img13)))
  (at 466 (image_available img14))
  (at 474 (not (image_available img14)))
  (at 408 (image_available img15))
  (at 416 (not (image_available img15)))
  (at 891 (image_available img1))
  (at 899 (not (image_available img1)))
  (at 874 (image_available img2))
  (at 882 (not (image_available img2)))
  (at 855 (image_available img3))
  (at 863 (not (image_available img3)))
  (at 809 (image_available img4))
  (at 817 (not (image_available img4)))
  (at 990 (image_available img5))
  (at 998 (not (image_available img5)))
  (at 766 (image_available img6))
  (at 774 (not (image_available img6)))
  (at 816 (image_available img7))
  (at 824 (not (image_available img7)))
  (at 1013 (image_available img8))
  (at 1021 (not (image_available img8)))
  (at 788 (image_available img9))
  (at 796 (not (image_available img9)))
  (at 732 (image_available img10))
  (at 740 (not (image_available img10)))
  (at 1033 (image_available img11))
  (at 1041 (not (image_available img11)))
  (at 725 (image_available img12))
  (at 733 (not (image_available img12)))
  (at 723 (image_available img13))
  (at 731 (not (image_available img13)))
  (at 826 (image_available img14))
  (at 834 (not (image_available img14)))
  (at 768 (image_available img15))
  (at 776 (not (image_available img15)))
  (at 1251 (image_available img1))
  (at 1259 (not (image_available img1)))
  (at 1234 (image_available img2))
  (at 1242 (not (image_available img2)))
  (at 1215 (image_available img3))
  (at 1223 (not (image_available img3)))
  (at 1169 (image_available img4))
  (at 1177 (not (image_available img4)))
  (at 1350 (image_available img5))
  (at 1358 (not (image_available img5)))
  (at 1126 (image_available img6))
  (at 1134 (not (image_available img6)))
  (at 1176 (image_available img7))
  (at 1184 (not (image_available img7)))
  (at 1373 (image_available img8))
  (at 1381 (not (image_available img8)))
  (at 1148 (image_available img9))
  (at 1156 (not (image_available img9)))
  (at 1092 (image_available img10))
  (at 1100 (not (image_available img10)))
  (at 1393 (image_available img11))
  (at 1401 (not (image_available img11)))
  (at 1085 (image_available img12))
  (at 1093 (not (image_available img12)))
  (at 1083 (image_available img13))
  (at 1091 (not (image_available img13)))
  (at 1186 (image_available img14))
  (at 1194 (not (image_available img14)))
  (at 1128 (image_available img15))
  (at 1136 (not (image_available img15)))
  (at 1611 (image_available img1))
  (at 1619 (not (image_available img1)))
  (at 1594 (image_available img2))
  (at 1602 (not (image_available img2)))
  (at 1575 (image_available img3))
  (at 1583 (not (image_available img3)))
  (at 1529 (image_available img4))
  (at 1537 (not (image_available img4)))
  (at 1710 (image_available img5))
  (at 1718 (not (image_available img5)))
  (at 1486 (image_available img6))
  (at 1494 (not (image_available img6)))
  (at 1536 (image_available img7))
  (at 1544 (not (image_available img7)))
  (at 1733 (image_available img8))
  (at 1741 (not (image_available img8)))
  (at 1508 (image_available img9))
  (at 1516 (not (image_available img9)))
  (at 1452 (image_available img10))
  (at 1460 (not (image_available img10)))
  (at 1753 (image_available img11))
  (at 1761 (not (image_available img11)))
  (at 1445 (image_available img12))
  (at 1453 (not (image_available img12)))
  (at 1443 (image_available img13))
  (at 1451 (not (image_available img13)))
  (at 1546 (image_available img14))
  (at 1554 (not (image_available img14)))
  (at 1488 (image_available img15))
  (at 1496 (not (image_available img15)))
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

  (> (image_score img3) 0)
  (<= (image_score img3) 10)

  (> (image_score img5) 0)
  (<= (image_score img5) 3)

  (> (image_score img6) 0)
  (<= (image_score img6) 10)

  (> (image_score img8) 0)
  (<= (image_score img8) 6)

  (> (image_score img11) 0)
  (<= (image_score img11) 6)

  (> (image_score img12) 0)
  (<= (image_score img12) 6)

  (> (image_score img15) 0)
  (<= (image_score img15) 5)

(>= (total_score) 11)
))
(:metric maximize (+
  (image_score img2)
    (+ (image_score img3)
      (+ (image_score img5)
        (+ (image_score img6)
          (+ (image_score img8)
            (+ (image_score img11)
              (+ (image_score img12)
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