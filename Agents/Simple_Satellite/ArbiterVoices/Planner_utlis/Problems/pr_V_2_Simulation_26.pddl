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
  (memory_free mem4)
  (memory_free mem6)
  (memory_free mem7)
  (memory_free mem8)
  (memory_free mem9)

   (memory_taken mem0 img2)
   (memory_taken mem1 img5)
   (memory_taken mem3 img3)
   (memory_taken mem5 img4)

(image_analysed mem1 img5)
(image_analysed mem3 img3)
(image_analysed mem5 img4)

  (at 44 (image_available img1))
  (at 52 (not (image_available img1)))
  (at 5 (image_available img4))
  (at 13 (not (image_available img4)))
  (at 8 (image_available img10))
  (at 16 (not (image_available img10)))
  (at 404 (image_available img1))
  (at 412 (not (image_available img1)))
  (at 233 (image_available img2))
  (at 241 (not (image_available img2)))
  (at 191 (image_available img3))
  (at 199 (not (image_available img3)))
  (at 365 (image_available img4))
  (at 373 (not (image_available img4)))
  (at 162 (image_available img5))
  (at 170 (not (image_available img5)))
  (at 152 (image_available img6))
  (at 160 (not (image_available img6)))
  (at 208 (image_available img7))
  (at 216 (not (image_available img7)))
  (at 310 (image_available img8))
  (at 318 (not (image_available img8)))
  (at 244 (image_available img9))
  (at 252 (not (image_available img9)))
  (at 368 (image_available img10))
  (at 376 (not (image_available img10)))
  (at 764 (image_available img1))
  (at 772 (not (image_available img1)))
  (at 593 (image_available img2))
  (at 601 (not (image_available img2)))
  (at 551 (image_available img3))
  (at 559 (not (image_available img3)))
  (at 725 (image_available img4))
  (at 733 (not (image_available img4)))
  (at 522 (image_available img5))
  (at 530 (not (image_available img5)))
  (at 512 (image_available img6))
  (at 520 (not (image_available img6)))
  (at 568 (image_available img7))
  (at 576 (not (image_available img7)))
  (at 670 (image_available img8))
  (at 678 (not (image_available img8)))
  (at 604 (image_available img9))
  (at 612 (not (image_available img9)))
  (at 728 (image_available img10))
  (at 736 (not (image_available img10)))
  (at 1124 (image_available img1))
  (at 1132 (not (image_available img1)))
  (at 953 (image_available img2))
  (at 961 (not (image_available img2)))
  (at 911 (image_available img3))
  (at 919 (not (image_available img3)))
  (at 1085 (image_available img4))
  (at 1093 (not (image_available img4)))
  (at 882 (image_available img5))
  (at 890 (not (image_available img5)))
  (at 872 (image_available img6))
  (at 880 (not (image_available img6)))
  (at 928 (image_available img7))
  (at 936 (not (image_available img7)))
  (at 1030 (image_available img8))
  (at 1038 (not (image_available img8)))
  (at 964 (image_available img9))
  (at 972 (not (image_available img9)))
  (at 1088 (image_available img10))
  (at 1096 (not (image_available img10)))
  (at 1484 (image_available img1))
  (at 1492 (not (image_available img1)))
  (at 1313 (image_available img2))
  (at 1321 (not (image_available img2)))
  (at 1271 (image_available img3))
  (at 1279 (not (image_available img3)))
  (at 1445 (image_available img4))
  (at 1453 (not (image_available img4)))
  (at 1242 (image_available img5))
  (at 1250 (not (image_available img5)))
  (at 1232 (image_available img6))
  (at 1240 (not (image_available img6)))
  (at 1288 (image_available img7))
  (at 1296 (not (image_available img7)))
  (at 1390 (image_available img8))
  (at 1398 (not (image_available img8)))
  (at 1324 (image_available img9))
  (at 1332 (not (image_available img9)))
  (at 1448 (image_available img10))
  (at 1456 (not (image_available img10)))
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
  (<= (image_score img2) 7)

  (> (image_score img3) 0)
  (<= (image_score img3) 1)

  (> (image_score img5) 0)
  (<= (image_score img5) 2)

(>= (total_score) 2)
))
(:metric maximize (+
  (image_score img2)
    (+ (image_score img3)
      (image_score img5)
    )
  )
)
)