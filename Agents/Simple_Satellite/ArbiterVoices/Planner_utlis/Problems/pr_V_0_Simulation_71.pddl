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

  (memory_free mem1)
  (memory_free mem2)
  (memory_free mem8)
  (memory_free mem9)

   (memory_taken mem0 img11)
   (memory_taken mem3 img16)
   (memory_taken mem4 img7)
   (memory_taken mem5 img2)
   (memory_taken mem6 img21)
   (memory_taken mem7 img8)

(image_analysed mem3 img16)
(image_analysed mem4 img7)
(image_analysed mem5 img2)
(image_analysed mem6 img21)
(image_analysed mem7 img8)

  (at 243 (image_available img1))
  (at 251 (not (image_available img1)))
  (at 85 (image_available img3))
  (at 93 (not (image_available img3)))
  (at 164 (image_available img4))
  (at 172 (not (image_available img4)))
  (at 49 (image_available img5))
  (at 57 (not (image_available img5)))
  (at 90 (image_available img7))
  (at 98 (not (image_available img7)))
  (at 35 (image_available img10))
  (at 43 (not (image_available img10)))
  (at 204 (image_available img11))
  (at 212 (not (image_available img11)))
  (at 101 (image_available img12))
  (at 109 (not (image_available img12)))
  (at 214 (image_available img13))
  (at 222 (not (image_available img13)))
  (at 217 (image_available img14))
  (at 225 (not (image_available img14)))
  (at 105 (image_available img15))
  (at 113 (not (image_available img15)))
  (at 160 (image_available img17))
  (at 168 (not (image_available img17)))
  (at 231 (image_available img18))
  (at 239 (not (image_available img18)))
  (at 152 (image_available img20))
  (at 160 (not (image_available img20)))
  (at 244 (image_available img21))
  (at 252 (not (image_available img21)))
  (at 118 (image_available img22))
  (at 126 (not (image_available img22)))
  (at 169 (image_available img25))
  (at 177 (not (image_available img25)))
  (at 603 (image_available img1))
  (at 611 (not (image_available img1)))
  (at 294 (image_available img2))
  (at 302 (not (image_available img2)))
  (at 445 (image_available img3))
  (at 453 (not (image_available img3)))
  (at 524 (image_available img4))
  (at 532 (not (image_available img4)))
  (at 409 (image_available img5))
  (at 417 (not (image_available img5)))
  (at 335 (image_available img6))
  (at 343 (not (image_available img6)))
  (at 450 (image_available img7))
  (at 458 (not (image_available img7)))
  (at 337 (image_available img8))
  (at 345 (not (image_available img8)))
  (at 295 (image_available img9))
  (at 303 (not (image_available img9)))
  (at 395 (image_available img10))
  (at 403 (not (image_available img10)))
  (at 564 (image_available img11))
  (at 572 (not (image_available img11)))
  (at 461 (image_available img12))
  (at 469 (not (image_available img12)))
  (at 574 (image_available img13))
  (at 582 (not (image_available img13)))
  (at 577 (image_available img14))
  (at 585 (not (image_available img14)))
  (at 465 (image_available img15))
  (at 473 (not (image_available img15)))
  (at 275 (image_available img16))
  (at 283 (not (image_available img16)))
  (at 520 (image_available img17))
  (at 528 (not (image_available img17)))
  (at 591 (image_available img18))
  (at 599 (not (image_available img18)))
  (at 262 (image_available img19))
  (at 270 (not (image_available img19)))
  (at 512 (image_available img20))
  (at 520 (not (image_available img20)))
  (at 604 (image_available img21))
  (at 612 (not (image_available img21)))
  (at 478 (image_available img22))
  (at 486 (not (image_available img22)))
  (at 342 (image_available img23))
  (at 350 (not (image_available img23)))
  (at 305 (image_available img24))
  (at 313 (not (image_available img24)))
  (at 529 (image_available img25))
  (at 537 (not (image_available img25)))
  (at 963 (image_available img1))
  (at 971 (not (image_available img1)))
  (at 654 (image_available img2))
  (at 662 (not (image_available img2)))
  (at 805 (image_available img3))
  (at 813 (not (image_available img3)))
  (at 884 (image_available img4))
  (at 892 (not (image_available img4)))
  (at 769 (image_available img5))
  (at 777 (not (image_available img5)))
  (at 695 (image_available img6))
  (at 703 (not (image_available img6)))
  (at 810 (image_available img7))
  (at 818 (not (image_available img7)))
  (at 697 (image_available img8))
  (at 705 (not (image_available img8)))
  (at 655 (image_available img9))
  (at 663 (not (image_available img9)))
  (at 755 (image_available img10))
  (at 763 (not (image_available img10)))
  (at 924 (image_available img11))
  (at 932 (not (image_available img11)))
  (at 821 (image_available img12))
  (at 829 (not (image_available img12)))
  (at 934 (image_available img13))
  (at 942 (not (image_available img13)))
  (at 937 (image_available img14))
  (at 945 (not (image_available img14)))
  (at 825 (image_available img15))
  (at 833 (not (image_available img15)))
  (at 635 (image_available img16))
  (at 643 (not (image_available img16)))
  (at 880 (image_available img17))
  (at 888 (not (image_available img17)))
  (at 951 (image_available img18))
  (at 959 (not (image_available img18)))
  (at 622 (image_available img19))
  (at 630 (not (image_available img19)))
  (at 872 (image_available img20))
  (at 880 (not (image_available img20)))
  (at 964 (image_available img21))
  (at 972 (not (image_available img21)))
  (at 838 (image_available img22))
  (at 846 (not (image_available img22)))
  (at 702 (image_available img23))
  (at 710 (not (image_available img23)))
  (at 665 (image_available img24))
  (at 673 (not (image_available img24)))
  (at 889 (image_available img25))
  (at 897 (not (image_available img25)))
  (at 1323 (image_available img1))
  (at 1331 (not (image_available img1)))
  (at 1014 (image_available img2))
  (at 1022 (not (image_available img2)))
  (at 1165 (image_available img3))
  (at 1173 (not (image_available img3)))
  (at 1244 (image_available img4))
  (at 1252 (not (image_available img4)))
  (at 1129 (image_available img5))
  (at 1137 (not (image_available img5)))
  (at 1055 (image_available img6))
  (at 1063 (not (image_available img6)))
  (at 1170 (image_available img7))
  (at 1178 (not (image_available img7)))
  (at 1057 (image_available img8))
  (at 1065 (not (image_available img8)))
  (at 1015 (image_available img9))
  (at 1023 (not (image_available img9)))
  (at 1115 (image_available img10))
  (at 1123 (not (image_available img10)))
  (at 1284 (image_available img11))
  (at 1292 (not (image_available img11)))
  (at 1181 (image_available img12))
  (at 1189 (not (image_available img12)))
  (at 1294 (image_available img13))
  (at 1302 (not (image_available img13)))
  (at 1297 (image_available img14))
  (at 1305 (not (image_available img14)))
  (at 1185 (image_available img15))
  (at 1193 (not (image_available img15)))
  (at 995 (image_available img16))
  (at 1003 (not (image_available img16)))
  (at 1240 (image_available img17))
  (at 1248 (not (image_available img17)))
  (at 1311 (image_available img18))
  (at 1319 (not (image_available img18)))
  (at 982 (image_available img19))
  (at 990 (not (image_available img19)))
  (at 1232 (image_available img20))
  (at 1240 (not (image_available img20)))
  (at 1324 (image_available img21))
  (at 1332 (not (image_available img21)))
  (at 1198 (image_available img22))
  (at 1206 (not (image_available img22)))
  (at 1062 (image_available img23))
  (at 1070 (not (image_available img23)))
  (at 1025 (image_available img24))
  (at 1033 (not (image_available img24)))
  (at 1249 (image_available img25))
  (at 1257 (not (image_available img25)))
  (at 1683 (image_available img1))
  (at 1691 (not (image_available img1)))
  (at 1374 (image_available img2))
  (at 1382 (not (image_available img2)))
  (at 1525 (image_available img3))
  (at 1533 (not (image_available img3)))
  (at 1604 (image_available img4))
  (at 1612 (not (image_available img4)))
  (at 1489 (image_available img5))
  (at 1497 (not (image_available img5)))
  (at 1415 (image_available img6))
  (at 1423 (not (image_available img6)))
  (at 1530 (image_available img7))
  (at 1538 (not (image_available img7)))
  (at 1417 (image_available img8))
  (at 1425 (not (image_available img8)))
  (at 1375 (image_available img9))
  (at 1383 (not (image_available img9)))
  (at 1475 (image_available img10))
  (at 1483 (not (image_available img10)))
  (at 1644 (image_available img11))
  (at 1652 (not (image_available img11)))
  (at 1541 (image_available img12))
  (at 1549 (not (image_available img12)))
  (at 1654 (image_available img13))
  (at 1662 (not (image_available img13)))
  (at 1657 (image_available img14))
  (at 1665 (not (image_available img14)))
  (at 1545 (image_available img15))
  (at 1553 (not (image_available img15)))
  (at 1355 (image_available img16))
  (at 1363 (not (image_available img16)))
  (at 1600 (image_available img17))
  (at 1608 (not (image_available img17)))
  (at 1671 (image_available img18))
  (at 1679 (not (image_available img18)))
  (at 1342 (image_available img19))
  (at 1350 (not (image_available img19)))
  (at 1592 (image_available img20))
  (at 1600 (not (image_available img20)))
  (at 1684 (image_available img21))
  (at 1692 (not (image_available img21)))
  (at 1558 (image_available img22))
  (at 1566 (not (image_available img22)))
  (at 1422 (image_available img23))
  (at 1430 (not (image_available img23)))
  (at 1385 (image_available img24))
  (at 1393 (not (image_available img24)))
  (at 1609 (image_available img25))
  (at 1617 (not (image_available img25)))
  (at 1 (dump_available))
  (at 8.0 (not (dump_available)))
  (at 150.0 (dump_available))
  (at 188.0 (not (dump_available)))
  (at 330.0 (dump_available))
  (at 368.0 (not (dump_available)))
  (at 510.0 (dump_available))
  (at 548.0 (not (dump_available)))
  (at 690.0 (dump_available))
  (at 728.0 (not (dump_available)))
  (at 870.0 (dump_available))
  (at 908.0 (not (dump_available)))
  (at 1050.0 (dump_available))
  (at 1088.0 (not (dump_available)))
  (at 1230.0 (dump_available))
  (at 1268.0 (not (dump_available)))
  (at 1410.0 (dump_available))
  (at 1448.0 (not (dump_available)))
  (at 1590.0 (dump_available))
  (at 1628.0 (not (dump_available)))

)
(:goal (and
  (> (image_score img1) 0)
  (<= (image_score img1) 2.0)

  (> (image_score img4) 0)
  (<= (image_score img4) 12.0)

  (> (image_score img14) 0)
  (<= (image_score img14) 10.0)

  (> (image_score img17) 0)
  (<= (image_score img17) 3.0)

  (> (image_score img21) 0)
  (<= (image_score img21) 13.0)

  (> (image_score img24) 0)
  (<= (image_score img24) 5.0)

(>= (total_score) 9)
))
(:metric maximize (+
  (image_score img1)
    (+ (image_score img4)
      (+ (image_score img14)
        (+ (image_score img17)
          (+ (image_score img21)
            (image_score img24)
          )
        )
      )
    )
  )
)
)
