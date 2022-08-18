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

  (memory_free mem2)
  (memory_free mem3)
  (memory_free mem4)
  (memory_free mem5)
  (memory_free mem6)
  (memory_free mem7)
  (memory_free mem8)
  (memory_free mem9)

   (memory_taken mem0 img9)
   (memory_taken mem1 img1)

(image_analysed mem0 img9)
(image_analysed mem1 img1)

  (at 70 (image_available img2))
  (at 78 (not (image_available img2)))
  (at 156 (image_available img5))
  (at 164 (not (image_available img5)))
  (at 143 (image_available img6))
  (at 151 (not (image_available img6)))
  (at 14 (image_available img7))
  (at 22 (not (image_available img7)))
  (at 244 (image_available img8))
  (at 252 (not (image_available img8)))
  (at 8 (image_available img9))
  (at 16 (not (image_available img9)))
  (at 286 (image_available img1))
  (at 294 (not (image_available img1)))
  (at 430 (image_available img2))
  (at 438 (not (image_available img2)))
  (at 286 (image_available img3))
  (at 294 (not (image_available img3)))
  (at 312 (image_available img4))
  (at 320 (not (image_available img4)))
  (at 516 (image_available img5))
  (at 524 (not (image_available img5)))
  (at 503 (image_available img6))
  (at 511 (not (image_available img6)))
  (at 374 (image_available img7))
  (at 382 (not (image_available img7)))
  (at 604 (image_available img8))
  (at 612 (not (image_available img8)))
  (at 368 (image_available img9))
  (at 376 (not (image_available img9)))
  (at 294 (image_available img10))
  (at 302 (not (image_available img10)))
  (at 646 (image_available img1))
  (at 654 (not (image_available img1)))
  (at 790 (image_available img2))
  (at 798 (not (image_available img2)))
  (at 646 (image_available img3))
  (at 654 (not (image_available img3)))
  (at 672 (image_available img4))
  (at 680 (not (image_available img4)))
  (at 876 (image_available img5))
  (at 884 (not (image_available img5)))
  (at 863 (image_available img6))
  (at 871 (not (image_available img6)))
  (at 734 (image_available img7))
  (at 742 (not (image_available img7)))
  (at 964 (image_available img8))
  (at 972 (not (image_available img8)))
  (at 728 (image_available img9))
  (at 736 (not (image_available img9)))
  (at 654 (image_available img10))
  (at 662 (not (image_available img10)))
  (at 1006 (image_available img1))
  (at 1014 (not (image_available img1)))
  (at 1150 (image_available img2))
  (at 1158 (not (image_available img2)))
  (at 1006 (image_available img3))
  (at 1014 (not (image_available img3)))
  (at 1032 (image_available img4))
  (at 1040 (not (image_available img4)))
  (at 1236 (image_available img5))
  (at 1244 (not (image_available img5)))
  (at 1223 (image_available img6))
  (at 1231 (not (image_available img6)))
  (at 1094 (image_available img7))
  (at 1102 (not (image_available img7)))
  (at 1324 (image_available img8))
  (at 1332 (not (image_available img8)))
  (at 1088 (image_available img9))
  (at 1096 (not (image_available img9)))
  (at 1014 (image_available img10))
  (at 1022 (not (image_available img10)))
  (at 1366 (image_available img1))
  (at 1374 (not (image_available img1)))
  (at 1510 (image_available img2))
  (at 1518 (not (image_available img2)))
  (at 1366 (image_available img3))
  (at 1374 (not (image_available img3)))
  (at 1392 (image_available img4))
  (at 1400 (not (image_available img4)))
  (at 1596 (image_available img5))
  (at 1604 (not (image_available img5)))
  (at 1583 (image_available img6))
  (at 1591 (not (image_available img6)))
  (at 1454 (image_available img7))
  (at 1462 (not (image_available img7)))
  (at 1684 (image_available img8))
  (at 1692 (not (image_available img8)))
  (at 1448 (image_available img9))
  (at 1456 (not (image_available img9)))
  (at 1374 (image_available img10))
  (at 1382 (not (image_available img10)))
  (at 1 (dump_available))
  (at 26.0 (not (dump_available)))
  (at 168.0 (dump_available))
  (at 206.0 (not (dump_available)))
  (at 348.0 (dump_available))
  (at 386.0 (not (dump_available)))
  (at 528.0 (dump_available))
  (at 566.0 (not (dump_available)))
  (at 708.0 (dump_available))
  (at 746.0 (not (dump_available)))
  (at 888.0 (dump_available))
  (at 926.0 (not (dump_available)))
  (at 1068.0 (dump_available))
  (at 1106.0 (not (dump_available)))
  (at 1248.0 (dump_available))
  (at 1286.0 (not (dump_available)))
  (at 1428.0 (dump_available))
  (at 1466.0 (not (dump_available)))
  (at 1608.0 (dump_available))
  (at 1646.0 (not (dump_available)))

)
(:goal (and
  (> (image_score img4) 0)
  (<= (image_score img4) 1)

(>= (total_score) 1)
))
(:metric maximize 
  (image_score img4)
)
)
