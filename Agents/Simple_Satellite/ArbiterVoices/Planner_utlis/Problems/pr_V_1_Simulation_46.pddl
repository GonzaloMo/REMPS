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

  (memory_free mem6)
  (memory_free mem7)
  (memory_free mem9)

   (memory_taken mem0 img2)
   (memory_taken mem1 img10)
   (memory_taken mem2 img8)
   (memory_taken mem3 img12)
   (memory_taken mem4 img7)
   (memory_taken mem5 img4)
   (memory_taken mem8 img1)

(image_analysed mem0 img2)
(image_analysed mem1 img10)
(image_analysed mem3 img12)
(image_analysed mem4 img7)
(image_analysed mem5 img4)
(image_analysed mem8 img1)

  (at 42 (image_available img10))
  (at 50 (not (image_available img10)))
  (at 29 (image_available img14))
  (at 37 (not (image_available img14)))
  (at 315 (image_available img1))
  (at 323 (not (image_available img1)))
  (at 189 (image_available img2))
  (at 197 (not (image_available img2)))
  (at 269 (image_available img3))
  (at 277 (not (image_available img3)))
  (at 145 (image_available img4))
  (at 153 (not (image_available img4)))
  (at 239 (image_available img5))
  (at 247 (not (image_available img5)))
  (at 144 (image_available img6))
  (at 152 (not (image_available img6)))
  (at 346 (image_available img7))
  (at 354 (not (image_available img7)))
  (at 301 (image_available img8))
  (at 309 (not (image_available img8)))
  (at 131 (image_available img9))
  (at 139 (not (image_available img9)))
  (at 402 (image_available img10))
  (at 410 (not (image_available img10)))
  (at 347 (image_available img11))
  (at 355 (not (image_available img11)))
  (at 248 (image_available img12))
  (at 256 (not (image_available img12)))
  (at 251 (image_available img13))
  (at 259 (not (image_available img13)))
  (at 389 (image_available img14))
  (at 397 (not (image_available img14)))
  (at 162 (image_available img15))
  (at 170 (not (image_available img15)))
  (at 675 (image_available img1))
  (at 683 (not (image_available img1)))
  (at 549 (image_available img2))
  (at 557 (not (image_available img2)))
  (at 629 (image_available img3))
  (at 637 (not (image_available img3)))
  (at 505 (image_available img4))
  (at 513 (not (image_available img4)))
  (at 599 (image_available img5))
  (at 607 (not (image_available img5)))
  (at 504 (image_available img6))
  (at 512 (not (image_available img6)))
  (at 706 (image_available img7))
  (at 714 (not (image_available img7)))
  (at 661 (image_available img8))
  (at 669 (not (image_available img8)))
  (at 491 (image_available img9))
  (at 499 (not (image_available img9)))
  (at 762 (image_available img10))
  (at 770 (not (image_available img10)))
  (at 707 (image_available img11))
  (at 715 (not (image_available img11)))
  (at 608 (image_available img12))
  (at 616 (not (image_available img12)))
  (at 611 (image_available img13))
  (at 619 (not (image_available img13)))
  (at 749 (image_available img14))
  (at 757 (not (image_available img14)))
  (at 522 (image_available img15))
  (at 530 (not (image_available img15)))
  (at 1035 (image_available img1))
  (at 1043 (not (image_available img1)))
  (at 909 (image_available img2))
  (at 917 (not (image_available img2)))
  (at 989 (image_available img3))
  (at 997 (not (image_available img3)))
  (at 865 (image_available img4))
  (at 873 (not (image_available img4)))
  (at 959 (image_available img5))
  (at 967 (not (image_available img5)))
  (at 864 (image_available img6))
  (at 872 (not (image_available img6)))
  (at 1066 (image_available img7))
  (at 1074 (not (image_available img7)))
  (at 1021 (image_available img8))
  (at 1029 (not (image_available img8)))
  (at 851 (image_available img9))
  (at 859 (not (image_available img9)))
  (at 1122 (image_available img10))
  (at 1130 (not (image_available img10)))
  (at 1067 (image_available img11))
  (at 1075 (not (image_available img11)))
  (at 968 (image_available img12))
  (at 976 (not (image_available img12)))
  (at 971 (image_available img13))
  (at 979 (not (image_available img13)))
  (at 1109 (image_available img14))
  (at 1117 (not (image_available img14)))
  (at 882 (image_available img15))
  (at 890 (not (image_available img15)))
  (at 1395 (image_available img1))
  (at 1403 (not (image_available img1)))
  (at 1269 (image_available img2))
  (at 1277 (not (image_available img2)))
  (at 1349 (image_available img3))
  (at 1357 (not (image_available img3)))
  (at 1225 (image_available img4))
  (at 1233 (not (image_available img4)))
  (at 1319 (image_available img5))
  (at 1327 (not (image_available img5)))
  (at 1224 (image_available img6))
  (at 1232 (not (image_available img6)))
  (at 1426 (image_available img7))
  (at 1434 (not (image_available img7)))
  (at 1381 (image_available img8))
  (at 1389 (not (image_available img8)))
  (at 1211 (image_available img9))
  (at 1219 (not (image_available img9)))
  (at 1482 (image_available img10))
  (at 1490 (not (image_available img10)))
  (at 1427 (image_available img11))
  (at 1435 (not (image_available img11)))
  (at 1328 (image_available img12))
  (at 1336 (not (image_available img12)))
  (at 1331 (image_available img13))
  (at 1339 (not (image_available img13)))
  (at 1469 (image_available img14))
  (at 1477 (not (image_available img14)))
  (at 1242 (image_available img15))
  (at 1250 (not (image_available img15)))
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
  (> (image_score img1) 0)
  (<= (image_score img1) 1)

  (> (image_score img2) 0)
  (<= (image_score img2) 9)

  (> (image_score img3) 0)
  (<= (image_score img3) 6)

  (> (image_score img4) 0)
  (<= (image_score img4) 5)

  (> (image_score img7) 0)
  (<= (image_score img7) 2)

  (> (image_score img8) 0)
  (<= (image_score img8) 6)

  (> (image_score img11) 0)
  (<= (image_score img11) 6)

  (> (image_score img13) 0)
  (<= (image_score img13) 1)

(>= (total_score) 8)
))
(:metric maximize (+
  (image_score img1)
    (+ (image_score img2)
      (+ (image_score img3)
        (+ (image_score img4)
          (+ (image_score img7)
            (+ (image_score img8)
              (+ (image_score img11)
                (image_score img13)
              )
            )
          )
        )
      )
    )
  )
)
)
