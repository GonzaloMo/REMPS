(define(problem satprob)
(:domain SimpleSatellite)
(:objects
  mem0 mem1 mem2 mem3 mem4 mem5 mem6 mem7 mem8 mem9 - memory
 img1 img2 img3 img4 img5 - image
)
(:init
  (sat_free)
  (= (image_score img1) 0)
  (= (image_score img2) 0)
  (= (image_score img3) 0)
  (= (image_score img4) 0)
  (= (image_score img5) 0)
  (= (total_score) 0)

  (memory_free mem0)
  (memory_free mem2)
  (memory_free mem3)
  (memory_free mem4)
  (memory_free mem5)
  (memory_free mem6)
  (memory_free mem7)
  (memory_free mem8)
  (memory_free mem9)

   (memory_taken mem1 img3)

(image_analysed mem1 img3)

  (at 0 (image_available img3))
  (at 0 (not (image_available img3)))
  (at 11 (image_available img4))
  (at 19 (not (image_available img4)))
  (at 262 (image_available img1))
  (at 270 (not (image_available img1)))
  (at 230 (image_available img2))
  (at 238 (not (image_available img2)))
  (at 352 (image_available img3))
  (at 360 (not (image_available img3)))
  (at 371 (image_available img4))
  (at 379 (not (image_available img4)))
  (at 247 (image_available img5))
  (at 255 (not (image_available img5)))
  (at 622 (image_available img1))
  (at 630 (not (image_available img1)))
  (at 590 (image_available img2))
  (at 598 (not (image_available img2)))
  (at 712 (image_available img3))
  (at 720 (not (image_available img3)))
  (at 731 (image_available img4))
  (at 739 (not (image_available img4)))
  (at 607 (image_available img5))
  (at 615 (not (image_available img5)))
  (at 982 (image_available img1))
  (at 990 (not (image_available img1)))
  (at 950 (image_available img2))
  (at 958 (not (image_available img2)))
  (at 1072 (image_available img3))
  (at 1080 (not (image_available img3)))
  (at 1091 (image_available img4))
  (at 1099 (not (image_available img4)))
  (at 967 (image_available img5))
  (at 975 (not (image_available img5)))
  (at 1342 (image_available img1))
  (at 1350 (not (image_available img1)))
  (at 1310 (image_available img2))
  (at 1318 (not (image_available img2)))
  (at 1432 (image_available img3))
  (at 1440 (not (image_available img3)))
  (at 1451 (image_available img4))
  (at 1459 (not (image_available img4)))
  (at 1327 (image_available img5))
  (at 1335 (not (image_available img5)))
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
  (<= (image_score img1) 5)

  (> (image_score img2) 0)
  (<= (image_score img2) 2)

(>= (total_score) 2)
))
(:metric maximize (+
  (image_score img1)
    (image_score img2)
  )
)
)
