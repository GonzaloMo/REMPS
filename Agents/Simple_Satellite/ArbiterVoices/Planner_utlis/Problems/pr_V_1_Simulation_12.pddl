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
  (memory_free mem4)
  (memory_free mem5)
  (memory_free mem6)
  (memory_free mem7)
  (memory_free mem8)
  (memory_free mem9)

   (memory_taken mem1 img3)
   (memory_taken mem2 img1)
   (memory_taken mem3 img4)

(image_analysed mem1 img3)
(image_analysed mem2 img1)
(image_analysed mem3 img4)

  (at 161 (image_available img1))
  (at 169 (not (image_available img1)))
  (at 290 (image_available img2))
  (at 298 (not (image_available img2)))
  (at 343 (image_available img3))
  (at 351 (not (image_available img3)))
  (at 232 (image_available img4))
  (at 240 (not (image_available img4)))
  (at 180 (image_available img5))
  (at 188 (not (image_available img5)))
  (at 521 (image_available img1))
  (at 529 (not (image_available img1)))
  (at 650 (image_available img2))
  (at 658 (not (image_available img2)))
  (at 703 (image_available img3))
  (at 711 (not (image_available img3)))
  (at 592 (image_available img4))
  (at 600 (not (image_available img4)))
  (at 540 (image_available img5))
  (at 548 (not (image_available img5)))
  (at 881 (image_available img1))
  (at 889 (not (image_available img1)))
  (at 1010 (image_available img2))
  (at 1018 (not (image_available img2)))
  (at 1063 (image_available img3))
  (at 1071 (not (image_available img3)))
  (at 952 (image_available img4))
  (at 960 (not (image_available img4)))
  (at 900 (image_available img5))
  (at 908 (not (image_available img5)))
  (at 1241 (image_available img1))
  (at 1249 (not (image_available img1)))
  (at 1370 (image_available img2))
  (at 1378 (not (image_available img2)))
  (at 1423 (image_available img3))
  (at 1431 (not (image_available img3)))
  (at 1312 (image_available img4))
  (at 1320 (not (image_available img4)))
  (at 1260 (image_available img5))
  (at 1268 (not (image_available img5)))
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
  (> (image_score img5) 0)
  (<= (image_score img5) 1)

(>= (total_score) 1)
))
(:metric maximize 
  (image_score img5)
)
)
