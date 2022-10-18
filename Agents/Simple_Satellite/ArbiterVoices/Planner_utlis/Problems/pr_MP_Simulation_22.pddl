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



  (at 301 (image_available img1))
  (at 309 (not (image_available img1)))
  (at 325 (image_available img2))
  (at 333 (not (image_available img2)))
  (at 281 (image_available img3))
  (at 289 (not (image_available img3)))
  (at 157 (image_available img4))
  (at 165 (not (image_available img4)))
  (at 73 (image_available img5))
  (at 81 (not (image_available img5)))
  (at 80 (image_available img6))
  (at 88 (not (image_available img6)))
  (at 240 (image_available img7))
  (at 248 (not (image_available img7)))
  (at 296 (image_available img8))
  (at 304 (not (image_available img8)))
  (at 260 (image_available img9))
  (at 268 (not (image_available img9)))
  (at 243 (image_available img10))
  (at 251 (not (image_available img10)))
  (at 661 (image_available img1))
  (at 669 (not (image_available img1)))
  (at 685 (image_available img2))
  (at 693 (not (image_available img2)))
  (at 641 (image_available img3))
  (at 649 (not (image_available img3)))
  (at 517 (image_available img4))
  (at 525 (not (image_available img4)))
  (at 433 (image_available img5))
  (at 441 (not (image_available img5)))
  (at 440 (image_available img6))
  (at 448 (not (image_available img6)))
  (at 600 (image_available img7))
  (at 608 (not (image_available img7)))
  (at 656 (image_available img8))
  (at 664 (not (image_available img8)))
  (at 620 (image_available img9))
  (at 628 (not (image_available img9)))
  (at 603 (image_available img10))
  (at 611 (not (image_available img10)))
  (at 1021 (image_available img1))
  (at 1029 (not (image_available img1)))
  (at 1045 (image_available img2))
  (at 1053 (not (image_available img2)))
  (at 1001 (image_available img3))
  (at 1009 (not (image_available img3)))
  (at 877 (image_available img4))
  (at 885 (not (image_available img4)))
  (at 793 (image_available img5))
  (at 801 (not (image_available img5)))
  (at 800 (image_available img6))
  (at 808 (not (image_available img6)))
  (at 960 (image_available img7))
  (at 968 (not (image_available img7)))
  (at 1016 (image_available img8))
  (at 1024 (not (image_available img8)))
  (at 980 (image_available img9))
  (at 988 (not (image_available img9)))
  (at 963 (image_available img10))
  (at 971 (not (image_available img10)))
  (at 1381 (image_available img1))
  (at 1389 (not (image_available img1)))
  (at 1405 (image_available img2))
  (at 1413 (not (image_available img2)))
  (at 1361 (image_available img3))
  (at 1369 (not (image_available img3)))
  (at 1237 (image_available img4))
  (at 1245 (not (image_available img4)))
  (at 1153 (image_available img5))
  (at 1161 (not (image_available img5)))
  (at 1160 (image_available img6))
  (at 1168 (not (image_available img6)))
  (at 1320 (image_available img7))
  (at 1328 (not (image_available img7)))
  (at 1376 (image_available img8))
  (at 1384 (not (image_available img8)))
  (at 1340 (image_available img9))
  (at 1348 (not (image_available img9)))
  (at 1323 (image_available img10))
  (at 1331 (not (image_available img10)))
  (at 1741 (image_available img1))
  (at 1749 (not (image_available img1)))
  (at 1765 (image_available img2))
  (at 1773 (not (image_available img2)))
  (at 1721 (image_available img3))
  (at 1729 (not (image_available img3)))
  (at 1597 (image_available img4))
  (at 1605 (not (image_available img4)))
  (at 1513 (image_available img5))
  (at 1521 (not (image_available img5)))
  (at 1520 (image_available img6))
  (at 1528 (not (image_available img6)))
  (at 1680 (image_available img7))
  (at 1688 (not (image_available img7)))
  (at 1736 (image_available img8))
  (at 1744 (not (image_available img8)))
  (at 1700 (image_available img9))
  (at 1708 (not (image_available img9)))
  (at 1683 (image_available img10))
  (at 1691 (not (image_available img10)))
  (at 2101 (image_available img1))
  (at 2109 (not (image_available img1)))
  (at 2125 (image_available img2))
  (at 2133 (not (image_available img2)))
  (at 2081 (image_available img3))
  (at 2089 (not (image_available img3)))
  (at 1957 (image_available img4))
  (at 1965 (not (image_available img4)))
  (at 1873 (image_available img5))
  (at 1881 (not (image_available img5)))
  (at 1880 (image_available img6))
  (at 1888 (not (image_available img6)))
  (at 2040 (image_available img7))
  (at 2048 (not (image_available img7)))
  (at 2096 (image_available img8))
  (at 2104 (not (image_available img8)))
  (at 2060 (image_available img9))
  (at 2068 (not (image_available img9)))
  (at 2043 (image_available img10))
  (at 2051 (not (image_available img10)))
  (at 2461 (image_available img1))
  (at 2469 (not (image_available img1)))
  (at 2485 (image_available img2))
  (at 2493 (not (image_available img2)))
  (at 2441 (image_available img3))
  (at 2449 (not (image_available img3)))
  (at 2317 (image_available img4))
  (at 2325 (not (image_available img4)))
  (at 2233 (image_available img5))
  (at 2241 (not (image_available img5)))
  (at 2240 (image_available img6))
  (at 2248 (not (image_available img6)))
  (at 2400 (image_available img7))
  (at 2408 (not (image_available img7)))
  (at 2456 (image_available img8))
  (at 2464 (not (image_available img8)))
  (at 2420 (image_available img9))
  (at 2428 (not (image_available img9)))
  (at 2403 (image_available img10))
  (at 2411 (not (image_available img10)))
  (at 2821 (image_available img1))
  (at 2829 (not (image_available img1)))
  (at 2845 (image_available img2))
  (at 2853 (not (image_available img2)))
  (at 2801 (image_available img3))
  (at 2809 (not (image_available img3)))
  (at 2677 (image_available img4))
  (at 2685 (not (image_available img4)))
  (at 2593 (image_available img5))
  (at 2601 (not (image_available img5)))
  (at 2600 (image_available img6))
  (at 2608 (not (image_available img6)))
  (at 2760 (image_available img7))
  (at 2768 (not (image_available img7)))
  (at 2816 (image_available img8))
  (at 2824 (not (image_available img8)))
  (at 2780 (image_available img9))
  (at 2788 (not (image_available img9)))
  (at 2763 (image_available img10))
  (at 2771 (not (image_available img10)))
  (at 3181 (image_available img1))
  (at 3189 (not (image_available img1)))
  (at 3205 (image_available img2))
  (at 3213 (not (image_available img2)))
  (at 3161 (image_available img3))
  (at 3169 (not (image_available img3)))
  (at 3037 (image_available img4))
  (at 3045 (not (image_available img4)))
  (at 2953 (image_available img5))
  (at 2961 (not (image_available img5)))
  (at 2960 (image_available img6))
  (at 2968 (not (image_available img6)))
  (at 3120 (image_available img7))
  (at 3128 (not (image_available img7)))
  (at 3176 (image_available img8))
  (at 3184 (not (image_available img8)))
  (at 3140 (image_available img9))
  (at 3148 (not (image_available img9)))
  (at 3123 (image_available img10))
  (at 3131 (not (image_available img10)))
  (at 3541 (image_available img1))
  (at 3549 (not (image_available img1)))
  (at 3565 (image_available img2))
  (at 3573 (not (image_available img2)))
  (at 3521 (image_available img3))
  (at 3529 (not (image_available img3)))
  (at 3397 (image_available img4))
  (at 3405 (not (image_available img4)))
  (at 3313 (image_available img5))
  (at 3321 (not (image_available img5)))
  (at 3320 (image_available img6))
  (at 3328 (not (image_available img6)))
  (at 3480 (image_available img7))
  (at 3488 (not (image_available img7)))
  (at 3536 (image_available img8))
  (at 3544 (not (image_available img8)))
  (at 3500 (image_available img9))
  (at 3508 (not (image_available img9)))
  (at 3483 (image_available img10))
  (at 3491 (not (image_available img10)))
  (at 3901 (image_available img1))
  (at 3909 (not (image_available img1)))
  (at 3925 (image_available img2))
  (at 3933 (not (image_available img2)))
  (at 3881 (image_available img3))
  (at 3889 (not (image_available img3)))
  (at 3757 (image_available img4))
  (at 3765 (not (image_available img4)))
  (at 3673 (image_available img5))
  (at 3681 (not (image_available img5)))
  (at 3680 (image_available img6))
  (at 3688 (not (image_available img6)))
  (at 3840 (image_available img7))
  (at 3848 (not (image_available img7)))
  (at 3896 (image_available img8))
  (at 3904 (not (image_available img8)))
  (at 3860 (image_available img9))
  (at 3868 (not (image_available img9)))
  (at 3843 (image_available img10))
  (at 3851 (not (image_available img10)))
  (at 4261 (image_available img1))
  (at 4269 (not (image_available img1)))
  (at 4285 (image_available img2))
  (at 4293 (not (image_available img2)))
  (at 4241 (image_available img3))
  (at 4249 (not (image_available img3)))
  (at 4117 (image_available img4))
  (at 4125 (not (image_available img4)))
  (at 4033 (image_available img5))
  (at 4041 (not (image_available img5)))
  (at 4040 (image_available img6))
  (at 4048 (not (image_available img6)))
  (at 4200 (image_available img7))
  (at 4208 (not (image_available img7)))
  (at 4256 (image_available img8))
  (at 4264 (not (image_available img8)))
  (at 4220 (image_available img9))
  (at 4228 (not (image_available img9)))
  (at 4203 (image_available img10))
  (at 4211 (not (image_available img10)))
  (at 4621 (image_available img1))
  (at 4629 (not (image_available img1)))
  (at 4645 (image_available img2))
  (at 4653 (not (image_available img2)))
  (at 4601 (image_available img3))
  (at 4609 (not (image_available img3)))
  (at 4477 (image_available img4))
  (at 4485 (not (image_available img4)))
  (at 4393 (image_available img5))
  (at 4401 (not (image_available img5)))
  (at 4400 (image_available img6))
  (at 4408 (not (image_available img6)))
  (at 4560 (image_available img7))
  (at 4568 (not (image_available img7)))
  (at 4616 (image_available img8))
  (at 4624 (not (image_available img8)))
  (at 4580 (image_available img9))
  (at 4588 (not (image_available img9)))
  (at 4563 (image_available img10))
  (at 4571 (not (image_available img10)))
  (at 4981 (image_available img1))
  (at 4989 (not (image_available img1)))
  (at 5005 (image_available img2))
  (at 5013 (not (image_available img2)))
  (at 4961 (image_available img3))
  (at 4969 (not (image_available img3)))
  (at 4837 (image_available img4))
  (at 4845 (not (image_available img4)))
  (at 4753 (image_available img5))
  (at 4761 (not (image_available img5)))
  (at 4760 (image_available img6))
  (at 4768 (not (image_available img6)))
  (at 4920 (image_available img7))
  (at 4928 (not (image_available img7)))
  (at 4976 (image_available img8))
  (at 4984 (not (image_available img8)))
  (at 4940 (image_available img9))
  (at 4948 (not (image_available img9)))
  (at 4923 (image_available img10))
  (at 4931 (not (image_available img10)))
  (at 5341 (image_available img1))
  (at 5349 (not (image_available img1)))
  (at 5365 (image_available img2))
  (at 5373 (not (image_available img2)))
  (at 5321 (image_available img3))
  (at 5329 (not (image_available img3)))
  (at 5197 (image_available img4))
  (at 5205 (not (image_available img4)))
  (at 5113 (image_available img5))
  (at 5121 (not (image_available img5)))
  (at 5120 (image_available img6))
  (at 5128 (not (image_available img6)))
  (at 5280 (image_available img7))
  (at 5288 (not (image_available img7)))
  (at 5336 (image_available img8))
  (at 5344 (not (image_available img8)))
  (at 5300 (image_available img9))
  (at 5308 (not (image_available img9)))
  (at 5283 (image_available img10))
  (at 5291 (not (image_available img10)))
  (at 5701 (image_available img1))
  (at 5709 (not (image_available img1)))
  (at 5725 (image_available img2))
  (at 5733 (not (image_available img2)))
  (at 5681 (image_available img3))
  (at 5689 (not (image_available img3)))
  (at 5557 (image_available img4))
  (at 5565 (not (image_available img4)))
  (at 5473 (image_available img5))
  (at 5481 (not (image_available img5)))
  (at 5480 (image_available img6))
  (at 5488 (not (image_available img6)))
  (at 5640 (image_available img7))
  (at 5648 (not (image_available img7)))
  (at 5696 (image_available img8))
  (at 5704 (not (image_available img8)))
  (at 5660 (image_available img9))
  (at 5668 (not (image_available img9)))
  (at 5643 (image_available img10))
  (at 5651 (not (image_available img10)))
  (at 6061 (image_available img1))
  (at 6069 (not (image_available img1)))
  (at 6085 (image_available img2))
  (at 6093 (not (image_available img2)))
  (at 6041 (image_available img3))
  (at 6049 (not (image_available img3)))
  (at 5917 (image_available img4))
  (at 5925 (not (image_available img4)))
  (at 5833 (image_available img5))
  (at 5841 (not (image_available img5)))
  (at 5840 (image_available img6))
  (at 5848 (not (image_available img6)))
  (at 6000 (image_available img7))
  (at 6008 (not (image_available img7)))
  (at 6056 (image_available img8))
  (at 6064 (not (image_available img8)))
  (at 6020 (image_available img9))
  (at 6028 (not (image_available img9)))
  (at 6003 (image_available img10))
  (at 6011 (not (image_available img10)))
  (at 6421 (image_available img1))
  (at 6429 (not (image_available img1)))
  (at 6445 (image_available img2))
  (at 6453 (not (image_available img2)))
  (at 6401 (image_available img3))
  (at 6409 (not (image_available img3)))
  (at 6277 (image_available img4))
  (at 6285 (not (image_available img4)))
  (at 6193 (image_available img5))
  (at 6201 (not (image_available img5)))
  (at 6200 (image_available img6))
  (at 6208 (not (image_available img6)))
  (at 6360 (image_available img7))
  (at 6368 (not (image_available img7)))
  (at 6416 (image_available img8))
  (at 6424 (not (image_available img8)))
  (at 6380 (image_available img9))
  (at 6388 (not (image_available img9)))
  (at 6363 (image_available img10))
  (at 6371 (not (image_available img10)))
  (at 6781 (image_available img1))
  (at 6789 (not (image_available img1)))
  (at 6805 (image_available img2))
  (at 6813 (not (image_available img2)))
  (at 6761 (image_available img3))
  (at 6769 (not (image_available img3)))
  (at 6637 (image_available img4))
  (at 6645 (not (image_available img4)))
  (at 6553 (image_available img5))
  (at 6561 (not (image_available img5)))
  (at 6560 (image_available img6))
  (at 6568 (not (image_available img6)))
  (at 6720 (image_available img7))
  (at 6728 (not (image_available img7)))
  (at 6776 (image_available img8))
  (at 6784 (not (image_available img8)))
  (at 6740 (image_available img9))
  (at 6748 (not (image_available img9)))
  (at 6723 (image_available img10))
  (at 6731 (not (image_available img10)))
  (at 7141 (image_available img1))
  (at 7149 (not (image_available img1)))
  (at 7165 (image_available img2))
  (at 7173 (not (image_available img2)))
  (at 7121 (image_available img3))
  (at 7129 (not (image_available img3)))
  (at 6997 (image_available img4))
  (at 7005 (not (image_available img4)))
  (at 6913 (image_available img5))
  (at 6921 (not (image_available img5)))
  (at 6920 (image_available img6))
  (at 6928 (not (image_available img6)))
  (at 7080 (image_available img7))
  (at 7088 (not (image_available img7)))
  (at 7136 (image_available img8))
  (at 7144 (not (image_available img8)))
  (at 7100 (image_available img9))
  (at 7108 (not (image_available img9)))
  (at 7083 (image_available img10))
  (at 7091 (not (image_available img10)))
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
  (> (image_score img4) 0)
  (<= (image_score img4) 6.0)

  (> (image_score img5) 0)
  (<= (image_score img5) 9.0)

  (> (image_score img8) 0)
  (<= (image_score img8) 10.0)

(>= (total_score) 5)
))
(:metric maximize (+
  (image_score img4)
    (+ (image_score img5)
      (image_score img8)
    )
  )
)
)