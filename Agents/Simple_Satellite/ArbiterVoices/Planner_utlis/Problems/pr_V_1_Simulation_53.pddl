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



  (at 79 (image_available img1))
  (at 87 (not (image_available img1)))
  (at 14 (image_available img2))
  (at 22 (not (image_available img2)))
  (at 63 (image_available img3))
  (at 71 (not (image_available img3)))
  (at 199 (image_available img4))
  (at 207 (not (image_available img4)))
  (at 313 (image_available img5))
  (at 321 (not (image_available img5)))
  (at 124 (image_available img6))
  (at 132 (not (image_available img6)))
  (at 171 (image_available img7))
  (at 179 (not (image_available img7)))
  (at 180 (image_available img8))
  (at 188 (not (image_available img8)))
  (at 311 (image_available img9))
  (at 319 (not (image_available img9)))
  (at 336 (image_available img10))
  (at 344 (not (image_available img10)))
  (at 318 (image_available img11))
  (at 326 (not (image_available img11)))
  (at 247 (image_available img12))
  (at 255 (not (image_available img12)))
  (at 67 (image_available img13))
  (at 75 (not (image_available img13)))
  (at 200 (image_available img14))
  (at 208 (not (image_available img14)))
  (at 78 (image_available img15))
  (at 86 (not (image_available img15)))
  (at 117 (image_available img16))
  (at 125 (not (image_available img16)))
  (at 261 (image_available img17))
  (at 269 (not (image_available img17)))
  (at 315 (image_available img18))
  (at 323 (not (image_available img18)))
  (at 258 (image_available img19))
  (at 266 (not (image_available img19)))
  (at 182 (image_available img20))
  (at 190 (not (image_available img20)))
  (at 439 (image_available img1))
  (at 447 (not (image_available img1)))
  (at 374 (image_available img2))
  (at 382 (not (image_available img2)))
  (at 423 (image_available img3))
  (at 431 (not (image_available img3)))
  (at 559 (image_available img4))
  (at 567 (not (image_available img4)))
  (at 673 (image_available img5))
  (at 681 (not (image_available img5)))
  (at 484 (image_available img6))
  (at 492 (not (image_available img6)))
  (at 531 (image_available img7))
  (at 539 (not (image_available img7)))
  (at 540 (image_available img8))
  (at 548 (not (image_available img8)))
  (at 671 (image_available img9))
  (at 679 (not (image_available img9)))
  (at 696 (image_available img10))
  (at 704 (not (image_available img10)))
  (at 678 (image_available img11))
  (at 686 (not (image_available img11)))
  (at 607 (image_available img12))
  (at 615 (not (image_available img12)))
  (at 427 (image_available img13))
  (at 435 (not (image_available img13)))
  (at 560 (image_available img14))
  (at 568 (not (image_available img14)))
  (at 438 (image_available img15))
  (at 446 (not (image_available img15)))
  (at 477 (image_available img16))
  (at 485 (not (image_available img16)))
  (at 621 (image_available img17))
  (at 629 (not (image_available img17)))
  (at 675 (image_available img18))
  (at 683 (not (image_available img18)))
  (at 618 (image_available img19))
  (at 626 (not (image_available img19)))
  (at 542 (image_available img20))
  (at 550 (not (image_available img20)))
  (at 799 (image_available img1))
  (at 807 (not (image_available img1)))
  (at 734 (image_available img2))
  (at 742 (not (image_available img2)))
  (at 783 (image_available img3))
  (at 791 (not (image_available img3)))
  (at 919 (image_available img4))
  (at 927 (not (image_available img4)))
  (at 1033 (image_available img5))
  (at 1041 (not (image_available img5)))
  (at 844 (image_available img6))
  (at 852 (not (image_available img6)))
  (at 891 (image_available img7))
  (at 899 (not (image_available img7)))
  (at 900 (image_available img8))
  (at 908 (not (image_available img8)))
  (at 1031 (image_available img9))
  (at 1039 (not (image_available img9)))
  (at 1056 (image_available img10))
  (at 1064 (not (image_available img10)))
  (at 1038 (image_available img11))
  (at 1046 (not (image_available img11)))
  (at 967 (image_available img12))
  (at 975 (not (image_available img12)))
  (at 787 (image_available img13))
  (at 795 (not (image_available img13)))
  (at 920 (image_available img14))
  (at 928 (not (image_available img14)))
  (at 798 (image_available img15))
  (at 806 (not (image_available img15)))
  (at 837 (image_available img16))
  (at 845 (not (image_available img16)))
  (at 981 (image_available img17))
  (at 989 (not (image_available img17)))
  (at 1035 (image_available img18))
  (at 1043 (not (image_available img18)))
  (at 978 (image_available img19))
  (at 986 (not (image_available img19)))
  (at 902 (image_available img20))
  (at 910 (not (image_available img20)))
  (at 1159 (image_available img1))
  (at 1167 (not (image_available img1)))
  (at 1094 (image_available img2))
  (at 1102 (not (image_available img2)))
  (at 1143 (image_available img3))
  (at 1151 (not (image_available img3)))
  (at 1279 (image_available img4))
  (at 1287 (not (image_available img4)))
  (at 1393 (image_available img5))
  (at 1401 (not (image_available img5)))
  (at 1204 (image_available img6))
  (at 1212 (not (image_available img6)))
  (at 1251 (image_available img7))
  (at 1259 (not (image_available img7)))
  (at 1260 (image_available img8))
  (at 1268 (not (image_available img8)))
  (at 1391 (image_available img9))
  (at 1399 (not (image_available img9)))
  (at 1416 (image_available img10))
  (at 1424 (not (image_available img10)))
  (at 1398 (image_available img11))
  (at 1406 (not (image_available img11)))
  (at 1327 (image_available img12))
  (at 1335 (not (image_available img12)))
  (at 1147 (image_available img13))
  (at 1155 (not (image_available img13)))
  (at 1280 (image_available img14))
  (at 1288 (not (image_available img14)))
  (at 1158 (image_available img15))
  (at 1166 (not (image_available img15)))
  (at 1197 (image_available img16))
  (at 1205 (not (image_available img16)))
  (at 1341 (image_available img17))
  (at 1349 (not (image_available img17)))
  (at 1395 (image_available img18))
  (at 1403 (not (image_available img18)))
  (at 1338 (image_available img19))
  (at 1346 (not (image_available img19)))
  (at 1262 (image_available img20))
  (at 1270 (not (image_available img20)))
  (at 1519 (image_available img1))
  (at 1527 (not (image_available img1)))
  (at 1454 (image_available img2))
  (at 1462 (not (image_available img2)))
  (at 1503 (image_available img3))
  (at 1511 (not (image_available img3)))
  (at 1639 (image_available img4))
  (at 1647 (not (image_available img4)))
  (at 1753 (image_available img5))
  (at 1761 (not (image_available img5)))
  (at 1564 (image_available img6))
  (at 1572 (not (image_available img6)))
  (at 1611 (image_available img7))
  (at 1619 (not (image_available img7)))
  (at 1620 (image_available img8))
  (at 1628 (not (image_available img8)))
  (at 1751 (image_available img9))
  (at 1759 (not (image_available img9)))
  (at 1776 (image_available img10))
  (at 1784 (not (image_available img10)))
  (at 1758 (image_available img11))
  (at 1766 (not (image_available img11)))
  (at 1687 (image_available img12))
  (at 1695 (not (image_available img12)))
  (at 1507 (image_available img13))
  (at 1515 (not (image_available img13)))
  (at 1640 (image_available img14))
  (at 1648 (not (image_available img14)))
  (at 1518 (image_available img15))
  (at 1526 (not (image_available img15)))
  (at 1557 (image_available img16))
  (at 1565 (not (image_available img16)))
  (at 1701 (image_available img17))
  (at 1709 (not (image_available img17)))
  (at 1755 (image_available img18))
  (at 1763 (not (image_available img18)))
  (at 1698 (image_available img19))
  (at 1706 (not (image_available img19)))
  (at 1622 (image_available img20))
  (at 1630 (not (image_available img20)))
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
  (<= (image_score img2) 1)

  (> (image_score img3) 0)
  (<= (image_score img3) 5)

  (> (image_score img9) 0)
  (<= (image_score img9) 1)

  (> (image_score img11) 0)
  (<= (image_score img11) 4)

  (> (image_score img13) 0)
  (<= (image_score img13) 2)

  (> (image_score img15) 0)
  (<= (image_score img15) 1)

  (> (image_score img18) 0)
  (<= (image_score img18) 3)

  (> (image_score img20) 0)
  (<= (image_score img20) 4)

(>= (total_score) 5)
))
(:metric maximize (+
  (image_score img2)
    (+ (image_score img3)
      (+ (image_score img9)
        (+ (image_score img11)
          (+ (image_score img13)
            (+ (image_score img15)
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
