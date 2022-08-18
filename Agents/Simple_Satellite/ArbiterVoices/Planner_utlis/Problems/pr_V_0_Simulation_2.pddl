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

   (memory_taken mem1 img2)

(image_analysed mem1 img2)

  (at 27 (image_available img4))
  (at 35 (not (image_available img4)))
  (at 75 (image_available img5))
  (at 83 (not (image_available img5)))
  (at 163 (image_available img1))
  (at 171 (not (image_available img1)))
  (at 152 (image_available img2))
  (at 160 (not (image_available img2)))
  (at 111 (image_available img3))
  (at 119 (not (image_available img3)))
  (at 387 (image_available img4))
  (at 395 (not (image_available img4)))
  (at 435 (image_available img5))
  (at 443 (not (image_available img5)))
  (at 523 (image_available img1))
  (at 531 (not (image_available img1)))
  (at 512 (image_available img2))
  (at 520 (not (image_available img2)))
  (at 471 (image_available img3))
  (at 479 (not (image_available img3)))
  (at 747 (image_available img4))
  (at 755 (not (image_available img4)))
  (at 795 (image_available img5))
  (at 803 (not (image_available img5)))
  (at 883 (image_available img1))
  (at 891 (not (image_available img1)))
  (at 872 (image_available img2))
  (at 880 (not (image_available img2)))
  (at 831 (image_available img3))
  (at 839 (not (image_available img3)))
  (at 1107 (image_available img4))
  (at 1115 (not (image_available img4)))
  (at 1155 (image_available img5))
  (at 1163 (not (image_available img5)))
  (at 1243 (image_available img1))
  (at 1251 (not (image_available img1)))
  (at 1232 (image_available img2))
  (at 1240 (not (image_available img2)))
  (at 1191 (image_available img3))
  (at 1199 (not (image_available img3)))
  (at 1467 (image_available img4))
  (at 1475 (not (image_available img4)))
  (at 1515 (image_available img5))
  (at 1523 (not (image_available img5)))
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
  (<= (image_score img1) 8)

(>= (total_score) 2)
))
(:metric maximize 
  (image_score img1)
)
)