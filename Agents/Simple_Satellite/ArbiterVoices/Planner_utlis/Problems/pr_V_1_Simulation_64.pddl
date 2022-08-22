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

  (memory_free mem5)
  (memory_free mem6)
  (memory_free mem8)
  (memory_free mem9)

   (memory_taken mem0 img5)
   (memory_taken mem1 img8)
   (memory_taken mem2 img18)
   (memory_taken mem3 img10)
   (memory_taken mem4 img3)
   (memory_taken mem7 img6)

(image_analysed mem0 img5)
(image_analysed mem1 img8)
(image_analysed mem2 img18)
(image_analysed mem3 img10)
(image_analysed mem4 img3)
(image_analysed mem7 img6)

  (at 213 (image_available img1))
  (at 221 (not (image_available img1)))
  (at 235 (image_available img2))
  (at 243 (not (image_available img2)))
  (at 227 (image_available img4))
  (at 235 (not (image_available img4)))
  (at 207 (image_available img5))
  (at 215 (not (image_available img5)))
  (at 65 (image_available img6))
  (at 73 (not (image_available img6)))
  (at 234 (image_available img7))
  (at 242 (not (image_available img7)))
  (at 145 (image_available img8))
  (at 153 (not (image_available img8)))
  (at 152 (image_available img9))
  (at 160 (not (image_available img9)))
  (at 75 (image_available img10))
  (at 83 (not (image_available img10)))
  (at 46 (image_available img11))
  (at 54 (not (image_available img11)))
  (at 252 (image_available img12))
  (at 260 (not (image_available img12)))
  (at 129 (image_available img14))
  (at 137 (not (image_available img14)))
  (at 230 (image_available img16))
  (at 238 (not (image_available img16)))
  (at 227 (image_available img17))
  (at 235 (not (image_available img17)))
  (at 39 (image_available img20))
  (at 47 (not (image_available img20)))
  (at 573 (image_available img1))
  (at 581 (not (image_available img1)))
  (at 595 (image_available img2))
  (at 603 (not (image_available img2)))
  (at 306 (image_available img3))
  (at 314 (not (image_available img3)))
  (at 587 (image_available img4))
  (at 595 (not (image_available img4)))
  (at 567 (image_available img5))
  (at 575 (not (image_available img5)))
  (at 425 (image_available img6))
  (at 433 (not (image_available img6)))
  (at 594 (image_available img7))
  (at 602 (not (image_available img7)))
  (at 505 (image_available img8))
  (at 513 (not (image_available img8)))
  (at 512 (image_available img9))
  (at 520 (not (image_available img9)))
  (at 435 (image_available img10))
  (at 443 (not (image_available img10)))
  (at 406 (image_available img11))
  (at 414 (not (image_available img11)))
  (at 612 (image_available img12))
  (at 620 (not (image_available img12)))
  (at 297 (image_available img13))
  (at 305 (not (image_available img13)))
  (at 489 (image_available img14))
  (at 497 (not (image_available img14)))
  (at 291 (image_available img15))
  (at 299 (not (image_available img15)))
  (at 590 (image_available img16))
  (at 598 (not (image_available img16)))
  (at 587 (image_available img17))
  (at 595 (not (image_available img17)))
  (at 349 (image_available img18))
  (at 357 (not (image_available img18)))
  (at 326 (image_available img19))
  (at 334 (not (image_available img19)))
  (at 399 (image_available img20))
  (at 407 (not (image_available img20)))
  (at 933 (image_available img1))
  (at 941 (not (image_available img1)))
  (at 955 (image_available img2))
  (at 963 (not (image_available img2)))
  (at 666 (image_available img3))
  (at 674 (not (image_available img3)))
  (at 947 (image_available img4))
  (at 955 (not (image_available img4)))
  (at 927 (image_available img5))
  (at 935 (not (image_available img5)))
  (at 785 (image_available img6))
  (at 793 (not (image_available img6)))
  (at 954 (image_available img7))
  (at 962 (not (image_available img7)))
  (at 865 (image_available img8))
  (at 873 (not (image_available img8)))
  (at 872 (image_available img9))
  (at 880 (not (image_available img9)))
  (at 795 (image_available img10))
  (at 803 (not (image_available img10)))
  (at 766 (image_available img11))
  (at 774 (not (image_available img11)))
  (at 972 (image_available img12))
  (at 980 (not (image_available img12)))
  (at 657 (image_available img13))
  (at 665 (not (image_available img13)))
  (at 849 (image_available img14))
  (at 857 (not (image_available img14)))
  (at 651 (image_available img15))
  (at 659 (not (image_available img15)))
  (at 950 (image_available img16))
  (at 958 (not (image_available img16)))
  (at 947 (image_available img17))
  (at 955 (not (image_available img17)))
  (at 709 (image_available img18))
  (at 717 (not (image_available img18)))
  (at 686 (image_available img19))
  (at 694 (not (image_available img19)))
  (at 759 (image_available img20))
  (at 767 (not (image_available img20)))
  (at 1293 (image_available img1))
  (at 1301 (not (image_available img1)))
  (at 1315 (image_available img2))
  (at 1323 (not (image_available img2)))
  (at 1026 (image_available img3))
  (at 1034 (not (image_available img3)))
  (at 1307 (image_available img4))
  (at 1315 (not (image_available img4)))
  (at 1287 (image_available img5))
  (at 1295 (not (image_available img5)))
  (at 1145 (image_available img6))
  (at 1153 (not (image_available img6)))
  (at 1314 (image_available img7))
  (at 1322 (not (image_available img7)))
  (at 1225 (image_available img8))
  (at 1233 (not (image_available img8)))
  (at 1232 (image_available img9))
  (at 1240 (not (image_available img9)))
  (at 1155 (image_available img10))
  (at 1163 (not (image_available img10)))
  (at 1126 (image_available img11))
  (at 1134 (not (image_available img11)))
  (at 1332 (image_available img12))
  (at 1340 (not (image_available img12)))
  (at 1017 (image_available img13))
  (at 1025 (not (image_available img13)))
  (at 1209 (image_available img14))
  (at 1217 (not (image_available img14)))
  (at 1011 (image_available img15))
  (at 1019 (not (image_available img15)))
  (at 1310 (image_available img16))
  (at 1318 (not (image_available img16)))
  (at 1307 (image_available img17))
  (at 1315 (not (image_available img17)))
  (at 1069 (image_available img18))
  (at 1077 (not (image_available img18)))
  (at 1046 (image_available img19))
  (at 1054 (not (image_available img19)))
  (at 1119 (image_available img20))
  (at 1127 (not (image_available img20)))
  (at 1653 (image_available img1))
  (at 1661 (not (image_available img1)))
  (at 1675 (image_available img2))
  (at 1683 (not (image_available img2)))
  (at 1386 (image_available img3))
  (at 1394 (not (image_available img3)))
  (at 1667 (image_available img4))
  (at 1675 (not (image_available img4)))
  (at 1647 (image_available img5))
  (at 1655 (not (image_available img5)))
  (at 1505 (image_available img6))
  (at 1513 (not (image_available img6)))
  (at 1674 (image_available img7))
  (at 1682 (not (image_available img7)))
  (at 1585 (image_available img8))
  (at 1593 (not (image_available img8)))
  (at 1592 (image_available img9))
  (at 1600 (not (image_available img9)))
  (at 1515 (image_available img10))
  (at 1523 (not (image_available img10)))
  (at 1486 (image_available img11))
  (at 1494 (not (image_available img11)))
  (at 1692 (image_available img12))
  (at 1700 (not (image_available img12)))
  (at 1377 (image_available img13))
  (at 1385 (not (image_available img13)))
  (at 1569 (image_available img14))
  (at 1577 (not (image_available img14)))
  (at 1371 (image_available img15))
  (at 1379 (not (image_available img15)))
  (at 1670 (image_available img16))
  (at 1678 (not (image_available img16)))
  (at 1667 (image_available img17))
  (at 1675 (not (image_available img17)))
  (at 1429 (image_available img18))
  (at 1437 (not (image_available img18)))
  (at 1406 (image_available img19))
  (at 1414 (not (image_available img19)))
  (at 1479 (image_available img20))
  (at 1487 (not (image_available img20)))
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
  (> (image_score img2) 0)
  (<= (image_score img2) 9.0)

  (> (image_score img6) 0)
  (<= (image_score img6) 1.0)

  (> (image_score img7) 0)
  (<= (image_score img7) 18.0)

  (> (image_score img8) 0)
  (<= (image_score img8) 14.0)

  (> (image_score img10) 0)
  (<= (image_score img10) 2.0)

  (> (image_score img11) 0)
  (<= (image_score img11) 18.0)

  (> (image_score img18) 0)
  (<= (image_score img18) 1.0)

(>= (total_score) 13)
))
(:metric maximize (+
  (image_score img2)
    (+ (image_score img6)
      (+ (image_score img7)
        (+ (image_score img8)
          (+ (image_score img10)
            (+ (image_score img11)
              (image_score img18)
            )
          )
        )
      )
    )
  )
)
)
