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



  (at 288 (image_available img1))
  (at 296 (not (image_available img1)))
  (at 219 (image_available img2))
  (at 227 (not (image_available img2)))
  (at 196 (image_available img3))
  (at 204 (not (image_available img3)))
  (at 61 (image_available img4))
  (at 69 (not (image_available img4)))
  (at 188 (image_available img5))
  (at 196 (not (image_available img5)))
  (at 55 (image_available img6))
  (at 63 (not (image_available img6)))
  (at 27 (image_available img7))
  (at 35 (not (image_available img7)))
  (at 197 (image_available img8))
  (at 205 (not (image_available img8)))
  (at 350 (image_available img9))
  (at 358 (not (image_available img9)))
  (at 312 (image_available img10))
  (at 320 (not (image_available img10)))
  (at 648 (image_available img1))
  (at 656 (not (image_available img1)))
  (at 579 (image_available img2))
  (at 587 (not (image_available img2)))
  (at 556 (image_available img3))
  (at 564 (not (image_available img3)))
  (at 421 (image_available img4))
  (at 429 (not (image_available img4)))
  (at 548 (image_available img5))
  (at 556 (not (image_available img5)))
  (at 415 (image_available img6))
  (at 423 (not (image_available img6)))
  (at 387 (image_available img7))
  (at 395 (not (image_available img7)))
  (at 557 (image_available img8))
  (at 565 (not (image_available img8)))
  (at 710 (image_available img9))
  (at 718 (not (image_available img9)))
  (at 672 (image_available img10))
  (at 680 (not (image_available img10)))
  (at 1008 (image_available img1))
  (at 1016 (not (image_available img1)))
  (at 939 (image_available img2))
  (at 947 (not (image_available img2)))
  (at 916 (image_available img3))
  (at 924 (not (image_available img3)))
  (at 781 (image_available img4))
  (at 789 (not (image_available img4)))
  (at 908 (image_available img5))
  (at 916 (not (image_available img5)))
  (at 775 (image_available img6))
  (at 783 (not (image_available img6)))
  (at 747 (image_available img7))
  (at 755 (not (image_available img7)))
  (at 917 (image_available img8))
  (at 925 (not (image_available img8)))
  (at 1070 (image_available img9))
  (at 1078 (not (image_available img9)))
  (at 1032 (image_available img10))
  (at 1040 (not (image_available img10)))
  (at 1368 (image_available img1))
  (at 1376 (not (image_available img1)))
  (at 1299 (image_available img2))
  (at 1307 (not (image_available img2)))
  (at 1276 (image_available img3))
  (at 1284 (not (image_available img3)))
  (at 1141 (image_available img4))
  (at 1149 (not (image_available img4)))
  (at 1268 (image_available img5))
  (at 1276 (not (image_available img5)))
  (at 1135 (image_available img6))
  (at 1143 (not (image_available img6)))
  (at 1107 (image_available img7))
  (at 1115 (not (image_available img7)))
  (at 1277 (image_available img8))
  (at 1285 (not (image_available img8)))
  (at 1430 (image_available img9))
  (at 1438 (not (image_available img9)))
  (at 1392 (image_available img10))
  (at 1400 (not (image_available img10)))
  (at 1728 (image_available img1))
  (at 1736 (not (image_available img1)))
  (at 1659 (image_available img2))
  (at 1667 (not (image_available img2)))
  (at 1636 (image_available img3))
  (at 1644 (not (image_available img3)))
  (at 1501 (image_available img4))
  (at 1509 (not (image_available img4)))
  (at 1628 (image_available img5))
  (at 1636 (not (image_available img5)))
  (at 1495 (image_available img6))
  (at 1503 (not (image_available img6)))
  (at 1467 (image_available img7))
  (at 1475 (not (image_available img7)))
  (at 1637 (image_available img8))
  (at 1645 (not (image_available img8)))
  (at 1790 (image_available img9))
  (at 1798 (not (image_available img9)))
  (at 1752 (image_available img10))
  (at 1760 (not (image_available img10)))
  (at 2088 (image_available img1))
  (at 2096 (not (image_available img1)))
  (at 2019 (image_available img2))
  (at 2027 (not (image_available img2)))
  (at 1996 (image_available img3))
  (at 2004 (not (image_available img3)))
  (at 1861 (image_available img4))
  (at 1869 (not (image_available img4)))
  (at 1988 (image_available img5))
  (at 1996 (not (image_available img5)))
  (at 1855 (image_available img6))
  (at 1863 (not (image_available img6)))
  (at 1827 (image_available img7))
  (at 1835 (not (image_available img7)))
  (at 1997 (image_available img8))
  (at 2005 (not (image_available img8)))
  (at 2150 (image_available img9))
  (at 2158 (not (image_available img9)))
  (at 2112 (image_available img10))
  (at 2120 (not (image_available img10)))
  (at 2448 (image_available img1))
  (at 2456 (not (image_available img1)))
  (at 2379 (image_available img2))
  (at 2387 (not (image_available img2)))
  (at 2356 (image_available img3))
  (at 2364 (not (image_available img3)))
  (at 2221 (image_available img4))
  (at 2229 (not (image_available img4)))
  (at 2348 (image_available img5))
  (at 2356 (not (image_available img5)))
  (at 2215 (image_available img6))
  (at 2223 (not (image_available img6)))
  (at 2187 (image_available img7))
  (at 2195 (not (image_available img7)))
  (at 2357 (image_available img8))
  (at 2365 (not (image_available img8)))
  (at 2510 (image_available img9))
  (at 2518 (not (image_available img9)))
  (at 2472 (image_available img10))
  (at 2480 (not (image_available img10)))
  (at 2808 (image_available img1))
  (at 2816 (not (image_available img1)))
  (at 2739 (image_available img2))
  (at 2747 (not (image_available img2)))
  (at 2716 (image_available img3))
  (at 2724 (not (image_available img3)))
  (at 2581 (image_available img4))
  (at 2589 (not (image_available img4)))
  (at 2708 (image_available img5))
  (at 2716 (not (image_available img5)))
  (at 2575 (image_available img6))
  (at 2583 (not (image_available img6)))
  (at 2547 (image_available img7))
  (at 2555 (not (image_available img7)))
  (at 2717 (image_available img8))
  (at 2725 (not (image_available img8)))
  (at 2870 (image_available img9))
  (at 2878 (not (image_available img9)))
  (at 2832 (image_available img10))
  (at 2840 (not (image_available img10)))
  (at 3168 (image_available img1))
  (at 3176 (not (image_available img1)))
  (at 3099 (image_available img2))
  (at 3107 (not (image_available img2)))
  (at 3076 (image_available img3))
  (at 3084 (not (image_available img3)))
  (at 2941 (image_available img4))
  (at 2949 (not (image_available img4)))
  (at 3068 (image_available img5))
  (at 3076 (not (image_available img5)))
  (at 2935 (image_available img6))
  (at 2943 (not (image_available img6)))
  (at 2907 (image_available img7))
  (at 2915 (not (image_available img7)))
  (at 3077 (image_available img8))
  (at 3085 (not (image_available img8)))
  (at 3230 (image_available img9))
  (at 3238 (not (image_available img9)))
  (at 3192 (image_available img10))
  (at 3200 (not (image_available img10)))
  (at 3528 (image_available img1))
  (at 3536 (not (image_available img1)))
  (at 3459 (image_available img2))
  (at 3467 (not (image_available img2)))
  (at 3436 (image_available img3))
  (at 3444 (not (image_available img3)))
  (at 3301 (image_available img4))
  (at 3309 (not (image_available img4)))
  (at 3428 (image_available img5))
  (at 3436 (not (image_available img5)))
  (at 3295 (image_available img6))
  (at 3303 (not (image_available img6)))
  (at 3267 (image_available img7))
  (at 3275 (not (image_available img7)))
  (at 3437 (image_available img8))
  (at 3445 (not (image_available img8)))
  (at 3590 (image_available img9))
  (at 3598 (not (image_available img9)))
  (at 3552 (image_available img10))
  (at 3560 (not (image_available img10)))
  (at 3888 (image_available img1))
  (at 3896 (not (image_available img1)))
  (at 3819 (image_available img2))
  (at 3827 (not (image_available img2)))
  (at 3796 (image_available img3))
  (at 3804 (not (image_available img3)))
  (at 3661 (image_available img4))
  (at 3669 (not (image_available img4)))
  (at 3788 (image_available img5))
  (at 3796 (not (image_available img5)))
  (at 3655 (image_available img6))
  (at 3663 (not (image_available img6)))
  (at 3627 (image_available img7))
  (at 3635 (not (image_available img7)))
  (at 3797 (image_available img8))
  (at 3805 (not (image_available img8)))
  (at 3950 (image_available img9))
  (at 3958 (not (image_available img9)))
  (at 3912 (image_available img10))
  (at 3920 (not (image_available img10)))
  (at 4248 (image_available img1))
  (at 4256 (not (image_available img1)))
  (at 4179 (image_available img2))
  (at 4187 (not (image_available img2)))
  (at 4156 (image_available img3))
  (at 4164 (not (image_available img3)))
  (at 4021 (image_available img4))
  (at 4029 (not (image_available img4)))
  (at 4148 (image_available img5))
  (at 4156 (not (image_available img5)))
  (at 4015 (image_available img6))
  (at 4023 (not (image_available img6)))
  (at 3987 (image_available img7))
  (at 3995 (not (image_available img7)))
  (at 4157 (image_available img8))
  (at 4165 (not (image_available img8)))
  (at 4310 (image_available img9))
  (at 4318 (not (image_available img9)))
  (at 4272 (image_available img10))
  (at 4280 (not (image_available img10)))
  (at 4608 (image_available img1))
  (at 4616 (not (image_available img1)))
  (at 4539 (image_available img2))
  (at 4547 (not (image_available img2)))
  (at 4516 (image_available img3))
  (at 4524 (not (image_available img3)))
  (at 4381 (image_available img4))
  (at 4389 (not (image_available img4)))
  (at 4508 (image_available img5))
  (at 4516 (not (image_available img5)))
  (at 4375 (image_available img6))
  (at 4383 (not (image_available img6)))
  (at 4347 (image_available img7))
  (at 4355 (not (image_available img7)))
  (at 4517 (image_available img8))
  (at 4525 (not (image_available img8)))
  (at 4670 (image_available img9))
  (at 4678 (not (image_available img9)))
  (at 4632 (image_available img10))
  (at 4640 (not (image_available img10)))
  (at 4968 (image_available img1))
  (at 4976 (not (image_available img1)))
  (at 4899 (image_available img2))
  (at 4907 (not (image_available img2)))
  (at 4876 (image_available img3))
  (at 4884 (not (image_available img3)))
  (at 4741 (image_available img4))
  (at 4749 (not (image_available img4)))
  (at 4868 (image_available img5))
  (at 4876 (not (image_available img5)))
  (at 4735 (image_available img6))
  (at 4743 (not (image_available img6)))
  (at 4707 (image_available img7))
  (at 4715 (not (image_available img7)))
  (at 4877 (image_available img8))
  (at 4885 (not (image_available img8)))
  (at 5030 (image_available img9))
  (at 5038 (not (image_available img9)))
  (at 4992 (image_available img10))
  (at 5000 (not (image_available img10)))
  (at 5328 (image_available img1))
  (at 5336 (not (image_available img1)))
  (at 5259 (image_available img2))
  (at 5267 (not (image_available img2)))
  (at 5236 (image_available img3))
  (at 5244 (not (image_available img3)))
  (at 5101 (image_available img4))
  (at 5109 (not (image_available img4)))
  (at 5228 (image_available img5))
  (at 5236 (not (image_available img5)))
  (at 5095 (image_available img6))
  (at 5103 (not (image_available img6)))
  (at 5067 (image_available img7))
  (at 5075 (not (image_available img7)))
  (at 5237 (image_available img8))
  (at 5245 (not (image_available img8)))
  (at 5390 (image_available img9))
  (at 5398 (not (image_available img9)))
  (at 5352 (image_available img10))
  (at 5360 (not (image_available img10)))
  (at 5688 (image_available img1))
  (at 5696 (not (image_available img1)))
  (at 5619 (image_available img2))
  (at 5627 (not (image_available img2)))
  (at 5596 (image_available img3))
  (at 5604 (not (image_available img3)))
  (at 5461 (image_available img4))
  (at 5469 (not (image_available img4)))
  (at 5588 (image_available img5))
  (at 5596 (not (image_available img5)))
  (at 5455 (image_available img6))
  (at 5463 (not (image_available img6)))
  (at 5427 (image_available img7))
  (at 5435 (not (image_available img7)))
  (at 5597 (image_available img8))
  (at 5605 (not (image_available img8)))
  (at 5750 (image_available img9))
  (at 5758 (not (image_available img9)))
  (at 5712 (image_available img10))
  (at 5720 (not (image_available img10)))
  (at 6048 (image_available img1))
  (at 6056 (not (image_available img1)))
  (at 5979 (image_available img2))
  (at 5987 (not (image_available img2)))
  (at 5956 (image_available img3))
  (at 5964 (not (image_available img3)))
  (at 5821 (image_available img4))
  (at 5829 (not (image_available img4)))
  (at 5948 (image_available img5))
  (at 5956 (not (image_available img5)))
  (at 5815 (image_available img6))
  (at 5823 (not (image_available img6)))
  (at 5787 (image_available img7))
  (at 5795 (not (image_available img7)))
  (at 5957 (image_available img8))
  (at 5965 (not (image_available img8)))
  (at 6110 (image_available img9))
  (at 6118 (not (image_available img9)))
  (at 6072 (image_available img10))
  (at 6080 (not (image_available img10)))
  (at 6408 (image_available img1))
  (at 6416 (not (image_available img1)))
  (at 6339 (image_available img2))
  (at 6347 (not (image_available img2)))
  (at 6316 (image_available img3))
  (at 6324 (not (image_available img3)))
  (at 6181 (image_available img4))
  (at 6189 (not (image_available img4)))
  (at 6308 (image_available img5))
  (at 6316 (not (image_available img5)))
  (at 6175 (image_available img6))
  (at 6183 (not (image_available img6)))
  (at 6147 (image_available img7))
  (at 6155 (not (image_available img7)))
  (at 6317 (image_available img8))
  (at 6325 (not (image_available img8)))
  (at 6470 (image_available img9))
  (at 6478 (not (image_available img9)))
  (at 6432 (image_available img10))
  (at 6440 (not (image_available img10)))
  (at 6768 (image_available img1))
  (at 6776 (not (image_available img1)))
  (at 6699 (image_available img2))
  (at 6707 (not (image_available img2)))
  (at 6676 (image_available img3))
  (at 6684 (not (image_available img3)))
  (at 6541 (image_available img4))
  (at 6549 (not (image_available img4)))
  (at 6668 (image_available img5))
  (at 6676 (not (image_available img5)))
  (at 6535 (image_available img6))
  (at 6543 (not (image_available img6)))
  (at 6507 (image_available img7))
  (at 6515 (not (image_available img7)))
  (at 6677 (image_available img8))
  (at 6685 (not (image_available img8)))
  (at 6830 (image_available img9))
  (at 6838 (not (image_available img9)))
  (at 6792 (image_available img10))
  (at 6800 (not (image_available img10)))
  (at 7128 (image_available img1))
  (at 7136 (not (image_available img1)))
  (at 7059 (image_available img2))
  (at 7067 (not (image_available img2)))
  (at 7036 (image_available img3))
  (at 7044 (not (image_available img3)))
  (at 6901 (image_available img4))
  (at 6909 (not (image_available img4)))
  (at 7028 (image_available img5))
  (at 7036 (not (image_available img5)))
  (at 6895 (image_available img6))
  (at 6903 (not (image_available img6)))
  (at 6867 (image_available img7))
  (at 6875 (not (image_available img7)))
  (at 7037 (image_available img8))
  (at 7045 (not (image_available img8)))
  (at 7190 (image_available img9))
  (at 7198 (not (image_available img9)))
  (at 7152 (image_available img10))
  (at 7160 (not (image_available img10)))
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
  (> (image_score img8) 0)
  (<= (image_score img8) 15.0)

(>= (total_score) 3)
))
(:metric maximize 
  (image_score img8)
)
)
