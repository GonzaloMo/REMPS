(define(problem satprob)
(:domain SimpleSatellite)
(:objects
  mem0 mem1 mem2 mem3 mem4 mem5 mem6 mem7 mem8 mem9 - memory
 img1 img2 img3 img4 img5 img6 img7 img8 img9 img10 - image
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
  (= (total_score) 0)

  (memory_free mem1)
  (memory_free mem3)
  (memory_free mem4)
  (memory_free mem5)
  (memory_free mem6)
  (memory_free mem7)
  (memory_free mem8)
  (memory_free mem9)

   (memory_taken mem0 img1)
   (memory_taken mem2 img9)

(image_analysed mem0 img1)
(image_analysed mem2 img9)

  (at 72 (image_available img3))
  (at 80 (not (image_available img3)))
  (at 205 (image_available img1))
  (at 213 (not (image_available img1)))
  (at 214 (image_available img2))
  (at 222 (not (image_available img2)))
  (at 432 (image_available img3))
  (at 440 (not (image_available img3)))
  (at 329 (image_available img4))
  (at 337 (not (image_available img4)))
  (at 247 (image_available img5))
  (at 255 (not (image_available img5)))
  (at 246 (image_available img6))
  (at 254 (not (image_available img6)))
  (at 243 (image_available img7))
  (at 251 (not (image_available img7)))
  (at 262 (image_available img8))
  (at 270 (not (image_available img8)))
  (at 260 (image_available img9))
  (at 268 (not (image_available img9)))
  (at 273 (image_available img10))
  (at 281 (not (image_available img10)))
  (at 565 (image_available img1))
  (at 573 (not (image_available img1)))
  (at 574 (image_available img2))
  (at 582 (not (image_available img2)))
  (at 792 (image_available img3))
  (at 800 (not (image_available img3)))
  (at 689 (image_available img4))
  (at 697 (not (image_available img4)))
  (at 607 (image_available img5))
  (at 615 (not (image_available img5)))
  (at 606 (image_available img6))
  (at 614 (not (image_available img6)))
  (at 603 (image_available img7))
  (at 611 (not (image_available img7)))
  (at 622 (image_available img8))
  (at 630 (not (image_available img8)))
  (at 620 (image_available img9))
  (at 628 (not (image_available img9)))
  (at 633 (image_available img10))
  (at 641 (not (image_available img10)))
  (at 925 (image_available img1))
  (at 933 (not (image_available img1)))
  (at 934 (image_available img2))
  (at 942 (not (image_available img2)))
  (at 1152 (image_available img3))
  (at 1160 (not (image_available img3)))
  (at 1049 (image_available img4))
  (at 1057 (not (image_available img4)))
  (at 967 (image_available img5))
  (at 975 (not (image_available img5)))
  (at 966 (image_available img6))
  (at 974 (not (image_available img6)))
  (at 963 (image_available img7))
  (at 971 (not (image_available img7)))
  (at 982 (image_available img8))
  (at 990 (not (image_available img8)))
  (at 980 (image_available img9))
  (at 988 (not (image_available img9)))
  (at 993 (image_available img10))
  (at 1001 (not (image_available img10)))
  (at 1285 (image_available img1))
  (at 1293 (not (image_available img1)))
  (at 1294 (image_available img2))
  (at 1302 (not (image_available img2)))
  (at 1512 (image_available img3))
  (at 1520 (not (image_available img3)))
  (at 1409 (image_available img4))
  (at 1417 (not (image_available img4)))
  (at 1327 (image_available img5))
  (at 1335 (not (image_available img5)))
  (at 1326 (image_available img6))
  (at 1334 (not (image_available img6)))
  (at 1323 (image_available img7))
  (at 1331 (not (image_available img7)))
  (at 1342 (image_available img8))
  (at 1350 (not (image_available img8)))
  (at 1340 (image_available img9))
  (at 1348 (not (image_available img9)))
  (at 1353 (image_available img10))
  (at 1361 (not (image_available img10)))
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

  (> (image_score img8) 0)
  (<= (image_score img8) 11)

(>= (total_score) 3)
))
(:metric maximize (+
  (image_score img1)
    (image_score img8)
  )
)
)
