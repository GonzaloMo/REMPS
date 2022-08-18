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

  (memory_free mem4)
  (memory_free mem5)
  (memory_free mem6)
  (memory_free mem7)
  (memory_free mem8)
  (memory_free mem9)

   (memory_taken mem0 img4)
   (memory_taken mem1 img5)
   (memory_taken mem2 img2)
   (memory_taken mem3 img1)

(image_analysed mem0 img4)
(image_analysed mem1 img5)
(image_analysed mem3 img1)

  (at 176 (image_available img4))
  (at 184 (not (image_available img4)))
  (at 224 (image_available img5))
  (at 232 (not (image_available img5)))
  (at 312 (image_available img1))
  (at 320 (not (image_available img1)))
  (at 301 (image_available img2))
  (at 309 (not (image_available img2)))
  (at 260 (image_available img3))
  (at 268 (not (image_available img3)))
  (at 536 (image_available img4))
  (at 544 (not (image_available img4)))
  (at 584 (image_available img5))
  (at 592 (not (image_available img5)))
  (at 672 (image_available img1))
  (at 680 (not (image_available img1)))
  (at 661 (image_available img2))
  (at 669 (not (image_available img2)))
  (at 620 (image_available img3))
  (at 628 (not (image_available img3)))
  (at 896 (image_available img4))
  (at 904 (not (image_available img4)))
  (at 944 (image_available img5))
  (at 952 (not (image_available img5)))
  (at 1032 (image_available img1))
  (at 1040 (not (image_available img1)))
  (at 1021 (image_available img2))
  (at 1029 (not (image_available img2)))
  (at 980 (image_available img3))
  (at 988 (not (image_available img3)))
  (at 1256 (image_available img4))
  (at 1264 (not (image_available img4)))
  (at 1304 (image_available img5))
  (at 1312 (not (image_available img5)))
  (at 1392 (image_available img1))
  (at 1400 (not (image_available img1)))
  (at 1381 (image_available img2))
  (at 1389 (not (image_available img2)))
  (at 1340 (image_available img3))
  (at 1348 (not (image_available img3)))
  (at 1616 (image_available img4))
  (at 1624 (not (image_available img4)))
  (at 1664 (image_available img5))
  (at 1672 (not (image_available img5)))
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
  (at 1587.0 (dump_available))
  (at 1625.0 (not (dump_available)))

)
(:goal (and
  (> (image_score img1) 0)
  (<= (image_score img1) 4)

(>= (total_score) 1)
))
(:metric maximize 
  (image_score img1)
)
)
