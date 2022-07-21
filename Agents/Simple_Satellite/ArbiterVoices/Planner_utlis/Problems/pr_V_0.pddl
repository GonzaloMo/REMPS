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
  (memory_free mem4)
  (memory_free mem5)
  (memory_free mem6)
  (memory_free mem7)
  (memory_free mem8)
  (memory_free mem9)



  (at 209 (image_available img1))
  (at 217 (not (image_available img1)))
  (at 100 (image_available img2))
  (at 108 (not (image_available img2)))
  (at 324 (image_available img3))
  (at 332 (not (image_available img3)))
  (at 106 (image_available img4))
  (at 114 (not (image_available img4)))
  (at 147 (image_available img5))
  (at 155 (not (image_available img5)))
  (at 241 (image_available img6))
  (at 249 (not (image_available img6)))
  (at 96 (image_available img7))
  (at 104 (not (image_available img7)))
  (at 347 (image_available img8))
  (at 355 (not (image_available img8)))
  (at 215 (image_available img9))
  (at 223 (not (image_available img9)))
  (at 333 (image_available img10))
  (at 341 (not (image_available img10)))
  (at 569 (image_available img1))
  (at 577 (not (image_available img1)))
  (at 460 (image_available img2))
  (at 468 (not (image_available img2)))
  (at 684 (image_available img3))
  (at 692 (not (image_available img3)))
  (at 466 (image_available img4))
  (at 474 (not (image_available img4)))
  (at 507 (image_available img5))
  (at 515 (not (image_available img5)))
  (at 601 (image_available img6))
  (at 609 (not (image_available img6)))
  (at 456 (image_available img7))
  (at 464 (not (image_available img7)))
  (at 707 (image_available img8))
  (at 715 (not (image_available img8)))
  (at 575 (image_available img9))
  (at 583 (not (image_available img9)))
  (at 693 (image_available img10))
  (at 701 (not (image_available img10)))
  (at 929 (image_available img1))
  (at 937 (not (image_available img1)))
  (at 820 (image_available img2))
  (at 828 (not (image_available img2)))
  (at 1044 (image_available img3))
  (at 1052 (not (image_available img3)))
  (at 826 (image_available img4))
  (at 834 (not (image_available img4)))
  (at 867 (image_available img5))
  (at 875 (not (image_available img5)))
  (at 961 (image_available img6))
  (at 969 (not (image_available img6)))
  (at 816 (image_available img7))
  (at 824 (not (image_available img7)))
  (at 1067 (image_available img8))
  (at 1075 (not (image_available img8)))
  (at 935 (image_available img9))
  (at 943 (not (image_available img9)))
  (at 1053 (image_available img10))
  (at 1061 (not (image_available img10)))
  (at 1289 (image_available img1))
  (at 1297 (not (image_available img1)))
  (at 1180 (image_available img2))
  (at 1188 (not (image_available img2)))
  (at 1404 (image_available img3))
  (at 1412 (not (image_available img3)))
  (at 1186 (image_available img4))
  (at 1194 (not (image_available img4)))
  (at 1227 (image_available img5))
  (at 1235 (not (image_available img5)))
  (at 1321 (image_available img6))
  (at 1329 (not (image_available img6)))
  (at 1176 (image_available img7))
  (at 1184 (not (image_available img7)))
  (at 1427 (image_available img8))
  (at 1435 (not (image_available img8)))
  (at 1295 (image_available img9))
  (at 1303 (not (image_available img9)))
  (at 1413 (image_available img10))
  (at 1421 (not (image_available img10)))
  (at 1649 (image_available img1))
  (at 1657 (not (image_available img1)))
  (at 1540 (image_available img2))
  (at 1548 (not (image_available img2)))
  (at 1764 (image_available img3))
  (at 1772 (not (image_available img3)))
  (at 1546 (image_available img4))
  (at 1554 (not (image_available img4)))
  (at 1587 (image_available img5))
  (at 1595 (not (image_available img5)))
  (at 1681 (image_available img6))
  (at 1689 (not (image_available img6)))
  (at 1536 (image_available img7))
  (at 1544 (not (image_available img7)))
  (at 1787 (image_available img8))
  (at 1795 (not (image_available img8)))
  (at 1655 (image_available img9))
  (at 1663 (not (image_available img9)))
  (at 1773 (image_available img10))
  (at 1781 (not (image_available img10)))
  (at 71.0 (dump_available))
  (at 109.0 (not (dump_available)))
  (at 251.0 (dump_available))
  (at 289.0 (not (dump_available)))
  (at 431.0 (dump_available))
  (at 469.0 (not (dump_available)))
  (at 611.0 (dump_available))
  (at 649.0 (not (dump_available)))
  (at 791.0 (dump_available))
  (at 829.0 (not (dump_available)))
  (at 971.0 (dump_available))
  (at 1009.0 (not (dump_available)))
  (at 1151.0 (dump_available))
  (at 1189.0 (not (dump_available)))
  (at 1331.0 (dump_available))
  (at 1369.0 (not (dump_available)))
  (at 1511.0 (dump_available))
  (at 1549.0 (not (dump_available)))
  (at 1691.0 (dump_available))
  (at 1729.0 (not (dump_available)))

)
(:goal (and
  (> (image_score img1) 0)
  (<= (image_score img1) 7)

  (> (image_score img4) 0)
  (<= (image_score img4) 11)

  (> (image_score img6) 0)
  (<= (image_score img6) 9)

))
(:metric maximize (+
  (image_score img1)
    (+ (image_score img4)
      (image_score img6)
    )
  )
)
)
