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

  (memory_free mem2)
  (memory_free mem3)
  (memory_free mem4)
  (memory_free mem5)
  (memory_free mem6)
  (memory_free mem7)
  (memory_free mem8)
  (memory_free mem9)

   (memory_taken mem0 img1)
   (memory_taken mem1 img2)

(image_analysed mem0 img1)
(image_analysed mem1 img2)

  (at 62 (image_available img1))
  (at 70 (not (image_available img1)))
  (at 202 (image_available img2))
  (at 210 (not (image_available img2)))
  (at 244 (image_available img4))
  (at 252 (not (image_available img4)))
  (at 254 (image_available img5))
  (at 262 (not (image_available img5)))
  (at 422 (image_available img1))
  (at 430 (not (image_available img1)))
  (at 562 (image_available img2))
  (at 570 (not (image_available img2)))
  (at 283 (image_available img3))
  (at 291 (not (image_available img3)))
  (at 604 (image_available img4))
  (at 612 (not (image_available img4)))
  (at 614 (image_available img5))
  (at 622 (not (image_available img5)))
  (at 782 (image_available img1))
  (at 790 (not (image_available img1)))
  (at 922 (image_available img2))
  (at 930 (not (image_available img2)))
  (at 643 (image_available img3))
  (at 651 (not (image_available img3)))
  (at 964 (image_available img4))
  (at 972 (not (image_available img4)))
  (at 974 (image_available img5))
  (at 982 (not (image_available img5)))
  (at 1142 (image_available img1))
  (at 1150 (not (image_available img1)))
  (at 1282 (image_available img2))
  (at 1290 (not (image_available img2)))
  (at 1003 (image_available img3))
  (at 1011 (not (image_available img3)))
  (at 1324 (image_available img4))
  (at 1332 (not (image_available img4)))
  (at 1334 (image_available img5))
  (at 1342 (not (image_available img5)))
  (at 1502 (image_available img1))
  (at 1510 (not (image_available img1)))
  (at 1642 (image_available img2))
  (at 1650 (not (image_available img2)))
  (at 1363 (image_available img3))
  (at 1371 (not (image_available img3)))
  (at 1684 (image_available img4))
  (at 1692 (not (image_available img4)))
  (at 1694 (image_available img5))
  (at 1702 (not (image_available img5)))
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
  (at 1618.0 (dump_available))
  (at 1656.0 (not (dump_available)))

)
(:goal (and
  (> (image_score img1) 0)
  (<= (image_score img1) 1)

  (> (image_score img4) 0)
  (<= (image_score img4) 1)

(>= (total_score) 1)
))
(:metric maximize (+
  (image_score img1)
    (image_score img4)
  )
)
)
