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

  (memory_free mem1)
  (memory_free mem4)
  (memory_free mem6)
  (memory_free mem7)
  (memory_free mem8)
  (memory_free mem9)

   (memory_taken mem0 img4)
   (memory_taken mem2 img9)
   (memory_taken mem3 img2)
   (memory_taken mem5 img10)

(image_analysed mem0 img4)
(image_analysed mem2 img9)
(image_analysed mem3 img2)

  (at 3 (image_available img1))
  (at 11 (not (image_available img1)))
  (at 37 (image_available img3))
  (at 45 (not (image_available img3)))
  (at 56 (image_available img5))
  (at 64 (not (image_available img5)))
  (at 18 (image_available img10))
  (at 26 (not (image_available img10)))
  (at 363 (image_available img1))
  (at 371 (not (image_available img1)))
  (at 269 (image_available img2))
  (at 277 (not (image_available img2)))
  (at 397 (image_available img3))
  (at 405 (not (image_available img3)))
  (at 313 (image_available img4))
  (at 321 (not (image_available img4)))
  (at 416 (image_available img5))
  (at 424 (not (image_available img5)))
  (at 187 (image_available img6))
  (at 195 (not (image_available img6)))
  (at 116 (image_available img7))
  (at 124 (not (image_available img7)))
  (at 278 (image_available img8))
  (at 286 (not (image_available img8)))
  (at 273 (image_available img9))
  (at 281 (not (image_available img9)))
  (at 378 (image_available img10))
  (at 386 (not (image_available img10)))
  (at 723 (image_available img1))
  (at 731 (not (image_available img1)))
  (at 629 (image_available img2))
  (at 637 (not (image_available img2)))
  (at 757 (image_available img3))
  (at 765 (not (image_available img3)))
  (at 673 (image_available img4))
  (at 681 (not (image_available img4)))
  (at 776 (image_available img5))
  (at 784 (not (image_available img5)))
  (at 547 (image_available img6))
  (at 555 (not (image_available img6)))
  (at 476 (image_available img7))
  (at 484 (not (image_available img7)))
  (at 638 (image_available img8))
  (at 646 (not (image_available img8)))
  (at 633 (image_available img9))
  (at 641 (not (image_available img9)))
  (at 738 (image_available img10))
  (at 746 (not (image_available img10)))
  (at 1083 (image_available img1))
  (at 1091 (not (image_available img1)))
  (at 989 (image_available img2))
  (at 997 (not (image_available img2)))
  (at 1117 (image_available img3))
  (at 1125 (not (image_available img3)))
  (at 1033 (image_available img4))
  (at 1041 (not (image_available img4)))
  (at 1136 (image_available img5))
  (at 1144 (not (image_available img5)))
  (at 907 (image_available img6))
  (at 915 (not (image_available img6)))
  (at 836 (image_available img7))
  (at 844 (not (image_available img7)))
  (at 998 (image_available img8))
  (at 1006 (not (image_available img8)))
  (at 993 (image_available img9))
  (at 1001 (not (image_available img9)))
  (at 1098 (image_available img10))
  (at 1106 (not (image_available img10)))
  (at 1443 (image_available img1))
  (at 1451 (not (image_available img1)))
  (at 1349 (image_available img2))
  (at 1357 (not (image_available img2)))
  (at 1477 (image_available img3))
  (at 1485 (not (image_available img3)))
  (at 1393 (image_available img4))
  (at 1401 (not (image_available img4)))
  (at 1496 (image_available img5))
  (at 1504 (not (image_available img5)))
  (at 1267 (image_available img6))
  (at 1275 (not (image_available img6)))
  (at 1196 (image_available img7))
  (at 1204 (not (image_available img7)))
  (at 1358 (image_available img8))
  (at 1366 (not (image_available img8)))
  (at 1353 (image_available img9))
  (at 1361 (not (image_available img9)))
  (at 1458 (image_available img10))
  (at 1466 (not (image_available img10)))
  (at 1 (dump_available))
  (at 36.0 (not (dump_available)))
  (at 178.0 (dump_available))
  (at 216.0 (not (dump_available)))
  (at 358.0 (dump_available))
  (at 396.0 (not (dump_available)))
  (at 538.0 (dump_available))
  (at 576.0 (not (dump_available)))
  (at 718.0 (dump_available))
  (at 756.0 (not (dump_available)))
  (at 898.0 (dump_available))
  (at 936.0 (not (dump_available)))
  (at 1078.0 (dump_available))
  (at 1116.0 (not (dump_available)))
  (at 1258.0 (dump_available))
  (at 1296.0 (not (dump_available)))
  (at 1438.0 (dump_available))
  (at 1476.0 (not (dump_available)))

)
(:goal (and
  (> (image_score img2) 0)
  (<= (image_score img2) 1)

  (> (image_score img10) 0)
  (<= (image_score img10) 3)

(>= (total_score) 1)
))
(:metric maximize (+
  (image_score img2)
    (image_score img10)
  )
)
)
