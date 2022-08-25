(define(problem satprob)
(:domain SimpleSatellite)
(:objects
  mem0 mem1 mem2 mem3 mem4 mem5 mem6 mem7 mem8 mem9 - memory
 img1 img2 img3 img4 img5 - image
)
(:init
  (sat_free)
  (= (image_score img1) 0)
  (= (image_score img2) 0)
  (= (image_score img3) 0)
  (= (image_score img4) 0)
  (= (image_score img5) 0)
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



  (at 104 (image_available img1))
  (at 112 (not (image_available img1)))
  (at 265 (image_available img2))
  (at 273 (not (image_available img2)))
  (at 166 (image_available img3))
  (at 174 (not (image_available img3)))
  (at 239 (image_available img4))
  (at 247 (not (image_available img4)))
  (at 1 (image_available img5))
  (at 9 (not (image_available img5)))
  (at 464 (image_available img1))
  (at 472 (not (image_available img1)))
  (at 625 (image_available img2))
  (at 633 (not (image_available img2)))
  (at 526 (image_available img3))
  (at 534 (not (image_available img3)))
  (at 599 (image_available img4))
  (at 607 (not (image_available img4)))
  (at 361 (image_available img5))
  (at 369 (not (image_available img5)))
  (at 824 (image_available img1))
  (at 832 (not (image_available img1)))
  (at 985 (image_available img2))
  (at 993 (not (image_available img2)))
  (at 886 (image_available img3))
  (at 894 (not (image_available img3)))
  (at 959 (image_available img4))
  (at 967 (not (image_available img4)))
  (at 721 (image_available img5))
  (at 729 (not (image_available img5)))
  (at 1184 (image_available img1))
  (at 1192 (not (image_available img1)))
  (at 1345 (image_available img2))
  (at 1353 (not (image_available img2)))
  (at 1246 (image_available img3))
  (at 1254 (not (image_available img3)))
  (at 1319 (image_available img4))
  (at 1327 (not (image_available img4)))
  (at 1081 (image_available img5))
  (at 1089 (not (image_available img5)))
  (at 1544 (image_available img1))
  (at 1552 (not (image_available img1)))
  (at 1705 (image_available img2))
  (at 1713 (not (image_available img2)))
  (at 1606 (image_available img3))
  (at 1614 (not (image_available img3)))
  (at 1679 (image_available img4))
  (at 1687 (not (image_available img4)))
  (at 1441 (image_available img5))
  (at 1449 (not (image_available img5)))
  (at 1904 (image_available img1))
  (at 1912 (not (image_available img1)))
  (at 2065 (image_available img2))
  (at 2073 (not (image_available img2)))
  (at 1966 (image_available img3))
  (at 1974 (not (image_available img3)))
  (at 2039 (image_available img4))
  (at 2047 (not (image_available img4)))
  (at 1801 (image_available img5))
  (at 1809 (not (image_available img5)))
  (at 2264 (image_available img1))
  (at 2272 (not (image_available img1)))
  (at 2425 (image_available img2))
  (at 2433 (not (image_available img2)))
  (at 2326 (image_available img3))
  (at 2334 (not (image_available img3)))
  (at 2399 (image_available img4))
  (at 2407 (not (image_available img4)))
  (at 2161 (image_available img5))
  (at 2169 (not (image_available img5)))
  (at 2624 (image_available img1))
  (at 2632 (not (image_available img1)))
  (at 2785 (image_available img2))
  (at 2793 (not (image_available img2)))
  (at 2686 (image_available img3))
  (at 2694 (not (image_available img3)))
  (at 2759 (image_available img4))
  (at 2767 (not (image_available img4)))
  (at 2521 (image_available img5))
  (at 2529 (not (image_available img5)))
  (at 2984 (image_available img1))
  (at 2992 (not (image_available img1)))
  (at 3145 (image_available img2))
  (at 3153 (not (image_available img2)))
  (at 3046 (image_available img3))
  (at 3054 (not (image_available img3)))
  (at 3119 (image_available img4))
  (at 3127 (not (image_available img4)))
  (at 2881 (image_available img5))
  (at 2889 (not (image_available img5)))
  (at 3344 (image_available img1))
  (at 3352 (not (image_available img1)))
  (at 3505 (image_available img2))
  (at 3513 (not (image_available img2)))
  (at 3406 (image_available img3))
  (at 3414 (not (image_available img3)))
  (at 3479 (image_available img4))
  (at 3487 (not (image_available img4)))
  (at 3241 (image_available img5))
  (at 3249 (not (image_available img5)))
  (at 3704 (image_available img1))
  (at 3712 (not (image_available img1)))
  (at 3865 (image_available img2))
  (at 3873 (not (image_available img2)))
  (at 3766 (image_available img3))
  (at 3774 (not (image_available img3)))
  (at 3839 (image_available img4))
  (at 3847 (not (image_available img4)))
  (at 3601 (image_available img5))
  (at 3609 (not (image_available img5)))
  (at 4064 (image_available img1))
  (at 4072 (not (image_available img1)))
  (at 4225 (image_available img2))
  (at 4233 (not (image_available img2)))
  (at 4126 (image_available img3))
  (at 4134 (not (image_available img3)))
  (at 4199 (image_available img4))
  (at 4207 (not (image_available img4)))
  (at 3961 (image_available img5))
  (at 3969 (not (image_available img5)))
  (at 4424 (image_available img1))
  (at 4432 (not (image_available img1)))
  (at 4585 (image_available img2))
  (at 4593 (not (image_available img2)))
  (at 4486 (image_available img3))
  (at 4494 (not (image_available img3)))
  (at 4559 (image_available img4))
  (at 4567 (not (image_available img4)))
  (at 4321 (image_available img5))
  (at 4329 (not (image_available img5)))
  (at 4784 (image_available img1))
  (at 4792 (not (image_available img1)))
  (at 4945 (image_available img2))
  (at 4953 (not (image_available img2)))
  (at 4846 (image_available img3))
  (at 4854 (not (image_available img3)))
  (at 4919 (image_available img4))
  (at 4927 (not (image_available img4)))
  (at 4681 (image_available img5))
  (at 4689 (not (image_available img5)))
  (at 5144 (image_available img1))
  (at 5152 (not (image_available img1)))
  (at 5305 (image_available img2))
  (at 5313 (not (image_available img2)))
  (at 5206 (image_available img3))
  (at 5214 (not (image_available img3)))
  (at 5279 (image_available img4))
  (at 5287 (not (image_available img4)))
  (at 5041 (image_available img5))
  (at 5049 (not (image_available img5)))
  (at 5504 (image_available img1))
  (at 5512 (not (image_available img1)))
  (at 5665 (image_available img2))
  (at 5673 (not (image_available img2)))
  (at 5566 (image_available img3))
  (at 5574 (not (image_available img3)))
  (at 5639 (image_available img4))
  (at 5647 (not (image_available img4)))
  (at 5401 (image_available img5))
  (at 5409 (not (image_available img5)))
  (at 5864 (image_available img1))
  (at 5872 (not (image_available img1)))
  (at 6025 (image_available img2))
  (at 6033 (not (image_available img2)))
  (at 5926 (image_available img3))
  (at 5934 (not (image_available img3)))
  (at 5999 (image_available img4))
  (at 6007 (not (image_available img4)))
  (at 5761 (image_available img5))
  (at 5769 (not (image_available img5)))
  (at 6224 (image_available img1))
  (at 6232 (not (image_available img1)))
  (at 6385 (image_available img2))
  (at 6393 (not (image_available img2)))
  (at 6286 (image_available img3))
  (at 6294 (not (image_available img3)))
  (at 6359 (image_available img4))
  (at 6367 (not (image_available img4)))
  (at 6121 (image_available img5))
  (at 6129 (not (image_available img5)))
  (at 6584 (image_available img1))
  (at 6592 (not (image_available img1)))
  (at 6745 (image_available img2))
  (at 6753 (not (image_available img2)))
  (at 6646 (image_available img3))
  (at 6654 (not (image_available img3)))
  (at 6719 (image_available img4))
  (at 6727 (not (image_available img4)))
  (at 6481 (image_available img5))
  (at 6489 (not (image_available img5)))
  (at 6944 (image_available img1))
  (at 6952 (not (image_available img1)))
  (at 7105 (image_available img2))
  (at 7113 (not (image_available img2)))
  (at 7006 (image_available img3))
  (at 7014 (not (image_available img3)))
  (at 7079 (image_available img4))
  (at 7087 (not (image_available img4)))
  (at 6841 (image_available img5))
  (at 6849 (not (image_available img5)))
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
  (at 1876.0 (dump_available))
  (at 1914.0 (not (dump_available)))
  (at 2056.0 (dump_available))
  (at 2094.0 (not (dump_available)))
  (at 2236.0 (dump_available))
  (at 2274.0 (not (dump_available)))
  (at 2416.0 (dump_available))
  (at 2454.0 (not (dump_available)))
  (at 2596.0 (dump_available))
  (at 2634.0 (not (dump_available)))
  (at 2776.0 (dump_available))
  (at 2814.0 (not (dump_available)))
  (at 2956.0 (dump_available))
  (at 2994.0 (not (dump_available)))
  (at 3136.0 (dump_available))
  (at 3174.0 (not (dump_available)))
  (at 3316.0 (dump_available))
  (at 3354.0 (not (dump_available)))
  (at 3496.0 (dump_available))
  (at 3534.0 (not (dump_available)))
  (at 3676.0 (dump_available))
  (at 3714.0 (not (dump_available)))
  (at 3856.0 (dump_available))
  (at 3894.0 (not (dump_available)))
  (at 4036.0 (dump_available))
  (at 4074.0 (not (dump_available)))
  (at 4216.0 (dump_available))
  (at 4254.0 (not (dump_available)))
  (at 4396.0 (dump_available))
  (at 4434.0 (not (dump_available)))
  (at 4576.0 (dump_available))
  (at 4614.0 (not (dump_available)))
  (at 4756.0 (dump_available))
  (at 4794.0 (not (dump_available)))
  (at 4936.0 (dump_available))
  (at 4974.0 (not (dump_available)))
  (at 5116.0 (dump_available))
  (at 5154.0 (not (dump_available)))
  (at 5296.0 (dump_available))
  (at 5334.0 (not (dump_available)))
  (at 5476.0 (dump_available))
  (at 5514.0 (not (dump_available)))
  (at 5656.0 (dump_available))
  (at 5694.0 (not (dump_available)))
  (at 5836.0 (dump_available))
  (at 5874.0 (not (dump_available)))
  (at 6016.0 (dump_available))
  (at 6054.0 (not (dump_available)))
  (at 6196.0 (dump_available))
  (at 6234.0 (not (dump_available)))
  (at 6376.0 (dump_available))
  (at 6414.0 (not (dump_available)))
  (at 6556.0 (dump_available))
  (at 6594.0 (not (dump_available)))
  (at 6736.0 (dump_available))
  (at 6774.0 (not (dump_available)))
  (at 6916.0 (dump_available))
  (at 6954.0 (not (dump_available)))
  (at 7096.0 (dump_available))
  (at 7134.0 (not (dump_available)))

)
(:goal (and
  (> (image_score img1) 0)
  (<= (image_score img1) 10)

  (> (image_score img3) 0)
  (<= (image_score img3) 2)

  (> (image_score img4) 0)
  (<= (image_score img4) 2)

(>= (total_score) 3)
))
(:metric maximize (+
  (image_score img1)
    (+ (image_score img3)
      (image_score img4)
    )
  )
)
)
