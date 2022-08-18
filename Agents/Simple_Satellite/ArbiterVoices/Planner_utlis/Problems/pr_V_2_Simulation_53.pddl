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
  (memory_free mem8)
  (memory_free mem9)

   (memory_taken mem0 img13)
   (memory_taken mem1 img10)
   (memory_taken mem2 img13)
   (memory_taken mem3 img12)
   (memory_taken mem4 img5)
   (memory_taken mem6 img19)
   (memory_taken mem7 img18)

(image_analysed mem0 img13)
(image_analysed mem1 img10)
(image_analysed mem2 img13)
(image_analysed mem3 img12)
(image_analysed mem4 img5)
(image_analysed mem6 img19)
(image_analysed mem7 img18)

  (at 176 (image_available img1))
  (at 184 (not (image_available img1)))
  (at 136 (image_available img2))
  (at 144 (not (image_available img2)))
  (at 211 (image_available img3))
  (at 219 (not (image_available img3)))
  (at 237 (image_available img5))
  (at 245 (not (image_available img5)))
  (at 32 (image_available img6))
  (at 40 (not (image_available img6)))
  (at 221 (image_available img7))
  (at 229 (not (image_available img7)))
  (at 13 (image_available img8))
  (at 21 (not (image_available img8)))
  (at 66 (image_available img12))
  (at 74 (not (image_available img12)))
  (at 6 (image_available img13))
  (at 14 (not (image_available img13)))
  (at 75 (image_available img15))
  (at 83 (not (image_available img15)))
  (at 107 (image_available img16))
  (at 115 (not (image_available img16)))
  (at 0 (image_available img17))
  (at 7 (not (image_available img17)))
  (at 151 (image_available img19))
  (at 159 (not (image_available img19)))
  (at 69 (image_available img20))
  (at 77 (not (image_available img20)))
  (at 536 (image_available img1))
  (at 544 (not (image_available img1)))
  (at 496 (image_available img2))
  (at 504 (not (image_available img2)))
  (at 571 (image_available img3))
  (at 579 (not (image_available img3)))
  (at 323 (image_available img4))
  (at 331 (not (image_available img4)))
  (at 597 (image_available img5))
  (at 605 (not (image_available img5)))
  (at 392 (image_available img6))
  (at 400 (not (image_available img6)))
  (at 581 (image_available img7))
  (at 589 (not (image_available img7)))
  (at 373 (image_available img8))
  (at 381 (not (image_available img8)))
  (at 301 (image_available img9))
  (at 309 (not (image_available img9)))
  (at 263 (image_available img10))
  (at 271 (not (image_available img10)))
  (at 254 (image_available img11))
  (at 262 (not (image_available img11)))
  (at 426 (image_available img12))
  (at 434 (not (image_available img12)))
  (at 366 (image_available img13))
  (at 374 (not (image_available img13)))
  (at 267 (image_available img14))
  (at 275 (not (image_available img14)))
  (at 435 (image_available img15))
  (at 443 (not (image_available img15)))
  (at 467 (image_available img16))
  (at 475 (not (image_available img16)))
  (at 359 (image_available img17))
  (at 367 (not (image_available img17)))
  (at 298 (image_available img18))
  (at 306 (not (image_available img18)))
  (at 511 (image_available img19))
  (at 519 (not (image_available img19)))
  (at 429 (image_available img20))
  (at 437 (not (image_available img20)))
  (at 896 (image_available img1))
  (at 904 (not (image_available img1)))
  (at 856 (image_available img2))
  (at 864 (not (image_available img2)))
  (at 931 (image_available img3))
  (at 939 (not (image_available img3)))
  (at 683 (image_available img4))
  (at 691 (not (image_available img4)))
  (at 957 (image_available img5))
  (at 965 (not (image_available img5)))
  (at 752 (image_available img6))
  (at 760 (not (image_available img6)))
  (at 941 (image_available img7))
  (at 949 (not (image_available img7)))
  (at 733 (image_available img8))
  (at 741 (not (image_available img8)))
  (at 661 (image_available img9))
  (at 669 (not (image_available img9)))
  (at 623 (image_available img10))
  (at 631 (not (image_available img10)))
  (at 614 (image_available img11))
  (at 622 (not (image_available img11)))
  (at 786 (image_available img12))
  (at 794 (not (image_available img12)))
  (at 726 (image_available img13))
  (at 734 (not (image_available img13)))
  (at 627 (image_available img14))
  (at 635 (not (image_available img14)))
  (at 795 (image_available img15))
  (at 803 (not (image_available img15)))
  (at 827 (image_available img16))
  (at 835 (not (image_available img16)))
  (at 719 (image_available img17))
  (at 727 (not (image_available img17)))
  (at 658 (image_available img18))
  (at 666 (not (image_available img18)))
  (at 871 (image_available img19))
  (at 879 (not (image_available img19)))
  (at 789 (image_available img20))
  (at 797 (not (image_available img20)))
  (at 1256 (image_available img1))
  (at 1264 (not (image_available img1)))
  (at 1216 (image_available img2))
  (at 1224 (not (image_available img2)))
  (at 1291 (image_available img3))
  (at 1299 (not (image_available img3)))
  (at 1043 (image_available img4))
  (at 1051 (not (image_available img4)))
  (at 1317 (image_available img5))
  (at 1325 (not (image_available img5)))
  (at 1112 (image_available img6))
  (at 1120 (not (image_available img6)))
  (at 1301 (image_available img7))
  (at 1309 (not (image_available img7)))
  (at 1093 (image_available img8))
  (at 1101 (not (image_available img8)))
  (at 1021 (image_available img9))
  (at 1029 (not (image_available img9)))
  (at 983 (image_available img10))
  (at 991 (not (image_available img10)))
  (at 974 (image_available img11))
  (at 982 (not (image_available img11)))
  (at 1146 (image_available img12))
  (at 1154 (not (image_available img12)))
  (at 1086 (image_available img13))
  (at 1094 (not (image_available img13)))
  (at 987 (image_available img14))
  (at 995 (not (image_available img14)))
  (at 1155 (image_available img15))
  (at 1163 (not (image_available img15)))
  (at 1187 (image_available img16))
  (at 1195 (not (image_available img16)))
  (at 1079 (image_available img17))
  (at 1087 (not (image_available img17)))
  (at 1018 (image_available img18))
  (at 1026 (not (image_available img18)))
  (at 1231 (image_available img19))
  (at 1239 (not (image_available img19)))
  (at 1149 (image_available img20))
  (at 1157 (not (image_available img20)))
  (at 1616 (image_available img1))
  (at 1624 (not (image_available img1)))
  (at 1576 (image_available img2))
  (at 1584 (not (image_available img2)))
  (at 1651 (image_available img3))
  (at 1659 (not (image_available img3)))
  (at 1403 (image_available img4))
  (at 1411 (not (image_available img4)))
  (at 1677 (image_available img5))
  (at 1685 (not (image_available img5)))
  (at 1472 (image_available img6))
  (at 1480 (not (image_available img6)))
  (at 1661 (image_available img7))
  (at 1669 (not (image_available img7)))
  (at 1453 (image_available img8))
  (at 1461 (not (image_available img8)))
  (at 1381 (image_available img9))
  (at 1389 (not (image_available img9)))
  (at 1343 (image_available img10))
  (at 1351 (not (image_available img10)))
  (at 1334 (image_available img11))
  (at 1342 (not (image_available img11)))
  (at 1506 (image_available img12))
  (at 1514 (not (image_available img12)))
  (at 1446 (image_available img13))
  (at 1454 (not (image_available img13)))
  (at 1347 (image_available img14))
  (at 1355 (not (image_available img14)))
  (at 1515 (image_available img15))
  (at 1523 (not (image_available img15)))
  (at 1547 (image_available img16))
  (at 1555 (not (image_available img16)))
  (at 1439 (image_available img17))
  (at 1447 (not (image_available img17)))
  (at 1378 (image_available img18))
  (at 1386 (not (image_available img18)))
  (at 1591 (image_available img19))
  (at 1599 (not (image_available img19)))
  (at 1509 (image_available img20))
  (at 1517 (not (image_available img20)))
  (at 1 (dump_available))
  (at 2.0 (not (dump_available)))
  (at 144.0 (dump_available))
  (at 182.0 (not (dump_available)))
  (at 324.0 (dump_available))
  (at 362.0 (not (dump_available)))
  (at 504.0 (dump_available))
  (at 542.0 (not (dump_available)))
  (at 684.0 (dump_available))
  (at 722.0 (not (dump_available)))
  (at 864.0 (dump_available))
  (at 902.0 (not (dump_available)))
  (at 1044.0 (dump_available))
  (at 1082.0 (not (dump_available)))
  (at 1224.0 (dump_available))
  (at 1262.0 (not (dump_available)))
  (at 1404.0 (dump_available))
  (at 1442.0 (not (dump_available)))
  (at 1584.0 (dump_available))
  (at 1622.0 (not (dump_available)))

)
(:goal (and
  (> (image_score img4) 0)
  (<= (image_score img4) 1)

  (> (image_score img5) 0)
  (<= (image_score img5) 1)

  (> (image_score img13) 0)
  (<= (image_score img13) 2)

  (> (image_score img18) 0)
  (<= (image_score img18) 1)

(>= (total_score) 1)
))
(:metric maximize (+
  (image_score img4)
    (+ (image_score img5)
      (+ (image_score img13)
        (image_score img18)
      )
    )
  )
)
)