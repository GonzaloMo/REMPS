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
  (memory_free mem3)
  (memory_free mem5)
  (memory_free mem6)
  (memory_free mem7)
  (memory_free mem8)
  (memory_free mem9)

   (memory_taken mem2 img6)
   (memory_taken mem4 img8)

(image_analysed mem2 img6)
(image_analysed mem4 img8)

  (at 67 (image_available img1))
  (at 75 (not (image_available img1)))
  (at 35 (image_available img19))
  (at 43 (not (image_available img19)))
  (at 73 (image_available img22))
  (at 81 (not (image_available img22)))
  (at 427 (image_available img1))
  (at 435 (not (image_available img1)))
  (at 217 (image_available img2))
  (at 225 (not (image_available img2)))
  (at 260 (image_available img3))
  (at 268 (not (image_available img3)))
  (at 136 (image_available img4))
  (at 144 (not (image_available img4)))
  (at 137 (image_available img5))
  (at 145 (not (image_available img5)))
  (at 89 (image_available img6))
  (at 97 (not (image_available img6)))
  (at 106 (image_available img7))
  (at 114 (not (image_available img7)))
  (at 127 (image_available img8))
  (at 135 (not (image_available img8)))
  (at 214 (image_available img9))
  (at 222 (not (image_available img9)))
  (at 297 (image_available img10))
  (at 305 (not (image_available img10)))
  (at 174 (image_available img11))
  (at 182 (not (image_available img11)))
  (at 148 (image_available img12))
  (at 156 (not (image_available img12)))
  (at 190 (image_available img13))
  (at 198 (not (image_available img13)))
  (at 107 (image_available img14))
  (at 115 (not (image_available img14)))
  (at 176 (image_available img15))
  (at 184 (not (image_available img15)))
  (at 329 (image_available img16))
  (at 337 (not (image_available img16)))
  (at 200 (image_available img17))
  (at 208 (not (image_available img17)))
  (at 199 (image_available img18))
  (at 207 (not (image_available img18)))
  (at 395 (image_available img19))
  (at 403 (not (image_available img19)))
  (at 323 (image_available img20))
  (at 331 (not (image_available img20)))
  (at 137 (image_available img21))
  (at 145 (not (image_available img21)))
  (at 433 (image_available img22))
  (at 441 (not (image_available img22)))
  (at 245 (image_available img23))
  (at 253 (not (image_available img23)))
  (at 330 (image_available img24))
  (at 338 (not (image_available img24)))
  (at 225 (image_available img25))
  (at 233 (not (image_available img25)))
  (at 787 (image_available img1))
  (at 795 (not (image_available img1)))
  (at 577 (image_available img2))
  (at 585 (not (image_available img2)))
  (at 620 (image_available img3))
  (at 628 (not (image_available img3)))
  (at 496 (image_available img4))
  (at 504 (not (image_available img4)))
  (at 497 (image_available img5))
  (at 505 (not (image_available img5)))
  (at 449 (image_available img6))
  (at 457 (not (image_available img6)))
  (at 466 (image_available img7))
  (at 474 (not (image_available img7)))
  (at 487 (image_available img8))
  (at 495 (not (image_available img8)))
  (at 574 (image_available img9))
  (at 582 (not (image_available img9)))
  (at 657 (image_available img10))
  (at 665 (not (image_available img10)))
  (at 534 (image_available img11))
  (at 542 (not (image_available img11)))
  (at 508 (image_available img12))
  (at 516 (not (image_available img12)))
  (at 550 (image_available img13))
  (at 558 (not (image_available img13)))
  (at 467 (image_available img14))
  (at 475 (not (image_available img14)))
  (at 536 (image_available img15))
  (at 544 (not (image_available img15)))
  (at 689 (image_available img16))
  (at 697 (not (image_available img16)))
  (at 560 (image_available img17))
  (at 568 (not (image_available img17)))
  (at 559 (image_available img18))
  (at 567 (not (image_available img18)))
  (at 755 (image_available img19))
  (at 763 (not (image_available img19)))
  (at 683 (image_available img20))
  (at 691 (not (image_available img20)))
  (at 497 (image_available img21))
  (at 505 (not (image_available img21)))
  (at 793 (image_available img22))
  (at 801 (not (image_available img22)))
  (at 605 (image_available img23))
  (at 613 (not (image_available img23)))
  (at 690 (image_available img24))
  (at 698 (not (image_available img24)))
  (at 585 (image_available img25))
  (at 593 (not (image_available img25)))
  (at 1147 (image_available img1))
  (at 1155 (not (image_available img1)))
  (at 937 (image_available img2))
  (at 945 (not (image_available img2)))
  (at 980 (image_available img3))
  (at 988 (not (image_available img3)))
  (at 856 (image_available img4))
  (at 864 (not (image_available img4)))
  (at 857 (image_available img5))
  (at 865 (not (image_available img5)))
  (at 809 (image_available img6))
  (at 817 (not (image_available img6)))
  (at 826 (image_available img7))
  (at 834 (not (image_available img7)))
  (at 847 (image_available img8))
  (at 855 (not (image_available img8)))
  (at 934 (image_available img9))
  (at 942 (not (image_available img9)))
  (at 1017 (image_available img10))
  (at 1025 (not (image_available img10)))
  (at 894 (image_available img11))
  (at 902 (not (image_available img11)))
  (at 868 (image_available img12))
  (at 876 (not (image_available img12)))
  (at 910 (image_available img13))
  (at 918 (not (image_available img13)))
  (at 827 (image_available img14))
  (at 835 (not (image_available img14)))
  (at 896 (image_available img15))
  (at 904 (not (image_available img15)))
  (at 1049 (image_available img16))
  (at 1057 (not (image_available img16)))
  (at 920 (image_available img17))
  (at 928 (not (image_available img17)))
  (at 919 (image_available img18))
  (at 927 (not (image_available img18)))
  (at 1115 (image_available img19))
  (at 1123 (not (image_available img19)))
  (at 1043 (image_available img20))
  (at 1051 (not (image_available img20)))
  (at 857 (image_available img21))
  (at 865 (not (image_available img21)))
  (at 1153 (image_available img22))
  (at 1161 (not (image_available img22)))
  (at 965 (image_available img23))
  (at 973 (not (image_available img23)))
  (at 1050 (image_available img24))
  (at 1058 (not (image_available img24)))
  (at 945 (image_available img25))
  (at 953 (not (image_available img25)))
  (at 1507 (image_available img1))
  (at 1515 (not (image_available img1)))
  (at 1297 (image_available img2))
  (at 1305 (not (image_available img2)))
  (at 1340 (image_available img3))
  (at 1348 (not (image_available img3)))
  (at 1216 (image_available img4))
  (at 1224 (not (image_available img4)))
  (at 1217 (image_available img5))
  (at 1225 (not (image_available img5)))
  (at 1169 (image_available img6))
  (at 1177 (not (image_available img6)))
  (at 1186 (image_available img7))
  (at 1194 (not (image_available img7)))
  (at 1207 (image_available img8))
  (at 1215 (not (image_available img8)))
  (at 1294 (image_available img9))
  (at 1302 (not (image_available img9)))
  (at 1377 (image_available img10))
  (at 1385 (not (image_available img10)))
  (at 1254 (image_available img11))
  (at 1262 (not (image_available img11)))
  (at 1228 (image_available img12))
  (at 1236 (not (image_available img12)))
  (at 1270 (image_available img13))
  (at 1278 (not (image_available img13)))
  (at 1187 (image_available img14))
  (at 1195 (not (image_available img14)))
  (at 1256 (image_available img15))
  (at 1264 (not (image_available img15)))
  (at 1409 (image_available img16))
  (at 1417 (not (image_available img16)))
  (at 1280 (image_available img17))
  (at 1288 (not (image_available img17)))
  (at 1279 (image_available img18))
  (at 1287 (not (image_available img18)))
  (at 1475 (image_available img19))
  (at 1483 (not (image_available img19)))
  (at 1403 (image_available img20))
  (at 1411 (not (image_available img20)))
  (at 1217 (image_available img21))
  (at 1225 (not (image_available img21)))
  (at 1513 (image_available img22))
  (at 1521 (not (image_available img22)))
  (at 1325 (image_available img23))
  (at 1333 (not (image_available img23)))
  (at 1410 (image_available img24))
  (at 1418 (not (image_available img24)))
  (at 1305 (image_available img25))
  (at 1313 (not (image_available img25)))
  (at 1 (dump_available))
  (at 18.0 (not (dump_available)))
  (at 160.0 (dump_available))
  (at 198.0 (not (dump_available)))
  (at 340.0 (dump_available))
  (at 378.0 (not (dump_available)))
  (at 520.0 (dump_available))
  (at 558.0 (not (dump_available)))
  (at 700.0 (dump_available))
  (at 738.0 (not (dump_available)))
  (at 880.0 (dump_available))
  (at 918.0 (not (dump_available)))
  (at 1060.0 (dump_available))
  (at 1098.0 (not (dump_available)))
  (at 1240.0 (dump_available))
  (at 1278.0 (not (dump_available)))
  (at 1420.0 (dump_available))
  (at 1458.0 (not (dump_available)))

)
(:goal (and
  (> (image_score img18) 0)
  (<= (image_score img18) 1)

(>= (total_score) 1)
))
(:metric maximize 
  (image_score img18)
)
)
