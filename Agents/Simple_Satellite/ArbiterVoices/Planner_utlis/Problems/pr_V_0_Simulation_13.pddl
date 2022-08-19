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



  (at 180 (image_available img1))
  (at 188 (not (image_available img1)))
  (at 143 (image_available img2))
  (at 151 (not (image_available img2)))
  (at 314 (image_available img3))
  (at 322 (not (image_available img3)))
  (at 335 (image_available img4))
  (at 343 (not (image_available img4)))
  (at 101 (image_available img5))
  (at 109 (not (image_available img5)))
  (at 540 (image_available img1))
  (at 548 (not (image_available img1)))
  (at 503 (image_available img2))
  (at 511 (not (image_available img2)))
  (at 674 (image_available img3))
  (at 682 (not (image_available img3)))
  (at 695 (image_available img4))
  (at 703 (not (image_available img4)))
  (at 461 (image_available img5))
  (at 469 (not (image_available img5)))
  (at 900 (image_available img1))
  (at 908 (not (image_available img1)))
  (at 863 (image_available img2))
  (at 871 (not (image_available img2)))
  (at 1034 (image_available img3))
  (at 1042 (not (image_available img3)))
  (at 1055 (image_available img4))
  (at 1063 (not (image_available img4)))
  (at 821 (image_available img5))
  (at 829 (not (image_available img5)))
  (at 1260 (image_available img1))
  (at 1268 (not (image_available img1)))
  (at 1223 (image_available img2))
  (at 1231 (not (image_available img2)))
  (at 1394 (image_available img3))
  (at 1402 (not (image_available img3)))
  (at 1415 (image_available img4))
  (at 1423 (not (image_available img4)))
  (at 1181 (image_available img5))
  (at 1189 (not (image_available img5)))
  (at 1620 (image_available img1))
  (at 1628 (not (image_available img1)))
  (at 1583 (image_available img2))
  (at 1591 (not (image_available img2)))
  (at 1754 (image_available img3))
  (at 1762 (not (image_available img3)))
  (at 1775 (image_available img4))
  (at 1783 (not (image_available img4)))
  (at 1541 (image_available img5))
  (at 1549 (not (image_available img5)))
  (at 76.0 (dump_available))
  (at 114.0 (not (dump_available)))
  (at 256.0 (dump_available))
  (at 294.0 (not (dump_available)))
  (at 436.0 (dump_available))
  (at 474.0 (not (dump_available)))
  (at 616.0 (dump_available))
  (at 654.0 (not (dump_available)))
  (at 796.0 (dump_available))
  (at 834.0 (not (dump_available)))
  (at 976.0 (dump_available))
  (at 1014.0 (not (dump_available)))
  (at 1156.0 (dump_available))
  (at 1194.0 (not (dump_available)))
  (at 1336.0 (dump_available))
  (at 1374.0 (not (dump_available)))
  (at 1516.0 (dump_available))
  (at 1554.0 (not (dump_available)))
  (at 1696.0 (dump_available))
  (at 1734.0 (not (dump_available)))

)
(:goal (and
  (> (image_score img1) 0)
  (<= (image_score img1) 1)

  (> (image_score img3) 0)
  (<= (image_score img3) 4)

  (> (image_score img4) 0)
  (<= (image_score img4) 1)

(>= (total_score) 2)
))
(:metric maximize (+
  (image_score img1)
    (+ (image_score img3)
      (image_score img4)
    )
  )
)
)
