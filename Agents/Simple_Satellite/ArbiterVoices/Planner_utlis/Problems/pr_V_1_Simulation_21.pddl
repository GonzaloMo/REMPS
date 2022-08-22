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
  (memory_free mem1)
  (memory_free mem2)
  (memory_free mem3)
  (memory_free mem5)
  (memory_free mem6)
  (memory_free mem7)
  (memory_free mem8)
  (memory_free mem9)

   (memory_taken mem4 img5)

(image_analysed mem4 img5)

  (at 35 (image_available img3))
  (at 43 (not (image_available img3)))
  (at 11 (image_available img6))
  (at 19 (not (image_available img6)))
  (at 243 (image_available img1))
  (at 251 (not (image_available img1)))
  (at 88 (image_available img2))
  (at 96 (not (image_available img2)))
  (at 395 (image_available img3))
  (at 403 (not (image_available img3)))
  (at 289 (image_available img4))
  (at 297 (not (image_available img4)))
  (at 301 (image_available img5))
  (at 309 (not (image_available img5)))
  (at 371 (image_available img6))
  (at 379 (not (image_available img6)))
  (at 110 (image_available img7))
  (at 118 (not (image_available img7)))
  (at 298 (image_available img8))
  (at 306 (not (image_available img8)))
  (at 329 (image_available img9))
  (at 337 (not (image_available img9)))
  (at 133 (image_available img10))
  (at 141 (not (image_available img10)))
  (at 603 (image_available img1))
  (at 611 (not (image_available img1)))
  (at 448 (image_available img2))
  (at 456 (not (image_available img2)))
  (at 755 (image_available img3))
  (at 763 (not (image_available img3)))
  (at 649 (image_available img4))
  (at 657 (not (image_available img4)))
  (at 661 (image_available img5))
  (at 669 (not (image_available img5)))
  (at 731 (image_available img6))
  (at 739 (not (image_available img6)))
  (at 470 (image_available img7))
  (at 478 (not (image_available img7)))
  (at 658 (image_available img8))
  (at 666 (not (image_available img8)))
  (at 689 (image_available img9))
  (at 697 (not (image_available img9)))
  (at 493 (image_available img10))
  (at 501 (not (image_available img10)))
  (at 963 (image_available img1))
  (at 971 (not (image_available img1)))
  (at 808 (image_available img2))
  (at 816 (not (image_available img2)))
  (at 1115 (image_available img3))
  (at 1123 (not (image_available img3)))
  (at 1009 (image_available img4))
  (at 1017 (not (image_available img4)))
  (at 1021 (image_available img5))
  (at 1029 (not (image_available img5)))
  (at 1091 (image_available img6))
  (at 1099 (not (image_available img6)))
  (at 830 (image_available img7))
  (at 838 (not (image_available img7)))
  (at 1018 (image_available img8))
  (at 1026 (not (image_available img8)))
  (at 1049 (image_available img9))
  (at 1057 (not (image_available img9)))
  (at 853 (image_available img10))
  (at 861 (not (image_available img10)))
  (at 1323 (image_available img1))
  (at 1331 (not (image_available img1)))
  (at 1168 (image_available img2))
  (at 1176 (not (image_available img2)))
  (at 1475 (image_available img3))
  (at 1483 (not (image_available img3)))
  (at 1369 (image_available img4))
  (at 1377 (not (image_available img4)))
  (at 1381 (image_available img5))
  (at 1389 (not (image_available img5)))
  (at 1451 (image_available img6))
  (at 1459 (not (image_available img6)))
  (at 1190 (image_available img7))
  (at 1198 (not (image_available img7)))
  (at 1378 (image_available img8))
  (at 1386 (not (image_available img8)))
  (at 1409 (image_available img9))
  (at 1417 (not (image_available img9)))
  (at 1213 (image_available img10))
  (at 1221 (not (image_available img10)))
  (at 1 (dump_available))
  (at 5.0 (not (dump_available)))
  (at 147.0 (dump_available))
  (at 185.0 (not (dump_available)))
  (at 327.0 (dump_available))
  (at 365.0 (not (dump_available)))
  (at 507.0 (dump_available))
  (at 545.0 (not (dump_available)))
  (at 687.0 (dump_available))
  (at 725.0 (not (dump_available)))
  (at 867.0 (dump_available))
  (at 905.0 (not (dump_available)))
  (at 1047.0 (dump_available))
  (at 1085.0 (not (dump_available)))
  (at 1227.0 (dump_available))
  (at 1265.0 (not (dump_available)))
  (at 1407.0 (dump_available))
  (at 1445.0 (not (dump_available)))

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
