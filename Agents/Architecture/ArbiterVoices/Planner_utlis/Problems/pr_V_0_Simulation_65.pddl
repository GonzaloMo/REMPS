(define(problem satprob)
(:domain SimpleSatellite)
(:objects
  mem0 mem1 mem2 mem3 mem4 mem5 mem6 mem7 mem8 mem9 - memory
 img1 img2 img3 img4 img5 img6 img7 img8 img9 img10 img11 img12 img13 img14 img15 img16 img17 img18 img19 img20 img21 img22 img23 img24 img25 - image
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
  (= (image_score img21) 0)
  (= (image_score img22) 0)
  (= (image_score img23) 0)
  (= (image_score img24) 0)
  (= (image_score img25) 0)
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



  (at 274 (image_available img1))
  (at 282 (not (image_available img1)))
  (at 285 (image_available img2))
  (at 293 (not (image_available img2)))
  (at 252 (image_available img3))
  (at 260 (not (image_available img3)))
  (at 207 (image_available img4))
  (at 215 (not (image_available img4)))
  (at 230 (image_available img5))
  (at 238 (not (image_available img5)))
  (at 236 (image_available img6))
  (at 244 (not (image_available img6)))
  (at 257 (image_available img7))
  (at 265 (not (image_available img7)))
  (at 320 (image_available img8))
  (at 328 (not (image_available img8)))
  (at 329 (image_available img9))
  (at 337 (not (image_available img9)))
  (at 68 (image_available img10))
  (at 76 (not (image_available img10)))
  (at 349 (image_available img11))
  (at 357 (not (image_available img11)))
  (at 239 (image_available img12))
  (at 247 (not (image_available img12)))
  (at 75 (image_available img13))
  (at 83 (not (image_available img13)))
  (at 220 (image_available img14))
  (at 228 (not (image_available img14)))
  (at 209 (image_available img15))
  (at 217 (not (image_available img15)))
  (at 117 (image_available img16))
  (at 125 (not (image_available img16)))
  (at 150 (image_available img17))
  (at 158 (not (image_available img17)))
  (at 55 (image_available img18))
  (at 63 (not (image_available img18)))
  (at 198 (image_available img19))
  (at 206 (not (image_available img19)))
  (at 192 (image_available img20))
  (at 200 (not (image_available img20)))
  (at 219 (image_available img21))
  (at 227 (not (image_available img21)))
  (at 183 (image_available img22))
  (at 191 (not (image_available img22)))
  (at 303 (image_available img23))
  (at 311 (not (image_available img23)))
  (at 239 (image_available img24))
  (at 247 (not (image_available img24)))
  (at 36 (image_available img25))
  (at 44 (not (image_available img25)))
  (at 634 (image_available img1))
  (at 642 (not (image_available img1)))
  (at 645 (image_available img2))
  (at 653 (not (image_available img2)))
  (at 612 (image_available img3))
  (at 620 (not (image_available img3)))
  (at 567 (image_available img4))
  (at 575 (not (image_available img4)))
  (at 590 (image_available img5))
  (at 598 (not (image_available img5)))
  (at 596 (image_available img6))
  (at 604 (not (image_available img6)))
  (at 617 (image_available img7))
  (at 625 (not (image_available img7)))
  (at 680 (image_available img8))
  (at 688 (not (image_available img8)))
  (at 689 (image_available img9))
  (at 697 (not (image_available img9)))
  (at 428 (image_available img10))
  (at 436 (not (image_available img10)))
  (at 709 (image_available img11))
  (at 717 (not (image_available img11)))
  (at 599 (image_available img12))
  (at 607 (not (image_available img12)))
  (at 435 (image_available img13))
  (at 443 (not (image_available img13)))
  (at 580 (image_available img14))
  (at 588 (not (image_available img14)))
  (at 569 (image_available img15))
  (at 577 (not (image_available img15)))
  (at 477 (image_available img16))
  (at 485 (not (image_available img16)))
  (at 510 (image_available img17))
  (at 518 (not (image_available img17)))
  (at 415 (image_available img18))
  (at 423 (not (image_available img18)))
  (at 558 (image_available img19))
  (at 566 (not (image_available img19)))
  (at 552 (image_available img20))
  (at 560 (not (image_available img20)))
  (at 579 (image_available img21))
  (at 587 (not (image_available img21)))
  (at 543 (image_available img22))
  (at 551 (not (image_available img22)))
  (at 663 (image_available img23))
  (at 671 (not (image_available img23)))
  (at 599 (image_available img24))
  (at 607 (not (image_available img24)))
  (at 396 (image_available img25))
  (at 404 (not (image_available img25)))
  (at 994 (image_available img1))
  (at 1002 (not (image_available img1)))
  (at 1005 (image_available img2))
  (at 1013 (not (image_available img2)))
  (at 972 (image_available img3))
  (at 980 (not (image_available img3)))
  (at 927 (image_available img4))
  (at 935 (not (image_available img4)))
  (at 950 (image_available img5))
  (at 958 (not (image_available img5)))
  (at 956 (image_available img6))
  (at 964 (not (image_available img6)))
  (at 977 (image_available img7))
  (at 985 (not (image_available img7)))
  (at 1040 (image_available img8))
  (at 1048 (not (image_available img8)))
  (at 1049 (image_available img9))
  (at 1057 (not (image_available img9)))
  (at 788 (image_available img10))
  (at 796 (not (image_available img10)))
  (at 1069 (image_available img11))
  (at 1077 (not (image_available img11)))
  (at 959 (image_available img12))
  (at 967 (not (image_available img12)))
  (at 795 (image_available img13))
  (at 803 (not (image_available img13)))
  (at 940 (image_available img14))
  (at 948 (not (image_available img14)))
  (at 929 (image_available img15))
  (at 937 (not (image_available img15)))
  (at 837 (image_available img16))
  (at 845 (not (image_available img16)))
  (at 870 (image_available img17))
  (at 878 (not (image_available img17)))
  (at 775 (image_available img18))
  (at 783 (not (image_available img18)))
  (at 918 (image_available img19))
  (at 926 (not (image_available img19)))
  (at 912 (image_available img20))
  (at 920 (not (image_available img20)))
  (at 939 (image_available img21))
  (at 947 (not (image_available img21)))
  (at 903 (image_available img22))
  (at 911 (not (image_available img22)))
  (at 1023 (image_available img23))
  (at 1031 (not (image_available img23)))
  (at 959 (image_available img24))
  (at 967 (not (image_available img24)))
  (at 756 (image_available img25))
  (at 764 (not (image_available img25)))
  (at 1354 (image_available img1))
  (at 1362 (not (image_available img1)))
  (at 1365 (image_available img2))
  (at 1373 (not (image_available img2)))
  (at 1332 (image_available img3))
  (at 1340 (not (image_available img3)))
  (at 1287 (image_available img4))
  (at 1295 (not (image_available img4)))
  (at 1310 (image_available img5))
  (at 1318 (not (image_available img5)))
  (at 1316 (image_available img6))
  (at 1324 (not (image_available img6)))
  (at 1337 (image_available img7))
  (at 1345 (not (image_available img7)))
  (at 1400 (image_available img8))
  (at 1408 (not (image_available img8)))
  (at 1409 (image_available img9))
  (at 1417 (not (image_available img9)))
  (at 1148 (image_available img10))
  (at 1156 (not (image_available img10)))
  (at 1429 (image_available img11))
  (at 1437 (not (image_available img11)))
  (at 1319 (image_available img12))
  (at 1327 (not (image_available img12)))
  (at 1155 (image_available img13))
  (at 1163 (not (image_available img13)))
  (at 1300 (image_available img14))
  (at 1308 (not (image_available img14)))
  (at 1289 (image_available img15))
  (at 1297 (not (image_available img15)))
  (at 1197 (image_available img16))
  (at 1205 (not (image_available img16)))
  (at 1230 (image_available img17))
  (at 1238 (not (image_available img17)))
  (at 1135 (image_available img18))
  (at 1143 (not (image_available img18)))
  (at 1278 (image_available img19))
  (at 1286 (not (image_available img19)))
  (at 1272 (image_available img20))
  (at 1280 (not (image_available img20)))
  (at 1299 (image_available img21))
  (at 1307 (not (image_available img21)))
  (at 1263 (image_available img22))
  (at 1271 (not (image_available img22)))
  (at 1383 (image_available img23))
  (at 1391 (not (image_available img23)))
  (at 1319 (image_available img24))
  (at 1327 (not (image_available img24)))
  (at 1116 (image_available img25))
  (at 1124 (not (image_available img25)))
  (at 1714 (image_available img1))
  (at 1722 (not (image_available img1)))
  (at 1725 (image_available img2))
  (at 1733 (not (image_available img2)))
  (at 1692 (image_available img3))
  (at 1700 (not (image_available img3)))
  (at 1647 (image_available img4))
  (at 1655 (not (image_available img4)))
  (at 1670 (image_available img5))
  (at 1678 (not (image_available img5)))
  (at 1676 (image_available img6))
  (at 1684 (not (image_available img6)))
  (at 1697 (image_available img7))
  (at 1705 (not (image_available img7)))
  (at 1760 (image_available img8))
  (at 1768 (not (image_available img8)))
  (at 1769 (image_available img9))
  (at 1777 (not (image_available img9)))
  (at 1508 (image_available img10))
  (at 1516 (not (image_available img10)))
  (at 1789 (image_available img11))
  (at 1797 (not (image_available img11)))
  (at 1679 (image_available img12))
  (at 1687 (not (image_available img12)))
  (at 1515 (image_available img13))
  (at 1523 (not (image_available img13)))
  (at 1660 (image_available img14))
  (at 1668 (not (image_available img14)))
  (at 1649 (image_available img15))
  (at 1657 (not (image_available img15)))
  (at 1557 (image_available img16))
  (at 1565 (not (image_available img16)))
  (at 1590 (image_available img17))
  (at 1598 (not (image_available img17)))
  (at 1495 (image_available img18))
  (at 1503 (not (image_available img18)))
  (at 1638 (image_available img19))
  (at 1646 (not (image_available img19)))
  (at 1632 (image_available img20))
  (at 1640 (not (image_available img20)))
  (at 1659 (image_available img21))
  (at 1667 (not (image_available img21)))
  (at 1623 (image_available img22))
  (at 1631 (not (image_available img22)))
  (at 1743 (image_available img23))
  (at 1751 (not (image_available img23)))
  (at 1679 (image_available img24))
  (at 1687 (not (image_available img24)))
  (at 1476 (image_available img25))
  (at 1484 (not (image_available img25)))
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
  (> (image_score img4) 0)
  (<= (image_score img4) 5)

  (> (image_score img11) 0)
  (<= (image_score img11) 4)

  (> (image_score img19) 0)
  (<= (image_score img19) 5)

  (> (image_score img22) 0)
  (<= (image_score img22) 1)

  (> (image_score img24) 0)
  (<= (image_score img24) 3)

(>= (total_score) 4)
))
(:metric maximize (+
  (image_score img4)
    (+ (image_score img11)
      (+ (image_score img19)
        (+ (image_score img22)
          (image_score img24)
        )
      )
    )
  )
)
)