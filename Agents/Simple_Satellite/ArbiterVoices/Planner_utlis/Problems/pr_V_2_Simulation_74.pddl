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

   (memory_taken mem0 img12)
   (memory_taken mem1 img2)
   (memory_taken mem2 img18)
   (memory_taken mem3 img4)
   (memory_taken mem4 img10)
   (memory_taken mem6 img19)

(image_analysed mem0 img12)
(image_analysed mem2 img18)
(image_analysed mem3 img4)
(image_analysed mem4 img10)
(image_analysed mem6 img19)

  (at 91 (image_available img1))
  (at 99 (not (image_available img1)))
  (at 19 (image_available img6))
  (at 27 (not (image_available img6)))
  (at 16 (image_available img7))
  (at 24 (not (image_available img7)))
  (at 76 (image_available img11))
  (at 84 (not (image_available img11)))
  (at 1 (image_available img13))
  (at 9 (not (image_available img13)))
  (at 33 (image_available img15))
  (at 41 (not (image_available img15)))
  (at 22 (image_available img16))
  (at 30 (not (image_available img16)))
  (at 15 (image_available img17))
  (at 23 (not (image_available img17)))
  (at 44 (image_available img21))
  (at 52 (not (image_available img21)))
  (at 8 (image_available img23))
  (at 16 (not (image_available img23)))
  (at 451 (image_available img1))
  (at 459 (not (image_available img1)))
  (at 168 (image_available img2))
  (at 176 (not (image_available img2)))
  (at 176 (image_available img3))
  (at 184 (not (image_available img3)))
  (at 298 (image_available img4))
  (at 306 (not (image_available img4)))
  (at 320 (image_available img5))
  (at 328 (not (image_available img5)))
  (at 379 (image_available img6))
  (at 387 (not (image_available img6)))
  (at 376 (image_available img7))
  (at 384 (not (image_available img7)))
  (at 295 (image_available img8))
  (at 303 (not (image_available img8)))
  (at 217 (image_available img9))
  (at 225 (not (image_available img9)))
  (at 124 (image_available img10))
  (at 132 (not (image_available img10)))
  (at 436 (image_available img11))
  (at 444 (not (image_available img11)))
  (at 300 (image_available img12))
  (at 308 (not (image_available img12)))
  (at 361 (image_available img13))
  (at 369 (not (image_available img13)))
  (at 118 (image_available img14))
  (at 126 (not (image_available img14)))
  (at 393 (image_available img15))
  (at 401 (not (image_available img15)))
  (at 382 (image_available img16))
  (at 390 (not (image_available img16)))
  (at 375 (image_available img17))
  (at 383 (not (image_available img17)))
  (at 265 (image_available img18))
  (at 273 (not (image_available img18)))
  (at 161 (image_available img19))
  (at 169 (not (image_available img19)))
  (at 201 (image_available img20))
  (at 209 (not (image_available img20)))
  (at 404 (image_available img21))
  (at 412 (not (image_available img21)))
  (at 187 (image_available img22))
  (at 195 (not (image_available img22)))
  (at 368 (image_available img23))
  (at 376 (not (image_available img23)))
  (at 278 (image_available img24))
  (at 286 (not (image_available img24)))
  (at 175 (image_available img25))
  (at 183 (not (image_available img25)))
  (at 811 (image_available img1))
  (at 819 (not (image_available img1)))
  (at 528 (image_available img2))
  (at 536 (not (image_available img2)))
  (at 536 (image_available img3))
  (at 544 (not (image_available img3)))
  (at 658 (image_available img4))
  (at 666 (not (image_available img4)))
  (at 680 (image_available img5))
  (at 688 (not (image_available img5)))
  (at 739 (image_available img6))
  (at 747 (not (image_available img6)))
  (at 736 (image_available img7))
  (at 744 (not (image_available img7)))
  (at 655 (image_available img8))
  (at 663 (not (image_available img8)))
  (at 577 (image_available img9))
  (at 585 (not (image_available img9)))
  (at 484 (image_available img10))
  (at 492 (not (image_available img10)))
  (at 796 (image_available img11))
  (at 804 (not (image_available img11)))
  (at 660 (image_available img12))
  (at 668 (not (image_available img12)))
  (at 721 (image_available img13))
  (at 729 (not (image_available img13)))
  (at 478 (image_available img14))
  (at 486 (not (image_available img14)))
  (at 753 (image_available img15))
  (at 761 (not (image_available img15)))
  (at 742 (image_available img16))
  (at 750 (not (image_available img16)))
  (at 735 (image_available img17))
  (at 743 (not (image_available img17)))
  (at 625 (image_available img18))
  (at 633 (not (image_available img18)))
  (at 521 (image_available img19))
  (at 529 (not (image_available img19)))
  (at 561 (image_available img20))
  (at 569 (not (image_available img20)))
  (at 764 (image_available img21))
  (at 772 (not (image_available img21)))
  (at 547 (image_available img22))
  (at 555 (not (image_available img22)))
  (at 728 (image_available img23))
  (at 736 (not (image_available img23)))
  (at 638 (image_available img24))
  (at 646 (not (image_available img24)))
  (at 535 (image_available img25))
  (at 543 (not (image_available img25)))
  (at 1171 (image_available img1))
  (at 1179 (not (image_available img1)))
  (at 888 (image_available img2))
  (at 896 (not (image_available img2)))
  (at 896 (image_available img3))
  (at 904 (not (image_available img3)))
  (at 1018 (image_available img4))
  (at 1026 (not (image_available img4)))
  (at 1040 (image_available img5))
  (at 1048 (not (image_available img5)))
  (at 1099 (image_available img6))
  (at 1107 (not (image_available img6)))
  (at 1096 (image_available img7))
  (at 1104 (not (image_available img7)))
  (at 1015 (image_available img8))
  (at 1023 (not (image_available img8)))
  (at 937 (image_available img9))
  (at 945 (not (image_available img9)))
  (at 844 (image_available img10))
  (at 852 (not (image_available img10)))
  (at 1156 (image_available img11))
  (at 1164 (not (image_available img11)))
  (at 1020 (image_available img12))
  (at 1028 (not (image_available img12)))
  (at 1081 (image_available img13))
  (at 1089 (not (image_available img13)))
  (at 838 (image_available img14))
  (at 846 (not (image_available img14)))
  (at 1113 (image_available img15))
  (at 1121 (not (image_available img15)))
  (at 1102 (image_available img16))
  (at 1110 (not (image_available img16)))
  (at 1095 (image_available img17))
  (at 1103 (not (image_available img17)))
  (at 985 (image_available img18))
  (at 993 (not (image_available img18)))
  (at 881 (image_available img19))
  (at 889 (not (image_available img19)))
  (at 921 (image_available img20))
  (at 929 (not (image_available img20)))
  (at 1124 (image_available img21))
  (at 1132 (not (image_available img21)))
  (at 907 (image_available img22))
  (at 915 (not (image_available img22)))
  (at 1088 (image_available img23))
  (at 1096 (not (image_available img23)))
  (at 998 (image_available img24))
  (at 1006 (not (image_available img24)))
  (at 895 (image_available img25))
  (at 903 (not (image_available img25)))
  (at 1531 (image_available img1))
  (at 1539 (not (image_available img1)))
  (at 1248 (image_available img2))
  (at 1256 (not (image_available img2)))
  (at 1256 (image_available img3))
  (at 1264 (not (image_available img3)))
  (at 1378 (image_available img4))
  (at 1386 (not (image_available img4)))
  (at 1400 (image_available img5))
  (at 1408 (not (image_available img5)))
  (at 1459 (image_available img6))
  (at 1467 (not (image_available img6)))
  (at 1456 (image_available img7))
  (at 1464 (not (image_available img7)))
  (at 1375 (image_available img8))
  (at 1383 (not (image_available img8)))
  (at 1297 (image_available img9))
  (at 1305 (not (image_available img9)))
  (at 1204 (image_available img10))
  (at 1212 (not (image_available img10)))
  (at 1516 (image_available img11))
  (at 1524 (not (image_available img11)))
  (at 1380 (image_available img12))
  (at 1388 (not (image_available img12)))
  (at 1441 (image_available img13))
  (at 1449 (not (image_available img13)))
  (at 1198 (image_available img14))
  (at 1206 (not (image_available img14)))
  (at 1473 (image_available img15))
  (at 1481 (not (image_available img15)))
  (at 1462 (image_available img16))
  (at 1470 (not (image_available img16)))
  (at 1455 (image_available img17))
  (at 1463 (not (image_available img17)))
  (at 1345 (image_available img18))
  (at 1353 (not (image_available img18)))
  (at 1241 (image_available img19))
  (at 1249 (not (image_available img19)))
  (at 1281 (image_available img20))
  (at 1289 (not (image_available img20)))
  (at 1484 (image_available img21))
  (at 1492 (not (image_available img21)))
  (at 1267 (image_available img22))
  (at 1275 (not (image_available img22)))
  (at 1448 (image_available img23))
  (at 1456 (not (image_available img23)))
  (at 1358 (image_available img24))
  (at 1366 (not (image_available img24)))
  (at 1255 (image_available img25))
  (at 1263 (not (image_available img25)))
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
  (<= (image_score img2) 1)

  (> (image_score img8) 0)
  (<= (image_score img8) 4)

  (> (image_score img10) 0)
  (<= (image_score img10) 4)

  (> (image_score img16) 0)
  (<= (image_score img16) 8)

  (> (image_score img19) 0)
  (<= (image_score img19) 2)

  (> (image_score img20) 0)
  (<= (image_score img20) 5)

  (> (image_score img21) 0)
  (<= (image_score img21) 6)

  (> (image_score img22) 0)
  (<= (image_score img22) 4)

  (> (image_score img23) 0)
  (<= (image_score img23) 2)

  (> (image_score img24) 0)
  (<= (image_score img24) 7)

  (> (image_score img25) 0)
  (<= (image_score img25) 4)

(>= (total_score) 10)
))
(:metric maximize (+
  (image_score img2)
    (+ (image_score img8)
      (+ (image_score img10)
        (+ (image_score img16)
          (+ (image_score img19)
            (+ (image_score img20)
              (+ (image_score img21)
                (+ (image_score img22)
                  (+ (image_score img23)
                    (+ (image_score img24)
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
