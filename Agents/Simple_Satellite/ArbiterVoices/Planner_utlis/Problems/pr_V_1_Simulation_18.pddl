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

   (memory_taken mem0 img8)
   (memory_taken mem1 img9)

(image_analysed mem0 img8)
(image_analysed mem1 img9)

  (at 118 (image_available img2))
  (at 126 (not (image_available img2)))
  (at 165 (image_available img3))
  (at 173 (not (image_available img3)))
  (at 75 (image_available img6))
  (at 83 (not (image_available img6)))
  (at 2 (image_available img7))
  (at 10 (not (image_available img7)))
  (at 164 (image_available img8))
  (at 172 (not (image_available img8)))
  (at 192 (image_available img9))
  (at 200 (not (image_available img9)))
  (at 163 (image_available img10))
  (at 171 (not (image_available img10)))
  (at 298 (image_available img1))
  (at 306 (not (image_available img1)))
  (at 478 (image_available img2))
  (at 486 (not (image_available img2)))
  (at 525 (image_available img3))
  (at 533 (not (image_available img3)))
  (at 344 (image_available img4))
  (at 352 (not (image_available img4)))
  (at 282 (image_available img5))
  (at 290 (not (image_available img5)))
  (at 435 (image_available img6))
  (at 443 (not (image_available img6)))
  (at 362 (image_available img7))
  (at 370 (not (image_available img7)))
  (at 524 (image_available img8))
  (at 532 (not (image_available img8)))
  (at 552 (image_available img9))
  (at 560 (not (image_available img9)))
  (at 523 (image_available img10))
  (at 531 (not (image_available img10)))
  (at 658 (image_available img1))
  (at 666 (not (image_available img1)))
  (at 838 (image_available img2))
  (at 846 (not (image_available img2)))
  (at 885 (image_available img3))
  (at 893 (not (image_available img3)))
  (at 704 (image_available img4))
  (at 712 (not (image_available img4)))
  (at 642 (image_available img5))
  (at 650 (not (image_available img5)))
  (at 795 (image_available img6))
  (at 803 (not (image_available img6)))
  (at 722 (image_available img7))
  (at 730 (not (image_available img7)))
  (at 884 (image_available img8))
  (at 892 (not (image_available img8)))
  (at 912 (image_available img9))
  (at 920 (not (image_available img9)))
  (at 883 (image_available img10))
  (at 891 (not (image_available img10)))
  (at 1018 (image_available img1))
  (at 1026 (not (image_available img1)))
  (at 1198 (image_available img2))
  (at 1206 (not (image_available img2)))
  (at 1245 (image_available img3))
  (at 1253 (not (image_available img3)))
  (at 1064 (image_available img4))
  (at 1072 (not (image_available img4)))
  (at 1002 (image_available img5))
  (at 1010 (not (image_available img5)))
  (at 1155 (image_available img6))
  (at 1163 (not (image_available img6)))
  (at 1082 (image_available img7))
  (at 1090 (not (image_available img7)))
  (at 1244 (image_available img8))
  (at 1252 (not (image_available img8)))
  (at 1272 (image_available img9))
  (at 1280 (not (image_available img9)))
  (at 1243 (image_available img10))
  (at 1251 (not (image_available img10)))
  (at 1378 (image_available img1))
  (at 1386 (not (image_available img1)))
  (at 1558 (image_available img2))
  (at 1566 (not (image_available img2)))
  (at 1605 (image_available img3))
  (at 1613 (not (image_available img3)))
  (at 1424 (image_available img4))
  (at 1432 (not (image_available img4)))
  (at 1362 (image_available img5))
  (at 1370 (not (image_available img5)))
  (at 1515 (image_available img6))
  (at 1523 (not (image_available img6)))
  (at 1442 (image_available img7))
  (at 1450 (not (image_available img7)))
  (at 1604 (image_available img8))
  (at 1612 (not (image_available img8)))
  (at 1632 (image_available img9))
  (at 1640 (not (image_available img9)))
  (at 1603 (image_available img10))
  (at 1611 (not (image_available img10)))
  (at 1 (dump_available))
  (at 2.0 (not (dump_available)))
  (at 144.0 (dump_available))
  (at 182.0 (not (dump_available)))
  (at 324.0 (dump_available))
  (at 362.0 (not (dump_available)))
  (at 504.0 (dump_available))
  (at 542.0 (not (dump_available)))
  (at 684.0 (dump_available))
  (at 722.0 (not (dump_available)))
  (at 864.0 (dump_available))
  (at 902.0 (not (dump_available)))
  (at 1044.0 (dump_available))
  (at 1082.0 (not (dump_available)))
  (at 1224.0 (dump_available))
  (at 1262.0 (not (dump_available)))
  (at 1404.0 (dump_available))
  (at 1442.0 (not (dump_available)))
  (at 1584.0 (dump_available))
  (at 1622.0 (not (dump_available)))

)
(:goal (and
  (> (image_score img1) 0)
  (<= (image_score img1) 8)

  (> (image_score img9) 0)
  (<= (image_score img9) 1)

(>= (total_score) 2)
))
(:metric maximize (+
  (image_score img1)
    (image_score img9)
  )
)
)
