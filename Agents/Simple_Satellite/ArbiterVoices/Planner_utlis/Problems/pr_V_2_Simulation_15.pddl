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

  (memory_free mem6)
  (memory_free mem7)
  (memory_free mem8)
  (memory_free mem9)

   (memory_taken mem0 img3)
   (memory_taken mem1 img5)
   (memory_taken mem2 img1)
   (memory_taken mem3 img4)
   (memory_taken mem4 img2)
   (memory_taken mem5 img3)

(image_analysed mem0 img3)
(image_analysed mem1 img5)
(image_analysed mem2 img1)
(image_analysed mem3 img4)
(image_analysed mem4 img2)
(image_analysed mem5 img3)

  (at 334 (image_available img1))
  (at 342 (not (image_available img1)))
  (at 209 (image_available img2))
  (at 217 (not (image_available img2)))
  (at 298 (image_available img3))
  (at 306 (not (image_available img3)))
  (at 167 (image_available img4))
  (at 175 (not (image_available img4)))
  (at 111 (image_available img5))
  (at 119 (not (image_available img5)))
  (at 694 (image_available img1))
  (at 702 (not (image_available img1)))
  (at 569 (image_available img2))
  (at 577 (not (image_available img2)))
  (at 658 (image_available img3))
  (at 666 (not (image_available img3)))
  (at 527 (image_available img4))
  (at 535 (not (image_available img4)))
  (at 471 (image_available img5))
  (at 479 (not (image_available img5)))
  (at 1054 (image_available img1))
  (at 1062 (not (image_available img1)))
  (at 929 (image_available img2))
  (at 937 (not (image_available img2)))
  (at 1018 (image_available img3))
  (at 1026 (not (image_available img3)))
  (at 887 (image_available img4))
  (at 895 (not (image_available img4)))
  (at 831 (image_available img5))
  (at 839 (not (image_available img5)))
  (at 1414 (image_available img1))
  (at 1422 (not (image_available img1)))
  (at 1289 (image_available img2))
  (at 1297 (not (image_available img2)))
  (at 1378 (image_available img3))
  (at 1386 (not (image_available img3)))
  (at 1247 (image_available img4))
  (at 1255 (not (image_available img4)))
  (at 1191 (image_available img5))
  (at 1199 (not (image_available img5)))
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
  (<= (image_score img1) 12)

  (> (image_score img2) 0)
  (<= (image_score img2) 9)

  (> (image_score img3) 0)
  (<= (image_score img3) 2)

(>= (total_score) 5)
))
(:metric maximize (+
  (image_score img1)
    (+ (image_score img2)
      (image_score img3)
    )
  )
)
)
