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
  (memory_free mem1)
  (memory_free mem2)
  (memory_free mem3)
  (memory_free mem4)
  (memory_free mem5)
  (memory_free mem6)
  (memory_free mem7)
  (memory_free mem8)
  (memory_free mem9)



  (at 74 (image_available img1))
  (at 82 (not (image_available img1)))
  (at 247 (image_available img2))
  (at 255 (not (image_available img2)))
  (at 218 (image_available img3))
  (at 226 (not (image_available img3)))
  (at 29 (image_available img4))
  (at 37 (not (image_available img4)))
  (at 64 (image_available img5))
  (at 72 (not (image_available img5)))
  (at 340 (image_available img6))
  (at 348 (not (image_available img6)))
  (at 285 (image_available img7))
  (at 293 (not (image_available img7)))
  (at 338 (image_available img8))
  (at 346 (not (image_available img8)))
  (at 106 (image_available img9))
  (at 114 (not (image_available img9)))
  (at 232 (image_available img10))
  (at 240 (not (image_available img10)))
  (at 178 (image_available img11))
  (at 186 (not (image_available img11)))
  (at 72 (image_available img12))
  (at 80 (not (image_available img12)))
  (at 47 (image_available img13))
  (at 55 (not (image_available img13)))
  (at 151 (image_available img14))
  (at 159 (not (image_available img14)))
  (at 64 (image_available img15))
  (at 72 (not (image_available img15)))
  (at 350 (image_available img16))
  (at 358 (not (image_available img16)))
  (at 142 (image_available img17))
  (at 150 (not (image_available img17)))
  (at 153 (image_available img18))
  (at 161 (not (image_available img18)))
  (at 282 (image_available img19))
  (at 290 (not (image_available img19)))
  (at 61 (image_available img20))
  (at 69 (not (image_available img20)))
  (at 434 (image_available img1))
  (at 442 (not (image_available img1)))
  (at 607 (image_available img2))
  (at 615 (not (image_available img2)))
  (at 578 (image_available img3))
  (at 586 (not (image_available img3)))
  (at 389 (image_available img4))
  (at 397 (not (image_available img4)))
  (at 424 (image_available img5))
  (at 432 (not (image_available img5)))
  (at 700 (image_available img6))
  (at 708 (not (image_available img6)))
  (at 645 (image_available img7))
  (at 653 (not (image_available img7)))
  (at 698 (image_available img8))
  (at 706 (not (image_available img8)))
  (at 466 (image_available img9))
  (at 474 (not (image_available img9)))
  (at 592 (image_available img10))
  (at 600 (not (image_available img10)))
  (at 538 (image_available img11))
  (at 546 (not (image_available img11)))
  (at 432 (image_available img12))
  (at 440 (not (image_available img12)))
  (at 407 (image_available img13))
  (at 415 (not (image_available img13)))
  (at 511 (image_available img14))
  (at 519 (not (image_available img14)))
  (at 424 (image_available img15))
  (at 432 (not (image_available img15)))
  (at 710 (image_available img16))
  (at 718 (not (image_available img16)))
  (at 502 (image_available img17))
  (at 510 (not (image_available img17)))
  (at 513 (image_available img18))
  (at 521 (not (image_available img18)))
  (at 642 (image_available img19))
  (at 650 (not (image_available img19)))
  (at 421 (image_available img20))
  (at 429 (not (image_available img20)))
  (at 794 (image_available img1))
  (at 802 (not (image_available img1)))
  (at 967 (image_available img2))
  (at 975 (not (image_available img2)))
  (at 938 (image_available img3))
  (at 946 (not (image_available img3)))
  (at 749 (image_available img4))
  (at 757 (not (image_available img4)))
  (at 784 (image_available img5))
  (at 792 (not (image_available img5)))
  (at 1060 (image_available img6))
  (at 1068 (not (image_available img6)))
  (at 1005 (image_available img7))
  (at 1013 (not (image_available img7)))
  (at 1058 (image_available img8))
  (at 1066 (not (image_available img8)))
  (at 826 (image_available img9))
  (at 834 (not (image_available img9)))
  (at 952 (image_available img10))
  (at 960 (not (image_available img10)))
  (at 898 (image_available img11))
  (at 906 (not (image_available img11)))
  (at 792 (image_available img12))
  (at 800 (not (image_available img12)))
  (at 767 (image_available img13))
  (at 775 (not (image_available img13)))
  (at 871 (image_available img14))
  (at 879 (not (image_available img14)))
  (at 784 (image_available img15))
  (at 792 (not (image_available img15)))
  (at 1070 (image_available img16))
  (at 1078 (not (image_available img16)))
  (at 862 (image_available img17))
  (at 870 (not (image_available img17)))
  (at 873 (image_available img18))
  (at 881 (not (image_available img18)))
  (at 1002 (image_available img19))
  (at 1010 (not (image_available img19)))
  (at 781 (image_available img20))
  (at 789 (not (image_available img20)))
  (at 1154 (image_available img1))
  (at 1162 (not (image_available img1)))
  (at 1327 (image_available img2))
  (at 1335 (not (image_available img2)))
  (at 1298 (image_available img3))
  (at 1306 (not (image_available img3)))
  (at 1109 (image_available img4))
  (at 1117 (not (image_available img4)))
  (at 1144 (image_available img5))
  (at 1152 (not (image_available img5)))
  (at 1420 (image_available img6))
  (at 1428 (not (image_available img6)))
  (at 1365 (image_available img7))
  (at 1373 (not (image_available img7)))
  (at 1418 (image_available img8))
  (at 1426 (not (image_available img8)))
  (at 1186 (image_available img9))
  (at 1194 (not (image_available img9)))
  (at 1312 (image_available img10))
  (at 1320 (not (image_available img10)))
  (at 1258 (image_available img11))
  (at 1266 (not (image_available img11)))
  (at 1152 (image_available img12))
  (at 1160 (not (image_available img12)))
  (at 1127 (image_available img13))
  (at 1135 (not (image_available img13)))
  (at 1231 (image_available img14))
  (at 1239 (not (image_available img14)))
  (at 1144 (image_available img15))
  (at 1152 (not (image_available img15)))
  (at 1430 (image_available img16))
  (at 1438 (not (image_available img16)))
  (at 1222 (image_available img17))
  (at 1230 (not (image_available img17)))
  (at 1233 (image_available img18))
  (at 1241 (not (image_available img18)))
  (at 1362 (image_available img19))
  (at 1370 (not (image_available img19)))
  (at 1141 (image_available img20))
  (at 1149 (not (image_available img20)))
  (at 1514 (image_available img1))
  (at 1522 (not (image_available img1)))
  (at 1687 (image_available img2))
  (at 1695 (not (image_available img2)))
  (at 1658 (image_available img3))
  (at 1666 (not (image_available img3)))
  (at 1469 (image_available img4))
  (at 1477 (not (image_available img4)))
  (at 1504 (image_available img5))
  (at 1512 (not (image_available img5)))
  (at 1780 (image_available img6))
  (at 1788 (not (image_available img6)))
  (at 1725 (image_available img7))
  (at 1733 (not (image_available img7)))
  (at 1778 (image_available img8))
  (at 1786 (not (image_available img8)))
  (at 1546 (image_available img9))
  (at 1554 (not (image_available img9)))
  (at 1672 (image_available img10))
  (at 1680 (not (image_available img10)))
  (at 1618 (image_available img11))
  (at 1626 (not (image_available img11)))
  (at 1512 (image_available img12))
  (at 1520 (not (image_available img12)))
  (at 1487 (image_available img13))
  (at 1495 (not (image_available img13)))
  (at 1591 (image_available img14))
  (at 1599 (not (image_available img14)))
  (at 1504 (image_available img15))
  (at 1512 (not (image_available img15)))
  (at 1790 (image_available img16))
  (at 1798 (not (image_available img16)))
  (at 1582 (image_available img17))
  (at 1590 (not (image_available img17)))
  (at 1593 (image_available img18))
  (at 1601 (not (image_available img18)))
  (at 1722 (image_available img19))
  (at 1730 (not (image_available img19)))
  (at 1501 (image_available img20))
  (at 1509 (not (image_available img20)))
  (at 1874 (image_available img1))
  (at 1882 (not (image_available img1)))
  (at 2047 (image_available img2))
  (at 2055 (not (image_available img2)))
  (at 2018 (image_available img3))
  (at 2026 (not (image_available img3)))
  (at 1829 (image_available img4))
  (at 1837 (not (image_available img4)))
  (at 1864 (image_available img5))
  (at 1872 (not (image_available img5)))
  (at 2140 (image_available img6))
  (at 2148 (not (image_available img6)))
  (at 2085 (image_available img7))
  (at 2093 (not (image_available img7)))
  (at 2138 (image_available img8))
  (at 2146 (not (image_available img8)))
  (at 1906 (image_available img9))
  (at 1914 (not (image_available img9)))
  (at 2032 (image_available img10))
  (at 2040 (not (image_available img10)))
  (at 1978 (image_available img11))
  (at 1986 (not (image_available img11)))
  (at 1872 (image_available img12))
  (at 1880 (not (image_available img12)))
  (at 1847 (image_available img13))
  (at 1855 (not (image_available img13)))
  (at 1951 (image_available img14))
  (at 1959 (not (image_available img14)))
  (at 1864 (image_available img15))
  (at 1872 (not (image_available img15)))
  (at 2150 (image_available img16))
  (at 2158 (not (image_available img16)))
  (at 1942 (image_available img17))
  (at 1950 (not (image_available img17)))
  (at 1953 (image_available img18))
  (at 1961 (not (image_available img18)))
  (at 2082 (image_available img19))
  (at 2090 (not (image_available img19)))
  (at 1861 (image_available img20))
  (at 1869 (not (image_available img20)))
  (at 2234 (image_available img1))
  (at 2242 (not (image_available img1)))
  (at 2407 (image_available img2))
  (at 2415 (not (image_available img2)))
  (at 2378 (image_available img3))
  (at 2386 (not (image_available img3)))
  (at 2189 (image_available img4))
  (at 2197 (not (image_available img4)))
  (at 2224 (image_available img5))
  (at 2232 (not (image_available img5)))
  (at 2500 (image_available img6))
  (at 2508 (not (image_available img6)))
  (at 2445 (image_available img7))
  (at 2453 (not (image_available img7)))
  (at 2498 (image_available img8))
  (at 2506 (not (image_available img8)))
  (at 2266 (image_available img9))
  (at 2274 (not (image_available img9)))
  (at 2392 (image_available img10))
  (at 2400 (not (image_available img10)))
  (at 2338 (image_available img11))
  (at 2346 (not (image_available img11)))
  (at 2232 (image_available img12))
  (at 2240 (not (image_available img12)))
  (at 2207 (image_available img13))
  (at 2215 (not (image_available img13)))
  (at 2311 (image_available img14))
  (at 2319 (not (image_available img14)))
  (at 2224 (image_available img15))
  (at 2232 (not (image_available img15)))
  (at 2510 (image_available img16))
  (at 2518 (not (image_available img16)))
  (at 2302 (image_available img17))
  (at 2310 (not (image_available img17)))
  (at 2313 (image_available img18))
  (at 2321 (not (image_available img18)))
  (at 2442 (image_available img19))
  (at 2450 (not (image_available img19)))
  (at 2221 (image_available img20))
  (at 2229 (not (image_available img20)))
  (at 2594 (image_available img1))
  (at 2602 (not (image_available img1)))
  (at 2767 (image_available img2))
  (at 2775 (not (image_available img2)))
  (at 2738 (image_available img3))
  (at 2746 (not (image_available img3)))
  (at 2549 (image_available img4))
  (at 2557 (not (image_available img4)))
  (at 2584 (image_available img5))
  (at 2592 (not (image_available img5)))
  (at 2860 (image_available img6))
  (at 2868 (not (image_available img6)))
  (at 2805 (image_available img7))
  (at 2813 (not (image_available img7)))
  (at 2858 (image_available img8))
  (at 2866 (not (image_available img8)))
  (at 2626 (image_available img9))
  (at 2634 (not (image_available img9)))
  (at 2752 (image_available img10))
  (at 2760 (not (image_available img10)))
  (at 2698 (image_available img11))
  (at 2706 (not (image_available img11)))
  (at 2592 (image_available img12))
  (at 2600 (not (image_available img12)))
  (at 2567 (image_available img13))
  (at 2575 (not (image_available img13)))
  (at 2671 (image_available img14))
  (at 2679 (not (image_available img14)))
  (at 2584 (image_available img15))
  (at 2592 (not (image_available img15)))
  (at 2870 (image_available img16))
  (at 2878 (not (image_available img16)))
  (at 2662 (image_available img17))
  (at 2670 (not (image_available img17)))
  (at 2673 (image_available img18))
  (at 2681 (not (image_available img18)))
  (at 2802 (image_available img19))
  (at 2810 (not (image_available img19)))
  (at 2581 (image_available img20))
  (at 2589 (not (image_available img20)))
  (at 2954 (image_available img1))
  (at 2962 (not (image_available img1)))
  (at 3127 (image_available img2))
  (at 3135 (not (image_available img2)))
  (at 3098 (image_available img3))
  (at 3106 (not (image_available img3)))
  (at 2909 (image_available img4))
  (at 2917 (not (image_available img4)))
  (at 2944 (image_available img5))
  (at 2952 (not (image_available img5)))
  (at 3220 (image_available img6))
  (at 3228 (not (image_available img6)))
  (at 3165 (image_available img7))
  (at 3173 (not (image_available img7)))
  (at 3218 (image_available img8))
  (at 3226 (not (image_available img8)))
  (at 2986 (image_available img9))
  (at 2994 (not (image_available img9)))
  (at 3112 (image_available img10))
  (at 3120 (not (image_available img10)))
  (at 3058 (image_available img11))
  (at 3066 (not (image_available img11)))
  (at 2952 (image_available img12))
  (at 2960 (not (image_available img12)))
  (at 2927 (image_available img13))
  (at 2935 (not (image_available img13)))
  (at 3031 (image_available img14))
  (at 3039 (not (image_available img14)))
  (at 2944 (image_available img15))
  (at 2952 (not (image_available img15)))
  (at 3230 (image_available img16))
  (at 3238 (not (image_available img16)))
  (at 3022 (image_available img17))
  (at 3030 (not (image_available img17)))
  (at 3033 (image_available img18))
  (at 3041 (not (image_available img18)))
  (at 3162 (image_available img19))
  (at 3170 (not (image_available img19)))
  (at 2941 (image_available img20))
  (at 2949 (not (image_available img20)))
  (at 3314 (image_available img1))
  (at 3322 (not (image_available img1)))
  (at 3487 (image_available img2))
  (at 3495 (not (image_available img2)))
  (at 3458 (image_available img3))
  (at 3466 (not (image_available img3)))
  (at 3269 (image_available img4))
  (at 3277 (not (image_available img4)))
  (at 3304 (image_available img5))
  (at 3312 (not (image_available img5)))
  (at 3580 (image_available img6))
  (at 3588 (not (image_available img6)))
  (at 3525 (image_available img7))
  (at 3533 (not (image_available img7)))
  (at 3578 (image_available img8))
  (at 3586 (not (image_available img8)))
  (at 3346 (image_available img9))
  (at 3354 (not (image_available img9)))
  (at 3472 (image_available img10))
  (at 3480 (not (image_available img10)))
  (at 3418 (image_available img11))
  (at 3426 (not (image_available img11)))
  (at 3312 (image_available img12))
  (at 3320 (not (image_available img12)))
  (at 3287 (image_available img13))
  (at 3295 (not (image_available img13)))
  (at 3391 (image_available img14))
  (at 3399 (not (image_available img14)))
  (at 3304 (image_available img15))
  (at 3312 (not (image_available img15)))
  (at 3590 (image_available img16))
  (at 3598 (not (image_available img16)))
  (at 3382 (image_available img17))
  (at 3390 (not (image_available img17)))
  (at 3393 (image_available img18))
  (at 3401 (not (image_available img18)))
  (at 3522 (image_available img19))
  (at 3530 (not (image_available img19)))
  (at 3301 (image_available img20))
  (at 3309 (not (image_available img20)))
  (at 3674 (image_available img1))
  (at 3682 (not (image_available img1)))
  (at 3847 (image_available img2))
  (at 3855 (not (image_available img2)))
  (at 3818 (image_available img3))
  (at 3826 (not (image_available img3)))
  (at 3629 (image_available img4))
  (at 3637 (not (image_available img4)))
  (at 3664 (image_available img5))
  (at 3672 (not (image_available img5)))
  (at 3940 (image_available img6))
  (at 3948 (not (image_available img6)))
  (at 3885 (image_available img7))
  (at 3893 (not (image_available img7)))
  (at 3938 (image_available img8))
  (at 3946 (not (image_available img8)))
  (at 3706 (image_available img9))
  (at 3714 (not (image_available img9)))
  (at 3832 (image_available img10))
  (at 3840 (not (image_available img10)))
  (at 3778 (image_available img11))
  (at 3786 (not (image_available img11)))
  (at 3672 (image_available img12))
  (at 3680 (not (image_available img12)))
  (at 3647 (image_available img13))
  (at 3655 (not (image_available img13)))
  (at 3751 (image_available img14))
  (at 3759 (not (image_available img14)))
  (at 3664 (image_available img15))
  (at 3672 (not (image_available img15)))
  (at 3950 (image_available img16))
  (at 3958 (not (image_available img16)))
  (at 3742 (image_available img17))
  (at 3750 (not (image_available img17)))
  (at 3753 (image_available img18))
  (at 3761 (not (image_available img18)))
  (at 3882 (image_available img19))
  (at 3890 (not (image_available img19)))
  (at 3661 (image_available img20))
  (at 3669 (not (image_available img20)))
  (at 4034 (image_available img1))
  (at 4042 (not (image_available img1)))
  (at 4207 (image_available img2))
  (at 4215 (not (image_available img2)))
  (at 4178 (image_available img3))
  (at 4186 (not (image_available img3)))
  (at 3989 (image_available img4))
  (at 3997 (not (image_available img4)))
  (at 4024 (image_available img5))
  (at 4032 (not (image_available img5)))
  (at 4300 (image_available img6))
  (at 4308 (not (image_available img6)))
  (at 4245 (image_available img7))
  (at 4253 (not (image_available img7)))
  (at 4298 (image_available img8))
  (at 4306 (not (image_available img8)))
  (at 4066 (image_available img9))
  (at 4074 (not (image_available img9)))
  (at 4192 (image_available img10))
  (at 4200 (not (image_available img10)))
  (at 4138 (image_available img11))
  (at 4146 (not (image_available img11)))
  (at 4032 (image_available img12))
  (at 4040 (not (image_available img12)))
  (at 4007 (image_available img13))
  (at 4015 (not (image_available img13)))
  (at 4111 (image_available img14))
  (at 4119 (not (image_available img14)))
  (at 4024 (image_available img15))
  (at 4032 (not (image_available img15)))
  (at 4310 (image_available img16))
  (at 4318 (not (image_available img16)))
  (at 4102 (image_available img17))
  (at 4110 (not (image_available img17)))
  (at 4113 (image_available img18))
  (at 4121 (not (image_available img18)))
  (at 4242 (image_available img19))
  (at 4250 (not (image_available img19)))
  (at 4021 (image_available img20))
  (at 4029 (not (image_available img20)))
  (at 4394 (image_available img1))
  (at 4402 (not (image_available img1)))
  (at 4567 (image_available img2))
  (at 4575 (not (image_available img2)))
  (at 4538 (image_available img3))
  (at 4546 (not (image_available img3)))
  (at 4349 (image_available img4))
  (at 4357 (not (image_available img4)))
  (at 4384 (image_available img5))
  (at 4392 (not (image_available img5)))
  (at 4660 (image_available img6))
  (at 4668 (not (image_available img6)))
  (at 4605 (image_available img7))
  (at 4613 (not (image_available img7)))
  (at 4658 (image_available img8))
  (at 4666 (not (image_available img8)))
  (at 4426 (image_available img9))
  (at 4434 (not (image_available img9)))
  (at 4552 (image_available img10))
  (at 4560 (not (image_available img10)))
  (at 4498 (image_available img11))
  (at 4506 (not (image_available img11)))
  (at 4392 (image_available img12))
  (at 4400 (not (image_available img12)))
  (at 4367 (image_available img13))
  (at 4375 (not (image_available img13)))
  (at 4471 (image_available img14))
  (at 4479 (not (image_available img14)))
  (at 4384 (image_available img15))
  (at 4392 (not (image_available img15)))
  (at 4670 (image_available img16))
  (at 4678 (not (image_available img16)))
  (at 4462 (image_available img17))
  (at 4470 (not (image_available img17)))
  (at 4473 (image_available img18))
  (at 4481 (not (image_available img18)))
  (at 4602 (image_available img19))
  (at 4610 (not (image_available img19)))
  (at 4381 (image_available img20))
  (at 4389 (not (image_available img20)))
  (at 4754 (image_available img1))
  (at 4762 (not (image_available img1)))
  (at 4927 (image_available img2))
  (at 4935 (not (image_available img2)))
  (at 4898 (image_available img3))
  (at 4906 (not (image_available img3)))
  (at 4709 (image_available img4))
  (at 4717 (not (image_available img4)))
  (at 4744 (image_available img5))
  (at 4752 (not (image_available img5)))
  (at 5020 (image_available img6))
  (at 5028 (not (image_available img6)))
  (at 4965 (image_available img7))
  (at 4973 (not (image_available img7)))
  (at 5018 (image_available img8))
  (at 5026 (not (image_available img8)))
  (at 4786 (image_available img9))
  (at 4794 (not (image_available img9)))
  (at 4912 (image_available img10))
  (at 4920 (not (image_available img10)))
  (at 4858 (image_available img11))
  (at 4866 (not (image_available img11)))
  (at 4752 (image_available img12))
  (at 4760 (not (image_available img12)))
  (at 4727 (image_available img13))
  (at 4735 (not (image_available img13)))
  (at 4831 (image_available img14))
  (at 4839 (not (image_available img14)))
  (at 4744 (image_available img15))
  (at 4752 (not (image_available img15)))
  (at 5030 (image_available img16))
  (at 5038 (not (image_available img16)))
  (at 4822 (image_available img17))
  (at 4830 (not (image_available img17)))
  (at 4833 (image_available img18))
  (at 4841 (not (image_available img18)))
  (at 4962 (image_available img19))
  (at 4970 (not (image_available img19)))
  (at 4741 (image_available img20))
  (at 4749 (not (image_available img20)))
  (at 5114 (image_available img1))
  (at 5122 (not (image_available img1)))
  (at 5287 (image_available img2))
  (at 5295 (not (image_available img2)))
  (at 5258 (image_available img3))
  (at 5266 (not (image_available img3)))
  (at 5069 (image_available img4))
  (at 5077 (not (image_available img4)))
  (at 5104 (image_available img5))
  (at 5112 (not (image_available img5)))
  (at 5380 (image_available img6))
  (at 5388 (not (image_available img6)))
  (at 5325 (image_available img7))
  (at 5333 (not (image_available img7)))
  (at 5378 (image_available img8))
  (at 5386 (not (image_available img8)))
  (at 5146 (image_available img9))
  (at 5154 (not (image_available img9)))
  (at 5272 (image_available img10))
  (at 5280 (not (image_available img10)))
  (at 5218 (image_available img11))
  (at 5226 (not (image_available img11)))
  (at 5112 (image_available img12))
  (at 5120 (not (image_available img12)))
  (at 5087 (image_available img13))
  (at 5095 (not (image_available img13)))
  (at 5191 (image_available img14))
  (at 5199 (not (image_available img14)))
  (at 5104 (image_available img15))
  (at 5112 (not (image_available img15)))
  (at 5390 (image_available img16))
  (at 5398 (not (image_available img16)))
  (at 5182 (image_available img17))
  (at 5190 (not (image_available img17)))
  (at 5193 (image_available img18))
  (at 5201 (not (image_available img18)))
  (at 5322 (image_available img19))
  (at 5330 (not (image_available img19)))
  (at 5101 (image_available img20))
  (at 5109 (not (image_available img20)))
  (at 5474 (image_available img1))
  (at 5482 (not (image_available img1)))
  (at 5647 (image_available img2))
  (at 5655 (not (image_available img2)))
  (at 5618 (image_available img3))
  (at 5626 (not (image_available img3)))
  (at 5429 (image_available img4))
  (at 5437 (not (image_available img4)))
  (at 5464 (image_available img5))
  (at 5472 (not (image_available img5)))
  (at 5740 (image_available img6))
  (at 5748 (not (image_available img6)))
  (at 5685 (image_available img7))
  (at 5693 (not (image_available img7)))
  (at 5738 (image_available img8))
  (at 5746 (not (image_available img8)))
  (at 5506 (image_available img9))
  (at 5514 (not (image_available img9)))
  (at 5632 (image_available img10))
  (at 5640 (not (image_available img10)))
  (at 5578 (image_available img11))
  (at 5586 (not (image_available img11)))
  (at 5472 (image_available img12))
  (at 5480 (not (image_available img12)))
  (at 5447 (image_available img13))
  (at 5455 (not (image_available img13)))
  (at 5551 (image_available img14))
  (at 5559 (not (image_available img14)))
  (at 5464 (image_available img15))
  (at 5472 (not (image_available img15)))
  (at 5750 (image_available img16))
  (at 5758 (not (image_available img16)))
  (at 5542 (image_available img17))
  (at 5550 (not (image_available img17)))
  (at 5553 (image_available img18))
  (at 5561 (not (image_available img18)))
  (at 5682 (image_available img19))
  (at 5690 (not (image_available img19)))
  (at 5461 (image_available img20))
  (at 5469 (not (image_available img20)))
  (at 5834 (image_available img1))
  (at 5842 (not (image_available img1)))
  (at 6007 (image_available img2))
  (at 6015 (not (image_available img2)))
  (at 5978 (image_available img3))
  (at 5986 (not (image_available img3)))
  (at 5789 (image_available img4))
  (at 5797 (not (image_available img4)))
  (at 5824 (image_available img5))
  (at 5832 (not (image_available img5)))
  (at 6100 (image_available img6))
  (at 6108 (not (image_available img6)))
  (at 6045 (image_available img7))
  (at 6053 (not (image_available img7)))
  (at 6098 (image_available img8))
  (at 6106 (not (image_available img8)))
  (at 5866 (image_available img9))
  (at 5874 (not (image_available img9)))
  (at 5992 (image_available img10))
  (at 6000 (not (image_available img10)))
  (at 5938 (image_available img11))
  (at 5946 (not (image_available img11)))
  (at 5832 (image_available img12))
  (at 5840 (not (image_available img12)))
  (at 5807 (image_available img13))
  (at 5815 (not (image_available img13)))
  (at 5911 (image_available img14))
  (at 5919 (not (image_available img14)))
  (at 5824 (image_available img15))
  (at 5832 (not (image_available img15)))
  (at 6110 (image_available img16))
  (at 6118 (not (image_available img16)))
  (at 5902 (image_available img17))
  (at 5910 (not (image_available img17)))
  (at 5913 (image_available img18))
  (at 5921 (not (image_available img18)))
  (at 6042 (image_available img19))
  (at 6050 (not (image_available img19)))
  (at 5821 (image_available img20))
  (at 5829 (not (image_available img20)))
  (at 6194 (image_available img1))
  (at 6202 (not (image_available img1)))
  (at 6367 (image_available img2))
  (at 6375 (not (image_available img2)))
  (at 6338 (image_available img3))
  (at 6346 (not (image_available img3)))
  (at 6149 (image_available img4))
  (at 6157 (not (image_available img4)))
  (at 6184 (image_available img5))
  (at 6192 (not (image_available img5)))
  (at 6460 (image_available img6))
  (at 6468 (not (image_available img6)))
  (at 6405 (image_available img7))
  (at 6413 (not (image_available img7)))
  (at 6458 (image_available img8))
  (at 6466 (not (image_available img8)))
  (at 6226 (image_available img9))
  (at 6234 (not (image_available img9)))
  (at 6352 (image_available img10))
  (at 6360 (not (image_available img10)))
  (at 6298 (image_available img11))
  (at 6306 (not (image_available img11)))
  (at 6192 (image_available img12))
  (at 6200 (not (image_available img12)))
  (at 6167 (image_available img13))
  (at 6175 (not (image_available img13)))
  (at 6271 (image_available img14))
  (at 6279 (not (image_available img14)))
  (at 6184 (image_available img15))
  (at 6192 (not (image_available img15)))
  (at 6470 (image_available img16))
  (at 6478 (not (image_available img16)))
  (at 6262 (image_available img17))
  (at 6270 (not (image_available img17)))
  (at 6273 (image_available img18))
  (at 6281 (not (image_available img18)))
  (at 6402 (image_available img19))
  (at 6410 (not (image_available img19)))
  (at 6181 (image_available img20))
  (at 6189 (not (image_available img20)))
  (at 6554 (image_available img1))
  (at 6562 (not (image_available img1)))
  (at 6727 (image_available img2))
  (at 6735 (not (image_available img2)))
  (at 6698 (image_available img3))
  (at 6706 (not (image_available img3)))
  (at 6509 (image_available img4))
  (at 6517 (not (image_available img4)))
  (at 6544 (image_available img5))
  (at 6552 (not (image_available img5)))
  (at 6820 (image_available img6))
  (at 6828 (not (image_available img6)))
  (at 6765 (image_available img7))
  (at 6773 (not (image_available img7)))
  (at 6818 (image_available img8))
  (at 6826 (not (image_available img8)))
  (at 6586 (image_available img9))
  (at 6594 (not (image_available img9)))
  (at 6712 (image_available img10))
  (at 6720 (not (image_available img10)))
  (at 6658 (image_available img11))
  (at 6666 (not (image_available img11)))
  (at 6552 (image_available img12))
  (at 6560 (not (image_available img12)))
  (at 6527 (image_available img13))
  (at 6535 (not (image_available img13)))
  (at 6631 (image_available img14))
  (at 6639 (not (image_available img14)))
  (at 6544 (image_available img15))
  (at 6552 (not (image_available img15)))
  (at 6830 (image_available img16))
  (at 6838 (not (image_available img16)))
  (at 6622 (image_available img17))
  (at 6630 (not (image_available img17)))
  (at 6633 (image_available img18))
  (at 6641 (not (image_available img18)))
  (at 6762 (image_available img19))
  (at 6770 (not (image_available img19)))
  (at 6541 (image_available img20))
  (at 6549 (not (image_available img20)))
  (at 6914 (image_available img1))
  (at 6922 (not (image_available img1)))
  (at 7087 (image_available img2))
  (at 7095 (not (image_available img2)))
  (at 7058 (image_available img3))
  (at 7066 (not (image_available img3)))
  (at 6869 (image_available img4))
  (at 6877 (not (image_available img4)))
  (at 6904 (image_available img5))
  (at 6912 (not (image_available img5)))
  (at 7180 (image_available img6))
  (at 7188 (not (image_available img6)))
  (at 7125 (image_available img7))
  (at 7133 (not (image_available img7)))
  (at 7178 (image_available img8))
  (at 7186 (not (image_available img8)))
  (at 6946 (image_available img9))
  (at 6954 (not (image_available img9)))
  (at 7072 (image_available img10))
  (at 7080 (not (image_available img10)))
  (at 7018 (image_available img11))
  (at 7026 (not (image_available img11)))
  (at 6912 (image_available img12))
  (at 6920 (not (image_available img12)))
  (at 6887 (image_available img13))
  (at 6895 (not (image_available img13)))
  (at 6991 (image_available img14))
  (at 6999 (not (image_available img14)))
  (at 6904 (image_available img15))
  (at 6912 (not (image_available img15)))
  (at 7190 (image_available img16))
  (at 7198 (not (image_available img16)))
  (at 6982 (image_available img17))
  (at 6990 (not (image_available img17)))
  (at 6993 (image_available img18))
  (at 7001 (not (image_available img18)))
  (at 7122 (image_available img19))
  (at 7130 (not (image_available img19)))
  (at 6901 (image_available img20))
  (at 6909 (not (image_available img20)))
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
  (> (image_score img7) 0)
  (<= (image_score img7) 3.0)

  (> (image_score img15) 0)
  (<= (image_score img15) 3.0)

  (> (image_score img17) 0)
  (<= (image_score img17) 13.0)

(>= (total_score) 4)
))
(:metric maximize (+
  (image_score img7)
    (+ (image_score img15)
      (image_score img17)
    )
  )
)
)