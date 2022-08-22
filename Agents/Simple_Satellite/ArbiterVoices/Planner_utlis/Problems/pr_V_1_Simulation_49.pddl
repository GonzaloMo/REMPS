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

  (memory_free mem2)
  (memory_free mem3)
  (memory_free mem4)
  (memory_free mem5)
  (memory_free mem6)
  (memory_free mem7)
  (memory_free mem8)
  (memory_free mem9)

   (memory_taken mem0 img19)
   (memory_taken mem1 img3)

(image_analysed mem0 img19)
(image_analysed mem1 img3)

  (at 163 (image_available img1))
  (at 171 (not (image_available img1)))
  (at 12 (image_available img2))
  (at 20 (not (image_available img2)))
  (at 260 (image_available img3))
  (at 268 (not (image_available img3)))
  (at 11 (image_available img4))
  (at 19 (not (image_available img4)))
  (at 51 (image_available img5))
  (at 59 (not (image_available img5)))
  (at 201 (image_available img8))
  (at 209 (not (image_available img8)))
  (at 83 (image_available img9))
  (at 91 (not (image_available img9)))
  (at 0 (image_available img12))
  (at 3 (not (image_available img12)))
  (at 127 (image_available img15))
  (at 135 (not (image_available img15)))
  (at 32 (image_available img16))
  (at 40 (not (image_available img16)))
  (at 60 (image_available img18))
  (at 68 (not (image_available img18)))
  (at 196 (image_available img19))
  (at 204 (not (image_available img19)))
  (at 92 (image_available img20))
  (at 100 (not (image_available img20)))
  (at 523 (image_available img1))
  (at 531 (not (image_available img1)))
  (at 372 (image_available img2))
  (at 380 (not (image_available img2)))
  (at 620 (image_available img3))
  (at 628 (not (image_available img3)))
  (at 371 (image_available img4))
  (at 379 (not (image_available img4)))
  (at 411 (image_available img5))
  (at 419 (not (image_available img5)))
  (at 321 (image_available img6))
  (at 329 (not (image_available img6)))
  (at 323 (image_available img7))
  (at 331 (not (image_available img7)))
  (at 561 (image_available img8))
  (at 569 (not (image_available img8)))
  (at 443 (image_available img9))
  (at 451 (not (image_available img9)))
  (at 351 (image_available img10))
  (at 359 (not (image_available img10)))
  (at 279 (image_available img11))
  (at 287 (not (image_available img11)))
  (at 355 (image_available img12))
  (at 363 (not (image_available img12)))
  (at 287 (image_available img13))
  (at 295 (not (image_available img13)))
  (at 292 (image_available img14))
  (at 300 (not (image_available img14)))
  (at 487 (image_available img15))
  (at 495 (not (image_available img15)))
  (at 392 (image_available img16))
  (at 400 (not (image_available img16)))
  (at 347 (image_available img17))
  (at 355 (not (image_available img17)))
  (at 420 (image_available img18))
  (at 428 (not (image_available img18)))
  (at 556 (image_available img19))
  (at 564 (not (image_available img19)))
  (at 452 (image_available img20))
  (at 460 (not (image_available img20)))
  (at 883 (image_available img1))
  (at 891 (not (image_available img1)))
  (at 732 (image_available img2))
  (at 740 (not (image_available img2)))
  (at 980 (image_available img3))
  (at 988 (not (image_available img3)))
  (at 731 (image_available img4))
  (at 739 (not (image_available img4)))
  (at 771 (image_available img5))
  (at 779 (not (image_available img5)))
  (at 681 (image_available img6))
  (at 689 (not (image_available img6)))
  (at 683 (image_available img7))
  (at 691 (not (image_available img7)))
  (at 921 (image_available img8))
  (at 929 (not (image_available img8)))
  (at 803 (image_available img9))
  (at 811 (not (image_available img9)))
  (at 711 (image_available img10))
  (at 719 (not (image_available img10)))
  (at 639 (image_available img11))
  (at 647 (not (image_available img11)))
  (at 715 (image_available img12))
  (at 723 (not (image_available img12)))
  (at 647 (image_available img13))
  (at 655 (not (image_available img13)))
  (at 652 (image_available img14))
  (at 660 (not (image_available img14)))
  (at 847 (image_available img15))
  (at 855 (not (image_available img15)))
  (at 752 (image_available img16))
  (at 760 (not (image_available img16)))
  (at 707 (image_available img17))
  (at 715 (not (image_available img17)))
  (at 780 (image_available img18))
  (at 788 (not (image_available img18)))
  (at 916 (image_available img19))
  (at 924 (not (image_available img19)))
  (at 812 (image_available img20))
  (at 820 (not (image_available img20)))
  (at 1243 (image_available img1))
  (at 1251 (not (image_available img1)))
  (at 1092 (image_available img2))
  (at 1100 (not (image_available img2)))
  (at 1340 (image_available img3))
  (at 1348 (not (image_available img3)))
  (at 1091 (image_available img4))
  (at 1099 (not (image_available img4)))
  (at 1131 (image_available img5))
  (at 1139 (not (image_available img5)))
  (at 1041 (image_available img6))
  (at 1049 (not (image_available img6)))
  (at 1043 (image_available img7))
  (at 1051 (not (image_available img7)))
  (at 1281 (image_available img8))
  (at 1289 (not (image_available img8)))
  (at 1163 (image_available img9))
  (at 1171 (not (image_available img9)))
  (at 1071 (image_available img10))
  (at 1079 (not (image_available img10)))
  (at 999 (image_available img11))
  (at 1007 (not (image_available img11)))
  (at 1075 (image_available img12))
  (at 1083 (not (image_available img12)))
  (at 1007 (image_available img13))
  (at 1015 (not (image_available img13)))
  (at 1012 (image_available img14))
  (at 1020 (not (image_available img14)))
  (at 1207 (image_available img15))
  (at 1215 (not (image_available img15)))
  (at 1112 (image_available img16))
  (at 1120 (not (image_available img16)))
  (at 1067 (image_available img17))
  (at 1075 (not (image_available img17)))
  (at 1140 (image_available img18))
  (at 1148 (not (image_available img18)))
  (at 1276 (image_available img19))
  (at 1284 (not (image_available img19)))
  (at 1172 (image_available img20))
  (at 1180 (not (image_available img20)))
  (at 1603 (image_available img1))
  (at 1611 (not (image_available img1)))
  (at 1452 (image_available img2))
  (at 1460 (not (image_available img2)))
  (at 1700 (image_available img3))
  (at 1708 (not (image_available img3)))
  (at 1451 (image_available img4))
  (at 1459 (not (image_available img4)))
  (at 1491 (image_available img5))
  (at 1499 (not (image_available img5)))
  (at 1401 (image_available img6))
  (at 1409 (not (image_available img6)))
  (at 1403 (image_available img7))
  (at 1411 (not (image_available img7)))
  (at 1641 (image_available img8))
  (at 1649 (not (image_available img8)))
  (at 1523 (image_available img9))
  (at 1531 (not (image_available img9)))
  (at 1431 (image_available img10))
  (at 1439 (not (image_available img10)))
  (at 1359 (image_available img11))
  (at 1367 (not (image_available img11)))
  (at 1435 (image_available img12))
  (at 1443 (not (image_available img12)))
  (at 1367 (image_available img13))
  (at 1375 (not (image_available img13)))
  (at 1372 (image_available img14))
  (at 1380 (not (image_available img14)))
  (at 1567 (image_available img15))
  (at 1575 (not (image_available img15)))
  (at 1472 (image_available img16))
  (at 1480 (not (image_available img16)))
  (at 1427 (image_available img17))
  (at 1435 (not (image_available img17)))
  (at 1500 (image_available img18))
  (at 1508 (not (image_available img18)))
  (at 1636 (image_available img19))
  (at 1644 (not (image_available img19)))
  (at 1532 (image_available img20))
  (at 1540 (not (image_available img20)))
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
  (at 1606.0 (dump_available))
  (at 1644.0 (not (dump_available)))

)
(:goal (and
  (> (image_score img3) 0)
  (<= (image_score img3) 1)

(>= (total_score) 1)
))
(:metric maximize 
  (image_score img3)
)
)
