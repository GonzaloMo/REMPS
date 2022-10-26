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



  (at 219 (image_available img1))
  (at 227 (not (image_available img1)))
  (at 115 (image_available img2))
  (at 123 (not (image_available img2)))
  (at 56 (image_available img3))
  (at 64 (not (image_available img3)))
  (at 64 (image_available img4))
  (at 72 (not (image_available img4)))
  (at 51 (image_available img5))
  (at 59 (not (image_available img5)))
  (at 152 (image_available img6))
  (at 160 (not (image_available img6)))
  (at 281 (image_available img7))
  (at 289 (not (image_available img7)))
  (at 341 (image_available img8))
  (at 349 (not (image_available img8)))
  (at 97 (image_available img9))
  (at 105 (not (image_available img9)))
  (at 210 (image_available img10))
  (at 218 (not (image_available img10)))
  (at 209 (image_available img11))
  (at 217 (not (image_available img11)))
  (at 334 (image_available img12))
  (at 342 (not (image_available img12)))
  (at 274 (image_available img13))
  (at 282 (not (image_available img13)))
  (at 32 (image_available img14))
  (at 40 (not (image_available img14)))
  (at 260 (image_available img15))
  (at 268 (not (image_available img15)))
  (at 579 (image_available img1))
  (at 587 (not (image_available img1)))
  (at 475 (image_available img2))
  (at 483 (not (image_available img2)))
  (at 416 (image_available img3))
  (at 424 (not (image_available img3)))
  (at 424 (image_available img4))
  (at 432 (not (image_available img4)))
  (at 411 (image_available img5))
  (at 419 (not (image_available img5)))
  (at 512 (image_available img6))
  (at 520 (not (image_available img6)))
  (at 641 (image_available img7))
  (at 649 (not (image_available img7)))
  (at 701 (image_available img8))
  (at 709 (not (image_available img8)))
  (at 457 (image_available img9))
  (at 465 (not (image_available img9)))
  (at 570 (image_available img10))
  (at 578 (not (image_available img10)))
  (at 569 (image_available img11))
  (at 577 (not (image_available img11)))
  (at 694 (image_available img12))
  (at 702 (not (image_available img12)))
  (at 634 (image_available img13))
  (at 642 (not (image_available img13)))
  (at 392 (image_available img14))
  (at 400 (not (image_available img14)))
  (at 620 (image_available img15))
  (at 628 (not (image_available img15)))
  (at 939 (image_available img1))
  (at 947 (not (image_available img1)))
  (at 835 (image_available img2))
  (at 843 (not (image_available img2)))
  (at 776 (image_available img3))
  (at 784 (not (image_available img3)))
  (at 784 (image_available img4))
  (at 792 (not (image_available img4)))
  (at 771 (image_available img5))
  (at 779 (not (image_available img5)))
  (at 872 (image_available img6))
  (at 880 (not (image_available img6)))
  (at 1001 (image_available img7))
  (at 1009 (not (image_available img7)))
  (at 1061 (image_available img8))
  (at 1069 (not (image_available img8)))
  (at 817 (image_available img9))
  (at 825 (not (image_available img9)))
  (at 930 (image_available img10))
  (at 938 (not (image_available img10)))
  (at 929 (image_available img11))
  (at 937 (not (image_available img11)))
  (at 1054 (image_available img12))
  (at 1062 (not (image_available img12)))
  (at 994 (image_available img13))
  (at 1002 (not (image_available img13)))
  (at 752 (image_available img14))
  (at 760 (not (image_available img14)))
  (at 980 (image_available img15))
  (at 988 (not (image_available img15)))
  (at 1299 (image_available img1))
  (at 1307 (not (image_available img1)))
  (at 1195 (image_available img2))
  (at 1203 (not (image_available img2)))
  (at 1136 (image_available img3))
  (at 1144 (not (image_available img3)))
  (at 1144 (image_available img4))
  (at 1152 (not (image_available img4)))
  (at 1131 (image_available img5))
  (at 1139 (not (image_available img5)))
  (at 1232 (image_available img6))
  (at 1240 (not (image_available img6)))
  (at 1361 (image_available img7))
  (at 1369 (not (image_available img7)))
  (at 1421 (image_available img8))
  (at 1429 (not (image_available img8)))
  (at 1177 (image_available img9))
  (at 1185 (not (image_available img9)))
  (at 1290 (image_available img10))
  (at 1298 (not (image_available img10)))
  (at 1289 (image_available img11))
  (at 1297 (not (image_available img11)))
  (at 1414 (image_available img12))
  (at 1422 (not (image_available img12)))
  (at 1354 (image_available img13))
  (at 1362 (not (image_available img13)))
  (at 1112 (image_available img14))
  (at 1120 (not (image_available img14)))
  (at 1340 (image_available img15))
  (at 1348 (not (image_available img15)))
  (at 1659 (image_available img1))
  (at 1667 (not (image_available img1)))
  (at 1555 (image_available img2))
  (at 1563 (not (image_available img2)))
  (at 1496 (image_available img3))
  (at 1504 (not (image_available img3)))
  (at 1504 (image_available img4))
  (at 1512 (not (image_available img4)))
  (at 1491 (image_available img5))
  (at 1499 (not (image_available img5)))
  (at 1592 (image_available img6))
  (at 1600 (not (image_available img6)))
  (at 1721 (image_available img7))
  (at 1729 (not (image_available img7)))
  (at 1781 (image_available img8))
  (at 1789 (not (image_available img8)))
  (at 1537 (image_available img9))
  (at 1545 (not (image_available img9)))
  (at 1650 (image_available img10))
  (at 1658 (not (image_available img10)))
  (at 1649 (image_available img11))
  (at 1657 (not (image_available img11)))
  (at 1774 (image_available img12))
  (at 1782 (not (image_available img12)))
  (at 1714 (image_available img13))
  (at 1722 (not (image_available img13)))
  (at 1472 (image_available img14))
  (at 1480 (not (image_available img14)))
  (at 1700 (image_available img15))
  (at 1708 (not (image_available img15)))
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
  (> (image_score img11) 0)
  (<= (image_score img11) 6.0)

(>= (total_score) 2)
))
(:metric maximize 
  (image_score img11)
)
)