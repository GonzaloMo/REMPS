(define(problem satprob)
(:domain SimpleSatellite)
(:objects
  mem0 mem1 mem2 mem3 mem4 mem5 mem6 mem7 mem8 mem9 - memory
 img1 img2 img3 img4 img5 img6 img7 img8 img9 img10 img11 img12 img13 img14 img15 - image
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
  (= (total_score) 0)

  (memory_free mem5)
  (memory_free mem6)
  (memory_free mem7)
  (memory_free mem8)
  (memory_free mem9)

   (memory_taken mem0 img10)
   (memory_taken mem1 img8)
   (memory_taken mem2 img11)
   (memory_taken mem3 img4)
   (memory_taken mem4 img9)

(image_analysed mem0 img10)
(image_analysed mem1 img8)
(image_analysed mem2 img11)
(image_analysed mem3 img4)

  (at 19 (image_available img3))
  (at 27 (not (image_available img3)))
  (at 62 (image_available img7))
  (at 70 (not (image_available img7)))
  (at 0 (image_available img9))
  (at 5 (not (image_available img9)))
  (at 46 (image_available img10))
  (at 54 (not (image_available img10)))
  (at 14 (image_available img14))
  (at 22 (not (image_available img14)))
  (at 64 (image_available img15))
  (at 72 (not (image_available img15)))
  (at 161 (image_available img1))
  (at 169 (not (image_available img1)))
  (at 227 (image_available img2))
  (at 235 (not (image_available img2)))
  (at 379 (image_available img3))
  (at 387 (not (image_available img3)))
  (at 316 (image_available img4))
  (at 324 (not (image_available img4)))
  (at 259 (image_available img5))
  (at 267 (not (image_available img5)))
  (at 169 (image_available img6))
  (at 177 (not (image_available img6)))
  (at 422 (image_available img7))
  (at 430 (not (image_available img7)))
  (at 266 (image_available img8))
  (at 274 (not (image_available img8)))
  (at 357 (image_available img9))
  (at 365 (not (image_available img9)))
  (at 406 (image_available img10))
  (at 414 (not (image_available img10)))
  (at 307 (image_available img11))
  (at 315 (not (image_available img11)))
  (at 201 (image_available img12))
  (at 209 (not (image_available img12)))
  (at 238 (image_available img13))
  (at 246 (not (image_available img13)))
  (at 374 (image_available img14))
  (at 382 (not (image_available img14)))
  (at 424 (image_available img15))
  (at 432 (not (image_available img15)))
  (at 521 (image_available img1))
  (at 529 (not (image_available img1)))
  (at 587 (image_available img2))
  (at 595 (not (image_available img2)))
  (at 739 (image_available img3))
  (at 747 (not (image_available img3)))
  (at 676 (image_available img4))
  (at 684 (not (image_available img4)))
  (at 619 (image_available img5))
  (at 627 (not (image_available img5)))
  (at 529 (image_available img6))
  (at 537 (not (image_available img6)))
  (at 782 (image_available img7))
  (at 790 (not (image_available img7)))
  (at 626 (image_available img8))
  (at 634 (not (image_available img8)))
  (at 717 (image_available img9))
  (at 725 (not (image_available img9)))
  (at 766 (image_available img10))
  (at 774 (not (image_available img10)))
  (at 667 (image_available img11))
  (at 675 (not (image_available img11)))
  (at 561 (image_available img12))
  (at 569 (not (image_available img12)))
  (at 598 (image_available img13))
  (at 606 (not (image_available img13)))
  (at 734 (image_available img14))
  (at 742 (not (image_available img14)))
  (at 784 (image_available img15))
  (at 792 (not (image_available img15)))
  (at 881 (image_available img1))
  (at 889 (not (image_available img1)))
  (at 947 (image_available img2))
  (at 955 (not (image_available img2)))
  (at 1099 (image_available img3))
  (at 1107 (not (image_available img3)))
  (at 1036 (image_available img4))
  (at 1044 (not (image_available img4)))
  (at 979 (image_available img5))
  (at 987 (not (image_available img5)))
  (at 889 (image_available img6))
  (at 897 (not (image_available img6)))
  (at 1142 (image_available img7))
  (at 1150 (not (image_available img7)))
  (at 986 (image_available img8))
  (at 994 (not (image_available img8)))
  (at 1077 (image_available img9))
  (at 1085 (not (image_available img9)))
  (at 1126 (image_available img10))
  (at 1134 (not (image_available img10)))
  (at 1027 (image_available img11))
  (at 1035 (not (image_available img11)))
  (at 921 (image_available img12))
  (at 929 (not (image_available img12)))
  (at 958 (image_available img13))
  (at 966 (not (image_available img13)))
  (at 1094 (image_available img14))
  (at 1102 (not (image_available img14)))
  (at 1144 (image_available img15))
  (at 1152 (not (image_available img15)))
  (at 1241 (image_available img1))
  (at 1249 (not (image_available img1)))
  (at 1307 (image_available img2))
  (at 1315 (not (image_available img2)))
  (at 1459 (image_available img3))
  (at 1467 (not (image_available img3)))
  (at 1396 (image_available img4))
  (at 1404 (not (image_available img4)))
  (at 1339 (image_available img5))
  (at 1347 (not (image_available img5)))
  (at 1249 (image_available img6))
  (at 1257 (not (image_available img6)))
  (at 1502 (image_available img7))
  (at 1510 (not (image_available img7)))
  (at 1346 (image_available img8))
  (at 1354 (not (image_available img8)))
  (at 1437 (image_available img9))
  (at 1445 (not (image_available img9)))
  (at 1486 (image_available img10))
  (at 1494 (not (image_available img10)))
  (at 1387 (image_available img11))
  (at 1395 (not (image_available img11)))
  (at 1281 (image_available img12))
  (at 1289 (not (image_available img12)))
  (at 1318 (image_available img13))
  (at 1326 (not (image_available img13)))
  (at 1454 (image_available img14))
  (at 1462 (not (image_available img14)))
  (at 1504 (image_available img15))
  (at 1512 (not (image_available img15)))
  (at 1 (dump_available))
  (at 21.0 (not (dump_available)))
  (at 163.0 (dump_available))
  (at 201.0 (not (dump_available)))
  (at 343.0 (dump_available))
  (at 381.0 (not (dump_available)))
  (at 523.0 (dump_available))
  (at 561.0 (not (dump_available)))
  (at 703.0 (dump_available))
  (at 741.0 (not (dump_available)))
  (at 883.0 (dump_available))
  (at 921.0 (not (dump_available)))
  (at 1063.0 (dump_available))
  (at 1101.0 (not (dump_available)))
  (at 1243.0 (dump_available))
  (at 1281.0 (not (dump_available)))
  (at 1423.0 (dump_available))
  (at 1461.0 (not (dump_available)))

)
(:goal (and
  (> (image_score img8) 0)
  (<= (image_score img8) 3)

(>= (total_score) 1)
))
(:metric maximize 
  (image_score img8)
)
)
