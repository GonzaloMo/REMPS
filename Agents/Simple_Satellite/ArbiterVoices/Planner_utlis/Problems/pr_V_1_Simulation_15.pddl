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

   (memory_taken mem0 img3)
   (memory_taken mem1 img2)

(image_analysed mem0 img3)
(image_analysed mem1 img2)

  (at 49 (image_available img2))
  (at 57 (not (image_available img2)))
  (at 299 (image_available img1))
  (at 307 (not (image_available img1)))
  (at 409 (image_available img2))
  (at 417 (not (image_available img2)))
  (at 288 (image_available img3))
  (at 296 (not (image_available img3)))
  (at 114 (image_available img4))
  (at 122 (not (image_available img4)))
  (at 312 (image_available img5))
  (at 320 (not (image_available img5)))
  (at 659 (image_available img1))
  (at 667 (not (image_available img1)))
  (at 769 (image_available img2))
  (at 777 (not (image_available img2)))
  (at 648 (image_available img3))
  (at 656 (not (image_available img3)))
  (at 474 (image_available img4))
  (at 482 (not (image_available img4)))
  (at 672 (image_available img5))
  (at 680 (not (image_available img5)))
  (at 1019 (image_available img1))
  (at 1027 (not (image_available img1)))
  (at 1129 (image_available img2))
  (at 1137 (not (image_available img2)))
  (at 1008 (image_available img3))
  (at 1016 (not (image_available img3)))
  (at 834 (image_available img4))
  (at 842 (not (image_available img4)))
  (at 1032 (image_available img5))
  (at 1040 (not (image_available img5)))
  (at 1379 (image_available img1))
  (at 1387 (not (image_available img1)))
  (at 1489 (image_available img2))
  (at 1497 (not (image_available img2)))
  (at 1368 (image_available img3))
  (at 1376 (not (image_available img3)))
  (at 1194 (image_available img4))
  (at 1202 (not (image_available img4)))
  (at 1392 (image_available img5))
  (at 1400 (not (image_available img5)))
  (at 1 (dump_available))
  (at 25.0 (not (dump_available)))
  (at 167.0 (dump_available))
  (at 205.0 (not (dump_available)))
  (at 347.0 (dump_available))
  (at 385.0 (not (dump_available)))
  (at 527.0 (dump_available))
  (at 565.0 (not (dump_available)))
  (at 707.0 (dump_available))
  (at 745.0 (not (dump_available)))
  (at 887.0 (dump_available))
  (at 925.0 (not (dump_available)))
  (at 1067.0 (dump_available))
  (at 1105.0 (not (dump_available)))
  (at 1247.0 (dump_available))
  (at 1285.0 (not (dump_available)))
  (at 1427.0 (dump_available))
  (at 1465.0 (not (dump_available)))

)
(:goal (and
  (> (image_score img5) 0)
  (<= (image_score img5) 11)

(>= (total_score) 3)
))
(:metric maximize 
  (image_score img5)
)
)
