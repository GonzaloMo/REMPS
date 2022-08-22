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

  (memory_free mem9)

   (memory_taken mem0 img10)
   (memory_taken mem1 img24)
   (memory_taken mem2 img14)
   (memory_taken mem3 img15)
   (memory_taken mem4 img9)
   (memory_taken mem5 img20)
   (memory_taken mem6 img13)
   (memory_taken mem7 img2)
   (memory_taken mem8 img19)

(image_analysed mem0 img10)
(image_analysed mem1 img24)
(image_analysed mem2 img14)
(image_analysed mem3 img15)
(image_analysed mem4 img9)
(image_analysed mem5 img20)
(image_analysed mem6 img13)
(image_analysed mem7 img2)
(image_analysed mem8 img19)

  (at 73 (image_available img5))
  (at 81 (not (image_available img5)))
  (at 6 (image_available img6))
  (at 14 (not (image_available img6)))
  (at 14 (image_available img9))
  (at 22 (not (image_available img9)))
  (at 15 (image_available img10))
  (at 23 (not (image_available img10)))
  (at 83 (image_available img11))
  (at 91 (not (image_available img11)))
  (at 35 (image_available img13))
  (at 43 (not (image_available img13)))
  (at 3 (image_available img18))
  (at 11 (not (image_available img18)))
  (at 79 (image_available img20))
  (at 87 (not (image_available img20)))
  (at 67 (image_available img21))
  (at 75 (not (image_available img21)))
  (at 117 (image_available img1))
  (at 125 (not (image_available img1)))
  (at 155 (image_available img2))
  (at 163 (not (image_available img2)))
  (at 347 (image_available img3))
  (at 355 (not (image_available img3)))
  (at 182 (image_available img4))
  (at 190 (not (image_available img4)))
  (at 433 (image_available img5))
  (at 441 (not (image_available img5)))
  (at 366 (image_available img6))
  (at 374 (not (image_available img6)))
  (at 180 (image_available img7))
  (at 188 (not (image_available img7)))
  (at 126 (image_available img8))
  (at 134 (not (image_available img8)))
  (at 374 (image_available img9))
  (at 382 (not (image_available img9)))
  (at 375 (image_available img10))
  (at 383 (not (image_available img10)))
  (at 443 (image_available img11))
  (at 451 (not (image_available img11)))
  (at 171 (image_available img12))
  (at 179 (not (image_available img12)))
  (at 395 (image_available img13))
  (at 403 (not (image_available img13)))
  (at 307 (image_available img14))
  (at 315 (not (image_available img14)))
  (at 315 (image_available img15))
  (at 323 (not (image_available img15)))
  (at 317 (image_available img16))
  (at 325 (not (image_available img16)))
  (at 182 (image_available img17))
  (at 190 (not (image_available img17)))
  (at 363 (image_available img18))
  (at 371 (not (image_available img18)))
  (at 247 (image_available img19))
  (at 255 (not (image_available img19)))
  (at 439 (image_available img20))
  (at 447 (not (image_available img20)))
  (at 427 (image_available img21))
  (at 435 (not (image_available img21)))
  (at 117 (image_available img22))
  (at 125 (not (image_available img22)))
  (at 299 (image_available img23))
  (at 307 (not (image_available img23)))
  (at 248 (image_available img24))
  (at 256 (not (image_available img24)))
  (at 180 (image_available img25))
  (at 188 (not (image_available img25)))
  (at 477 (image_available img1))
  (at 485 (not (image_available img1)))
  (at 515 (image_available img2))
  (at 523 (not (image_available img2)))
  (at 707 (image_available img3))
  (at 715 (not (image_available img3)))
  (at 542 (image_available img4))
  (at 550 (not (image_available img4)))
  (at 793 (image_available img5))
  (at 801 (not (image_available img5)))
  (at 726 (image_available img6))
  (at 734 (not (image_available img6)))
  (at 540 (image_available img7))
  (at 548 (not (image_available img7)))
  (at 486 (image_available img8))
  (at 494 (not (image_available img8)))
  (at 734 (image_available img9))
  (at 742 (not (image_available img9)))
  (at 735 (image_available img10))
  (at 743 (not (image_available img10)))
  (at 803 (image_available img11))
  (at 811 (not (image_available img11)))
  (at 531 (image_available img12))
  (at 539 (not (image_available img12)))
  (at 755 (image_available img13))
  (at 763 (not (image_available img13)))
  (at 667 (image_available img14))
  (at 675 (not (image_available img14)))
  (at 675 (image_available img15))
  (at 683 (not (image_available img15)))
  (at 677 (image_available img16))
  (at 685 (not (image_available img16)))
  (at 542 (image_available img17))
  (at 550 (not (image_available img17)))
  (at 723 (image_available img18))
  (at 731 (not (image_available img18)))
  (at 607 (image_available img19))
  (at 615 (not (image_available img19)))
  (at 799 (image_available img20))
  (at 807 (not (image_available img20)))
  (at 787 (image_available img21))
  (at 795 (not (image_available img21)))
  (at 477 (image_available img22))
  (at 485 (not (image_available img22)))
  (at 659 (image_available img23))
  (at 667 (not (image_available img23)))
  (at 608 (image_available img24))
  (at 616 (not (image_available img24)))
  (at 540 (image_available img25))
  (at 548 (not (image_available img25)))
  (at 837 (image_available img1))
  (at 845 (not (image_available img1)))
  (at 875 (image_available img2))
  (at 883 (not (image_available img2)))
  (at 1067 (image_available img3))
  (at 1075 (not (image_available img3)))
  (at 902 (image_available img4))
  (at 910 (not (image_available img4)))
  (at 1153 (image_available img5))
  (at 1161 (not (image_available img5)))
  (at 1086 (image_available img6))
  (at 1094 (not (image_available img6)))
  (at 900 (image_available img7))
  (at 908 (not (image_available img7)))
  (at 846 (image_available img8))
  (at 854 (not (image_available img8)))
  (at 1094 (image_available img9))
  (at 1102 (not (image_available img9)))
  (at 1095 (image_available img10))
  (at 1103 (not (image_available img10)))
  (at 1163 (image_available img11))
  (at 1171 (not (image_available img11)))
  (at 891 (image_available img12))
  (at 899 (not (image_available img12)))
  (at 1115 (image_available img13))
  (at 1123 (not (image_available img13)))
  (at 1027 (image_available img14))
  (at 1035 (not (image_available img14)))
  (at 1035 (image_available img15))
  (at 1043 (not (image_available img15)))
  (at 1037 (image_available img16))
  (at 1045 (not (image_available img16)))
  (at 902 (image_available img17))
  (at 910 (not (image_available img17)))
  (at 1083 (image_available img18))
  (at 1091 (not (image_available img18)))
  (at 967 (image_available img19))
  (at 975 (not (image_available img19)))
  (at 1159 (image_available img20))
  (at 1167 (not (image_available img20)))
  (at 1147 (image_available img21))
  (at 1155 (not (image_available img21)))
  (at 837 (image_available img22))
  (at 845 (not (image_available img22)))
  (at 1019 (image_available img23))
  (at 1027 (not (image_available img23)))
  (at 968 (image_available img24))
  (at 976 (not (image_available img24)))
  (at 900 (image_available img25))
  (at 908 (not (image_available img25)))
  (at 1197 (image_available img1))
  (at 1205 (not (image_available img1)))
  (at 1235 (image_available img2))
  (at 1243 (not (image_available img2)))
  (at 1427 (image_available img3))
  (at 1435 (not (image_available img3)))
  (at 1262 (image_available img4))
  (at 1270 (not (image_available img4)))
  (at 1513 (image_available img5))
  (at 1521 (not (image_available img5)))
  (at 1446 (image_available img6))
  (at 1454 (not (image_available img6)))
  (at 1260 (image_available img7))
  (at 1268 (not (image_available img7)))
  (at 1206 (image_available img8))
  (at 1214 (not (image_available img8)))
  (at 1454 (image_available img9))
  (at 1462 (not (image_available img9)))
  (at 1455 (image_available img10))
  (at 1463 (not (image_available img10)))
  (at 1523 (image_available img11))
  (at 1531 (not (image_available img11)))
  (at 1251 (image_available img12))
  (at 1259 (not (image_available img12)))
  (at 1475 (image_available img13))
  (at 1483 (not (image_available img13)))
  (at 1387 (image_available img14))
  (at 1395 (not (image_available img14)))
  (at 1395 (image_available img15))
  (at 1403 (not (image_available img15)))
  (at 1397 (image_available img16))
  (at 1405 (not (image_available img16)))
  (at 1262 (image_available img17))
  (at 1270 (not (image_available img17)))
  (at 1443 (image_available img18))
  (at 1451 (not (image_available img18)))
  (at 1327 (image_available img19))
  (at 1335 (not (image_available img19)))
  (at 1519 (image_available img20))
  (at 1527 (not (image_available img20)))
  (at 1507 (image_available img21))
  (at 1515 (not (image_available img21)))
  (at 1197 (image_available img22))
  (at 1205 (not (image_available img22)))
  (at 1379 (image_available img23))
  (at 1387 (not (image_available img23)))
  (at 1328 (image_available img24))
  (at 1336 (not (image_available img24)))
  (at 1260 (image_available img25))
  (at 1268 (not (image_available img25)))
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

  (> (image_score img5) 0)
  (<= (image_score img5) 1)

  (> (image_score img12) 0)
  (<= (image_score img12) 5)

  (> (image_score img13) 0)
  (<= (image_score img13) 9)

  (> (image_score img14) 0)
  (<= (image_score img14) 7)

  (> (image_score img15) 0)
  (<= (image_score img15) 2)

  (> (image_score img17) 0)
  (<= (image_score img17) 2)

  (> (image_score img18) 0)
  (<= (image_score img18) 7)

  (> (image_score img21) 0)
  (<= (image_score img21) 1)

  (> (image_score img24) 0)
  (<= (image_score img24) 4)

(>= (total_score) 8)
))
(:metric maximize (+
  (image_score img2)
    (+ (image_score img5)
      (+ (image_score img12)
        (+ (image_score img13)
          (+ (image_score img14)
            (+ (image_score img15)
              (+ (image_score img17)
                (+ (image_score img18)
                  (+ (image_score img21)
                    (image_score img24)
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
