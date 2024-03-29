(define(problem satprob)
(:domain SimpleSatellite)
(:objects
  mem0 mem1 mem2 mem3 mem4 mem5 mem6 mem7 mem8 mem9 - memory
 img1 img2 img3 img4 img5 img6 img7 img8 img9 img10 - image
)
(:init
  (sat_free)
  (= (image_score img1) 0)
  (= (image_score img2) 0)
  (= (image_score img3) 0)
  (= (image_score img4) 0)
  (= (image_score img5) 0)
  (= (image_score img6) 0)
  (= (image_score img7) 0)
  (= (image_score img8) 0)
  (= (image_score img9) 0)
  (= (image_score img10) 0)
  (= (total_score) 0)

  (memory_free mem0)
  (memory_free mem3)
  (memory_free mem4)
  (memory_free mem5)
  (memory_free mem6)
  (memory_free mem7)
  (memory_free mem8)
  (memory_free mem9)

   (memory_taken mem1 img8)
   (memory_taken mem2 img1)

(image_analysed mem2 img1)

  (at 35 (image_available img3))
  (at 43 (not (image_available img3)))
  (at 5 (image_available img10))
  (at 13 (not (image_available img10)))
  (at 334 (image_available img1))
  (at 342 (not (image_available img1)))
  (at 193 (image_available img2))
  (at 201 (not (image_available img2)))
  (at 395 (image_available img3))
  (at 403 (not (image_available img3)))
  (at 288 (image_available img4))
  (at 296 (not (image_available img4)))
  (at 346 (image_available img5))
  (at 354 (not (image_available img5)))
  (at 298 (image_available img6))
  (at 306 (not (image_available img6)))
  (at 150 (image_available img7))
  (at 158 (not (image_available img7)))
  (at 344 (image_available img8))
  (at 352 (not (image_available img8)))
  (at 286 (image_available img9))
  (at 294 (not (image_available img9)))
  (at 365 (image_available img10))
  (at 373 (not (image_available img10)))
  (at 694 (image_available img1))
  (at 702 (not (image_available img1)))
  (at 553 (image_available img2))
  (at 561 (not (image_available img2)))
  (at 755 (image_available img3))
  (at 763 (not (image_available img3)))
  (at 648 (image_available img4))
  (at 656 (not (image_available img4)))
  (at 706 (image_available img5))
  (at 714 (not (image_available img5)))
  (at 658 (image_available img6))
  (at 666 (not (image_available img6)))
  (at 510 (image_available img7))
  (at 518 (not (image_available img7)))
  (at 704 (image_available img8))
  (at 712 (not (image_available img8)))
  (at 646 (image_available img9))
  (at 654 (not (image_available img9)))
  (at 725 (image_available img10))
  (at 733 (not (image_available img10)))
  (at 1054 (image_available img1))
  (at 1062 (not (image_available img1)))
  (at 913 (image_available img2))
  (at 921 (not (image_available img2)))
  (at 1115 (image_available img3))
  (at 1123 (not (image_available img3)))
  (at 1008 (image_available img4))
  (at 1016 (not (image_available img4)))
  (at 1066 (image_available img5))
  (at 1074 (not (image_available img5)))
  (at 1018 (image_available img6))
  (at 1026 (not (image_available img6)))
  (at 870 (image_available img7))
  (at 878 (not (image_available img7)))
  (at 1064 (image_available img8))
  (at 1072 (not (image_available img8)))
  (at 1006 (image_available img9))
  (at 1014 (not (image_available img9)))
  (at 1085 (image_available img10))
  (at 1093 (not (image_available img10)))
  (at 1414 (image_available img1))
  (at 1422 (not (image_available img1)))
  (at 1273 (image_available img2))
  (at 1281 (not (image_available img2)))
  (at 1475 (image_available img3))
  (at 1483 (not (image_available img3)))
  (at 1368 (image_available img4))
  (at 1376 (not (image_available img4)))
  (at 1426 (image_available img5))
  (at 1434 (not (image_available img5)))
  (at 1378 (image_available img6))
  (at 1386 (not (image_available img6)))
  (at 1230 (image_available img7))
  (at 1238 (not (image_available img7)))
  (at 1424 (image_available img8))
  (at 1432 (not (image_available img8)))
  (at 1366 (image_available img9))
  (at 1374 (not (image_available img9)))
  (at 1445 (image_available img10))
  (at 1453 (not (image_available img10)))
  (at 0 (dump_available))
  (at 24.0 (not (dump_available)))
  (at 166.0 (dump_available))
  (at 204.0 (not (dump_available)))
  (at 346.0 (dump_available))
  (at 384.0 (not (dump_available)))
  (at 526.0 (dump_available))
  (at 564.0 (not (dump_available)))
  (at 706.0 (dump_available))
  (at 744.0 (not (dump_available)))
  (at 886.0 (dump_available))
  (at 924.0 (not (dump_available)))
  (at 1066.0 (dump_available))
  (at 1104.0 (not (dump_available)))
  (at 1246.0 (dump_available))
  (at 1284.0 (not (dump_available)))
  (at 1426.0 (dump_available))
  (at 1464.0 (not (dump_available)))

)
(:goal (and
  (> (image_score img9) 0)
  (<= (image_score img9) 1)

))
(:metric maximize 
  (image_score img9)
)
)
