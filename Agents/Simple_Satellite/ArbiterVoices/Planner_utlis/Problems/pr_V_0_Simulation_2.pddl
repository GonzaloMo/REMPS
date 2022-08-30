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
  (memory_free mem3)
  (memory_free mem4)
  (memory_free mem5)
  (memory_free mem6)
  (memory_free mem7)
  (memory_free mem8)
  (memory_free mem9)

   (memory_taken mem1 img3)


  (at 0 (image_available img2))
  (at 7 (not (image_available img2)))
  (at 205 (image_available img1))
  (at 213 (not (image_available img1)))
  (at 359 (image_available img2))
  (at 367 (not (image_available img2)))
  (at 159 (image_available img3))
  (at 167 (not (image_available img3)))
  (at 248 (image_available img4))
  (at 256 (not (image_available img4)))
  (at 118 (image_available img5))
  (at 126 (not (image_available img5)))
  (at 565 (image_available img1))
  (at 573 (not (image_available img1)))
  (at 719 (image_available img2))
  (at 727 (not (image_available img2)))
  (at 519 (image_available img3))
  (at 527 (not (image_available img3)))
  (at 608 (image_available img4))
  (at 616 (not (image_available img4)))
  (at 478 (image_available img5))
  (at 486 (not (image_available img5)))
  (at 925 (image_available img1))
  (at 933 (not (image_available img1)))
  (at 1079 (image_available img2))
  (at 1087 (not (image_available img2)))
  (at 879 (image_available img3))
  (at 887 (not (image_available img3)))
  (at 968 (image_available img4))
  (at 976 (not (image_available img4)))
  (at 838 (image_available img5))
  (at 846 (not (image_available img5)))
  (at 1285 (image_available img1))
  (at 1293 (not (image_available img1)))
  (at 1439 (image_available img2))
  (at 1447 (not (image_available img2)))
  (at 1239 (image_available img3))
  (at 1247 (not (image_available img3)))
  (at 1328 (image_available img4))
  (at 1336 (not (image_available img4)))
  (at 1198 (image_available img5))
  (at 1206 (not (image_available img5)))
  (at 1 (dump_available))
  (at 22.0 (not (dump_available)))
  (at 164.0 (dump_available))
  (at 202.0 (not (dump_available)))
  (at 344.0 (dump_available))
  (at 382.0 (not (dump_available)))
  (at 524.0 (dump_available))
  (at 562.0 (not (dump_available)))
  (at 704.0 (dump_available))
  (at 742.0 (not (dump_available)))
  (at 884.0 (dump_available))
  (at 922.0 (not (dump_available)))
  (at 1064.0 (dump_available))
  (at 1102.0 (not (dump_available)))
  (at 1244.0 (dump_available))
  (at 1282.0 (not (dump_available)))
  (at 1424.0 (dump_available))
  (at 1462.0 (not (dump_available)))

)
(:goal (and
  (> (image_score img1) 0)
  (<= (image_score img1) 3)

  (> (image_score img2) 0)
  (<= (image_score img2) 2)

  (> (image_score img4) 0)
  (<= (image_score img4) 1)

(>= (total_score) 2)
))
(:metric maximize (+
  (image_score img1)
    (+ (image_score img2)
      (image_score img4)
    )
  )
)
)
