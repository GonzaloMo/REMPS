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



  (at 232 (image_available img1))
  (at 240 (not (image_available img1)))
  (at 52 (image_available img2))
  (at 60 (not (image_available img2)))
  (at 203 (image_available img3))
  (at 211 (not (image_available img3)))
  (at 133 (image_available img4))
  (at 141 (not (image_available img4)))
  (at 135 (image_available img5))
  (at 143 (not (image_available img5)))
  (at 313 (image_available img6))
  (at 321 (not (image_available img6)))
  (at 88 (image_available img7))
  (at 96 (not (image_available img7)))
  (at 305 (image_available img8))
  (at 313 (not (image_available img8)))
  (at 218 (image_available img9))
  (at 226 (not (image_available img9)))
  (at 203 (image_available img10))
  (at 211 (not (image_available img10)))
  (at 90 (image_available img11))
  (at 98 (not (image_available img11)))
  (at 18 (image_available img12))
  (at 26 (not (image_available img12)))
  (at 16 (image_available img13))
  (at 24 (not (image_available img13)))
  (at 240 (image_available img14))
  (at 248 (not (image_available img14)))
  (at 237 (image_available img15))
  (at 245 (not (image_available img15)))
  (at 105 (image_available img16))
  (at 113 (not (image_available img16)))
  (at 187 (image_available img17))
  (at 195 (not (image_available img17)))
  (at 39 (image_available img18))
  (at 47 (not (image_available img18)))
  (at 295 (image_available img19))
  (at 303 (not (image_available img19)))
  (at 184 (image_available img20))
  (at 192 (not (image_available img20)))
  (at 592 (image_available img1))
  (at 600 (not (image_available img1)))
  (at 412 (image_available img2))
  (at 420 (not (image_available img2)))
  (at 563 (image_available img3))
  (at 571 (not (image_available img3)))
  (at 493 (image_available img4))
  (at 501 (not (image_available img4)))
  (at 495 (image_available img5))
  (at 503 (not (image_available img5)))
  (at 673 (image_available img6))
  (at 681 (not (image_available img6)))
  (at 448 (image_available img7))
  (at 456 (not (image_available img7)))
  (at 665 (image_available img8))
  (at 673 (not (image_available img8)))
  (at 578 (image_available img9))
  (at 586 (not (image_available img9)))
  (at 563 (image_available img10))
  (at 571 (not (image_available img10)))
  (at 450 (image_available img11))
  (at 458 (not (image_available img11)))
  (at 378 (image_available img12))
  (at 386 (not (image_available img12)))
  (at 376 (image_available img13))
  (at 384 (not (image_available img13)))
  (at 600 (image_available img14))
  (at 608 (not (image_available img14)))
  (at 597 (image_available img15))
  (at 605 (not (image_available img15)))
  (at 465 (image_available img16))
  (at 473 (not (image_available img16)))
  (at 547 (image_available img17))
  (at 555 (not (image_available img17)))
  (at 399 (image_available img18))
  (at 407 (not (image_available img18)))
  (at 655 (image_available img19))
  (at 663 (not (image_available img19)))
  (at 544 (image_available img20))
  (at 552 (not (image_available img20)))
  (at 952 (image_available img1))
  (at 960 (not (image_available img1)))
  (at 772 (image_available img2))
  (at 780 (not (image_available img2)))
  (at 923 (image_available img3))
  (at 931 (not (image_available img3)))
  (at 853 (image_available img4))
  (at 861 (not (image_available img4)))
  (at 855 (image_available img5))
  (at 863 (not (image_available img5)))
  (at 1033 (image_available img6))
  (at 1041 (not (image_available img6)))
  (at 808 (image_available img7))
  (at 816 (not (image_available img7)))
  (at 1025 (image_available img8))
  (at 1033 (not (image_available img8)))
  (at 938 (image_available img9))
  (at 946 (not (image_available img9)))
  (at 923 (image_available img10))
  (at 931 (not (image_available img10)))
  (at 810 (image_available img11))
  (at 818 (not (image_available img11)))
  (at 738 (image_available img12))
  (at 746 (not (image_available img12)))
  (at 736 (image_available img13))
  (at 744 (not (image_available img13)))
  (at 960 (image_available img14))
  (at 968 (not (image_available img14)))
  (at 957 (image_available img15))
  (at 965 (not (image_available img15)))
  (at 825 (image_available img16))
  (at 833 (not (image_available img16)))
  (at 907 (image_available img17))
  (at 915 (not (image_available img17)))
  (at 759 (image_available img18))
  (at 767 (not (image_available img18)))
  (at 1015 (image_available img19))
  (at 1023 (not (image_available img19)))
  (at 904 (image_available img20))
  (at 912 (not (image_available img20)))
  (at 1312 (image_available img1))
  (at 1320 (not (image_available img1)))
  (at 1132 (image_available img2))
  (at 1140 (not (image_available img2)))
  (at 1283 (image_available img3))
  (at 1291 (not (image_available img3)))
  (at 1213 (image_available img4))
  (at 1221 (not (image_available img4)))
  (at 1215 (image_available img5))
  (at 1223 (not (image_available img5)))
  (at 1393 (image_available img6))
  (at 1401 (not (image_available img6)))
  (at 1168 (image_available img7))
  (at 1176 (not (image_available img7)))
  (at 1385 (image_available img8))
  (at 1393 (not (image_available img8)))
  (at 1298 (image_available img9))
  (at 1306 (not (image_available img9)))
  (at 1283 (image_available img10))
  (at 1291 (not (image_available img10)))
  (at 1170 (image_available img11))
  (at 1178 (not (image_available img11)))
  (at 1098 (image_available img12))
  (at 1106 (not (image_available img12)))
  (at 1096 (image_available img13))
  (at 1104 (not (image_available img13)))
  (at 1320 (image_available img14))
  (at 1328 (not (image_available img14)))
  (at 1317 (image_available img15))
  (at 1325 (not (image_available img15)))
  (at 1185 (image_available img16))
  (at 1193 (not (image_available img16)))
  (at 1267 (image_available img17))
  (at 1275 (not (image_available img17)))
  (at 1119 (image_available img18))
  (at 1127 (not (image_available img18)))
  (at 1375 (image_available img19))
  (at 1383 (not (image_available img19)))
  (at 1264 (image_available img20))
  (at 1272 (not (image_available img20)))
  (at 1672 (image_available img1))
  (at 1680 (not (image_available img1)))
  (at 1492 (image_available img2))
  (at 1500 (not (image_available img2)))
  (at 1643 (image_available img3))
  (at 1651 (not (image_available img3)))
  (at 1573 (image_available img4))
  (at 1581 (not (image_available img4)))
  (at 1575 (image_available img5))
  (at 1583 (not (image_available img5)))
  (at 1753 (image_available img6))
  (at 1761 (not (image_available img6)))
  (at 1528 (image_available img7))
  (at 1536 (not (image_available img7)))
  (at 1745 (image_available img8))
  (at 1753 (not (image_available img8)))
  (at 1658 (image_available img9))
  (at 1666 (not (image_available img9)))
  (at 1643 (image_available img10))
  (at 1651 (not (image_available img10)))
  (at 1530 (image_available img11))
  (at 1538 (not (image_available img11)))
  (at 1458 (image_available img12))
  (at 1466 (not (image_available img12)))
  (at 1456 (image_available img13))
  (at 1464 (not (image_available img13)))
  (at 1680 (image_available img14))
  (at 1688 (not (image_available img14)))
  (at 1677 (image_available img15))
  (at 1685 (not (image_available img15)))
  (at 1545 (image_available img16))
  (at 1553 (not (image_available img16)))
  (at 1627 (image_available img17))
  (at 1635 (not (image_available img17)))
  (at 1479 (image_available img18))
  (at 1487 (not (image_available img18)))
  (at 1735 (image_available img19))
  (at 1743 (not (image_available img19)))
  (at 1624 (image_available img20))
  (at 1632 (not (image_available img20)))
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

  (> (image_score img4) 0)
  (<= (image_score img4) 6)

  (> (image_score img5) 0)
  (<= (image_score img5) 15)

  (> (image_score img6) 0)
  (<= (image_score img6) 7)

  (> (image_score img7) 0)
  (<= (image_score img7) 6)

  (> (image_score img8) 0)
  (<= (image_score img8) 1)

  (> (image_score img10) 0)
  (<= (image_score img10) 5)

  (> (image_score img13) 0)
  (<= (image_score img13) 6)

  (> (image_score img16) 0)
  (<= (image_score img16) 1)

  (> (image_score img20) 0)
  (<= (image_score img20) 3)

(>= (total_score) 11)
))
(:metric maximize (+
  (image_score img1)
    (+ (image_score img4)
      (+ (image_score img5)
        (+ (image_score img6)
          (+ (image_score img7)
            (+ (image_score img8)
              (+ (image_score img10)
                (+ (image_score img13)
                  (+ (image_score img16)
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