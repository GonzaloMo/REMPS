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
  (memory_free mem3)
  (memory_free mem4)
  (memory_free mem5)
  (memory_free mem6)
  (memory_free mem7)
  (memory_free mem8)
  (memory_free mem9)

   (memory_taken mem1 img8)
   (memory_taken mem2 img10)

(image_analysed mem2 img10)

  (at 13 (image_available img5))
  (at 21 (not (image_available img5)))
  (at 46 (image_available img6))
  (at 54 (not (image_available img6)))
  (at 298 (image_available img1))
  (at 306 (not (image_available img1)))
  (at 227 (image_available img2))
  (at 235 (not (image_available img2)))
  (at 286 (image_available img3))
  (at 294 (not (image_available img3)))
  (at 193 (image_available img4))
  (at 201 (not (image_available img4)))
  (at 373 (image_available img5))
  (at 381 (not (image_available img5)))
  (at 406 (image_available img6))
  (at 414 (not (image_available img6)))
  (at 265 (image_available img7))
  (at 273 (not (image_available img7)))
  (at 152 (image_available img8))
  (at 160 (not (image_available img8)))
  (at 291 (image_available img9))
  (at 299 (not (image_available img9)))
  (at 284 (image_available img10))
  (at 292 (not (image_available img10)))
  (at 250 (image_available img11))
  (at 258 (not (image_available img11)))
  (at 293 (image_available img12))
  (at 301 (not (image_available img12)))
  (at 136 (image_available img13))
  (at 144 (not (image_available img13)))
  (at 120 (image_available img14))
  (at 128 (not (image_available img14)))
  (at 311 (image_available img15))
  (at 319 (not (image_available img15)))
  (at 658 (image_available img1))
  (at 666 (not (image_available img1)))
  (at 587 (image_available img2))
  (at 595 (not (image_available img2)))
  (at 646 (image_available img3))
  (at 654 (not (image_available img3)))
  (at 553 (image_available img4))
  (at 561 (not (image_available img4)))
  (at 733 (image_available img5))
  (at 741 (not (image_available img5)))
  (at 766 (image_available img6))
  (at 774 (not (image_available img6)))
  (at 625 (image_available img7))
  (at 633 (not (image_available img7)))
  (at 512 (image_available img8))
  (at 520 (not (image_available img8)))
  (at 651 (image_available img9))
  (at 659 (not (image_available img9)))
  (at 644 (image_available img10))
  (at 652 (not (image_available img10)))
  (at 610 (image_available img11))
  (at 618 (not (image_available img11)))
  (at 653 (image_available img12))
  (at 661 (not (image_available img12)))
  (at 496 (image_available img13))
  (at 504 (not (image_available img13)))
  (at 480 (image_available img14))
  (at 488 (not (image_available img14)))
  (at 671 (image_available img15))
  (at 679 (not (image_available img15)))
  (at 1018 (image_available img1))
  (at 1026 (not (image_available img1)))
  (at 947 (image_available img2))
  (at 955 (not (image_available img2)))
  (at 1006 (image_available img3))
  (at 1014 (not (image_available img3)))
  (at 913 (image_available img4))
  (at 921 (not (image_available img4)))
  (at 1093 (image_available img5))
  (at 1101 (not (image_available img5)))
  (at 1126 (image_available img6))
  (at 1134 (not (image_available img6)))
  (at 985 (image_available img7))
  (at 993 (not (image_available img7)))
  (at 872 (image_available img8))
  (at 880 (not (image_available img8)))
  (at 1011 (image_available img9))
  (at 1019 (not (image_available img9)))
  (at 1004 (image_available img10))
  (at 1012 (not (image_available img10)))
  (at 970 (image_available img11))
  (at 978 (not (image_available img11)))
  (at 1013 (image_available img12))
  (at 1021 (not (image_available img12)))
  (at 856 (image_available img13))
  (at 864 (not (image_available img13)))
  (at 840 (image_available img14))
  (at 848 (not (image_available img14)))
  (at 1031 (image_available img15))
  (at 1039 (not (image_available img15)))
  (at 1378 (image_available img1))
  (at 1386 (not (image_available img1)))
  (at 1307 (image_available img2))
  (at 1315 (not (image_available img2)))
  (at 1366 (image_available img3))
  (at 1374 (not (image_available img3)))
  (at 1273 (image_available img4))
  (at 1281 (not (image_available img4)))
  (at 1453 (image_available img5))
  (at 1461 (not (image_available img5)))
  (at 1486 (image_available img6))
  (at 1494 (not (image_available img6)))
  (at 1345 (image_available img7))
  (at 1353 (not (image_available img7)))
  (at 1232 (image_available img8))
  (at 1240 (not (image_available img8)))
  (at 1371 (image_available img9))
  (at 1379 (not (image_available img9)))
  (at 1364 (image_available img10))
  (at 1372 (not (image_available img10)))
  (at 1330 (image_available img11))
  (at 1338 (not (image_available img11)))
  (at 1373 (image_available img12))
  (at 1381 (not (image_available img12)))
  (at 1216 (image_available img13))
  (at 1224 (not (image_available img13)))
  (at 1200 (image_available img14))
  (at 1208 (not (image_available img14)))
  (at 1391 (image_available img15))
  (at 1399 (not (image_available img15)))
  (at 1 (dump_available))
  (at 15.0 (not (dump_available)))
  (at 157.0 (dump_available))
  (at 195.0 (not (dump_available)))
  (at 337.0 (dump_available))
  (at 375.0 (not (dump_available)))
  (at 517.0 (dump_available))
  (at 555.0 (not (dump_available)))
  (at 697.0 (dump_available))
  (at 735.0 (not (dump_available)))
  (at 877.0 (dump_available))
  (at 915.0 (not (dump_available)))
  (at 1057.0 (dump_available))
  (at 1095.0 (not (dump_available)))
  (at 1237.0 (dump_available))
  (at 1275.0 (not (dump_available)))
  (at 1417.0 (dump_available))
  (at 1455.0 (not (dump_available)))

)
(:goal (and
  (> (image_score img1) 0)
  (<= (image_score img1) 16)

(>= (total_score) 4)
))
(:metric maximize 
  (image_score img1)
)
)
