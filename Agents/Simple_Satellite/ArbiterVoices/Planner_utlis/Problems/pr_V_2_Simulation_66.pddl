(define(problem satprob)
(:domain SimpleSatellite)
(:objects
  mem0 mem1 mem2 mem3 mem4 mem5 mem6 mem7 mem8 mem9 - memory
 img1 img2 img3 img4 img5 img6 img7 img8 img9 img10 img11 img12 img13 img14 img15 img16 img17 img18 img19 img20 img21 img22 img23 img24 img25 - image
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
  (= (image_score img21) 0)
  (= (image_score img22) 0)
  (= (image_score img23) 0)
  (= (image_score img24) 0)
  (= (image_score img25) 0)
  (= (total_score) 0)

  (memory_free mem2)
  (memory_free mem3)
  (memory_free mem5)
  (memory_free mem6)
  (memory_free mem7)
  (memory_free mem8)
  (memory_free mem9)

   (memory_taken mem0 img7)
   (memory_taken mem1 img2)
   (memory_taken mem4 img20)

(image_analysed mem0 img7)
(image_analysed mem4 img20)

  (at 73 (image_available img8))
  (at 81 (not (image_available img8)))
  (at 19 (image_available img9))
  (at 27 (not (image_available img9)))
  (at 32 (image_available img10))
  (at 40 (not (image_available img10)))
  (at 48 (image_available img11))
  (at 56 (not (image_available img11)))
  (at 91 (image_available img15))
  (at 99 (not (image_available img15)))
  (at 33 (image_available img21))
  (at 41 (not (image_available img21)))
  (at 37 (image_available img22))
  (at 45 (not (image_available img22)))
  (at 58 (image_available img24))
  (at 66 (not (image_available img24)))
  (at 0 (image_available img25))
  (at 2 (not (image_available img25)))
  (at 252 (image_available img1))
  (at 260 (not (image_available img1)))
  (at 187 (image_available img2))
  (at 195 (not (image_available img2)))
  (at 117 (image_available img3))
  (at 125 (not (image_available img3)))
  (at 299 (image_available img4))
  (at 307 (not (image_available img4)))
  (at 116 (image_available img5))
  (at 124 (not (image_available img5)))
  (at 327 (image_available img6))
  (at 335 (not (image_available img6)))
  (at 330 (image_available img7))
  (at 338 (not (image_available img7)))
  (at 433 (image_available img8))
  (at 441 (not (image_available img8)))
  (at 379 (image_available img9))
  (at 387 (not (image_available img9)))
  (at 392 (image_available img10))
  (at 400 (not (image_available img10)))
  (at 408 (image_available img11))
  (at 416 (not (image_available img11)))
  (at 184 (image_available img12))
  (at 192 (not (image_available img12)))
  (at 271 (image_available img13))
  (at 279 (not (image_available img13)))
  (at 273 (image_available img14))
  (at 281 (not (image_available img14)))
  (at 451 (image_available img15))
  (at 459 (not (image_available img15)))
  (at 351 (image_available img16))
  (at 359 (not (image_available img16)))
  (at 270 (image_available img17))
  (at 278 (not (image_available img17)))
  (at 288 (image_available img18))
  (at 296 (not (image_available img18)))
  (at 238 (image_available img19))
  (at 246 (not (image_available img19)))
  (at 304 (image_available img20))
  (at 312 (not (image_available img20)))
  (at 393 (image_available img21))
  (at 401 (not (image_available img21)))
  (at 397 (image_available img22))
  (at 405 (not (image_available img22)))
  (at 183 (image_available img23))
  (at 191 (not (image_available img23)))
  (at 418 (image_available img24))
  (at 426 (not (image_available img24)))
  (at 354 (image_available img25))
  (at 362 (not (image_available img25)))
  (at 612 (image_available img1))
  (at 620 (not (image_available img1)))
  (at 547 (image_available img2))
  (at 555 (not (image_available img2)))
  (at 477 (image_available img3))
  (at 485 (not (image_available img3)))
  (at 659 (image_available img4))
  (at 667 (not (image_available img4)))
  (at 476 (image_available img5))
  (at 484 (not (image_available img5)))
  (at 687 (image_available img6))
  (at 695 (not (image_available img6)))
  (at 690 (image_available img7))
  (at 698 (not (image_available img7)))
  (at 793 (image_available img8))
  (at 801 (not (image_available img8)))
  (at 739 (image_available img9))
  (at 747 (not (image_available img9)))
  (at 752 (image_available img10))
  (at 760 (not (image_available img10)))
  (at 768 (image_available img11))
  (at 776 (not (image_available img11)))
  (at 544 (image_available img12))
  (at 552 (not (image_available img12)))
  (at 631 (image_available img13))
  (at 639 (not (image_available img13)))
  (at 633 (image_available img14))
  (at 641 (not (image_available img14)))
  (at 811 (image_available img15))
  (at 819 (not (image_available img15)))
  (at 711 (image_available img16))
  (at 719 (not (image_available img16)))
  (at 630 (image_available img17))
  (at 638 (not (image_available img17)))
  (at 648 (image_available img18))
  (at 656 (not (image_available img18)))
  (at 598 (image_available img19))
  (at 606 (not (image_available img19)))
  (at 664 (image_available img20))
  (at 672 (not (image_available img20)))
  (at 753 (image_available img21))
  (at 761 (not (image_available img21)))
  (at 757 (image_available img22))
  (at 765 (not (image_available img22)))
  (at 543 (image_available img23))
  (at 551 (not (image_available img23)))
  (at 778 (image_available img24))
  (at 786 (not (image_available img24)))
  (at 714 (image_available img25))
  (at 722 (not (image_available img25)))
  (at 972 (image_available img1))
  (at 980 (not (image_available img1)))
  (at 907 (image_available img2))
  (at 915 (not (image_available img2)))
  (at 837 (image_available img3))
  (at 845 (not (image_available img3)))
  (at 1019 (image_available img4))
  (at 1027 (not (image_available img4)))
  (at 836 (image_available img5))
  (at 844 (not (image_available img5)))
  (at 1047 (image_available img6))
  (at 1055 (not (image_available img6)))
  (at 1050 (image_available img7))
  (at 1058 (not (image_available img7)))
  (at 1153 (image_available img8))
  (at 1161 (not (image_available img8)))
  (at 1099 (image_available img9))
  (at 1107 (not (image_available img9)))
  (at 1112 (image_available img10))
  (at 1120 (not (image_available img10)))
  (at 1128 (image_available img11))
  (at 1136 (not (image_available img11)))
  (at 904 (image_available img12))
  (at 912 (not (image_available img12)))
  (at 991 (image_available img13))
  (at 999 (not (image_available img13)))
  (at 993 (image_available img14))
  (at 1001 (not (image_available img14)))
  (at 1171 (image_available img15))
  (at 1179 (not (image_available img15)))
  (at 1071 (image_available img16))
  (at 1079 (not (image_available img16)))
  (at 990 (image_available img17))
  (at 998 (not (image_available img17)))
  (at 1008 (image_available img18))
  (at 1016 (not (image_available img18)))
  (at 958 (image_available img19))
  (at 966 (not (image_available img19)))
  (at 1024 (image_available img20))
  (at 1032 (not (image_available img20)))
  (at 1113 (image_available img21))
  (at 1121 (not (image_available img21)))
  (at 1117 (image_available img22))
  (at 1125 (not (image_available img22)))
  (at 903 (image_available img23))
  (at 911 (not (image_available img23)))
  (at 1138 (image_available img24))
  (at 1146 (not (image_available img24)))
  (at 1074 (image_available img25))
  (at 1082 (not (image_available img25)))
  (at 1332 (image_available img1))
  (at 1340 (not (image_available img1)))
  (at 1267 (image_available img2))
  (at 1275 (not (image_available img2)))
  (at 1197 (image_available img3))
  (at 1205 (not (image_available img3)))
  (at 1379 (image_available img4))
  (at 1387 (not (image_available img4)))
  (at 1196 (image_available img5))
  (at 1204 (not (image_available img5)))
  (at 1407 (image_available img6))
  (at 1415 (not (image_available img6)))
  (at 1410 (image_available img7))
  (at 1418 (not (image_available img7)))
  (at 1513 (image_available img8))
  (at 1521 (not (image_available img8)))
  (at 1459 (image_available img9))
  (at 1467 (not (image_available img9)))
  (at 1472 (image_available img10))
  (at 1480 (not (image_available img10)))
  (at 1488 (image_available img11))
  (at 1496 (not (image_available img11)))
  (at 1264 (image_available img12))
  (at 1272 (not (image_available img12)))
  (at 1351 (image_available img13))
  (at 1359 (not (image_available img13)))
  (at 1353 (image_available img14))
  (at 1361 (not (image_available img14)))
  (at 1531 (image_available img15))
  (at 1539 (not (image_available img15)))
  (at 1431 (image_available img16))
  (at 1439 (not (image_available img16)))
  (at 1350 (image_available img17))
  (at 1358 (not (image_available img17)))
  (at 1368 (image_available img18))
  (at 1376 (not (image_available img18)))
  (at 1318 (image_available img19))
  (at 1326 (not (image_available img19)))
  (at 1384 (image_available img20))
  (at 1392 (not (image_available img20)))
  (at 1473 (image_available img21))
  (at 1481 (not (image_available img21)))
  (at 1477 (image_available img22))
  (at 1485 (not (image_available img22)))
  (at 1263 (image_available img23))
  (at 1271 (not (image_available img23)))
  (at 1498 (image_available img24))
  (at 1506 (not (image_available img24)))
  (at 1434 (image_available img25))
  (at 1442 (not (image_available img25)))
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

)
(:goal (and
  (> (image_score img14) 0)
  (<= (image_score img14) 2)

  (> (image_score img19) 0)
  (<= (image_score img19) 4)

  (> (image_score img20) 0)
  (<= (image_score img20) 3)

(>= (total_score) 2)
))
(:metric maximize (+
  (image_score img14)
    (+ (image_score img19)
      (image_score img20)
    )
  )
)
)
