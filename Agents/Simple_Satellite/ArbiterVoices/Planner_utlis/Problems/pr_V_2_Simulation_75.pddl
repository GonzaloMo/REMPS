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

  (memory_free mem6)
  (memory_free mem7)
  (memory_free mem8)
  (memory_free mem9)

   (memory_taken mem0 img23)
   (memory_taken mem1 img22)
   (memory_taken mem2 img17)
   (memory_taken mem3 img2)
   (memory_taken mem4 img9)
   (memory_taken mem5 img14)

(image_analysed mem0 img23)
(image_analysed mem1 img22)
(image_analysed mem2 img17)
(image_analysed mem3 img2)
(image_analysed mem5 img14)

  (at 231 (image_available img1))
  (at 239 (not (image_available img1)))
  (at 166 (image_available img2))
  (at 174 (not (image_available img2)))
  (at 110 (image_available img3))
  (at 118 (not (image_available img3)))
  (at 183 (image_available img4))
  (at 191 (not (image_available img4)))
  (at 108 (image_available img5))
  (at 116 (not (image_available img5)))
  (at 259 (image_available img6))
  (at 267 (not (image_available img6)))
  (at 75 (image_available img7))
  (at 83 (not (image_available img7)))
  (at 166 (image_available img9))
  (at 174 (not (image_available img9)))
  (at 47 (image_available img10))
  (at 55 (not (image_available img10)))
  (at 171 (image_available img11))
  (at 179 (not (image_available img11)))
  (at 1 (image_available img16))
  (at 9 (not (image_available img16)))
  (at 251 (image_available img17))
  (at 259 (not (image_available img17)))
  (at 93 (image_available img18))
  (at 101 (not (image_available img18)))
  (at 0 (image_available img20))
  (at 2 (not (image_available img20)))
  (at 212 (image_available img21))
  (at 220 (not (image_available img21)))
  (at 150 (image_available img22))
  (at 158 (not (image_available img22)))
  (at 203 (image_available img23))
  (at 211 (not (image_available img23)))
  (at 44 (image_available img24))
  (at 52 (not (image_available img24)))
  (at 591 (image_available img1))
  (at 599 (not (image_available img1)))
  (at 526 (image_available img2))
  (at 534 (not (image_available img2)))
  (at 470 (image_available img3))
  (at 478 (not (image_available img3)))
  (at 543 (image_available img4))
  (at 551 (not (image_available img4)))
  (at 468 (image_available img5))
  (at 476 (not (image_available img5)))
  (at 619 (image_available img6))
  (at 627 (not (image_available img6)))
  (at 435 (image_available img7))
  (at 443 (not (image_available img7)))
  (at 308 (image_available img8))
  (at 316 (not (image_available img8)))
  (at 526 (image_available img9))
  (at 534 (not (image_available img9)))
  (at 407 (image_available img10))
  (at 415 (not (image_available img10)))
  (at 531 (image_available img11))
  (at 539 (not (image_available img11)))
  (at 342 (image_available img12))
  (at 350 (not (image_available img12)))
  (at 290 (image_available img13))
  (at 298 (not (image_available img13)))
  (at 311 (image_available img14))
  (at 319 (not (image_available img14)))
  (at 331 (image_available img15))
  (at 339 (not (image_available img15)))
  (at 361 (image_available img16))
  (at 369 (not (image_available img16)))
  (at 611 (image_available img17))
  (at 619 (not (image_available img17)))
  (at 453 (image_available img18))
  (at 461 (not (image_available img18)))
  (at 343 (image_available img19))
  (at 351 (not (image_available img19)))
  (at 354 (image_available img20))
  (at 362 (not (image_available img20)))
  (at 572 (image_available img21))
  (at 580 (not (image_available img21)))
  (at 510 (image_available img22))
  (at 518 (not (image_available img22)))
  (at 563 (image_available img23))
  (at 571 (not (image_available img23)))
  (at 404 (image_available img24))
  (at 412 (not (image_available img24)))
  (at 315 (image_available img25))
  (at 323 (not (image_available img25)))
  (at 951 (image_available img1))
  (at 959 (not (image_available img1)))
  (at 886 (image_available img2))
  (at 894 (not (image_available img2)))
  (at 830 (image_available img3))
  (at 838 (not (image_available img3)))
  (at 903 (image_available img4))
  (at 911 (not (image_available img4)))
  (at 828 (image_available img5))
  (at 836 (not (image_available img5)))
  (at 979 (image_available img6))
  (at 987 (not (image_available img6)))
  (at 795 (image_available img7))
  (at 803 (not (image_available img7)))
  (at 668 (image_available img8))
  (at 676 (not (image_available img8)))
  (at 886 (image_available img9))
  (at 894 (not (image_available img9)))
  (at 767 (image_available img10))
  (at 775 (not (image_available img10)))
  (at 891 (image_available img11))
  (at 899 (not (image_available img11)))
  (at 702 (image_available img12))
  (at 710 (not (image_available img12)))
  (at 650 (image_available img13))
  (at 658 (not (image_available img13)))
  (at 671 (image_available img14))
  (at 679 (not (image_available img14)))
  (at 691 (image_available img15))
  (at 699 (not (image_available img15)))
  (at 721 (image_available img16))
  (at 729 (not (image_available img16)))
  (at 971 (image_available img17))
  (at 979 (not (image_available img17)))
  (at 813 (image_available img18))
  (at 821 (not (image_available img18)))
  (at 703 (image_available img19))
  (at 711 (not (image_available img19)))
  (at 714 (image_available img20))
  (at 722 (not (image_available img20)))
  (at 932 (image_available img21))
  (at 940 (not (image_available img21)))
  (at 870 (image_available img22))
  (at 878 (not (image_available img22)))
  (at 923 (image_available img23))
  (at 931 (not (image_available img23)))
  (at 764 (image_available img24))
  (at 772 (not (image_available img24)))
  (at 675 (image_available img25))
  (at 683 (not (image_available img25)))
  (at 1311 (image_available img1))
  (at 1319 (not (image_available img1)))
  (at 1246 (image_available img2))
  (at 1254 (not (image_available img2)))
  (at 1190 (image_available img3))
  (at 1198 (not (image_available img3)))
  (at 1263 (image_available img4))
  (at 1271 (not (image_available img4)))
  (at 1188 (image_available img5))
  (at 1196 (not (image_available img5)))
  (at 1339 (image_available img6))
  (at 1347 (not (image_available img6)))
  (at 1155 (image_available img7))
  (at 1163 (not (image_available img7)))
  (at 1028 (image_available img8))
  (at 1036 (not (image_available img8)))
  (at 1246 (image_available img9))
  (at 1254 (not (image_available img9)))
  (at 1127 (image_available img10))
  (at 1135 (not (image_available img10)))
  (at 1251 (image_available img11))
  (at 1259 (not (image_available img11)))
  (at 1062 (image_available img12))
  (at 1070 (not (image_available img12)))
  (at 1010 (image_available img13))
  (at 1018 (not (image_available img13)))
  (at 1031 (image_available img14))
  (at 1039 (not (image_available img14)))
  (at 1051 (image_available img15))
  (at 1059 (not (image_available img15)))
  (at 1081 (image_available img16))
  (at 1089 (not (image_available img16)))
  (at 1331 (image_available img17))
  (at 1339 (not (image_available img17)))
  (at 1173 (image_available img18))
  (at 1181 (not (image_available img18)))
  (at 1063 (image_available img19))
  (at 1071 (not (image_available img19)))
  (at 1074 (image_available img20))
  (at 1082 (not (image_available img20)))
  (at 1292 (image_available img21))
  (at 1300 (not (image_available img21)))
  (at 1230 (image_available img22))
  (at 1238 (not (image_available img22)))
  (at 1283 (image_available img23))
  (at 1291 (not (image_available img23)))
  (at 1124 (image_available img24))
  (at 1132 (not (image_available img24)))
  (at 1035 (image_available img25))
  (at 1043 (not (image_available img25)))
  (at 1671 (image_available img1))
  (at 1679 (not (image_available img1)))
  (at 1606 (image_available img2))
  (at 1614 (not (image_available img2)))
  (at 1550 (image_available img3))
  (at 1558 (not (image_available img3)))
  (at 1623 (image_available img4))
  (at 1631 (not (image_available img4)))
  (at 1548 (image_available img5))
  (at 1556 (not (image_available img5)))
  (at 1699 (image_available img6))
  (at 1707 (not (image_available img6)))
  (at 1515 (image_available img7))
  (at 1523 (not (image_available img7)))
  (at 1388 (image_available img8))
  (at 1396 (not (image_available img8)))
  (at 1606 (image_available img9))
  (at 1614 (not (image_available img9)))
  (at 1487 (image_available img10))
  (at 1495 (not (image_available img10)))
  (at 1611 (image_available img11))
  (at 1619 (not (image_available img11)))
  (at 1422 (image_available img12))
  (at 1430 (not (image_available img12)))
  (at 1370 (image_available img13))
  (at 1378 (not (image_available img13)))
  (at 1391 (image_available img14))
  (at 1399 (not (image_available img14)))
  (at 1411 (image_available img15))
  (at 1419 (not (image_available img15)))
  (at 1441 (image_available img16))
  (at 1449 (not (image_available img16)))
  (at 1691 (image_available img17))
  (at 1699 (not (image_available img17)))
  (at 1533 (image_available img18))
  (at 1541 (not (image_available img18)))
  (at 1423 (image_available img19))
  (at 1431 (not (image_available img19)))
  (at 1434 (image_available img20))
  (at 1442 (not (image_available img20)))
  (at 1652 (image_available img21))
  (at 1660 (not (image_available img21)))
  (at 1590 (image_available img22))
  (at 1598 (not (image_available img22)))
  (at 1643 (image_available img23))
  (at 1651 (not (image_available img23)))
  (at 1484 (image_available img24))
  (at 1492 (not (image_available img24)))
  (at 1395 (image_available img25))
  (at 1403 (not (image_available img25)))
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
  (at 1618.0 (dump_available))
  (at 1656.0 (not (dump_available)))

)
(:goal (and
  (> (image_score img2) 0)
  (<= (image_score img2) 7.0)

  (> (image_score img8) 0)
  (<= (image_score img8) 2.0)

  (> (image_score img10) 0)
  (<= (image_score img10) 7.0)

  (> (image_score img17) 0)
  (<= (image_score img17) 5.0)

  (> (image_score img18) 0)
  (<= (image_score img18) 4.0)

  (> (image_score img20) 0)
  (<= (image_score img20) 4.0)

  (> (image_score img21) 0)
  (<= (image_score img21) 3.0)

  (> (image_score img25) 0)
  (<= (image_score img25) 3.0)

(>= (total_score) 7)
))
(:metric maximize (+
  (image_score img2)
    (+ (image_score img8)
      (+ (image_score img10)
        (+ (image_score img17)
          (+ (image_score img18)
            (+ (image_score img20)
              (+ (image_score img21)
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
