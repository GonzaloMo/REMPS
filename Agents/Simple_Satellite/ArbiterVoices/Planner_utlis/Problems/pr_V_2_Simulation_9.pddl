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
  (memory_free mem1)
  (memory_free mem3)
  (memory_free mem4)
  (memory_free mem5)
  (memory_free mem6)
  (memory_free mem7)
  (memory_free mem8)
  (memory_free mem9)

   (memory_taken mem2 img2)

(image_analysed mem2 img2)

  (at 15 (image_available img4))
  (at 23 (not (image_available img4)))
  (at 272 (image_available img1))
  (at 280 (not (image_available img1)))
  (at 296 (image_available img2))
  (at 304 (not (image_available img2)))
  (at 89 (image_available img3))
  (at 97 (not (image_available img3)))
  (at 375 (image_available img4))
  (at 383 (not (image_available img4)))
  (at 251 (image_available img5))
  (at 259 (not (image_available img5)))
  (at 632 (image_available img1))
  (at 640 (not (image_available img1)))
  (at 656 (image_available img2))
  (at 664 (not (image_available img2)))
  (at 449 (image_available img3))
  (at 457 (not (image_available img3)))
  (at 735 (image_available img4))
  (at 743 (not (image_available img4)))
  (at 611 (image_available img5))
  (at 619 (not (image_available img5)))
  (at 992 (image_available img1))
  (at 1000 (not (image_available img1)))
  (at 1016 (image_available img2))
  (at 1024 (not (image_available img2)))
  (at 809 (image_available img3))
  (at 817 (not (image_available img3)))
  (at 1095 (image_available img4))
  (at 1103 (not (image_available img4)))
  (at 971 (image_available img5))
  (at 979 (not (image_available img5)))
  (at 1352 (image_available img1))
  (at 1360 (not (image_available img1)))
  (at 1376 (image_available img2))
  (at 1384 (not (image_available img2)))
  (at 1169 (image_available img3))
  (at 1177 (not (image_available img3)))
  (at 1455 (image_available img4))
  (at 1463 (not (image_available img4)))
  (at 1331 (image_available img5))
  (at 1339 (not (image_available img5)))
  (at 1 (dump_available))
  (at 5.0 (not (dump_available)))
  (at 147.0 (dump_available))
  (at 185.0 (not (dump_available)))
  (at 327.0 (dump_available))
  (at 365.0 (not (dump_available)))
  (at 507.0 (dump_available))
  (at 545.0 (not (dump_available)))
  (at 687.0 (dump_available))
  (at 725.0 (not (dump_available)))
  (at 867.0 (dump_available))
  (at 905.0 (not (dump_available)))
  (at 1047.0 (dump_available))
  (at 1085.0 (not (dump_available)))
  (at 1227.0 (dump_available))
  (at 1265.0 (not (dump_available)))
  (at 1407.0 (dump_available))
  (at 1445.0 (not (dump_available)))

)
(:goal (and
  (> (image_score img2) 0)
  (<= (image_score img2) 1)

  (> (image_score img5) 0)
  (<= (image_score img5) 1)

(>= (total_score) 1)
))
(:metric maximize (+
  (image_score img2)
    (image_score img5)
  )
)
)
