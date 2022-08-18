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



  (at 286 (image_available img1))
  (at 294 (not (image_available img1)))
  (at 274 (image_available img2))
  (at 282 (not (image_available img2)))
  (at 252 (image_available img3))
  (at 260 (not (image_available img3)))
  (at 215 (image_available img4))
  (at 223 (not (image_available img4)))
  (at 252 (image_available img5))
  (at 260 (not (image_available img5)))
  (at 333 (image_available img6))
  (at 341 (not (image_available img6)))
  (at 117 (image_available img7))
  (at 125 (not (image_available img7)))
  (at 38 (image_available img8))
  (at 46 (not (image_available img8)))
  (at 225 (image_available img9))
  (at 233 (not (image_available img9)))
  (at 248 (image_available img10))
  (at 256 (not (image_available img10)))
  (at 35 (image_available img11))
  (at 43 (not (image_available img11)))
  (at 236 (image_available img12))
  (at 244 (not (image_available img12)))
  (at 341 (image_available img13))
  (at 349 (not (image_available img13)))
  (at 176 (image_available img14))
  (at 184 (not (image_available img14)))
  (at 14 (image_available img15))
  (at 22 (not (image_available img15)))
  (at 105 (image_available img16))
  (at 113 (not (image_available img16)))
  (at 264 (image_available img17))
  (at 272 (not (image_available img17)))
  (at 291 (image_available img18))
  (at 299 (not (image_available img18)))
  (at 313 (image_available img19))
  (at 321 (not (image_available img19)))
  (at 24 (image_available img20))
  (at 32 (not (image_available img20)))
  (at 646 (image_available img1))
  (at 654 (not (image_available img1)))
  (at 634 (image_available img2))
  (at 642 (not (image_available img2)))
  (at 612 (image_available img3))
  (at 620 (not (image_available img3)))
  (at 575 (image_available img4))
  (at 583 (not (image_available img4)))
  (at 612 (image_available img5))
  (at 620 (not (image_available img5)))
  (at 693 (image_available img6))
  (at 701 (not (image_available img6)))
  (at 477 (image_available img7))
  (at 485 (not (image_available img7)))
  (at 398 (image_available img8))
  (at 406 (not (image_available img8)))
  (at 585 (image_available img9))
  (at 593 (not (image_available img9)))
  (at 608 (image_available img10))
  (at 616 (not (image_available img10)))
  (at 395 (image_available img11))
  (at 403 (not (image_available img11)))
  (at 596 (image_available img12))
  (at 604 (not (image_available img12)))
  (at 701 (image_available img13))
  (at 709 (not (image_available img13)))
  (at 536 (image_available img14))
  (at 544 (not (image_available img14)))
  (at 374 (image_available img15))
  (at 382 (not (image_available img15)))
  (at 465 (image_available img16))
  (at 473 (not (image_available img16)))
  (at 624 (image_available img17))
  (at 632 (not (image_available img17)))
  (at 651 (image_available img18))
  (at 659 (not (image_available img18)))
  (at 673 (image_available img19))
  (at 681 (not (image_available img19)))
  (at 384 (image_available img20))
  (at 392 (not (image_available img20)))
  (at 1006 (image_available img1))
  (at 1014 (not (image_available img1)))
  (at 994 (image_available img2))
  (at 1002 (not (image_available img2)))
  (at 972 (image_available img3))
  (at 980 (not (image_available img3)))
  (at 935 (image_available img4))
  (at 943 (not (image_available img4)))
  (at 972 (image_available img5))
  (at 980 (not (image_available img5)))
  (at 1053 (image_available img6))
  (at 1061 (not (image_available img6)))
  (at 837 (image_available img7))
  (at 845 (not (image_available img7)))
  (at 758 (image_available img8))
  (at 766 (not (image_available img8)))
  (at 945 (image_available img9))
  (at 953 (not (image_available img9)))
  (at 968 (image_available img10))
  (at 976 (not (image_available img10)))
  (at 755 (image_available img11))
  (at 763 (not (image_available img11)))
  (at 956 (image_available img12))
  (at 964 (not (image_available img12)))
  (at 1061 (image_available img13))
  (at 1069 (not (image_available img13)))
  (at 896 (image_available img14))
  (at 904 (not (image_available img14)))
  (at 734 (image_available img15))
  (at 742 (not (image_available img15)))
  (at 825 (image_available img16))
  (at 833 (not (image_available img16)))
  (at 984 (image_available img17))
  (at 992 (not (image_available img17)))
  (at 1011 (image_available img18))
  (at 1019 (not (image_available img18)))
  (at 1033 (image_available img19))
  (at 1041 (not (image_available img19)))
  (at 744 (image_available img20))
  (at 752 (not (image_available img20)))
  (at 1366 (image_available img1))
  (at 1374 (not (image_available img1)))
  (at 1354 (image_available img2))
  (at 1362 (not (image_available img2)))
  (at 1332 (image_available img3))
  (at 1340 (not (image_available img3)))
  (at 1295 (image_available img4))
  (at 1303 (not (image_available img4)))
  (at 1332 (image_available img5))
  (at 1340 (not (image_available img5)))
  (at 1413 (image_available img6))
  (at 1421 (not (image_available img6)))
  (at 1197 (image_available img7))
  (at 1205 (not (image_available img7)))
  (at 1118 (image_available img8))
  (at 1126 (not (image_available img8)))
  (at 1305 (image_available img9))
  (at 1313 (not (image_available img9)))
  (at 1328 (image_available img10))
  (at 1336 (not (image_available img10)))
  (at 1115 (image_available img11))
  (at 1123 (not (image_available img11)))
  (at 1316 (image_available img12))
  (at 1324 (not (image_available img12)))
  (at 1421 (image_available img13))
  (at 1429 (not (image_available img13)))
  (at 1256 (image_available img14))
  (at 1264 (not (image_available img14)))
  (at 1094 (image_available img15))
  (at 1102 (not (image_available img15)))
  (at 1185 (image_available img16))
  (at 1193 (not (image_available img16)))
  (at 1344 (image_available img17))
  (at 1352 (not (image_available img17)))
  (at 1371 (image_available img18))
  (at 1379 (not (image_available img18)))
  (at 1393 (image_available img19))
  (at 1401 (not (image_available img19)))
  (at 1104 (image_available img20))
  (at 1112 (not (image_available img20)))
  (at 1726 (image_available img1))
  (at 1734 (not (image_available img1)))
  (at 1714 (image_available img2))
  (at 1722 (not (image_available img2)))
  (at 1692 (image_available img3))
  (at 1700 (not (image_available img3)))
  (at 1655 (image_available img4))
  (at 1663 (not (image_available img4)))
  (at 1692 (image_available img5))
  (at 1700 (not (image_available img5)))
  (at 1773 (image_available img6))
  (at 1781 (not (image_available img6)))
  (at 1557 (image_available img7))
  (at 1565 (not (image_available img7)))
  (at 1478 (image_available img8))
  (at 1486 (not (image_available img8)))
  (at 1665 (image_available img9))
  (at 1673 (not (image_available img9)))
  (at 1688 (image_available img10))
  (at 1696 (not (image_available img10)))
  (at 1475 (image_available img11))
  (at 1483 (not (image_available img11)))
  (at 1676 (image_available img12))
  (at 1684 (not (image_available img12)))
  (at 1781 (image_available img13))
  (at 1789 (not (image_available img13)))
  (at 1616 (image_available img14))
  (at 1624 (not (image_available img14)))
  (at 1454 (image_available img15))
  (at 1462 (not (image_available img15)))
  (at 1545 (image_available img16))
  (at 1553 (not (image_available img16)))
  (at 1704 (image_available img17))
  (at 1712 (not (image_available img17)))
  (at 1731 (image_available img18))
  (at 1739 (not (image_available img18)))
  (at 1753 (image_available img19))
  (at 1761 (not (image_available img19)))
  (at 1464 (image_available img20))
  (at 1472 (not (image_available img20)))
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
  (<= (image_score img1) 3)

  (> (image_score img6) 0)
  (<= (image_score img6) 10)

  (> (image_score img8) 0)
  (<= (image_score img8) 2)

  (> (image_score img10) 0)
  (<= (image_score img10) 1)

  (> (image_score img12) 0)
  (<= (image_score img12) 9)

  (> (image_score img14) 0)
  (<= (image_score img14) 3)

  (> (image_score img15) 0)
  (<= (image_score img15) 5)

  (> (image_score img16) 0)
  (<= (image_score img16) 2)

  (> (image_score img20) 0)
  (<= (image_score img20) 8)

(>= (total_score) 9)
))
(:metric maximize (+
  (image_score img1)
    (+ (image_score img6)
      (+ (image_score img8)
        (+ (image_score img10)
          (+ (image_score img12)
            (+ (image_score img14)
              (+ (image_score img15)
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