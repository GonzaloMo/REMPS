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



  (at 150 (image_available img1))
  (at 158 (not (image_available img1)))
  (at 195 (image_available img2))
  (at 203 (not (image_available img2)))
  (at 113 (image_available img3))
  (at 121 (not (image_available img3)))
  (at 98 (image_available img4))
  (at 106 (not (image_available img4)))
  (at 267 (image_available img5))
  (at 275 (not (image_available img5)))
  (at 224 (image_available img6))
  (at 232 (not (image_available img6)))
  (at 183 (image_available img7))
  (at 191 (not (image_available img7)))
  (at 328 (image_available img8))
  (at 336 (not (image_available img8)))
  (at 274 (image_available img9))
  (at 282 (not (image_available img9)))
  (at 92 (image_available img10))
  (at 100 (not (image_available img10)))
  (at 104 (image_available img11))
  (at 112 (not (image_available img11)))
  (at 119 (image_available img12))
  (at 127 (not (image_available img12)))
  (at 73 (image_available img13))
  (at 81 (not (image_available img13)))
  (at 215 (image_available img14))
  (at 223 (not (image_available img14)))
  (at 191 (image_available img15))
  (at 199 (not (image_available img15)))
  (at 70 (image_available img16))
  (at 78 (not (image_available img16)))
  (at 88 (image_available img17))
  (at 96 (not (image_available img17)))
  (at 47 (image_available img18))
  (at 55 (not (image_available img18)))
  (at 291 (image_available img19))
  (at 299 (not (image_available img19)))
  (at 315 (image_available img20))
  (at 323 (not (image_available img20)))
  (at 510 (image_available img1))
  (at 518 (not (image_available img1)))
  (at 555 (image_available img2))
  (at 563 (not (image_available img2)))
  (at 473 (image_available img3))
  (at 481 (not (image_available img3)))
  (at 458 (image_available img4))
  (at 466 (not (image_available img4)))
  (at 627 (image_available img5))
  (at 635 (not (image_available img5)))
  (at 584 (image_available img6))
  (at 592 (not (image_available img6)))
  (at 543 (image_available img7))
  (at 551 (not (image_available img7)))
  (at 688 (image_available img8))
  (at 696 (not (image_available img8)))
  (at 634 (image_available img9))
  (at 642 (not (image_available img9)))
  (at 452 (image_available img10))
  (at 460 (not (image_available img10)))
  (at 464 (image_available img11))
  (at 472 (not (image_available img11)))
  (at 479 (image_available img12))
  (at 487 (not (image_available img12)))
  (at 433 (image_available img13))
  (at 441 (not (image_available img13)))
  (at 575 (image_available img14))
  (at 583 (not (image_available img14)))
  (at 551 (image_available img15))
  (at 559 (not (image_available img15)))
  (at 430 (image_available img16))
  (at 438 (not (image_available img16)))
  (at 448 (image_available img17))
  (at 456 (not (image_available img17)))
  (at 407 (image_available img18))
  (at 415 (not (image_available img18)))
  (at 651 (image_available img19))
  (at 659 (not (image_available img19)))
  (at 675 (image_available img20))
  (at 683 (not (image_available img20)))
  (at 870 (image_available img1))
  (at 878 (not (image_available img1)))
  (at 915 (image_available img2))
  (at 923 (not (image_available img2)))
  (at 833 (image_available img3))
  (at 841 (not (image_available img3)))
  (at 818 (image_available img4))
  (at 826 (not (image_available img4)))
  (at 987 (image_available img5))
  (at 995 (not (image_available img5)))
  (at 944 (image_available img6))
  (at 952 (not (image_available img6)))
  (at 903 (image_available img7))
  (at 911 (not (image_available img7)))
  (at 1048 (image_available img8))
  (at 1056 (not (image_available img8)))
  (at 994 (image_available img9))
  (at 1002 (not (image_available img9)))
  (at 812 (image_available img10))
  (at 820 (not (image_available img10)))
  (at 824 (image_available img11))
  (at 832 (not (image_available img11)))
  (at 839 (image_available img12))
  (at 847 (not (image_available img12)))
  (at 793 (image_available img13))
  (at 801 (not (image_available img13)))
  (at 935 (image_available img14))
  (at 943 (not (image_available img14)))
  (at 911 (image_available img15))
  (at 919 (not (image_available img15)))
  (at 790 (image_available img16))
  (at 798 (not (image_available img16)))
  (at 808 (image_available img17))
  (at 816 (not (image_available img17)))
  (at 767 (image_available img18))
  (at 775 (not (image_available img18)))
  (at 1011 (image_available img19))
  (at 1019 (not (image_available img19)))
  (at 1035 (image_available img20))
  (at 1043 (not (image_available img20)))
  (at 1230 (image_available img1))
  (at 1238 (not (image_available img1)))
  (at 1275 (image_available img2))
  (at 1283 (not (image_available img2)))
  (at 1193 (image_available img3))
  (at 1201 (not (image_available img3)))
  (at 1178 (image_available img4))
  (at 1186 (not (image_available img4)))
  (at 1347 (image_available img5))
  (at 1355 (not (image_available img5)))
  (at 1304 (image_available img6))
  (at 1312 (not (image_available img6)))
  (at 1263 (image_available img7))
  (at 1271 (not (image_available img7)))
  (at 1408 (image_available img8))
  (at 1416 (not (image_available img8)))
  (at 1354 (image_available img9))
  (at 1362 (not (image_available img9)))
  (at 1172 (image_available img10))
  (at 1180 (not (image_available img10)))
  (at 1184 (image_available img11))
  (at 1192 (not (image_available img11)))
  (at 1199 (image_available img12))
  (at 1207 (not (image_available img12)))
  (at 1153 (image_available img13))
  (at 1161 (not (image_available img13)))
  (at 1295 (image_available img14))
  (at 1303 (not (image_available img14)))
  (at 1271 (image_available img15))
  (at 1279 (not (image_available img15)))
  (at 1150 (image_available img16))
  (at 1158 (not (image_available img16)))
  (at 1168 (image_available img17))
  (at 1176 (not (image_available img17)))
  (at 1127 (image_available img18))
  (at 1135 (not (image_available img18)))
  (at 1371 (image_available img19))
  (at 1379 (not (image_available img19)))
  (at 1395 (image_available img20))
  (at 1403 (not (image_available img20)))
  (at 1590 (image_available img1))
  (at 1598 (not (image_available img1)))
  (at 1635 (image_available img2))
  (at 1643 (not (image_available img2)))
  (at 1553 (image_available img3))
  (at 1561 (not (image_available img3)))
  (at 1538 (image_available img4))
  (at 1546 (not (image_available img4)))
  (at 1707 (image_available img5))
  (at 1715 (not (image_available img5)))
  (at 1664 (image_available img6))
  (at 1672 (not (image_available img6)))
  (at 1623 (image_available img7))
  (at 1631 (not (image_available img7)))
  (at 1768 (image_available img8))
  (at 1776 (not (image_available img8)))
  (at 1714 (image_available img9))
  (at 1722 (not (image_available img9)))
  (at 1532 (image_available img10))
  (at 1540 (not (image_available img10)))
  (at 1544 (image_available img11))
  (at 1552 (not (image_available img11)))
  (at 1559 (image_available img12))
  (at 1567 (not (image_available img12)))
  (at 1513 (image_available img13))
  (at 1521 (not (image_available img13)))
  (at 1655 (image_available img14))
  (at 1663 (not (image_available img14)))
  (at 1631 (image_available img15))
  (at 1639 (not (image_available img15)))
  (at 1510 (image_available img16))
  (at 1518 (not (image_available img16)))
  (at 1528 (image_available img17))
  (at 1536 (not (image_available img17)))
  (at 1487 (image_available img18))
  (at 1495 (not (image_available img18)))
  (at 1731 (image_available img19))
  (at 1739 (not (image_available img19)))
  (at 1755 (image_available img20))
  (at 1763 (not (image_available img20)))
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
  (<= (image_score img1) 11)

  (> (image_score img2) 0)
  (<= (image_score img2) 3)

  (> (image_score img3) 0)
  (<= (image_score img3) 14)

  (> (image_score img5) 0)
  (<= (image_score img5) 13)

  (> (image_score img6) 0)
  (<= (image_score img6) 14)

  (> (image_score img8) 0)
  (<= (image_score img8) 3)

  (> (image_score img9) 0)
  (<= (image_score img9) 4)

  (> (image_score img10) 0)
  (<= (image_score img10) 1)

  (> (image_score img12) 0)
  (<= (image_score img12) 7)

  (> (image_score img13) 0)
  (<= (image_score img13) 4)

  (> (image_score img15) 0)
  (<= (image_score img15) 1)

  (> (image_score img16) 0)
  (<= (image_score img16) 12)

  (> (image_score img18) 0)
  (<= (image_score img18) 8)

(>= (total_score) 19)
))
(:metric maximize (+
  (image_score img1)
    (+ (image_score img2)
      (+ (image_score img3)
        (+ (image_score img5)
          (+ (image_score img6)
            (+ (image_score img8)
              (+ (image_score img9)
                (+ (image_score img10)
                  (+ (image_score img12)
                    (+ (image_score img13)
                      (+ (image_score img15)
                        (+ (image_score img16)
                          (image_score img18)
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
)