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

  (memory_free mem9)

   (memory_taken mem0 img12)
   (memory_taken mem1 img12)
   (memory_taken mem2 img5)
   (memory_taken mem3 img2)
   (memory_taken mem4 img13)
   (memory_taken mem5 img6)
   (memory_taken mem6 img14)
   (memory_taken mem7 img1)
   (memory_taken mem8 img20)

(image_analysed mem0 img12)
(image_analysed mem2 img5)
(image_analysed mem3 img2)
(image_analysed mem4 img13)
(image_analysed mem5 img6)
(image_analysed mem7 img1)
(image_analysed mem8 img20)

  (at 10 (image_available img16))
  (at 18 (not (image_available img16)))
  (at 21 (image_available img19))
  (at 29 (not (image_available img19)))
  (at 301 (image_available img1))
  (at 309 (not (image_available img1)))
  (at 196 (image_available img2))
  (at 204 (not (image_available img2)))
  (at 346 (image_available img3))
  (at 354 (not (image_available img3)))
  (at 224 (image_available img4))
  (at 232 (not (image_available img4)))
  (at 309 (image_available img5))
  (at 317 (not (image_available img5)))
  (at 191 (image_available img6))
  (at 199 (not (image_available img6)))
  (at 123 (image_available img7))
  (at 131 (not (image_available img7)))
  (at 207 (image_available img8))
  (at 215 (not (image_available img8)))
  (at 209 (image_available img9))
  (at 217 (not (image_available img9)))
  (at 259 (image_available img10))
  (at 267 (not (image_available img10)))
  (at 280 (image_available img11))
  (at 288 (not (image_available img11)))
  (at 177 (image_available img12))
  (at 185 (not (image_available img12)))
  (at 324 (image_available img13))
  (at 332 (not (image_available img13)))
  (at 140 (image_available img14))
  (at 148 (not (image_available img14)))
  (at 187 (image_available img15))
  (at 195 (not (image_available img15)))
  (at 370 (image_available img16))
  (at 378 (not (image_available img16)))
  (at 193 (image_available img17))
  (at 201 (not (image_available img17)))
  (at 122 (image_available img18))
  (at 130 (not (image_available img18)))
  (at 381 (image_available img19))
  (at 389 (not (image_available img19)))
  (at 312 (image_available img20))
  (at 320 (not (image_available img20)))
  (at 661 (image_available img1))
  (at 669 (not (image_available img1)))
  (at 556 (image_available img2))
  (at 564 (not (image_available img2)))
  (at 706 (image_available img3))
  (at 714 (not (image_available img3)))
  (at 584 (image_available img4))
  (at 592 (not (image_available img4)))
  (at 669 (image_available img5))
  (at 677 (not (image_available img5)))
  (at 551 (image_available img6))
  (at 559 (not (image_available img6)))
  (at 483 (image_available img7))
  (at 491 (not (image_available img7)))
  (at 567 (image_available img8))
  (at 575 (not (image_available img8)))
  (at 569 (image_available img9))
  (at 577 (not (image_available img9)))
  (at 619 (image_available img10))
  (at 627 (not (image_available img10)))
  (at 640 (image_available img11))
  (at 648 (not (image_available img11)))
  (at 537 (image_available img12))
  (at 545 (not (image_available img12)))
  (at 684 (image_available img13))
  (at 692 (not (image_available img13)))
  (at 500 (image_available img14))
  (at 508 (not (image_available img14)))
  (at 547 (image_available img15))
  (at 555 (not (image_available img15)))
  (at 730 (image_available img16))
  (at 738 (not (image_available img16)))
  (at 553 (image_available img17))
  (at 561 (not (image_available img17)))
  (at 482 (image_available img18))
  (at 490 (not (image_available img18)))
  (at 741 (image_available img19))
  (at 749 (not (image_available img19)))
  (at 672 (image_available img20))
  (at 680 (not (image_available img20)))
  (at 1021 (image_available img1))
  (at 1029 (not (image_available img1)))
  (at 916 (image_available img2))
  (at 924 (not (image_available img2)))
  (at 1066 (image_available img3))
  (at 1074 (not (image_available img3)))
  (at 944 (image_available img4))
  (at 952 (not (image_available img4)))
  (at 1029 (image_available img5))
  (at 1037 (not (image_available img5)))
  (at 911 (image_available img6))
  (at 919 (not (image_available img6)))
  (at 843 (image_available img7))
  (at 851 (not (image_available img7)))
  (at 927 (image_available img8))
  (at 935 (not (image_available img8)))
  (at 929 (image_available img9))
  (at 937 (not (image_available img9)))
  (at 979 (image_available img10))
  (at 987 (not (image_available img10)))
  (at 1000 (image_available img11))
  (at 1008 (not (image_available img11)))
  (at 897 (image_available img12))
  (at 905 (not (image_available img12)))
  (at 1044 (image_available img13))
  (at 1052 (not (image_available img13)))
  (at 860 (image_available img14))
  (at 868 (not (image_available img14)))
  (at 907 (image_available img15))
  (at 915 (not (image_available img15)))
  (at 1090 (image_available img16))
  (at 1098 (not (image_available img16)))
  (at 913 (image_available img17))
  (at 921 (not (image_available img17)))
  (at 842 (image_available img18))
  (at 850 (not (image_available img18)))
  (at 1101 (image_available img19))
  (at 1109 (not (image_available img19)))
  (at 1032 (image_available img20))
  (at 1040 (not (image_available img20)))
  (at 1381 (image_available img1))
  (at 1389 (not (image_available img1)))
  (at 1276 (image_available img2))
  (at 1284 (not (image_available img2)))
  (at 1426 (image_available img3))
  (at 1434 (not (image_available img3)))
  (at 1304 (image_available img4))
  (at 1312 (not (image_available img4)))
  (at 1389 (image_available img5))
  (at 1397 (not (image_available img5)))
  (at 1271 (image_available img6))
  (at 1279 (not (image_available img6)))
  (at 1203 (image_available img7))
  (at 1211 (not (image_available img7)))
  (at 1287 (image_available img8))
  (at 1295 (not (image_available img8)))
  (at 1289 (image_available img9))
  (at 1297 (not (image_available img9)))
  (at 1339 (image_available img10))
  (at 1347 (not (image_available img10)))
  (at 1360 (image_available img11))
  (at 1368 (not (image_available img11)))
  (at 1257 (image_available img12))
  (at 1265 (not (image_available img12)))
  (at 1404 (image_available img13))
  (at 1412 (not (image_available img13)))
  (at 1220 (image_available img14))
  (at 1228 (not (image_available img14)))
  (at 1267 (image_available img15))
  (at 1275 (not (image_available img15)))
  (at 1450 (image_available img16))
  (at 1458 (not (image_available img16)))
  (at 1273 (image_available img17))
  (at 1281 (not (image_available img17)))
  (at 1202 (image_available img18))
  (at 1210 (not (image_available img18)))
  (at 1461 (image_available img19))
  (at 1469 (not (image_available img19)))
  (at 1392 (image_available img20))
  (at 1400 (not (image_available img20)))
  (at 1 (dump_available))
  (at 4.0 (not (dump_available)))
  (at 146.0 (dump_available))
  (at 184.0 (not (dump_available)))
  (at 326.0 (dump_available))
  (at 364.0 (not (dump_available)))
  (at 506.0 (dump_available))
  (at 544.0 (not (dump_available)))
  (at 686.0 (dump_available))
  (at 724.0 (not (dump_available)))
  (at 866.0 (dump_available))
  (at 904.0 (not (dump_available)))
  (at 1046.0 (dump_available))
  (at 1084.0 (not (dump_available)))
  (at 1226.0 (dump_available))
  (at 1264.0 (not (dump_available)))
  (at 1406.0 (dump_available))
  (at 1444.0 (not (dump_available)))

)
(:goal (and
  (> (image_score img1) 0)
  (<= (image_score img1) 9)

  (> (image_score img2) 0)
  (<= (image_score img2) 4)

  (> (image_score img3) 0)
  (<= (image_score img3) 10)

  (> (image_score img4) 0)
  (<= (image_score img4) 7)

  (> (image_score img5) 0)
  (<= (image_score img5) 6)

  (> (image_score img10) 0)
  (<= (image_score img10) 6)

  (> (image_score img11) 0)
  (<= (image_score img11) 2)

  (> (image_score img14) 0)
  (<= (image_score img14) 8)

  (> (image_score img16) 0)
  (<= (image_score img16) 6)

  (> (image_score img18) 0)
  (<= (image_score img18) 13)

  (> (image_score img19) 0)
  (<= (image_score img19) 1)

  (> (image_score img20) 0)
  (<= (image_score img20) 3)

(>= (total_score) 15)
))
(:metric maximize (+
  (image_score img1)
    (+ (image_score img2)
      (+ (image_score img3)
        (+ (image_score img4)
          (+ (image_score img5)
            (+ (image_score img10)
              (+ (image_score img11)
                (+ (image_score img14)
                  (+ (image_score img16)
                    (+ (image_score img18)
                      (+ (image_score img19)
                        (image_score img20)
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
