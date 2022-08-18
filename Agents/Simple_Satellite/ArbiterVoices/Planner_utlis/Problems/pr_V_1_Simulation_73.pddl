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

  (memory_free mem5)
  (memory_free mem7)
  (memory_free mem8)
  (memory_free mem9)

   (memory_taken mem0 img22)
   (memory_taken mem1 img19)
   (memory_taken mem2 img1)
   (memory_taken mem3 img20)
   (memory_taken mem4 img21)
   (memory_taken mem6 img3)

(image_analysed mem0 img22)
(image_analysed mem1 img19)
(image_analysed mem2 img1)
(image_analysed mem3 img20)
(image_analysed mem4 img21)
(image_analysed mem6 img3)

  (at 51 (image_available img3))
  (at 59 (not (image_available img3)))
  (at 49 (image_available img4))
  (at 57 (not (image_available img4)))
  (at 0 (image_available img5))
  (at 6 (not (image_available img5)))
  (at 40 (image_available img6))
  (at 48 (not (image_available img6)))
  (at 79 (image_available img17))
  (at 87 (not (image_available img17)))
  (at 58 (image_available img18))
  (at 66 (not (image_available img18)))
  (at 73 (image_available img19))
  (at 81 (not (image_available img19)))
  (at 73 (image_available img24))
  (at 81 (not (image_available img24)))
  (at 27 (image_available img25))
  (at 35 (not (image_available img25)))
  (at 238 (image_available img1))
  (at 246 (not (image_available img1)))
  (at 199 (image_available img2))
  (at 207 (not (image_available img2)))
  (at 411 (image_available img3))
  (at 419 (not (image_available img3)))
  (at 409 (image_available img4))
  (at 417 (not (image_available img4)))
  (at 358 (image_available img5))
  (at 366 (not (image_available img5)))
  (at 400 (image_available img6))
  (at 408 (not (image_available img6)))
  (at 173 (image_available img7))
  (at 181 (not (image_available img7)))
  (at 278 (image_available img8))
  (at 286 (not (image_available img8)))
  (at 338 (image_available img9))
  (at 346 (not (image_available img9)))
  (at 299 (image_available img10))
  (at 307 (not (image_available img10)))
  (at 130 (image_available img11))
  (at 138 (not (image_available img11)))
  (at 103 (image_available img12))
  (at 111 (not (image_available img12)))
  (at 339 (image_available img13))
  (at 347 (not (image_available img13)))
  (at 204 (image_available img14))
  (at 212 (not (image_available img14)))
  (at 241 (image_available img15))
  (at 249 (not (image_available img15)))
  (at 178 (image_available img16))
  (at 186 (not (image_available img16)))
  (at 439 (image_available img17))
  (at 447 (not (image_available img17)))
  (at 418 (image_available img18))
  (at 426 (not (image_available img18)))
  (at 433 (image_available img19))
  (at 441 (not (image_available img19)))
  (at 312 (image_available img20))
  (at 320 (not (image_available img20)))
  (at 276 (image_available img21))
  (at 284 (not (image_available img21)))
  (at 219 (image_available img22))
  (at 227 (not (image_available img22)))
  (at 221 (image_available img23))
  (at 229 (not (image_available img23)))
  (at 433 (image_available img24))
  (at 441 (not (image_available img24)))
  (at 387 (image_available img25))
  (at 395 (not (image_available img25)))
  (at 598 (image_available img1))
  (at 606 (not (image_available img1)))
  (at 559 (image_available img2))
  (at 567 (not (image_available img2)))
  (at 771 (image_available img3))
  (at 779 (not (image_available img3)))
  (at 769 (image_available img4))
  (at 777 (not (image_available img4)))
  (at 718 (image_available img5))
  (at 726 (not (image_available img5)))
  (at 760 (image_available img6))
  (at 768 (not (image_available img6)))
  (at 533 (image_available img7))
  (at 541 (not (image_available img7)))
  (at 638 (image_available img8))
  (at 646 (not (image_available img8)))
  (at 698 (image_available img9))
  (at 706 (not (image_available img9)))
  (at 659 (image_available img10))
  (at 667 (not (image_available img10)))
  (at 490 (image_available img11))
  (at 498 (not (image_available img11)))
  (at 463 (image_available img12))
  (at 471 (not (image_available img12)))
  (at 699 (image_available img13))
  (at 707 (not (image_available img13)))
  (at 564 (image_available img14))
  (at 572 (not (image_available img14)))
  (at 601 (image_available img15))
  (at 609 (not (image_available img15)))
  (at 538 (image_available img16))
  (at 546 (not (image_available img16)))
  (at 799 (image_available img17))
  (at 807 (not (image_available img17)))
  (at 778 (image_available img18))
  (at 786 (not (image_available img18)))
  (at 793 (image_available img19))
  (at 801 (not (image_available img19)))
  (at 672 (image_available img20))
  (at 680 (not (image_available img20)))
  (at 636 (image_available img21))
  (at 644 (not (image_available img21)))
  (at 579 (image_available img22))
  (at 587 (not (image_available img22)))
  (at 581 (image_available img23))
  (at 589 (not (image_available img23)))
  (at 793 (image_available img24))
  (at 801 (not (image_available img24)))
  (at 747 (image_available img25))
  (at 755 (not (image_available img25)))
  (at 958 (image_available img1))
  (at 966 (not (image_available img1)))
  (at 919 (image_available img2))
  (at 927 (not (image_available img2)))
  (at 1131 (image_available img3))
  (at 1139 (not (image_available img3)))
  (at 1129 (image_available img4))
  (at 1137 (not (image_available img4)))
  (at 1078 (image_available img5))
  (at 1086 (not (image_available img5)))
  (at 1120 (image_available img6))
  (at 1128 (not (image_available img6)))
  (at 893 (image_available img7))
  (at 901 (not (image_available img7)))
  (at 998 (image_available img8))
  (at 1006 (not (image_available img8)))
  (at 1058 (image_available img9))
  (at 1066 (not (image_available img9)))
  (at 1019 (image_available img10))
  (at 1027 (not (image_available img10)))
  (at 850 (image_available img11))
  (at 858 (not (image_available img11)))
  (at 823 (image_available img12))
  (at 831 (not (image_available img12)))
  (at 1059 (image_available img13))
  (at 1067 (not (image_available img13)))
  (at 924 (image_available img14))
  (at 932 (not (image_available img14)))
  (at 961 (image_available img15))
  (at 969 (not (image_available img15)))
  (at 898 (image_available img16))
  (at 906 (not (image_available img16)))
  (at 1159 (image_available img17))
  (at 1167 (not (image_available img17)))
  (at 1138 (image_available img18))
  (at 1146 (not (image_available img18)))
  (at 1153 (image_available img19))
  (at 1161 (not (image_available img19)))
  (at 1032 (image_available img20))
  (at 1040 (not (image_available img20)))
  (at 996 (image_available img21))
  (at 1004 (not (image_available img21)))
  (at 939 (image_available img22))
  (at 947 (not (image_available img22)))
  (at 941 (image_available img23))
  (at 949 (not (image_available img23)))
  (at 1153 (image_available img24))
  (at 1161 (not (image_available img24)))
  (at 1107 (image_available img25))
  (at 1115 (not (image_available img25)))
  (at 1318 (image_available img1))
  (at 1326 (not (image_available img1)))
  (at 1279 (image_available img2))
  (at 1287 (not (image_available img2)))
  (at 1491 (image_available img3))
  (at 1499 (not (image_available img3)))
  (at 1489 (image_available img4))
  (at 1497 (not (image_available img4)))
  (at 1438 (image_available img5))
  (at 1446 (not (image_available img5)))
  (at 1480 (image_available img6))
  (at 1488 (not (image_available img6)))
  (at 1253 (image_available img7))
  (at 1261 (not (image_available img7)))
  (at 1358 (image_available img8))
  (at 1366 (not (image_available img8)))
  (at 1418 (image_available img9))
  (at 1426 (not (image_available img9)))
  (at 1379 (image_available img10))
  (at 1387 (not (image_available img10)))
  (at 1210 (image_available img11))
  (at 1218 (not (image_available img11)))
  (at 1183 (image_available img12))
  (at 1191 (not (image_available img12)))
  (at 1419 (image_available img13))
  (at 1427 (not (image_available img13)))
  (at 1284 (image_available img14))
  (at 1292 (not (image_available img14)))
  (at 1321 (image_available img15))
  (at 1329 (not (image_available img15)))
  (at 1258 (image_available img16))
  (at 1266 (not (image_available img16)))
  (at 1519 (image_available img17))
  (at 1527 (not (image_available img17)))
  (at 1498 (image_available img18))
  (at 1506 (not (image_available img18)))
  (at 1513 (image_available img19))
  (at 1521 (not (image_available img19)))
  (at 1392 (image_available img20))
  (at 1400 (not (image_available img20)))
  (at 1356 (image_available img21))
  (at 1364 (not (image_available img21)))
  (at 1299 (image_available img22))
  (at 1307 (not (image_available img22)))
  (at 1301 (image_available img23))
  (at 1309 (not (image_available img23)))
  (at 1513 (image_available img24))
  (at 1521 (not (image_available img24)))
  (at 1467 (image_available img25))
  (at 1475 (not (image_available img25)))
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
  (> (image_score img2) 0)
  (<= (image_score img2) 3)

  (> (image_score img3) 0)
  (<= (image_score img3) 2)

  (> (image_score img4) 0)
  (<= (image_score img4) 2)

  (> (image_score img5) 0)
  (<= (image_score img5) 3)

  (> (image_score img6) 0)
  (<= (image_score img6) 2)

  (> (image_score img9) 0)
  (<= (image_score img9) 1)

  (> (image_score img13) 0)
  (<= (image_score img13) 4)

  (> (image_score img14) 0)
  (<= (image_score img14) 3)

  (> (image_score img16) 0)
  (<= (image_score img16) 2)

  (> (image_score img19) 0)
  (<= (image_score img19) 1)

  (> (image_score img21) 0)
  (<= (image_score img21) 2)

  (> (image_score img23) 0)
  (<= (image_score img23) 2)

  (> (image_score img25) 0)
  (<= (image_score img25) 1)

(>= (total_score) 6)
))
(:metric maximize (+
  (image_score img2)
    (+ (image_score img3)
      (+ (image_score img4)
        (+ (image_score img5)
          (+ (image_score img6)
            (+ (image_score img9)
              (+ (image_score img13)
                (+ (image_score img14)
                  (+ (image_score img16)
                    (+ (image_score img19)
                      (+ (image_score img21)
                        (+ (image_score img23)
                          (image_score img25)
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
