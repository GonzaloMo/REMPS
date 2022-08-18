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
  (memory_free mem2)
  (memory_free mem4)
  (memory_free mem5)
  (memory_free mem6)
  (memory_free mem7)
  (memory_free mem8)
  (memory_free mem9)

   (memory_taken mem0 img2)
   (memory_taken mem3 img4)

(image_analysed mem0 img2)
(image_analysed mem3 img4)

  (at 30 (image_available img1))
  (at 38 (not (image_available img1)))
  (at 63 (image_available img2))
  (at 71 (not (image_available img2)))
  (at 77 (image_available img3))
  (at 85 (not (image_available img3)))
  (at 5 (image_available img5))
  (at 13 (not (image_available img5)))
  (at 390 (image_available img1))
  (at 398 (not (image_available img1)))
  (at 423 (image_available img2))
  (at 431 (not (image_available img2)))
  (at 437 (image_available img3))
  (at 445 (not (image_available img3)))
  (at 342 (image_available img4))
  (at 350 (not (image_available img4)))
  (at 365 (image_available img5))
  (at 373 (not (image_available img5)))
  (at 146 (image_available img6))
  (at 154 (not (image_available img6)))
  (at 206 (image_available img7))
  (at 214 (not (image_available img7)))
  (at 210 (image_available img8))
  (at 218 (not (image_available img8)))
  (at 282 (image_available img9))
  (at 290 (not (image_available img9)))
  (at 152 (image_available img10))
  (at 160 (not (image_available img10)))
  (at 750 (image_available img1))
  (at 758 (not (image_available img1)))
  (at 783 (image_available img2))
  (at 791 (not (image_available img2)))
  (at 797 (image_available img3))
  (at 805 (not (image_available img3)))
  (at 702 (image_available img4))
  (at 710 (not (image_available img4)))
  (at 725 (image_available img5))
  (at 733 (not (image_available img5)))
  (at 506 (image_available img6))
  (at 514 (not (image_available img6)))
  (at 566 (image_available img7))
  (at 574 (not (image_available img7)))
  (at 570 (image_available img8))
  (at 578 (not (image_available img8)))
  (at 642 (image_available img9))
  (at 650 (not (image_available img9)))
  (at 512 (image_available img10))
  (at 520 (not (image_available img10)))
  (at 1110 (image_available img1))
  (at 1118 (not (image_available img1)))
  (at 1143 (image_available img2))
  (at 1151 (not (image_available img2)))
  (at 1157 (image_available img3))
  (at 1165 (not (image_available img3)))
  (at 1062 (image_available img4))
  (at 1070 (not (image_available img4)))
  (at 1085 (image_available img5))
  (at 1093 (not (image_available img5)))
  (at 866 (image_available img6))
  (at 874 (not (image_available img6)))
  (at 926 (image_available img7))
  (at 934 (not (image_available img7)))
  (at 930 (image_available img8))
  (at 938 (not (image_available img8)))
  (at 1002 (image_available img9))
  (at 1010 (not (image_available img9)))
  (at 872 (image_available img10))
  (at 880 (not (image_available img10)))
  (at 1470 (image_available img1))
  (at 1478 (not (image_available img1)))
  (at 1503 (image_available img2))
  (at 1511 (not (image_available img2)))
  (at 1517 (image_available img3))
  (at 1525 (not (image_available img3)))
  (at 1422 (image_available img4))
  (at 1430 (not (image_available img4)))
  (at 1445 (image_available img5))
  (at 1453 (not (image_available img5)))
  (at 1226 (image_available img6))
  (at 1234 (not (image_available img6)))
  (at 1286 (image_available img7))
  (at 1294 (not (image_available img7)))
  (at 1290 (image_available img8))
  (at 1298 (not (image_available img8)))
  (at 1362 (image_available img9))
  (at 1370 (not (image_available img9)))
  (at 1232 (image_available img10))
  (at 1240 (not (image_available img10)))
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
  (<= (image_score img2) 8)

  (> (image_score img3) 0)
  (<= (image_score img3) 2)

  (> (image_score img4) 0)
  (<= (image_score img4) 10)

  (> (image_score img7) 0)
  (<= (image_score img7) 3)

  (> (image_score img8) 0)
  (<= (image_score img8) 3)

(>= (total_score) 6)
))
(:metric maximize (+
  (image_score img2)
    (+ (image_score img3)
      (+ (image_score img4)
        (+ (image_score img7)
          (image_score img8)
        )
      )
    )
  )
)
)