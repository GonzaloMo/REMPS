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

   (memory_taken mem0 img3)

(image_analysed mem0 img3)

  (at 258 (image_available img1))
  (at 266 (not (image_available img1)))
  (at 268 (image_available img2))
  (at 276 (not (image_available img2)))
  (at 212 (image_available img3))
  (at 220 (not (image_available img3)))
  (at 330 (image_available img4))
  (at 338 (not (image_available img4)))
  (at 312 (image_available img5))
  (at 320 (not (image_available img5)))
  (at 618 (image_available img1))
  (at 626 (not (image_available img1)))
  (at 628 (image_available img2))
  (at 636 (not (image_available img2)))
  (at 572 (image_available img3))
  (at 580 (not (image_available img3)))
  (at 690 (image_available img4))
  (at 698 (not (image_available img4)))
  (at 672 (image_available img5))
  (at 680 (not (image_available img5)))
  (at 978 (image_available img1))
  (at 986 (not (image_available img1)))
  (at 988 (image_available img2))
  (at 996 (not (image_available img2)))
  (at 932 (image_available img3))
  (at 940 (not (image_available img3)))
  (at 1050 (image_available img4))
  (at 1058 (not (image_available img4)))
  (at 1032 (image_available img5))
  (at 1040 (not (image_available img5)))
  (at 1338 (image_available img1))
  (at 1346 (not (image_available img1)))
  (at 1348 (image_available img2))
  (at 1356 (not (image_available img2)))
  (at 1292 (image_available img3))
  (at 1300 (not (image_available img3)))
  (at 1410 (image_available img4))
  (at 1418 (not (image_available img4)))
  (at 1392 (image_available img5))
  (at 1400 (not (image_available img5)))
  (at 1 (dump_available))
  (at 15.0 (not (dump_available)))
  (at 157.0 (dump_available))
  (at 195.0 (not (dump_available)))
  (at 337.0 (dump_available))
  (at 375.0 (not (dump_available)))
  (at 517.0 (dump_available))
  (at 555.0 (not (dump_available)))
  (at 697.0 (dump_available))
  (at 735.0 (not (dump_available)))
  (at 877.0 (dump_available))
  (at 915.0 (not (dump_available)))
  (at 1057.0 (dump_available))
  (at 1095.0 (not (dump_available)))
  (at 1237.0 (dump_available))
  (at 1275.0 (not (dump_available)))
  (at 1417.0 (dump_available))
  (at 1455.0 (not (dump_available)))

)
(:goal (and
  (> (image_score img1) 0)
  (<= (image_score img1) 2)

  (> (image_score img2) 0)
  (<= (image_score img2) 1)

(>= (total_score) 1)
))
(:metric maximize (+
  (image_score img1)
    (image_score img2)
  )
)
)
