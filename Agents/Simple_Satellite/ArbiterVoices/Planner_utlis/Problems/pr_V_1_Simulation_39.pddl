(define(problem satprob)
(:domain SimpleSatellite)
(:objects
  mem0 mem1 mem2 mem3 mem4 mem5 mem6 mem7 mem8 mem9 - memory
 img1 img2 img3 img4 img5 img6 img7 img8 img9 img10 img11 img12 img13 img14 img15 - image
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
  (= (image_score img11) 0)
  (= (image_score img12) 0)
  (= (image_score img13) 0)
  (= (image_score img14) 0)
  (= (image_score img15) 0)
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



  (at 146 (image_available img1))
  (at 154 (not (image_available img1)))
  (at 320 (image_available img2))
  (at 328 (not (image_available img2)))
  (at 2 (image_available img3))
  (at 10 (not (image_available img3)))
  (at 54 (image_available img4))
  (at 62 (not (image_available img4)))
  (at 306 (image_available img5))
  (at 314 (not (image_available img5)))
  (at 37 (image_available img6))
  (at 45 (not (image_available img6)))
  (at 118 (image_available img7))
  (at 126 (not (image_available img7)))
  (at 283 (image_available img8))
  (at 291 (not (image_available img8)))
  (at 302 (image_available img9))
  (at 310 (not (image_available img9)))
  (at 146 (image_available img10))
  (at 154 (not (image_available img10)))
  (at 15 (image_available img11))
  (at 23 (not (image_available img11)))
  (at 194 (image_available img12))
  (at 202 (not (image_available img12)))
  (at 289 (image_available img13))
  (at 297 (not (image_available img13)))
  (at 176 (image_available img14))
  (at 184 (not (image_available img14)))
  (at 321 (image_available img15))
  (at 329 (not (image_available img15)))
  (at 506 (image_available img1))
  (at 514 (not (image_available img1)))
  (at 680 (image_available img2))
  (at 688 (not (image_available img2)))
  (at 362 (image_available img3))
  (at 370 (not (image_available img3)))
  (at 414 (image_available img4))
  (at 422 (not (image_available img4)))
  (at 666 (image_available img5))
  (at 674 (not (image_available img5)))
  (at 397 (image_available img6))
  (at 405 (not (image_available img6)))
  (at 478 (image_available img7))
  (at 486 (not (image_available img7)))
  (at 643 (image_available img8))
  (at 651 (not (image_available img8)))
  (at 662 (image_available img9))
  (at 670 (not (image_available img9)))
  (at 506 (image_available img10))
  (at 514 (not (image_available img10)))
  (at 375 (image_available img11))
  (at 383 (not (image_available img11)))
  (at 554 (image_available img12))
  (at 562 (not (image_available img12)))
  (at 649 (image_available img13))
  (at 657 (not (image_available img13)))
  (at 536 (image_available img14))
  (at 544 (not (image_available img14)))
  (at 681 (image_available img15))
  (at 689 (not (image_available img15)))
  (at 866 (image_available img1))
  (at 874 (not (image_available img1)))
  (at 1040 (image_available img2))
  (at 1048 (not (image_available img2)))
  (at 722 (image_available img3))
  (at 730 (not (image_available img3)))
  (at 774 (image_available img4))
  (at 782 (not (image_available img4)))
  (at 1026 (image_available img5))
  (at 1034 (not (image_available img5)))
  (at 757 (image_available img6))
  (at 765 (not (image_available img6)))
  (at 838 (image_available img7))
  (at 846 (not (image_available img7)))
  (at 1003 (image_available img8))
  (at 1011 (not (image_available img8)))
  (at 1022 (image_available img9))
  (at 1030 (not (image_available img9)))
  (at 866 (image_available img10))
  (at 874 (not (image_available img10)))
  (at 735 (image_available img11))
  (at 743 (not (image_available img11)))
  (at 914 (image_available img12))
  (at 922 (not (image_available img12)))
  (at 1009 (image_available img13))
  (at 1017 (not (image_available img13)))
  (at 896 (image_available img14))
  (at 904 (not (image_available img14)))
  (at 1041 (image_available img15))
  (at 1049 (not (image_available img15)))
  (at 1226 (image_available img1))
  (at 1234 (not (image_available img1)))
  (at 1400 (image_available img2))
  (at 1408 (not (image_available img2)))
  (at 1082 (image_available img3))
  (at 1090 (not (image_available img3)))
  (at 1134 (image_available img4))
  (at 1142 (not (image_available img4)))
  (at 1386 (image_available img5))
  (at 1394 (not (image_available img5)))
  (at 1117 (image_available img6))
  (at 1125 (not (image_available img6)))
  (at 1198 (image_available img7))
  (at 1206 (not (image_available img7)))
  (at 1363 (image_available img8))
  (at 1371 (not (image_available img8)))
  (at 1382 (image_available img9))
  (at 1390 (not (image_available img9)))
  (at 1226 (image_available img10))
  (at 1234 (not (image_available img10)))
  (at 1095 (image_available img11))
  (at 1103 (not (image_available img11)))
  (at 1274 (image_available img12))
  (at 1282 (not (image_available img12)))
  (at 1369 (image_available img13))
  (at 1377 (not (image_available img13)))
  (at 1256 (image_available img14))
  (at 1264 (not (image_available img14)))
  (at 1401 (image_available img15))
  (at 1409 (not (image_available img15)))
  (at 1586 (image_available img1))
  (at 1594 (not (image_available img1)))
  (at 1760 (image_available img2))
  (at 1768 (not (image_available img2)))
  (at 1442 (image_available img3))
  (at 1450 (not (image_available img3)))
  (at 1494 (image_available img4))
  (at 1502 (not (image_available img4)))
  (at 1746 (image_available img5))
  (at 1754 (not (image_available img5)))
  (at 1477 (image_available img6))
  (at 1485 (not (image_available img6)))
  (at 1558 (image_available img7))
  (at 1566 (not (image_available img7)))
  (at 1723 (image_available img8))
  (at 1731 (not (image_available img8)))
  (at 1742 (image_available img9))
  (at 1750 (not (image_available img9)))
  (at 1586 (image_available img10))
  (at 1594 (not (image_available img10)))
  (at 1455 (image_available img11))
  (at 1463 (not (image_available img11)))
  (at 1634 (image_available img12))
  (at 1642 (not (image_available img12)))
  (at 1729 (image_available img13))
  (at 1737 (not (image_available img13)))
  (at 1616 (image_available img14))
  (at 1624 (not (image_available img14)))
  (at 1761 (image_available img15))
  (at 1769 (not (image_available img15)))
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
  (> (image_score img2) 0)
  (<= (image_score img2) 2)

  (> (image_score img4) 0)
  (<= (image_score img4) 7)

  (> (image_score img7) 0)
  (<= (image_score img7) 5)

  (> (image_score img11) 0)
  (<= (image_score img11) 3)

(>= (total_score) 4)
))
(:metric maximize (+
  (image_score img2)
    (+ (image_score img4)
      (+ (image_score img7)
        (image_score img11)
      )
    )
  )
)
)
