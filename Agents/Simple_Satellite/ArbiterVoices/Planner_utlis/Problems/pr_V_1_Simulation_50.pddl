(define(problem satprob)
(:domain SimpleSatellite)
(:objects
  mem0 mem1 mem2 mem3 mem4 mem5 mem6 mem7 mem8 mem9 - memory
 img1 img2 img3 img4 img5 img6 img7 img8 img9 img10 img11 img12 img13 img14 img15 img16 img17 img18 img19 img20 - image
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
  (= (image_score img16) 0)
  (= (image_score img17) 0)
  (= (image_score img18) 0)
  (= (image_score img19) 0)
  (= (image_score img20) 0)
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

   (memory_taken mem1 img7)


  (at 95 (image_available img1))
  (at 103 (not (image_available img1)))
  (at 71 (image_available img2))
  (at 79 (not (image_available img2)))
  (at 211 (image_available img3))
  (at 219 (not (image_available img3)))
  (at 132 (image_available img5))
  (at 140 (not (image_available img5)))
  (at 40 (image_available img6))
  (at 48 (not (image_available img6)))
  (at 103 (image_available img7))
  (at 111 (not (image_available img7)))
  (at 96 (image_available img9))
  (at 104 (not (image_available img9)))
  (at 127 (image_available img12))
  (at 135 (not (image_available img12)))
  (at 257 (image_available img13))
  (at 265 (not (image_available img13)))
  (at 140 (image_available img14))
  (at 148 (not (image_available img14)))
  (at 228 (image_available img16))
  (at 236 (not (image_available img16)))
  (at 59 (image_available img17))
  (at 67 (not (image_available img17)))
  (at 174 (image_available img18))
  (at 182 (not (image_available img18)))
  (at 235 (image_available img19))
  (at 243 (not (image_available img19)))
  (at 455 (image_available img1))
  (at 463 (not (image_available img1)))
  (at 431 (image_available img2))
  (at 439 (not (image_available img2)))
  (at 571 (image_available img3))
  (at 579 (not (image_available img3)))
  (at 328 (image_available img4))
  (at 336 (not (image_available img4)))
  (at 492 (image_available img5))
  (at 500 (not (image_available img5)))
  (at 400 (image_available img6))
  (at 408 (not (image_available img6)))
  (at 463 (image_available img7))
  (at 471 (not (image_available img7)))
  (at 298 (image_available img8))
  (at 306 (not (image_available img8)))
  (at 456 (image_available img9))
  (at 464 (not (image_available img9)))
  (at 318 (image_available img10))
  (at 326 (not (image_available img10)))
  (at 288 (image_available img11))
  (at 296 (not (image_available img11)))
  (at 487 (image_available img12))
  (at 495 (not (image_available img12)))
  (at 617 (image_available img13))
  (at 625 (not (image_available img13)))
  (at 500 (image_available img14))
  (at 508 (not (image_available img14)))
  (at 328 (image_available img15))
  (at 336 (not (image_available img15)))
  (at 588 (image_available img16))
  (at 596 (not (image_available img16)))
  (at 419 (image_available img17))
  (at 427 (not (image_available img17)))
  (at 534 (image_available img18))
  (at 542 (not (image_available img18)))
  (at 595 (image_available img19))
  (at 603 (not (image_available img19)))
  (at 312 (image_available img20))
  (at 320 (not (image_available img20)))
  (at 815 (image_available img1))
  (at 823 (not (image_available img1)))
  (at 791 (image_available img2))
  (at 799 (not (image_available img2)))
  (at 931 (image_available img3))
  (at 939 (not (image_available img3)))
  (at 688 (image_available img4))
  (at 696 (not (image_available img4)))
  (at 852 (image_available img5))
  (at 860 (not (image_available img5)))
  (at 760 (image_available img6))
  (at 768 (not (image_available img6)))
  (at 823 (image_available img7))
  (at 831 (not (image_available img7)))
  (at 658 (image_available img8))
  (at 666 (not (image_available img8)))
  (at 816 (image_available img9))
  (at 824 (not (image_available img9)))
  (at 678 (image_available img10))
  (at 686 (not (image_available img10)))
  (at 648 (image_available img11))
  (at 656 (not (image_available img11)))
  (at 847 (image_available img12))
  (at 855 (not (image_available img12)))
  (at 977 (image_available img13))
  (at 985 (not (image_available img13)))
  (at 860 (image_available img14))
  (at 868 (not (image_available img14)))
  (at 688 (image_available img15))
  (at 696 (not (image_available img15)))
  (at 948 (image_available img16))
  (at 956 (not (image_available img16)))
  (at 779 (image_available img17))
  (at 787 (not (image_available img17)))
  (at 894 (image_available img18))
  (at 902 (not (image_available img18)))
  (at 955 (image_available img19))
  (at 963 (not (image_available img19)))
  (at 672 (image_available img20))
  (at 680 (not (image_available img20)))
  (at 1175 (image_available img1))
  (at 1183 (not (image_available img1)))
  (at 1151 (image_available img2))
  (at 1159 (not (image_available img2)))
  (at 1291 (image_available img3))
  (at 1299 (not (image_available img3)))
  (at 1048 (image_available img4))
  (at 1056 (not (image_available img4)))
  (at 1212 (image_available img5))
  (at 1220 (not (image_available img5)))
  (at 1120 (image_available img6))
  (at 1128 (not (image_available img6)))
  (at 1183 (image_available img7))
  (at 1191 (not (image_available img7)))
  (at 1018 (image_available img8))
  (at 1026 (not (image_available img8)))
  (at 1176 (image_available img9))
  (at 1184 (not (image_available img9)))
  (at 1038 (image_available img10))
  (at 1046 (not (image_available img10)))
  (at 1008 (image_available img11))
  (at 1016 (not (image_available img11)))
  (at 1207 (image_available img12))
  (at 1215 (not (image_available img12)))
  (at 1337 (image_available img13))
  (at 1345 (not (image_available img13)))
  (at 1220 (image_available img14))
  (at 1228 (not (image_available img14)))
  (at 1048 (image_available img15))
  (at 1056 (not (image_available img15)))
  (at 1308 (image_available img16))
  (at 1316 (not (image_available img16)))
  (at 1139 (image_available img17))
  (at 1147 (not (image_available img17)))
  (at 1254 (image_available img18))
  (at 1262 (not (image_available img18)))
  (at 1315 (image_available img19))
  (at 1323 (not (image_available img19)))
  (at 1032 (image_available img20))
  (at 1040 (not (image_available img20)))
  (at 1535 (image_available img1))
  (at 1543 (not (image_available img1)))
  (at 1511 (image_available img2))
  (at 1519 (not (image_available img2)))
  (at 1651 (image_available img3))
  (at 1659 (not (image_available img3)))
  (at 1408 (image_available img4))
  (at 1416 (not (image_available img4)))
  (at 1572 (image_available img5))
  (at 1580 (not (image_available img5)))
  (at 1480 (image_available img6))
  (at 1488 (not (image_available img6)))
  (at 1543 (image_available img7))
  (at 1551 (not (image_available img7)))
  (at 1378 (image_available img8))
  (at 1386 (not (image_available img8)))
  (at 1536 (image_available img9))
  (at 1544 (not (image_available img9)))
  (at 1398 (image_available img10))
  (at 1406 (not (image_available img10)))
  (at 1368 (image_available img11))
  (at 1376 (not (image_available img11)))
  (at 1567 (image_available img12))
  (at 1575 (not (image_available img12)))
  (at 1697 (image_available img13))
  (at 1705 (not (image_available img13)))
  (at 1580 (image_available img14))
  (at 1588 (not (image_available img14)))
  (at 1408 (image_available img15))
  (at 1416 (not (image_available img15)))
  (at 1668 (image_available img16))
  (at 1676 (not (image_available img16)))
  (at 1499 (image_available img17))
  (at 1507 (not (image_available img17)))
  (at 1614 (image_available img18))
  (at 1622 (not (image_available img18)))
  (at 1675 (image_available img19))
  (at 1683 (not (image_available img19)))
  (at 1392 (image_available img20))
  (at 1400 (not (image_available img20)))
  (at 1 (dump_available))
  (at 24.0 (not (dump_available)))
  (at 166.0 (dump_available))
  (at 204.0 (not (dump_available)))
  (at 346.0 (dump_available))
  (at 384.0 (not (dump_available)))
  (at 526.0 (dump_available))
  (at 564.0 (not (dump_available)))
  (at 706.0 (dump_available))
  (at 744.0 (not (dump_available)))
  (at 886.0 (dump_available))
  (at 924.0 (not (dump_available)))
  (at 1066.0 (dump_available))
  (at 1104.0 (not (dump_available)))
  (at 1246.0 (dump_available))
  (at 1284.0 (not (dump_available)))
  (at 1426.0 (dump_available))
  (at 1464.0 (not (dump_available)))
  (at 1606.0 (dump_available))
  (at 1644.0 (not (dump_available)))

)
(:goal (and
  (> (image_score img20) 0)
  (<= (image_score img20) 4)

(>= (total_score) 1)
))
(:metric maximize 
  (image_score img20)
)
)