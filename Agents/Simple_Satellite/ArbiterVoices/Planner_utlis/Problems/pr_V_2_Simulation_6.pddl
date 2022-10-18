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
   (memory_taken mem3 img5)

(image_analysed mem1 img1)
(image_analysed mem3 img5)

  (at 64 (image_available img1))
  (at 72 (not (image_available img1)))
  (at 221 (image_available img3))
  (at 229 (not (image_available img3)))
  (at 72 (image_available img4))
  (at 80 (not (image_available img4)))
  (at 424 (image_available img1))
  (at 432 (not (image_available img1)))
  (at 282 (image_available img2))
  (at 290 (not (image_available img2)))
  (at 581 (image_available img3))
  (at 589 (not (image_available img3)))
  (at 432 (image_available img4))
  (at 440 (not (image_available img4)))
  (at 285 (image_available img5))
  (at 293 (not (image_available img5)))
  (at 784 (image_available img1))
  (at 792 (not (image_available img1)))
  (at 642 (image_available img2))
  (at 650 (not (image_available img2)))
  (at 941 (image_available img3))
  (at 949 (not (image_available img3)))
  (at 792 (image_available img4))
  (at 800 (not (image_available img4)))
  (at 645 (image_available img5))
  (at 653 (not (image_available img5)))
  (at 1144 (image_available img1))
  (at 1152 (not (image_available img1)))
  (at 1002 (image_available img2))
  (at 1010 (not (image_available img2)))
  (at 1301 (image_available img3))
  (at 1309 (not (image_available img3)))
  (at 1152 (image_available img4))
  (at 1160 (not (image_available img4)))
  (at 1005 (image_available img5))
  (at 1013 (not (image_available img5)))
  (at 1504 (image_available img1))
  (at 1512 (not (image_available img1)))
  (at 1362 (image_available img2))
  (at 1370 (not (image_available img2)))
  (at 1661 (image_available img3))
  (at 1669 (not (image_available img3)))
  (at 1512 (image_available img4))
  (at 1520 (not (image_available img4)))
  (at 1365 (image_available img5))
  (at 1373 (not (image_available img5)))
  (at 1 (dump_available))
  (at 2.0 (not (dump_available)))
  (at 144.0 (dump_available))
  (at 182.0 (not (dump_available)))
  (at 324.0 (dump_available))
  (at 362.0 (not (dump_available)))
  (at 504.0 (dump_available))
  (at 542.0 (not (dump_available)))
  (at 684.0 (dump_available))
  (at 722.0 (not (dump_available)))
  (at 864.0 (dump_available))
  (at 902.0 (not (dump_available)))
  (at 1044.0 (dump_available))
  (at 1082.0 (not (dump_available)))
  (at 1224.0 (dump_available))
  (at 1262.0 (not (dump_available)))
  (at 1404.0 (dump_available))
  (at 1442.0 (not (dump_available)))
  (at 1584.0 (dump_available))
  (at 1622.0 (not (dump_available)))

)
(:goal (and
  (> (image_score img2) 0)
  (<= (image_score img2) 7)

(>= (total_score) 2)
))
(:metric maximize 
  (image_score img2)
)
)
