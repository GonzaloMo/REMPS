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

  (memory_free mem3)
  (memory_free mem4)
  (memory_free mem5)
  (memory_free mem6)
  (memory_free mem7)
  (memory_free mem8)
  (memory_free mem9)

   (memory_taken mem0 img4)
   (memory_taken mem1 img5)
   (memory_taken mem2 img1)

(image_analysed mem0 img4)
(image_analysed mem1 img5)
(image_analysed mem2 img1)

  (at 186 (image_available img4))
  (at 194 (not (image_available img4)))
  (at 234 (image_available img5))
  (at 242 (not (image_available img5)))
  (at 322 (image_available img1))
  (at 330 (not (image_available img1)))
  (at 311 (image_available img2))
  (at 319 (not (image_available img2)))
  (at 270 (image_available img3))
  (at 278 (not (image_available img3)))
  (at 546 (image_available img4))
  (at 554 (not (image_available img4)))
  (at 594 (image_available img5))
  (at 602 (not (image_available img5)))
  (at 682 (image_available img1))
  (at 690 (not (image_available img1)))
  (at 671 (image_available img2))
  (at 679 (not (image_available img2)))
  (at 630 (image_available img3))
  (at 638 (not (image_available img3)))
  (at 906 (image_available img4))
  (at 914 (not (image_available img4)))
  (at 954 (image_available img5))
  (at 962 (not (image_available img5)))
  (at 1042 (image_available img1))
  (at 1050 (not (image_available img1)))
  (at 1031 (image_available img2))
  (at 1039 (not (image_available img2)))
  (at 990 (image_available img3))
  (at 998 (not (image_available img3)))
  (at 1266 (image_available img4))
  (at 1274 (not (image_available img4)))
  (at 1314 (image_available img5))
  (at 1322 (not (image_available img5)))
  (at 1402 (image_available img1))
  (at 1410 (not (image_available img1)))
  (at 1391 (image_available img2))
  (at 1399 (not (image_available img2)))
  (at 1350 (image_available img3))
  (at 1358 (not (image_available img3)))
  (at 1626 (image_available img4))
  (at 1634 (not (image_available img4)))
  (at 1674 (image_available img5))
  (at 1682 (not (image_available img5)))
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
  (at 1597.0 (dump_available))
  (at 1635.0 (not (dump_available)))

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