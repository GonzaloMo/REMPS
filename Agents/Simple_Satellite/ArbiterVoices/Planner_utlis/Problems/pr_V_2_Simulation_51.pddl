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

  (memory_free mem0)
  (memory_free mem1)
  (memory_free mem2)
  (memory_free mem4)
  (memory_free mem5)
  (memory_free mem6)
  (memory_free mem7)
  (memory_free mem8)
  (memory_free mem9)

   (memory_taken mem3 img1)


  (at 45 (image_available img2))
  (at 53 (not (image_available img2)))
  (at 21 (image_available img3))
  (at 29 (not (image_available img3)))
  (at 64 (image_available img6))
  (at 72 (not (image_available img6)))
  (at 37 (image_available img16))
  (at 45 (not (image_available img16)))
  (at 71 (image_available img18))
  (at 79 (not (image_available img18)))
  (at 157 (image_available img1))
  (at 165 (not (image_available img1)))
  (at 405 (image_available img2))
  (at 413 (not (image_available img2)))
  (at 381 (image_available img3))
  (at 389 (not (image_available img3)))
  (at 203 (image_available img4))
  (at 211 (not (image_available img4)))
  (at 344 (image_available img5))
  (at 352 (not (image_available img5)))
  (at 424 (image_available img6))
  (at 432 (not (image_available img6)))
  (at 199 (image_available img7))
  (at 207 (not (image_available img7)))
  (at 162 (image_available img8))
  (at 170 (not (image_available img8)))
  (at 122 (image_available img9))
  (at 130 (not (image_available img9)))
  (at 268 (image_available img10))
  (at 276 (not (image_available img10)))
  (at 99 (image_available img11))
  (at 107 (not (image_available img11)))
  (at 330 (image_available img12))
  (at 338 (not (image_available img12)))
  (at 157 (image_available img13))
  (at 165 (not (image_available img13)))
  (at 118 (image_available img14))
  (at 126 (not (image_available img14)))
  (at 146 (image_available img15))
  (at 154 (not (image_available img15)))
  (at 397 (image_available img16))
  (at 405 (not (image_available img16)))
  (at 103 (image_available img17))
  (at 111 (not (image_available img17)))
  (at 431 (image_available img18))
  (at 439 (not (image_available img18)))
  (at 257 (image_available img19))
  (at 265 (not (image_available img19)))
  (at 153 (image_available img20))
  (at 161 (not (image_available img20)))
  (at 517 (image_available img1))
  (at 525 (not (image_available img1)))
  (at 765 (image_available img2))
  (at 773 (not (image_available img2)))
  (at 741 (image_available img3))
  (at 749 (not (image_available img3)))
  (at 563 (image_available img4))
  (at 571 (not (image_available img4)))
  (at 704 (image_available img5))
  (at 712 (not (image_available img5)))
  (at 784 (image_available img6))
  (at 792 (not (image_available img6)))
  (at 559 (image_available img7))
  (at 567 (not (image_available img7)))
  (at 522 (image_available img8))
  (at 530 (not (image_available img8)))
  (at 482 (image_available img9))
  (at 490 (not (image_available img9)))
  (at 628 (image_available img10))
  (at 636 (not (image_available img10)))
  (at 459 (image_available img11))
  (at 467 (not (image_available img11)))
  (at 690 (image_available img12))
  (at 698 (not (image_available img12)))
  (at 517 (image_available img13))
  (at 525 (not (image_available img13)))
  (at 478 (image_available img14))
  (at 486 (not (image_available img14)))
  (at 506 (image_available img15))
  (at 514 (not (image_available img15)))
  (at 757 (image_available img16))
  (at 765 (not (image_available img16)))
  (at 463 (image_available img17))
  (at 471 (not (image_available img17)))
  (at 791 (image_available img18))
  (at 799 (not (image_available img18)))
  (at 617 (image_available img19))
  (at 625 (not (image_available img19)))
  (at 513 (image_available img20))
  (at 521 (not (image_available img20)))
  (at 877 (image_available img1))
  (at 885 (not (image_available img1)))
  (at 1125 (image_available img2))
  (at 1133 (not (image_available img2)))
  (at 1101 (image_available img3))
  (at 1109 (not (image_available img3)))
  (at 923 (image_available img4))
  (at 931 (not (image_available img4)))
  (at 1064 (image_available img5))
  (at 1072 (not (image_available img5)))
  (at 1144 (image_available img6))
  (at 1152 (not (image_available img6)))
  (at 919 (image_available img7))
  (at 927 (not (image_available img7)))
  (at 882 (image_available img8))
  (at 890 (not (image_available img8)))
  (at 842 (image_available img9))
  (at 850 (not (image_available img9)))
  (at 988 (image_available img10))
  (at 996 (not (image_available img10)))
  (at 819 (image_available img11))
  (at 827 (not (image_available img11)))
  (at 1050 (image_available img12))
  (at 1058 (not (image_available img12)))
  (at 877 (image_available img13))
  (at 885 (not (image_available img13)))
  (at 838 (image_available img14))
  (at 846 (not (image_available img14)))
  (at 866 (image_available img15))
  (at 874 (not (image_available img15)))
  (at 1117 (image_available img16))
  (at 1125 (not (image_available img16)))
  (at 823 (image_available img17))
  (at 831 (not (image_available img17)))
  (at 1151 (image_available img18))
  (at 1159 (not (image_available img18)))
  (at 977 (image_available img19))
  (at 985 (not (image_available img19)))
  (at 873 (image_available img20))
  (at 881 (not (image_available img20)))
  (at 1237 (image_available img1))
  (at 1245 (not (image_available img1)))
  (at 1485 (image_available img2))
  (at 1493 (not (image_available img2)))
  (at 1461 (image_available img3))
  (at 1469 (not (image_available img3)))
  (at 1283 (image_available img4))
  (at 1291 (not (image_available img4)))
  (at 1424 (image_available img5))
  (at 1432 (not (image_available img5)))
  (at 1504 (image_available img6))
  (at 1512 (not (image_available img6)))
  (at 1279 (image_available img7))
  (at 1287 (not (image_available img7)))
  (at 1242 (image_available img8))
  (at 1250 (not (image_available img8)))
  (at 1202 (image_available img9))
  (at 1210 (not (image_available img9)))
  (at 1348 (image_available img10))
  (at 1356 (not (image_available img10)))
  (at 1179 (image_available img11))
  (at 1187 (not (image_available img11)))
  (at 1410 (image_available img12))
  (at 1418 (not (image_available img12)))
  (at 1237 (image_available img13))
  (at 1245 (not (image_available img13)))
  (at 1198 (image_available img14))
  (at 1206 (not (image_available img14)))
  (at 1226 (image_available img15))
  (at 1234 (not (image_available img15)))
  (at 1477 (image_available img16))
  (at 1485 (not (image_available img16)))
  (at 1183 (image_available img17))
  (at 1191 (not (image_available img17)))
  (at 1511 (image_available img18))
  (at 1519 (not (image_available img18)))
  (at 1337 (image_available img19))
  (at 1345 (not (image_available img19)))
  (at 1233 (image_available img20))
  (at 1241 (not (image_available img20)))
  (at 1 (dump_available))
  (at 22.0 (not (dump_available)))
  (at 164.0 (dump_available))
  (at 202.0 (not (dump_available)))
  (at 344.0 (dump_available))
  (at 382.0 (not (dump_available)))
  (at 524.0 (dump_available))
  (at 562.0 (not (dump_available)))
  (at 704.0 (dump_available))
  (at 742.0 (not (dump_available)))
  (at 884.0 (dump_available))
  (at 922.0 (not (dump_available)))
  (at 1064.0 (dump_available))
  (at 1102.0 (not (dump_available)))
  (at 1244.0 (dump_available))
  (at 1282.0 (not (dump_available)))
  (at 1424.0 (dump_available))
  (at 1462.0 (not (dump_available)))

)
(:goal (and
  (> (image_score img1) 0)
  (<= (image_score img1) 10)

  (> (image_score img20) 0)
  (<= (image_score img20) 3)

(>= (total_score) 3)
))
(:metric maximize (+
  (image_score img1)
    (image_score img20)
  )
)
)
