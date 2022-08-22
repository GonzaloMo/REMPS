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

  (memory_free mem4)
  (memory_free mem6)
  (memory_free mem7)
  (memory_free mem8)
  (memory_free mem9)

   (memory_taken mem0 img15)
   (memory_taken mem1 img6)
   (memory_taken mem2 img8)
   (memory_taken mem3 img13)
   (memory_taken mem5 img18)

(image_analysed mem0 img15)
(image_analysed mem1 img6)
(image_analysed mem2 img8)
(image_analysed mem3 img13)
(image_analysed mem5 img18)

  (at 155 (image_available img2))
  (at 163 (not (image_available img2)))
  (at 126 (image_available img3))
  (at 134 (not (image_available img3)))
  (at 248 (image_available img6))
  (at 256 (not (image_available img6)))
  (at 193 (image_available img7))
  (at 201 (not (image_available img7)))
  (at 246 (image_available img8))
  (at 254 (not (image_available img8)))
  (at 14 (image_available img9))
  (at 22 (not (image_available img9)))
  (at 140 (image_available img10))
  (at 148 (not (image_available img10)))
  (at 86 (image_available img11))
  (at 94 (not (image_available img11)))
  (at 59 (image_available img14))
  (at 67 (not (image_available img14)))
  (at 258 (image_available img16))
  (at 266 (not (image_available img16)))
  (at 50 (image_available img17))
  (at 58 (not (image_available img17)))
  (at 61 (image_available img18))
  (at 69 (not (image_available img18)))
  (at 190 (image_available img19))
  (at 198 (not (image_available img19)))
  (at 342 (image_available img1))
  (at 350 (not (image_available img1)))
  (at 515 (image_available img2))
  (at 523 (not (image_available img2)))
  (at 486 (image_available img3))
  (at 494 (not (image_available img3)))
  (at 297 (image_available img4))
  (at 305 (not (image_available img4)))
  (at 332 (image_available img5))
  (at 340 (not (image_available img5)))
  (at 608 (image_available img6))
  (at 616 (not (image_available img6)))
  (at 553 (image_available img7))
  (at 561 (not (image_available img7)))
  (at 606 (image_available img8))
  (at 614 (not (image_available img8)))
  (at 374 (image_available img9))
  (at 382 (not (image_available img9)))
  (at 500 (image_available img10))
  (at 508 (not (image_available img10)))
  (at 446 (image_available img11))
  (at 454 (not (image_available img11)))
  (at 340 (image_available img12))
  (at 348 (not (image_available img12)))
  (at 315 (image_available img13))
  (at 323 (not (image_available img13)))
  (at 419 (image_available img14))
  (at 427 (not (image_available img14)))
  (at 332 (image_available img15))
  (at 340 (not (image_available img15)))
  (at 618 (image_available img16))
  (at 626 (not (image_available img16)))
  (at 410 (image_available img17))
  (at 418 (not (image_available img17)))
  (at 421 (image_available img18))
  (at 429 (not (image_available img18)))
  (at 550 (image_available img19))
  (at 558 (not (image_available img19)))
  (at 329 (image_available img20))
  (at 337 (not (image_available img20)))
  (at 702 (image_available img1))
  (at 710 (not (image_available img1)))
  (at 875 (image_available img2))
  (at 883 (not (image_available img2)))
  (at 846 (image_available img3))
  (at 854 (not (image_available img3)))
  (at 657 (image_available img4))
  (at 665 (not (image_available img4)))
  (at 692 (image_available img5))
  (at 700 (not (image_available img5)))
  (at 968 (image_available img6))
  (at 976 (not (image_available img6)))
  (at 913 (image_available img7))
  (at 921 (not (image_available img7)))
  (at 966 (image_available img8))
  (at 974 (not (image_available img8)))
  (at 734 (image_available img9))
  (at 742 (not (image_available img9)))
  (at 860 (image_available img10))
  (at 868 (not (image_available img10)))
  (at 806 (image_available img11))
  (at 814 (not (image_available img11)))
  (at 700 (image_available img12))
  (at 708 (not (image_available img12)))
  (at 675 (image_available img13))
  (at 683 (not (image_available img13)))
  (at 779 (image_available img14))
  (at 787 (not (image_available img14)))
  (at 692 (image_available img15))
  (at 700 (not (image_available img15)))
  (at 978 (image_available img16))
  (at 986 (not (image_available img16)))
  (at 770 (image_available img17))
  (at 778 (not (image_available img17)))
  (at 781 (image_available img18))
  (at 789 (not (image_available img18)))
  (at 910 (image_available img19))
  (at 918 (not (image_available img19)))
  (at 689 (image_available img20))
  (at 697 (not (image_available img20)))
  (at 1062 (image_available img1))
  (at 1070 (not (image_available img1)))
  (at 1235 (image_available img2))
  (at 1243 (not (image_available img2)))
  (at 1206 (image_available img3))
  (at 1214 (not (image_available img3)))
  (at 1017 (image_available img4))
  (at 1025 (not (image_available img4)))
  (at 1052 (image_available img5))
  (at 1060 (not (image_available img5)))
  (at 1328 (image_available img6))
  (at 1336 (not (image_available img6)))
  (at 1273 (image_available img7))
  (at 1281 (not (image_available img7)))
  (at 1326 (image_available img8))
  (at 1334 (not (image_available img8)))
  (at 1094 (image_available img9))
  (at 1102 (not (image_available img9)))
  (at 1220 (image_available img10))
  (at 1228 (not (image_available img10)))
  (at 1166 (image_available img11))
  (at 1174 (not (image_available img11)))
  (at 1060 (image_available img12))
  (at 1068 (not (image_available img12)))
  (at 1035 (image_available img13))
  (at 1043 (not (image_available img13)))
  (at 1139 (image_available img14))
  (at 1147 (not (image_available img14)))
  (at 1052 (image_available img15))
  (at 1060 (not (image_available img15)))
  (at 1338 (image_available img16))
  (at 1346 (not (image_available img16)))
  (at 1130 (image_available img17))
  (at 1138 (not (image_available img17)))
  (at 1141 (image_available img18))
  (at 1149 (not (image_available img18)))
  (at 1270 (image_available img19))
  (at 1278 (not (image_available img19)))
  (at 1049 (image_available img20))
  (at 1057 (not (image_available img20)))
  (at 1422 (image_available img1))
  (at 1430 (not (image_available img1)))
  (at 1595 (image_available img2))
  (at 1603 (not (image_available img2)))
  (at 1566 (image_available img3))
  (at 1574 (not (image_available img3)))
  (at 1377 (image_available img4))
  (at 1385 (not (image_available img4)))
  (at 1412 (image_available img5))
  (at 1420 (not (image_available img5)))
  (at 1688 (image_available img6))
  (at 1696 (not (image_available img6)))
  (at 1633 (image_available img7))
  (at 1641 (not (image_available img7)))
  (at 1686 (image_available img8))
  (at 1694 (not (image_available img8)))
  (at 1454 (image_available img9))
  (at 1462 (not (image_available img9)))
  (at 1580 (image_available img10))
  (at 1588 (not (image_available img10)))
  (at 1526 (image_available img11))
  (at 1534 (not (image_available img11)))
  (at 1420 (image_available img12))
  (at 1428 (not (image_available img12)))
  (at 1395 (image_available img13))
  (at 1403 (not (image_available img13)))
  (at 1499 (image_available img14))
  (at 1507 (not (image_available img14)))
  (at 1412 (image_available img15))
  (at 1420 (not (image_available img15)))
  (at 1698 (image_available img16))
  (at 1706 (not (image_available img16)))
  (at 1490 (image_available img17))
  (at 1498 (not (image_available img17)))
  (at 1501 (image_available img18))
  (at 1509 (not (image_available img18)))
  (at 1630 (image_available img19))
  (at 1638 (not (image_available img19)))
  (at 1409 (image_available img20))
  (at 1417 (not (image_available img20)))
  (at 1 (dump_available))
  (at 22.0 (not (dump_available)))
  (at 164.0 (dump_available))
  (at 202.0 (not (dump_available)))
  (at 344.0 (dump_available))
  (at 382.0 (not (dump_available)))
  (at 524.0 (dump_available))
  (at 562.0 (not (dump_available)))
  (at 704.0 (dump_available))
  (at 742.0 (not (dump_available)))
  (at 884.0 (dump_available))
  (at 922.0 (not (dump_available)))
  (at 1064.0 (dump_available))
  (at 1102.0 (not (dump_available)))
  (at 1244.0 (dump_available))
  (at 1282.0 (not (dump_available)))
  (at 1424.0 (dump_available))
  (at 1462.0 (not (dump_available)))
  (at 1604.0 (dump_available))
  (at 1642.0 (not (dump_available)))

)
(:goal (and
  (> (image_score img6) 0)
  (<= (image_score img6) 12)

  (> (image_score img8) 0)
  (<= (image_score img8) 15)

  (> (image_score img18) 0)
  (<= (image_score img18) 13)

(>= (total_score) 8)
))
(:metric maximize (+
  (image_score img6)
    (+ (image_score img8)
      (image_score img18)
    )
  )
)
)
