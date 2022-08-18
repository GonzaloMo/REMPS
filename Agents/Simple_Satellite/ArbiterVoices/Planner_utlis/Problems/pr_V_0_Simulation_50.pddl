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

  (memory_free mem3)
  (memory_free mem4)
  (memory_free mem5)
  (memory_free mem6)
  (memory_free mem7)
  (memory_free mem8)
  (memory_free mem9)

   (memory_taken mem0 img6)
   (memory_taken mem1 img7)
   (memory_taken mem2 img1)

(image_analysed mem0 img6)
(image_analysed mem2 img1)

  (at 31 (image_available img3))
  (at 39 (not (image_available img3)))
  (at 77 (image_available img13))
  (at 85 (not (image_available img13)))
  (at 48 (image_available img16))
  (at 56 (not (image_available img16)))
  (at 0 (image_available img18))
  (at 2 (not (image_available img18)))
  (at 55 (image_available img19))
  (at 63 (not (image_available img19)))
  (at 275 (image_available img1))
  (at 283 (not (image_available img1)))
  (at 251 (image_available img2))
  (at 259 (not (image_available img2)))
  (at 391 (image_available img3))
  (at 399 (not (image_available img3)))
  (at 148 (image_available img4))
  (at 156 (not (image_available img4)))
  (at 312 (image_available img5))
  (at 320 (not (image_available img5)))
  (at 220 (image_available img6))
  (at 228 (not (image_available img6)))
  (at 283 (image_available img7))
  (at 291 (not (image_available img7)))
  (at 118 (image_available img8))
  (at 126 (not (image_available img8)))
  (at 276 (image_available img9))
  (at 284 (not (image_available img9)))
  (at 138 (image_available img10))
  (at 146 (not (image_available img10)))
  (at 108 (image_available img11))
  (at 116 (not (image_available img11)))
  (at 307 (image_available img12))
  (at 315 (not (image_available img12)))
  (at 437 (image_available img13))
  (at 445 (not (image_available img13)))
  (at 320 (image_available img14))
  (at 328 (not (image_available img14)))
  (at 148 (image_available img15))
  (at 156 (not (image_available img15)))
  (at 408 (image_available img16))
  (at 416 (not (image_available img16)))
  (at 239 (image_available img17))
  (at 247 (not (image_available img17)))
  (at 354 (image_available img18))
  (at 362 (not (image_available img18)))
  (at 415 (image_available img19))
  (at 423 (not (image_available img19)))
  (at 132 (image_available img20))
  (at 140 (not (image_available img20)))
  (at 635 (image_available img1))
  (at 643 (not (image_available img1)))
  (at 611 (image_available img2))
  (at 619 (not (image_available img2)))
  (at 751 (image_available img3))
  (at 759 (not (image_available img3)))
  (at 508 (image_available img4))
  (at 516 (not (image_available img4)))
  (at 672 (image_available img5))
  (at 680 (not (image_available img5)))
  (at 580 (image_available img6))
  (at 588 (not (image_available img6)))
  (at 643 (image_available img7))
  (at 651 (not (image_available img7)))
  (at 478 (image_available img8))
  (at 486 (not (image_available img8)))
  (at 636 (image_available img9))
  (at 644 (not (image_available img9)))
  (at 498 (image_available img10))
  (at 506 (not (image_available img10)))
  (at 468 (image_available img11))
  (at 476 (not (image_available img11)))
  (at 667 (image_available img12))
  (at 675 (not (image_available img12)))
  (at 797 (image_available img13))
  (at 805 (not (image_available img13)))
  (at 680 (image_available img14))
  (at 688 (not (image_available img14)))
  (at 508 (image_available img15))
  (at 516 (not (image_available img15)))
  (at 768 (image_available img16))
  (at 776 (not (image_available img16)))
  (at 599 (image_available img17))
  (at 607 (not (image_available img17)))
  (at 714 (image_available img18))
  (at 722 (not (image_available img18)))
  (at 775 (image_available img19))
  (at 783 (not (image_available img19)))
  (at 492 (image_available img20))
  (at 500 (not (image_available img20)))
  (at 995 (image_available img1))
  (at 1003 (not (image_available img1)))
  (at 971 (image_available img2))
  (at 979 (not (image_available img2)))
  (at 1111 (image_available img3))
  (at 1119 (not (image_available img3)))
  (at 868 (image_available img4))
  (at 876 (not (image_available img4)))
  (at 1032 (image_available img5))
  (at 1040 (not (image_available img5)))
  (at 940 (image_available img6))
  (at 948 (not (image_available img6)))
  (at 1003 (image_available img7))
  (at 1011 (not (image_available img7)))
  (at 838 (image_available img8))
  (at 846 (not (image_available img8)))
  (at 996 (image_available img9))
  (at 1004 (not (image_available img9)))
  (at 858 (image_available img10))
  (at 866 (not (image_available img10)))
  (at 828 (image_available img11))
  (at 836 (not (image_available img11)))
  (at 1027 (image_available img12))
  (at 1035 (not (image_available img12)))
  (at 1157 (image_available img13))
  (at 1165 (not (image_available img13)))
  (at 1040 (image_available img14))
  (at 1048 (not (image_available img14)))
  (at 868 (image_available img15))
  (at 876 (not (image_available img15)))
  (at 1128 (image_available img16))
  (at 1136 (not (image_available img16)))
  (at 959 (image_available img17))
  (at 967 (not (image_available img17)))
  (at 1074 (image_available img18))
  (at 1082 (not (image_available img18)))
  (at 1135 (image_available img19))
  (at 1143 (not (image_available img19)))
  (at 852 (image_available img20))
  (at 860 (not (image_available img20)))
  (at 1355 (image_available img1))
  (at 1363 (not (image_available img1)))
  (at 1331 (image_available img2))
  (at 1339 (not (image_available img2)))
  (at 1471 (image_available img3))
  (at 1479 (not (image_available img3)))
  (at 1228 (image_available img4))
  (at 1236 (not (image_available img4)))
  (at 1392 (image_available img5))
  (at 1400 (not (image_available img5)))
  (at 1300 (image_available img6))
  (at 1308 (not (image_available img6)))
  (at 1363 (image_available img7))
  (at 1371 (not (image_available img7)))
  (at 1198 (image_available img8))
  (at 1206 (not (image_available img8)))
  (at 1356 (image_available img9))
  (at 1364 (not (image_available img9)))
  (at 1218 (image_available img10))
  (at 1226 (not (image_available img10)))
  (at 1188 (image_available img11))
  (at 1196 (not (image_available img11)))
  (at 1387 (image_available img12))
  (at 1395 (not (image_available img12)))
  (at 1517 (image_available img13))
  (at 1525 (not (image_available img13)))
  (at 1400 (image_available img14))
  (at 1408 (not (image_available img14)))
  (at 1228 (image_available img15))
  (at 1236 (not (image_available img15)))
  (at 1488 (image_available img16))
  (at 1496 (not (image_available img16)))
  (at 1319 (image_available img17))
  (at 1327 (not (image_available img17)))
  (at 1434 (image_available img18))
  (at 1442 (not (image_available img18)))
  (at 1495 (image_available img19))
  (at 1503 (not (image_available img19)))
  (at 1212 (image_available img20))
  (at 1220 (not (image_available img20)))
  (at 1 (dump_available))
  (at 24.0 (not (dump_available)))
  (at 166.0 (dump_available))
  (at 204.0 (not (dump_available)))
  (at 346.0 (dump_available))
  (at 384.0 (not (dump_available)))
  (at 526.0 (dump_available))
  (at 564.0 (not (dump_available)))
  (at 706.0 (dump_available))
  (at 744.0 (not (dump_available)))
  (at 886.0 (dump_available))
  (at 924.0 (not (dump_available)))
  (at 1066.0 (dump_available))
  (at 1104.0 (not (dump_available)))
  (at 1246.0 (dump_available))
  (at 1284.0 (not (dump_available)))
  (at 1426.0 (dump_available))
  (at 1464.0 (not (dump_available)))

)
(:goal (and
  (> (image_score img5) 0)
  (<= (image_score img5) 5)

  (> (image_score img10) 0)
  (<= (image_score img10) 9)

  (> (image_score img12) 0)
  (<= (image_score img12) 2)

  (> (image_score img17) 0)
  (<= (image_score img17) 5)

(>= (total_score) 5)
))
(:metric maximize (+
  (image_score img5)
    (+ (image_score img10)
      (+ (image_score img12)
        (image_score img17)
      )
    )
  )
)
)