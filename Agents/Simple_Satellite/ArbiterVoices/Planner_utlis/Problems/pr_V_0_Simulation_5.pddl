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

  (memory_free mem1)
  (memory_free mem2)
  (memory_free mem3)
  (memory_free mem4)
  (memory_free mem5)
  (memory_free mem6)
  (memory_free mem7)
  (memory_free mem8)
  (memory_free mem9)

   (memory_taken mem0 img1)


  (at 75 (image_available img3))
  (at 83 (not (image_available img3)))
  (at 278 (image_available img1))
  (at 286 (not (image_available img1)))
  (at 136 (image_available img2))
  (at 144 (not (image_available img2)))
  (at 435 (image_available img3))
  (at 443 (not (image_available img3)))
  (at 286 (image_available img4))
  (at 294 (not (image_available img4)))
  (at 139 (image_available img5))
  (at 147 (not (image_available img5)))
  (at 638 (image_available img1))
  (at 646 (not (image_available img1)))
  (at 496 (image_available img2))
  (at 504 (not (image_available img2)))
  (at 795 (image_available img3))
  (at 803 (not (image_available img3)))
  (at 646 (image_available img4))
  (at 654 (not (image_available img4)))
  (at 499 (image_available img5))
  (at 507 (not (image_available img5)))
  (at 998 (image_available img1))
  (at 1006 (not (image_available img1)))
  (at 856 (image_available img2))
  (at 864 (not (image_available img2)))
  (at 1155 (image_available img3))
  (at 1163 (not (image_available img3)))
  (at 1006 (image_available img4))
  (at 1014 (not (image_available img4)))
  (at 859 (image_available img5))
  (at 867 (not (image_available img5)))
  (at 1358 (image_available img1))
  (at 1366 (not (image_available img1)))
  (at 1216 (image_available img2))
  (at 1224 (not (image_available img2)))
  (at 1515 (image_available img3))
  (at 1523 (not (image_available img3)))
  (at 1366 (image_available img4))
  (at 1374 (not (image_available img4)))
  (at 1219 (image_available img5))
  (at 1227 (not (image_available img5)))
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
  (> (image_score img4) 0)
  (<= (image_score img4) 1)

(>= (total_score) 1)
))
(:metric maximize 
  (image_score img4)
)
)
