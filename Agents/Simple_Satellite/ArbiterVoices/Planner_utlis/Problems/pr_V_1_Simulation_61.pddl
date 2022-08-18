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
  (memory_free mem8)
  (memory_free mem9)

   (memory_taken mem1 img4)
   (memory_taken mem2 img7)
   (memory_taken mem3 img19)
   (memory_taken mem4 img18)
   (memory_taken mem5 img6)
   (memory_taken mem6 img11)
   (memory_taken mem7 img13)

(image_analysed mem2 img7)
(image_analysed mem3 img19)
(image_analysed mem4 img18)
(image_analysed mem5 img6)
(image_analysed mem6 img11)

  (at 8 (image_available img2))
  (at 16 (not (image_available img2)))
  (at 9 (image_available img8))
  (at 17 (not (image_available img8)))
  (at 83 (image_available img10))
  (at 91 (not (image_available img10)))
  (at 14 (image_available img16))
  (at 22 (not (image_available img16)))
  (at 75 (image_available img19))
  (at 83 (not (image_available img19)))
  (at 87 (image_available img20))
  (at 95 (not (image_available img20)))
  (at 290 (image_available img1))
  (at 298 (not (image_available img1)))
  (at 368 (image_available img2))
  (at 376 (not (image_available img2)))
  (at 181 (image_available img3))
  (at 189 (not (image_available img3)))
  (at 215 (image_available img4))
  (at 223 (not (image_available img4)))
  (at 237 (image_available img5))
  (at 245 (not (image_available img5)))
  (at 143 (image_available img6))
  (at 151 (not (image_available img6)))
  (at 237 (image_available img7))
  (at 245 (not (image_available img7)))
  (at 369 (image_available img8))
  (at 377 (not (image_available img8)))
  (at 104 (image_available img9))
  (at 112 (not (image_available img9)))
  (at 443 (image_available img10))
  (at 451 (not (image_available img10)))
  (at 285 (image_available img11))
  (at 293 (not (image_available img11)))
  (at 289 (image_available img12))
  (at 297 (not (image_available img12)))
  (at 346 (image_available img13))
  (at 354 (not (image_available img13)))
  (at 254 (image_available img14))
  (at 262 (not (image_available img14)))
  (at 233 (image_available img15))
  (at 241 (not (image_available img15)))
  (at 374 (image_available img16))
  (at 382 (not (image_available img16)))
  (at 334 (image_available img17))
  (at 342 (not (image_available img17)))
  (at 135 (image_available img18))
  (at 143 (not (image_available img18)))
  (at 435 (image_available img19))
  (at 443 (not (image_available img19)))
  (at 447 (image_available img20))
  (at 455 (not (image_available img20)))
  (at 650 (image_available img1))
  (at 658 (not (image_available img1)))
  (at 728 (image_available img2))
  (at 736 (not (image_available img2)))
  (at 541 (image_available img3))
  (at 549 (not (image_available img3)))
  (at 575 (image_available img4))
  (at 583 (not (image_available img4)))
  (at 597 (image_available img5))
  (at 605 (not (image_available img5)))
  (at 503 (image_available img6))
  (at 511 (not (image_available img6)))
  (at 597 (image_available img7))
  (at 605 (not (image_available img7)))
  (at 729 (image_available img8))
  (at 737 (not (image_available img8)))
  (at 464 (image_available img9))
  (at 472 (not (image_available img9)))
  (at 803 (image_available img10))
  (at 811 (not (image_available img10)))
  (at 645 (image_available img11))
  (at 653 (not (image_available img11)))
  (at 649 (image_available img12))
  (at 657 (not (image_available img12)))
  (at 706 (image_available img13))
  (at 714 (not (image_available img13)))
  (at 614 (image_available img14))
  (at 622 (not (image_available img14)))
  (at 593 (image_available img15))
  (at 601 (not (image_available img15)))
  (at 734 (image_available img16))
  (at 742 (not (image_available img16)))
  (at 694 (image_available img17))
  (at 702 (not (image_available img17)))
  (at 495 (image_available img18))
  (at 503 (not (image_available img18)))
  (at 795 (image_available img19))
  (at 803 (not (image_available img19)))
  (at 807 (image_available img20))
  (at 815 (not (image_available img20)))
  (at 1010 (image_available img1))
  (at 1018 (not (image_available img1)))
  (at 1088 (image_available img2))
  (at 1096 (not (image_available img2)))
  (at 901 (image_available img3))
  (at 909 (not (image_available img3)))
  (at 935 (image_available img4))
  (at 943 (not (image_available img4)))
  (at 957 (image_available img5))
  (at 965 (not (image_available img5)))
  (at 863 (image_available img6))
  (at 871 (not (image_available img6)))
  (at 957 (image_available img7))
  (at 965 (not (image_available img7)))
  (at 1089 (image_available img8))
  (at 1097 (not (image_available img8)))
  (at 824 (image_available img9))
  (at 832 (not (image_available img9)))
  (at 1163 (image_available img10))
  (at 1171 (not (image_available img10)))
  (at 1005 (image_available img11))
  (at 1013 (not (image_available img11)))
  (at 1009 (image_available img12))
  (at 1017 (not (image_available img12)))
  (at 1066 (image_available img13))
  (at 1074 (not (image_available img13)))
  (at 974 (image_available img14))
  (at 982 (not (image_available img14)))
  (at 953 (image_available img15))
  (at 961 (not (image_available img15)))
  (at 1094 (image_available img16))
  (at 1102 (not (image_available img16)))
  (at 1054 (image_available img17))
  (at 1062 (not (image_available img17)))
  (at 855 (image_available img18))
  (at 863 (not (image_available img18)))
  (at 1155 (image_available img19))
  (at 1163 (not (image_available img19)))
  (at 1167 (image_available img20))
  (at 1175 (not (image_available img20)))
  (at 1370 (image_available img1))
  (at 1378 (not (image_available img1)))
  (at 1448 (image_available img2))
  (at 1456 (not (image_available img2)))
  (at 1261 (image_available img3))
  (at 1269 (not (image_available img3)))
  (at 1295 (image_available img4))
  (at 1303 (not (image_available img4)))
  (at 1317 (image_available img5))
  (at 1325 (not (image_available img5)))
  (at 1223 (image_available img6))
  (at 1231 (not (image_available img6)))
  (at 1317 (image_available img7))
  (at 1325 (not (image_available img7)))
  (at 1449 (image_available img8))
  (at 1457 (not (image_available img8)))
  (at 1184 (image_available img9))
  (at 1192 (not (image_available img9)))
  (at 1523 (image_available img10))
  (at 1531 (not (image_available img10)))
  (at 1365 (image_available img11))
  (at 1373 (not (image_available img11)))
  (at 1369 (image_available img12))
  (at 1377 (not (image_available img12)))
  (at 1426 (image_available img13))
  (at 1434 (not (image_available img13)))
  (at 1334 (image_available img14))
  (at 1342 (not (image_available img14)))
  (at 1313 (image_available img15))
  (at 1321 (not (image_available img15)))
  (at 1454 (image_available img16))
  (at 1462 (not (image_available img16)))
  (at 1414 (image_available img17))
  (at 1422 (not (image_available img17)))
  (at 1215 (image_available img18))
  (at 1223 (not (image_available img18)))
  (at 1515 (image_available img19))
  (at 1523 (not (image_available img19)))
  (at 1527 (image_available img20))
  (at 1535 (not (image_available img20)))
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
  (<= (image_score img2) 4)

  (> (image_score img5) 0)
  (<= (image_score img5) 1)

  (> (image_score img7) 0)
  (<= (image_score img7) 1)

  (> (image_score img10) 0)
  (<= (image_score img10) 4)

  (> (image_score img12) 0)
  (<= (image_score img12) 4)

  (> (image_score img14) 0)
  (<= (image_score img14) 5)

  (> (image_score img15) 0)
  (<= (image_score img15) 2)

  (> (image_score img16) 0)
  (<= (image_score img16) 1)

  (> (image_score img19) 0)
  (<= (image_score img19) 2)

(>= (total_score) 5)
))
(:metric maximize (+
  (image_score img2)
    (+ (image_score img5)
      (+ (image_score img7)
        (+ (image_score img10)
          (+ (image_score img12)
            (+ (image_score img14)
              (+ (image_score img15)
                (+ (image_score img16)
                  (image_score img19)
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