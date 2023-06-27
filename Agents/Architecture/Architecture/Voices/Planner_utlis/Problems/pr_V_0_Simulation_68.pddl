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



  (at 21 (image_available img1))
  (at 29 (not (image_available img1)))
  (at 60 (image_available img4))
  (at 68 (not (image_available img4)))
  (at 34 (image_available img15))
  (at 42 (not (image_available img15)))
  (at 37 (image_available img16))
  (at 45 (not (image_available img16)))
  (at 36 (image_available img18))
  (at 44 (not (image_available img18)))
  (at 47 (image_available img25))
  (at 55 (not (image_available img25)))
  (at 381 (image_available img1))
  (at 389 (not (image_available img1)))
  (at 301 (image_available img2))
  (at 309 (not (image_available img2)))
  (at 175 (image_available img3))
  (at 183 (not (image_available img3)))
  (at 420 (image_available img4))
  (at 428 (not (image_available img4)))
  (at 259 (image_available img5))
  (at 267 (not (image_available img5)))
  (at 345 (image_available img6))
  (at 353 (not (image_available img6)))
  (at 193 (image_available img7))
  (at 201 (not (image_available img7)))
  (at 133 (image_available img8))
  (at 141 (not (image_available img8)))
  (at 300 (image_available img9))
  (at 308 (not (image_available img9)))
  (at 316 (image_available img10))
  (at 324 (not (image_available img10)))
  (at 288 (image_available img11))
  (at 296 (not (image_available img11)))
  (at 349 (image_available img12))
  (at 357 (not (image_available img12)))
  (at 93 (image_available img13))
  (at 101 (not (image_available img13)))
  (at 282 (image_available img14))
  (at 290 (not (image_available img14)))
  (at 394 (image_available img15))
  (at 402 (not (image_available img15)))
  (at 397 (image_available img16))
  (at 405 (not (image_available img16)))
  (at 249 (image_available img17))
  (at 257 (not (image_available img17)))
  (at 396 (image_available img18))
  (at 404 (not (image_available img18)))
  (at 112 (image_available img19))
  (at 120 (not (image_available img19)))
  (at 236 (image_available img20))
  (at 244 (not (image_available img20)))
  (at 189 (image_available img21))
  (at 197 (not (image_available img21)))
  (at 329 (image_available img22))
  (at 337 (not (image_available img22)))
  (at 109 (image_available img23))
  (at 117 (not (image_available img23)))
  (at 321 (image_available img24))
  (at 329 (not (image_available img24)))
  (at 407 (image_available img25))
  (at 415 (not (image_available img25)))
  (at 741 (image_available img1))
  (at 749 (not (image_available img1)))
  (at 661 (image_available img2))
  (at 669 (not (image_available img2)))
  (at 535 (image_available img3))
  (at 543 (not (image_available img3)))
  (at 780 (image_available img4))
  (at 788 (not (image_available img4)))
  (at 619 (image_available img5))
  (at 627 (not (image_available img5)))
  (at 705 (image_available img6))
  (at 713 (not (image_available img6)))
  (at 553 (image_available img7))
  (at 561 (not (image_available img7)))
  (at 493 (image_available img8))
  (at 501 (not (image_available img8)))
  (at 660 (image_available img9))
  (at 668 (not (image_available img9)))
  (at 676 (image_available img10))
  (at 684 (not (image_available img10)))
  (at 648 (image_available img11))
  (at 656 (not (image_available img11)))
  (at 709 (image_available img12))
  (at 717 (not (image_available img12)))
  (at 453 (image_available img13))
  (at 461 (not (image_available img13)))
  (at 642 (image_available img14))
  (at 650 (not (image_available img14)))
  (at 754 (image_available img15))
  (at 762 (not (image_available img15)))
  (at 757 (image_available img16))
  (at 765 (not (image_available img16)))
  (at 609 (image_available img17))
  (at 617 (not (image_available img17)))
  (at 756 (image_available img18))
  (at 764 (not (image_available img18)))
  (at 472 (image_available img19))
  (at 480 (not (image_available img19)))
  (at 596 (image_available img20))
  (at 604 (not (image_available img20)))
  (at 549 (image_available img21))
  (at 557 (not (image_available img21)))
  (at 689 (image_available img22))
  (at 697 (not (image_available img22)))
  (at 469 (image_available img23))
  (at 477 (not (image_available img23)))
  (at 681 (image_available img24))
  (at 689 (not (image_available img24)))
  (at 767 (image_available img25))
  (at 775 (not (image_available img25)))
  (at 1101 (image_available img1))
  (at 1109 (not (image_available img1)))
  (at 1021 (image_available img2))
  (at 1029 (not (image_available img2)))
  (at 895 (image_available img3))
  (at 903 (not (image_available img3)))
  (at 1140 (image_available img4))
  (at 1148 (not (image_available img4)))
  (at 979 (image_available img5))
  (at 987 (not (image_available img5)))
  (at 1065 (image_available img6))
  (at 1073 (not (image_available img6)))
  (at 913 (image_available img7))
  (at 921 (not (image_available img7)))
  (at 853 (image_available img8))
  (at 861 (not (image_available img8)))
  (at 1020 (image_available img9))
  (at 1028 (not (image_available img9)))
  (at 1036 (image_available img10))
  (at 1044 (not (image_available img10)))
  (at 1008 (image_available img11))
  (at 1016 (not (image_available img11)))
  (at 1069 (image_available img12))
  (at 1077 (not (image_available img12)))
  (at 813 (image_available img13))
  (at 821 (not (image_available img13)))
  (at 1002 (image_available img14))
  (at 1010 (not (image_available img14)))
  (at 1114 (image_available img15))
  (at 1122 (not (image_available img15)))
  (at 1117 (image_available img16))
  (at 1125 (not (image_available img16)))
  (at 969 (image_available img17))
  (at 977 (not (image_available img17)))
  (at 1116 (image_available img18))
  (at 1124 (not (image_available img18)))
  (at 832 (image_available img19))
  (at 840 (not (image_available img19)))
  (at 956 (image_available img20))
  (at 964 (not (image_available img20)))
  (at 909 (image_available img21))
  (at 917 (not (image_available img21)))
  (at 1049 (image_available img22))
  (at 1057 (not (image_available img22)))
  (at 829 (image_available img23))
  (at 837 (not (image_available img23)))
  (at 1041 (image_available img24))
  (at 1049 (not (image_available img24)))
  (at 1127 (image_available img25))
  (at 1135 (not (image_available img25)))
  (at 1461 (image_available img1))
  (at 1469 (not (image_available img1)))
  (at 1381 (image_available img2))
  (at 1389 (not (image_available img2)))
  (at 1255 (image_available img3))
  (at 1263 (not (image_available img3)))
  (at 1500 (image_available img4))
  (at 1508 (not (image_available img4)))
  (at 1339 (image_available img5))
  (at 1347 (not (image_available img5)))
  (at 1425 (image_available img6))
  (at 1433 (not (image_available img6)))
  (at 1273 (image_available img7))
  (at 1281 (not (image_available img7)))
  (at 1213 (image_available img8))
  (at 1221 (not (image_available img8)))
  (at 1380 (image_available img9))
  (at 1388 (not (image_available img9)))
  (at 1396 (image_available img10))
  (at 1404 (not (image_available img10)))
  (at 1368 (image_available img11))
  (at 1376 (not (image_available img11)))
  (at 1429 (image_available img12))
  (at 1437 (not (image_available img12)))
  (at 1173 (image_available img13))
  (at 1181 (not (image_available img13)))
  (at 1362 (image_available img14))
  (at 1370 (not (image_available img14)))
  (at 1474 (image_available img15))
  (at 1482 (not (image_available img15)))
  (at 1477 (image_available img16))
  (at 1485 (not (image_available img16)))
  (at 1329 (image_available img17))
  (at 1337 (not (image_available img17)))
  (at 1476 (image_available img18))
  (at 1484 (not (image_available img18)))
  (at 1192 (image_available img19))
  (at 1200 (not (image_available img19)))
  (at 1316 (image_available img20))
  (at 1324 (not (image_available img20)))
  (at 1269 (image_available img21))
  (at 1277 (not (image_available img21)))
  (at 1409 (image_available img22))
  (at 1417 (not (image_available img22)))
  (at 1189 (image_available img23))
  (at 1197 (not (image_available img23)))
  (at 1401 (image_available img24))
  (at 1409 (not (image_available img24)))
  (at 1487 (image_available img25))
  (at 1495 (not (image_available img25)))
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

)
(:goal (and
  (> (image_score img8) 0)
  (<= (image_score img8) 16.0)

  (> (image_score img23) 0)
  (<= (image_score img23) 9.0)

(>= (total_score) 5)
))
(:metric maximize (+
  (image_score img8)
    (image_score img23)
  )
)
)