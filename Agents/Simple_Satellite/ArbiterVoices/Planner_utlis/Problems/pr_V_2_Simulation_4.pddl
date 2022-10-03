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
  (memory_free mem4)
  (memory_free mem5)
  (memory_free mem6)
  (memory_free mem7)
  (memory_free mem8)
  (memory_free mem9)

   (memory_taken mem1 img1)
   (memory_taken mem3 img4)

(image_analysed mem1 img1)
(image_analysed mem3 img4)

  (at 169 (image_available img1))
  (at 177 (not (image_available img1)))
  (at 330 (image_available img2))
  (at 338 (not (image_available img2)))
  (at 231 (image_available img3))
  (at 239 (not (image_available img3)))
  (at 304 (image_available img4))
  (at 312 (not (image_available img4)))
  (at 66 (image_available img5))
  (at 74 (not (image_available img5)))
  (at 529 (image_available img1))
  (at 537 (not (image_available img1)))
  (at 690 (image_available img2))
  (at 698 (not (image_available img2)))
  (at 591 (image_available img3))
  (at 599 (not (image_available img3)))
  (at 664 (image_available img4))
  (at 672 (not (image_available img4)))
  (at 426 (image_available img5))
  (at 434 (not (image_available img5)))
  (at 889 (image_available img1))
  (at 897 (not (image_available img1)))
  (at 1050 (image_available img2))
  (at 1058 (not (image_available img2)))
  (at 951 (image_available img3))
  (at 959 (not (image_available img3)))
  (at 1024 (image_available img4))
  (at 1032 (not (image_available img4)))
  (at 786 (image_available img5))
  (at 794 (not (image_available img5)))
  (at 1249 (image_available img1))
  (at 1257 (not (image_available img1)))
  (at 1410 (image_available img2))
  (at 1418 (not (image_available img2)))
  (at 1311 (image_available img3))
  (at 1319 (not (image_available img3)))
  (at 1384 (image_available img4))
  (at 1392 (not (image_available img4)))
  (at 1146 (image_available img5))
  (at 1154 (not (image_available img5)))
  (at 141.0 (dump_available))
  (at 179.0 (not (dump_available)))
  (at 321.0 (dump_available))
  (at 359.0 (not (dump_available)))
  (at 501.0 (dump_available))
  (at 539.0 (not (dump_available)))
  (at 681.0 (dump_available))
  (at 719.0 (not (dump_available)))
  (at 861.0 (dump_available))
  (at 899.0 (not (dump_available)))
  (at 1041.0 (dump_available))
  (at 1079.0 (not (dump_available)))
  (at 1221.0 (dump_available))
  (at 1259.0 (not (dump_available)))
  (at 1401.0 (dump_available))
  (at 1439.0 (not (dump_available)))

)
(:goal (and
  (> (image_score img4) 0)
  (<= (image_score img4) 2)

(>= (total_score) 1)
))
(:metric maximize 
  (image_score img4)
)
)
