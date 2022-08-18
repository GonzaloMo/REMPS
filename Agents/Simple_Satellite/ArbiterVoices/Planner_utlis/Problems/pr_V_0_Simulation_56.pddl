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



  (at 283 (image_available img1))
  (at 291 (not (image_available img1)))
  (at 229 (image_available img2))
  (at 237 (not (image_available img2)))
  (at 29 (image_available img3))
  (at 37 (not (image_available img3)))
  (at 127 (image_available img4))
  (at 135 (not (image_available img4)))
  (at 76 (image_available img5))
  (at 84 (not (image_available img5)))
  (at 175 (image_available img6))
  (at 183 (not (image_available img6)))
  (at 193 (image_available img7))
  (at 201 (not (image_available img7)))
  (at 192 (image_available img8))
  (at 200 (not (image_available img8)))
  (at 277 (image_available img9))
  (at 285 (not (image_available img9)))
  (at 316 (image_available img10))
  (at 324 (not (image_available img10)))
  (at 267 (image_available img11))
  (at 275 (not (image_available img11)))
  (at 148 (image_available img12))
  (at 156 (not (image_available img12)))
  (at 75 (image_available img13))
  (at 83 (not (image_available img13)))
  (at 174 (image_available img14))
  (at 182 (not (image_available img14)))
  (at 287 (image_available img15))
  (at 295 (not (image_available img15)))
  (at 139 (image_available img16))
  (at 147 (not (image_available img16)))
  (at 3 (image_available img17))
  (at 11 (not (image_available img17)))
  (at 101 (image_available img18))
  (at 109 (not (image_available img18)))
  (at 21 (image_available img19))
  (at 29 (not (image_available img19)))
  (at 124 (image_available img20))
  (at 132 (not (image_available img20)))
  (at 643 (image_available img1))
  (at 651 (not (image_available img1)))
  (at 589 (image_available img2))
  (at 597 (not (image_available img2)))
  (at 389 (image_available img3))
  (at 397 (not (image_available img3)))
  (at 487 (image_available img4))
  (at 495 (not (image_available img4)))
  (at 436 (image_available img5))
  (at 444 (not (image_available img5)))
  (at 535 (image_available img6))
  (at 543 (not (image_available img6)))
  (at 553 (image_available img7))
  (at 561 (not (image_available img7)))
  (at 552 (image_available img8))
  (at 560 (not (image_available img8)))
  (at 637 (image_available img9))
  (at 645 (not (image_available img9)))
  (at 676 (image_available img10))
  (at 684 (not (image_available img10)))
  (at 627 (image_available img11))
  (at 635 (not (image_available img11)))
  (at 508 (image_available img12))
  (at 516 (not (image_available img12)))
  (at 435 (image_available img13))
  (at 443 (not (image_available img13)))
  (at 534 (image_available img14))
  (at 542 (not (image_available img14)))
  (at 647 (image_available img15))
  (at 655 (not (image_available img15)))
  (at 499 (image_available img16))
  (at 507 (not (image_available img16)))
  (at 363 (image_available img17))
  (at 371 (not (image_available img17)))
  (at 461 (image_available img18))
  (at 469 (not (image_available img18)))
  (at 381 (image_available img19))
  (at 389 (not (image_available img19)))
  (at 484 (image_available img20))
  (at 492 (not (image_available img20)))
  (at 1003 (image_available img1))
  (at 1011 (not (image_available img1)))
  (at 949 (image_available img2))
  (at 957 (not (image_available img2)))
  (at 749 (image_available img3))
  (at 757 (not (image_available img3)))
  (at 847 (image_available img4))
  (at 855 (not (image_available img4)))
  (at 796 (image_available img5))
  (at 804 (not (image_available img5)))
  (at 895 (image_available img6))
  (at 903 (not (image_available img6)))
  (at 913 (image_available img7))
  (at 921 (not (image_available img7)))
  (at 912 (image_available img8))
  (at 920 (not (image_available img8)))
  (at 997 (image_available img9))
  (at 1005 (not (image_available img9)))
  (at 1036 (image_available img10))
  (at 1044 (not (image_available img10)))
  (at 987 (image_available img11))
  (at 995 (not (image_available img11)))
  (at 868 (image_available img12))
  (at 876 (not (image_available img12)))
  (at 795 (image_available img13))
  (at 803 (not (image_available img13)))
  (at 894 (image_available img14))
  (at 902 (not (image_available img14)))
  (at 1007 (image_available img15))
  (at 1015 (not (image_available img15)))
  (at 859 (image_available img16))
  (at 867 (not (image_available img16)))
  (at 723 (image_available img17))
  (at 731 (not (image_available img17)))
  (at 821 (image_available img18))
  (at 829 (not (image_available img18)))
  (at 741 (image_available img19))
  (at 749 (not (image_available img19)))
  (at 844 (image_available img20))
  (at 852 (not (image_available img20)))
  (at 1363 (image_available img1))
  (at 1371 (not (image_available img1)))
  (at 1309 (image_available img2))
  (at 1317 (not (image_available img2)))
  (at 1109 (image_available img3))
  (at 1117 (not (image_available img3)))
  (at 1207 (image_available img4))
  (at 1215 (not (image_available img4)))
  (at 1156 (image_available img5))
  (at 1164 (not (image_available img5)))
  (at 1255 (image_available img6))
  (at 1263 (not (image_available img6)))
  (at 1273 (image_available img7))
  (at 1281 (not (image_available img7)))
  (at 1272 (image_available img8))
  (at 1280 (not (image_available img8)))
  (at 1357 (image_available img9))
  (at 1365 (not (image_available img9)))
  (at 1396 (image_available img10))
  (at 1404 (not (image_available img10)))
  (at 1347 (image_available img11))
  (at 1355 (not (image_available img11)))
  (at 1228 (image_available img12))
  (at 1236 (not (image_available img12)))
  (at 1155 (image_available img13))
  (at 1163 (not (image_available img13)))
  (at 1254 (image_available img14))
  (at 1262 (not (image_available img14)))
  (at 1367 (image_available img15))
  (at 1375 (not (image_available img15)))
  (at 1219 (image_available img16))
  (at 1227 (not (image_available img16)))
  (at 1083 (image_available img17))
  (at 1091 (not (image_available img17)))
  (at 1181 (image_available img18))
  (at 1189 (not (image_available img18)))
  (at 1101 (image_available img19))
  (at 1109 (not (image_available img19)))
  (at 1204 (image_available img20))
  (at 1212 (not (image_available img20)))
  (at 1723 (image_available img1))
  (at 1731 (not (image_available img1)))
  (at 1669 (image_available img2))
  (at 1677 (not (image_available img2)))
  (at 1469 (image_available img3))
  (at 1477 (not (image_available img3)))
  (at 1567 (image_available img4))
  (at 1575 (not (image_available img4)))
  (at 1516 (image_available img5))
  (at 1524 (not (image_available img5)))
  (at 1615 (image_available img6))
  (at 1623 (not (image_available img6)))
  (at 1633 (image_available img7))
  (at 1641 (not (image_available img7)))
  (at 1632 (image_available img8))
  (at 1640 (not (image_available img8)))
  (at 1717 (image_available img9))
  (at 1725 (not (image_available img9)))
  (at 1756 (image_available img10))
  (at 1764 (not (image_available img10)))
  (at 1707 (image_available img11))
  (at 1715 (not (image_available img11)))
  (at 1588 (image_available img12))
  (at 1596 (not (image_available img12)))
  (at 1515 (image_available img13))
  (at 1523 (not (image_available img13)))
  (at 1614 (image_available img14))
  (at 1622 (not (image_available img14)))
  (at 1727 (image_available img15))
  (at 1735 (not (image_available img15)))
  (at 1579 (image_available img16))
  (at 1587 (not (image_available img16)))
  (at 1443 (image_available img17))
  (at 1451 (not (image_available img17)))
  (at 1541 (image_available img18))
  (at 1549 (not (image_available img18)))
  (at 1461 (image_available img19))
  (at 1469 (not (image_available img19)))
  (at 1564 (image_available img20))
  (at 1572 (not (image_available img20)))
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
  (<= (image_score img2) 13)

  (> (image_score img3) 0)
  (<= (image_score img3) 14)

  (> (image_score img4) 0)
  (<= (image_score img4) 12)

  (> (image_score img8) 0)
  (<= (image_score img8) 15)

  (> (image_score img10) 0)
  (<= (image_score img10) 19)

  (> (image_score img11) 0)
  (<= (image_score img11) 3)

  (> (image_score img12) 0)
  (<= (image_score img12) 10)

  (> (image_score img13) 0)
  (<= (image_score img13) 19)

  (> (image_score img17) 0)
  (<= (image_score img17) 5)

(>= (total_score) 22)
))
(:metric maximize (+
  (image_score img2)
    (+ (image_score img3)
      (+ (image_score img4)
        (+ (image_score img8)
          (+ (image_score img10)
            (+ (image_score img11)
              (+ (image_score img12)
                (+ (image_score img13)
                  (image_score img17)
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