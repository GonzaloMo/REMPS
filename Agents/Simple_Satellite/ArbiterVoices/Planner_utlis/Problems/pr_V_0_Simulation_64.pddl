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

  (memory_free mem6)
  (memory_free mem8)
  (memory_free mem9)

   (memory_taken mem0 img16)
   (memory_taken mem1 img8)
   (memory_taken mem2 img20)
   (memory_taken mem3 img9)
   (memory_taken mem4 img3)
   (memory_taken mem5 img5)
   (memory_taken mem7 img6)

(image_analysed mem0 img16)
(image_analysed mem1 img8)
(image_analysed mem2 img20)
(image_analysed mem3 img9)
(image_analysed mem4 img3)
(image_analysed mem7 img6)

  (at 0 (image_available img1))
  (at 7 (not (image_available img1)))
  (at 21 (image_available img2))
  (at 29 (not (image_available img2)))
  (at 13 (image_available img4))
  (at 21 (not (image_available img4)))
  (at 0 (image_available img5))
  (at 1 (not (image_available img5)))
  (at 20 (image_available img7))
  (at 28 (not (image_available img7)))
  (at 38 (image_available img12))
  (at 46 (not (image_available img12)))
  (at 16 (image_available img16))
  (at 24 (not (image_available img16)))
  (at 13 (image_available img17))
  (at 21 (not (image_available img17)))
  (at 359 (image_available img1))
  (at 367 (not (image_available img1)))
  (at 381 (image_available img2))
  (at 389 (not (image_available img2)))
  (at 92 (image_available img3))
  (at 100 (not (image_available img3)))
  (at 373 (image_available img4))
  (at 381 (not (image_available img4)))
  (at 353 (image_available img5))
  (at 361 (not (image_available img5)))
  (at 211 (image_available img6))
  (at 219 (not (image_available img6)))
  (at 380 (image_available img7))
  (at 388 (not (image_available img7)))
  (at 291 (image_available img8))
  (at 299 (not (image_available img8)))
  (at 298 (image_available img9))
  (at 306 (not (image_available img9)))
  (at 221 (image_available img10))
  (at 229 (not (image_available img10)))
  (at 192 (image_available img11))
  (at 200 (not (image_available img11)))
  (at 398 (image_available img12))
  (at 406 (not (image_available img12)))
  (at 83 (image_available img13))
  (at 91 (not (image_available img13)))
  (at 275 (image_available img14))
  (at 283 (not (image_available img14)))
  (at 77 (image_available img15))
  (at 85 (not (image_available img15)))
  (at 376 (image_available img16))
  (at 384 (not (image_available img16)))
  (at 373 (image_available img17))
  (at 381 (not (image_available img17)))
  (at 135 (image_available img18))
  (at 143 (not (image_available img18)))
  (at 112 (image_available img19))
  (at 120 (not (image_available img19)))
  (at 185 (image_available img20))
  (at 193 (not (image_available img20)))
  (at 719 (image_available img1))
  (at 727 (not (image_available img1)))
  (at 741 (image_available img2))
  (at 749 (not (image_available img2)))
  (at 452 (image_available img3))
  (at 460 (not (image_available img3)))
  (at 733 (image_available img4))
  (at 741 (not (image_available img4)))
  (at 713 (image_available img5))
  (at 721 (not (image_available img5)))
  (at 571 (image_available img6))
  (at 579 (not (image_available img6)))
  (at 740 (image_available img7))
  (at 748 (not (image_available img7)))
  (at 651 (image_available img8))
  (at 659 (not (image_available img8)))
  (at 658 (image_available img9))
  (at 666 (not (image_available img9)))
  (at 581 (image_available img10))
  (at 589 (not (image_available img10)))
  (at 552 (image_available img11))
  (at 560 (not (image_available img11)))
  (at 758 (image_available img12))
  (at 766 (not (image_available img12)))
  (at 443 (image_available img13))
  (at 451 (not (image_available img13)))
  (at 635 (image_available img14))
  (at 643 (not (image_available img14)))
  (at 437 (image_available img15))
  (at 445 (not (image_available img15)))
  (at 736 (image_available img16))
  (at 744 (not (image_available img16)))
  (at 733 (image_available img17))
  (at 741 (not (image_available img17)))
  (at 495 (image_available img18))
  (at 503 (not (image_available img18)))
  (at 472 (image_available img19))
  (at 480 (not (image_available img19)))
  (at 545 (image_available img20))
  (at 553 (not (image_available img20)))
  (at 1079 (image_available img1))
  (at 1087 (not (image_available img1)))
  (at 1101 (image_available img2))
  (at 1109 (not (image_available img2)))
  (at 812 (image_available img3))
  (at 820 (not (image_available img3)))
  (at 1093 (image_available img4))
  (at 1101 (not (image_available img4)))
  (at 1073 (image_available img5))
  (at 1081 (not (image_available img5)))
  (at 931 (image_available img6))
  (at 939 (not (image_available img6)))
  (at 1100 (image_available img7))
  (at 1108 (not (image_available img7)))
  (at 1011 (image_available img8))
  (at 1019 (not (image_available img8)))
  (at 1018 (image_available img9))
  (at 1026 (not (image_available img9)))
  (at 941 (image_available img10))
  (at 949 (not (image_available img10)))
  (at 912 (image_available img11))
  (at 920 (not (image_available img11)))
  (at 1118 (image_available img12))
  (at 1126 (not (image_available img12)))
  (at 803 (image_available img13))
  (at 811 (not (image_available img13)))
  (at 995 (image_available img14))
  (at 1003 (not (image_available img14)))
  (at 797 (image_available img15))
  (at 805 (not (image_available img15)))
  (at 1096 (image_available img16))
  (at 1104 (not (image_available img16)))
  (at 1093 (image_available img17))
  (at 1101 (not (image_available img17)))
  (at 855 (image_available img18))
  (at 863 (not (image_available img18)))
  (at 832 (image_available img19))
  (at 840 (not (image_available img19)))
  (at 905 (image_available img20))
  (at 913 (not (image_available img20)))
  (at 1439 (image_available img1))
  (at 1447 (not (image_available img1)))
  (at 1461 (image_available img2))
  (at 1469 (not (image_available img2)))
  (at 1172 (image_available img3))
  (at 1180 (not (image_available img3)))
  (at 1453 (image_available img4))
  (at 1461 (not (image_available img4)))
  (at 1433 (image_available img5))
  (at 1441 (not (image_available img5)))
  (at 1291 (image_available img6))
  (at 1299 (not (image_available img6)))
  (at 1460 (image_available img7))
  (at 1468 (not (image_available img7)))
  (at 1371 (image_available img8))
  (at 1379 (not (image_available img8)))
  (at 1378 (image_available img9))
  (at 1386 (not (image_available img9)))
  (at 1301 (image_available img10))
  (at 1309 (not (image_available img10)))
  (at 1272 (image_available img11))
  (at 1280 (not (image_available img11)))
  (at 1478 (image_available img12))
  (at 1486 (not (image_available img12)))
  (at 1163 (image_available img13))
  (at 1171 (not (image_available img13)))
  (at 1355 (image_available img14))
  (at 1363 (not (image_available img14)))
  (at 1157 (image_available img15))
  (at 1165 (not (image_available img15)))
  (at 1456 (image_available img16))
  (at 1464 (not (image_available img16)))
  (at 1453 (image_available img17))
  (at 1461 (not (image_available img17)))
  (at 1215 (image_available img18))
  (at 1223 (not (image_available img18)))
  (at 1192 (image_available img19))
  (at 1200 (not (image_available img19)))
  (at 1265 (image_available img20))
  (at 1273 (not (image_available img20)))
  (at 1 (dump_available))
  (at 2.0 (not (dump_available)))
  (at 144.0 (dump_available))
  (at 182.0 (not (dump_available)))
  (at 324.0 (dump_available))
  (at 362.0 (not (dump_available)))
  (at 504.0 (dump_available))
  (at 542.0 (not (dump_available)))
  (at 684.0 (dump_available))
  (at 722.0 (not (dump_available)))
  (at 864.0 (dump_available))
  (at 902.0 (not (dump_available)))
  (at 1044.0 (dump_available))
  (at 1082.0 (not (dump_available)))
  (at 1224.0 (dump_available))
  (at 1262.0 (not (dump_available)))
  (at 1404.0 (dump_available))
  (at 1442.0 (not (dump_available)))

)
(:goal (and
  (> (image_score img2) 0)
  (<= (image_score img2) 10.0)

  (> (image_score img6) 0)
  (<= (image_score img6) 4.0)

  (> (image_score img9) 0)
  (<= (image_score img9) 13.0)

  (> (image_score img15) 0)
  (<= (image_score img15) 11.0)

  (> (image_score img18) 0)
  (<= (image_score img18) 3.0)

  (> (image_score img19) 0)
  (<= (image_score img19) 19.0)

(>= (total_score) 12)
))
(:metric maximize (+
  (image_score img2)
    (+ (image_score img6)
      (+ (image_score img9)
        (+ (image_score img15)
          (+ (image_score img18)
            (image_score img19)
          )
        )
      )
    )
  )
)
)
