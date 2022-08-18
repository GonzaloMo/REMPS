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
  (memory_free mem2)
  (memory_free mem3)
  (memory_free mem4)
  (memory_free mem5)
  (memory_free mem6)
  (memory_free mem7)
  (memory_free mem8)
  (memory_free mem9)



  (at 67 (image_available img1))
  (at 75 (not (image_available img1)))
  (at 35 (image_available img2))
  (at 43 (not (image_available img2)))
  (at 157 (image_available img3))
  (at 165 (not (image_available img3)))
  (at 176 (image_available img4))
  (at 184 (not (image_available img4)))
  (at 52 (image_available img5))
  (at 60 (not (image_available img5)))
  (at 427 (image_available img1))
  (at 435 (not (image_available img1)))
  (at 395 (image_available img2))
  (at 403 (not (image_available img2)))
  (at 517 (image_available img3))
  (at 525 (not (image_available img3)))
  (at 536 (image_available img4))
  (at 544 (not (image_available img4)))
  (at 412 (image_available img5))
  (at 420 (not (image_available img5)))
  (at 787 (image_available img1))
  (at 795 (not (image_available img1)))
  (at 755 (image_available img2))
  (at 763 (not (image_available img2)))
  (at 877 (image_available img3))
  (at 885 (not (image_available img3)))
  (at 896 (image_available img4))
  (at 904 (not (image_available img4)))
  (at 772 (image_available img5))
  (at 780 (not (image_available img5)))
  (at 1147 (image_available img1))
  (at 1155 (not (image_available img1)))
  (at 1115 (image_available img2))
  (at 1123 (not (image_available img2)))
  (at 1237 (image_available img3))
  (at 1245 (not (image_available img3)))
  (at 1256 (image_available img4))
  (at 1264 (not (image_available img4)))
  (at 1132 (image_available img5))
  (at 1140 (not (image_available img5)))
  (at 1507 (image_available img1))
  (at 1515 (not (image_available img1)))
  (at 1475 (image_available img2))
  (at 1483 (not (image_available img2)))
  (at 1597 (image_available img3))
  (at 1605 (not (image_available img3)))
  (at 1616 (image_available img4))
  (at 1624 (not (image_available img4)))
  (at 1492 (image_available img5))
  (at 1500 (not (image_available img5)))
  (at 1 (dump_available))
  (at 21.0 (not (dump_available)))
  (at 163.0 (dump_available))
  (at 201.0 (not (dump_available)))
  (at 343.0 (dump_available))
  (at 381.0 (not (dump_available)))
  (at 523.0 (dump_available))
  (at 561.0 (not (dump_available)))
  (at 703.0 (dump_available))
  (at 741.0 (not (dump_available)))
  (at 883.0 (dump_available))
  (at 921.0 (not (dump_available)))
  (at 1063.0 (dump_available))
  (at 1101.0 (not (dump_available)))
  (at 1243.0 (dump_available))
  (at 1281.0 (not (dump_available)))
  (at 1423.0 (dump_available))
  (at 1461.0 (not (dump_available)))
  (at 1603.0 (dump_available))
  (at 1641.0 (not (dump_available)))

)
(:goal (and
  (> (image_score img1) 0)
  (<= (image_score img1) 1)

(>= (total_score) 1)
))
(:metric maximize 
  (image_score img1)
)
)
