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



  (at 48 (image_available img1))
  (at 56 (not (image_available img1)))
  (at 130 (image_available img2))
  (at 138 (not (image_available img2)))
  (at 206 (image_available img3))
  (at 214 (not (image_available img3)))
  (at 64 (image_available img4))
  (at 72 (not (image_available img4)))
  (at 175 (image_available img5))
  (at 183 (not (image_available img5)))
  (at 282 (image_available img6))
  (at 290 (not (image_available img6)))
  (at 3 (image_available img7))
  (at 11 (not (image_available img7)))
  (at 290 (image_available img8))
  (at 298 (not (image_available img8)))
  (at 296 (image_available img9))
  (at 304 (not (image_available img9)))
  (at 342 (image_available img10))
  (at 350 (not (image_available img10)))
  (at 312 (image_available img11))
  (at 320 (not (image_available img11)))
  (at 251 (image_available img12))
  (at 259 (not (image_available img12)))
  (at 142 (image_available img13))
  (at 150 (not (image_available img13)))
  (at 235 (image_available img14))
  (at 243 (not (image_available img14)))
  (at 48 (image_available img15))
  (at 56 (not (image_available img15)))
  (at 239 (image_available img16))
  (at 247 (not (image_available img16)))
  (at 71 (image_available img17))
  (at 79 (not (image_available img17)))
  (at 347 (image_available img18))
  (at 355 (not (image_available img18)))
  (at 27 (image_available img19))
  (at 35 (not (image_available img19)))
  (at 194 (image_available img20))
  (at 202 (not (image_available img20)))
  (at 408 (image_available img1))
  (at 416 (not (image_available img1)))
  (at 490 (image_available img2))
  (at 498 (not (image_available img2)))
  (at 566 (image_available img3))
  (at 574 (not (image_available img3)))
  (at 424 (image_available img4))
  (at 432 (not (image_available img4)))
  (at 535 (image_available img5))
  (at 543 (not (image_available img5)))
  (at 642 (image_available img6))
  (at 650 (not (image_available img6)))
  (at 363 (image_available img7))
  (at 371 (not (image_available img7)))
  (at 650 (image_available img8))
  (at 658 (not (image_available img8)))
  (at 656 (image_available img9))
  (at 664 (not (image_available img9)))
  (at 702 (image_available img10))
  (at 710 (not (image_available img10)))
  (at 672 (image_available img11))
  (at 680 (not (image_available img11)))
  (at 611 (image_available img12))
  (at 619 (not (image_available img12)))
  (at 502 (image_available img13))
  (at 510 (not (image_available img13)))
  (at 595 (image_available img14))
  (at 603 (not (image_available img14)))
  (at 408 (image_available img15))
  (at 416 (not (image_available img15)))
  (at 599 (image_available img16))
  (at 607 (not (image_available img16)))
  (at 431 (image_available img17))
  (at 439 (not (image_available img17)))
  (at 707 (image_available img18))
  (at 715 (not (image_available img18)))
  (at 387 (image_available img19))
  (at 395 (not (image_available img19)))
  (at 554 (image_available img20))
  (at 562 (not (image_available img20)))
  (at 768 (image_available img1))
  (at 776 (not (image_available img1)))
  (at 850 (image_available img2))
  (at 858 (not (image_available img2)))
  (at 926 (image_available img3))
  (at 934 (not (image_available img3)))
  (at 784 (image_available img4))
  (at 792 (not (image_available img4)))
  (at 895 (image_available img5))
  (at 903 (not (image_available img5)))
  (at 1002 (image_available img6))
  (at 1010 (not (image_available img6)))
  (at 723 (image_available img7))
  (at 731 (not (image_available img7)))
  (at 1010 (image_available img8))
  (at 1018 (not (image_available img8)))
  (at 1016 (image_available img9))
  (at 1024 (not (image_available img9)))
  (at 1062 (image_available img10))
  (at 1070 (not (image_available img10)))
  (at 1032 (image_available img11))
  (at 1040 (not (image_available img11)))
  (at 971 (image_available img12))
  (at 979 (not (image_available img12)))
  (at 862 (image_available img13))
  (at 870 (not (image_available img13)))
  (at 955 (image_available img14))
  (at 963 (not (image_available img14)))
  (at 768 (image_available img15))
  (at 776 (not (image_available img15)))
  (at 959 (image_available img16))
  (at 967 (not (image_available img16)))
  (at 791 (image_available img17))
  (at 799 (not (image_available img17)))
  (at 1067 (image_available img18))
  (at 1075 (not (image_available img18)))
  (at 747 (image_available img19))
  (at 755 (not (image_available img19)))
  (at 914 (image_available img20))
  (at 922 (not (image_available img20)))
  (at 1128 (image_available img1))
  (at 1136 (not (image_available img1)))
  (at 1210 (image_available img2))
  (at 1218 (not (image_available img2)))
  (at 1286 (image_available img3))
  (at 1294 (not (image_available img3)))
  (at 1144 (image_available img4))
  (at 1152 (not (image_available img4)))
  (at 1255 (image_available img5))
  (at 1263 (not (image_available img5)))
  (at 1362 (image_available img6))
  (at 1370 (not (image_available img6)))
  (at 1083 (image_available img7))
  (at 1091 (not (image_available img7)))
  (at 1370 (image_available img8))
  (at 1378 (not (image_available img8)))
  (at 1376 (image_available img9))
  (at 1384 (not (image_available img9)))
  (at 1422 (image_available img10))
  (at 1430 (not (image_available img10)))
  (at 1392 (image_available img11))
  (at 1400 (not (image_available img11)))
  (at 1331 (image_available img12))
  (at 1339 (not (image_available img12)))
  (at 1222 (image_available img13))
  (at 1230 (not (image_available img13)))
  (at 1315 (image_available img14))
  (at 1323 (not (image_available img14)))
  (at 1128 (image_available img15))
  (at 1136 (not (image_available img15)))
  (at 1319 (image_available img16))
  (at 1327 (not (image_available img16)))
  (at 1151 (image_available img17))
  (at 1159 (not (image_available img17)))
  (at 1427 (image_available img18))
  (at 1435 (not (image_available img18)))
  (at 1107 (image_available img19))
  (at 1115 (not (image_available img19)))
  (at 1274 (image_available img20))
  (at 1282 (not (image_available img20)))
  (at 1488 (image_available img1))
  (at 1496 (not (image_available img1)))
  (at 1570 (image_available img2))
  (at 1578 (not (image_available img2)))
  (at 1646 (image_available img3))
  (at 1654 (not (image_available img3)))
  (at 1504 (image_available img4))
  (at 1512 (not (image_available img4)))
  (at 1615 (image_available img5))
  (at 1623 (not (image_available img5)))
  (at 1722 (image_available img6))
  (at 1730 (not (image_available img6)))
  (at 1443 (image_available img7))
  (at 1451 (not (image_available img7)))
  (at 1730 (image_available img8))
  (at 1738 (not (image_available img8)))
  (at 1736 (image_available img9))
  (at 1744 (not (image_available img9)))
  (at 1782 (image_available img10))
  (at 1790 (not (image_available img10)))
  (at 1752 (image_available img11))
  (at 1760 (not (image_available img11)))
  (at 1691 (image_available img12))
  (at 1699 (not (image_available img12)))
  (at 1582 (image_available img13))
  (at 1590 (not (image_available img13)))
  (at 1675 (image_available img14))
  (at 1683 (not (image_available img14)))
  (at 1488 (image_available img15))
  (at 1496 (not (image_available img15)))
  (at 1679 (image_available img16))
  (at 1687 (not (image_available img16)))
  (at 1511 (image_available img17))
  (at 1519 (not (image_available img17)))
  (at 1787 (image_available img18))
  (at 1795 (not (image_available img18)))
  (at 1467 (image_available img19))
  (at 1475 (not (image_available img19)))
  (at 1634 (image_available img20))
  (at 1642 (not (image_available img20)))
  (at 1848 (image_available img1))
  (at 1856 (not (image_available img1)))
  (at 1930 (image_available img2))
  (at 1938 (not (image_available img2)))
  (at 2006 (image_available img3))
  (at 2014 (not (image_available img3)))
  (at 1864 (image_available img4))
  (at 1872 (not (image_available img4)))
  (at 1975 (image_available img5))
  (at 1983 (not (image_available img5)))
  (at 2082 (image_available img6))
  (at 2090 (not (image_available img6)))
  (at 1803 (image_available img7))
  (at 1811 (not (image_available img7)))
  (at 2090 (image_available img8))
  (at 2098 (not (image_available img8)))
  (at 2096 (image_available img9))
  (at 2104 (not (image_available img9)))
  (at 2142 (image_available img10))
  (at 2150 (not (image_available img10)))
  (at 2112 (image_available img11))
  (at 2120 (not (image_available img11)))
  (at 2051 (image_available img12))
  (at 2059 (not (image_available img12)))
  (at 1942 (image_available img13))
  (at 1950 (not (image_available img13)))
  (at 2035 (image_available img14))
  (at 2043 (not (image_available img14)))
  (at 1848 (image_available img15))
  (at 1856 (not (image_available img15)))
  (at 2039 (image_available img16))
  (at 2047 (not (image_available img16)))
  (at 1871 (image_available img17))
  (at 1879 (not (image_available img17)))
  (at 2147 (image_available img18))
  (at 2155 (not (image_available img18)))
  (at 1827 (image_available img19))
  (at 1835 (not (image_available img19)))
  (at 1994 (image_available img20))
  (at 2002 (not (image_available img20)))
  (at 2208 (image_available img1))
  (at 2216 (not (image_available img1)))
  (at 2290 (image_available img2))
  (at 2298 (not (image_available img2)))
  (at 2366 (image_available img3))
  (at 2374 (not (image_available img3)))
  (at 2224 (image_available img4))
  (at 2232 (not (image_available img4)))
  (at 2335 (image_available img5))
  (at 2343 (not (image_available img5)))
  (at 2442 (image_available img6))
  (at 2450 (not (image_available img6)))
  (at 2163 (image_available img7))
  (at 2171 (not (image_available img7)))
  (at 2450 (image_available img8))
  (at 2458 (not (image_available img8)))
  (at 2456 (image_available img9))
  (at 2464 (not (image_available img9)))
  (at 2502 (image_available img10))
  (at 2510 (not (image_available img10)))
  (at 2472 (image_available img11))
  (at 2480 (not (image_available img11)))
  (at 2411 (image_available img12))
  (at 2419 (not (image_available img12)))
  (at 2302 (image_available img13))
  (at 2310 (not (image_available img13)))
  (at 2395 (image_available img14))
  (at 2403 (not (image_available img14)))
  (at 2208 (image_available img15))
  (at 2216 (not (image_available img15)))
  (at 2399 (image_available img16))
  (at 2407 (not (image_available img16)))
  (at 2231 (image_available img17))
  (at 2239 (not (image_available img17)))
  (at 2507 (image_available img18))
  (at 2515 (not (image_available img18)))
  (at 2187 (image_available img19))
  (at 2195 (not (image_available img19)))
  (at 2354 (image_available img20))
  (at 2362 (not (image_available img20)))
  (at 2568 (image_available img1))
  (at 2576 (not (image_available img1)))
  (at 2650 (image_available img2))
  (at 2658 (not (image_available img2)))
  (at 2726 (image_available img3))
  (at 2734 (not (image_available img3)))
  (at 2584 (image_available img4))
  (at 2592 (not (image_available img4)))
  (at 2695 (image_available img5))
  (at 2703 (not (image_available img5)))
  (at 2802 (image_available img6))
  (at 2810 (not (image_available img6)))
  (at 2523 (image_available img7))
  (at 2531 (not (image_available img7)))
  (at 2810 (image_available img8))
  (at 2818 (not (image_available img8)))
  (at 2816 (image_available img9))
  (at 2824 (not (image_available img9)))
  (at 2862 (image_available img10))
  (at 2870 (not (image_available img10)))
  (at 2832 (image_available img11))
  (at 2840 (not (image_available img11)))
  (at 2771 (image_available img12))
  (at 2779 (not (image_available img12)))
  (at 2662 (image_available img13))
  (at 2670 (not (image_available img13)))
  (at 2755 (image_available img14))
  (at 2763 (not (image_available img14)))
  (at 2568 (image_available img15))
  (at 2576 (not (image_available img15)))
  (at 2759 (image_available img16))
  (at 2767 (not (image_available img16)))
  (at 2591 (image_available img17))
  (at 2599 (not (image_available img17)))
  (at 2867 (image_available img18))
  (at 2875 (not (image_available img18)))
  (at 2547 (image_available img19))
  (at 2555 (not (image_available img19)))
  (at 2714 (image_available img20))
  (at 2722 (not (image_available img20)))
  (at 2928 (image_available img1))
  (at 2936 (not (image_available img1)))
  (at 3010 (image_available img2))
  (at 3018 (not (image_available img2)))
  (at 3086 (image_available img3))
  (at 3094 (not (image_available img3)))
  (at 2944 (image_available img4))
  (at 2952 (not (image_available img4)))
  (at 3055 (image_available img5))
  (at 3063 (not (image_available img5)))
  (at 3162 (image_available img6))
  (at 3170 (not (image_available img6)))
  (at 2883 (image_available img7))
  (at 2891 (not (image_available img7)))
  (at 3170 (image_available img8))
  (at 3178 (not (image_available img8)))
  (at 3176 (image_available img9))
  (at 3184 (not (image_available img9)))
  (at 3222 (image_available img10))
  (at 3230 (not (image_available img10)))
  (at 3192 (image_available img11))
  (at 3200 (not (image_available img11)))
  (at 3131 (image_available img12))
  (at 3139 (not (image_available img12)))
  (at 3022 (image_available img13))
  (at 3030 (not (image_available img13)))
  (at 3115 (image_available img14))
  (at 3123 (not (image_available img14)))
  (at 2928 (image_available img15))
  (at 2936 (not (image_available img15)))
  (at 3119 (image_available img16))
  (at 3127 (not (image_available img16)))
  (at 2951 (image_available img17))
  (at 2959 (not (image_available img17)))
  (at 3227 (image_available img18))
  (at 3235 (not (image_available img18)))
  (at 2907 (image_available img19))
  (at 2915 (not (image_available img19)))
  (at 3074 (image_available img20))
  (at 3082 (not (image_available img20)))
  (at 3288 (image_available img1))
  (at 3296 (not (image_available img1)))
  (at 3370 (image_available img2))
  (at 3378 (not (image_available img2)))
  (at 3446 (image_available img3))
  (at 3454 (not (image_available img3)))
  (at 3304 (image_available img4))
  (at 3312 (not (image_available img4)))
  (at 3415 (image_available img5))
  (at 3423 (not (image_available img5)))
  (at 3522 (image_available img6))
  (at 3530 (not (image_available img6)))
  (at 3243 (image_available img7))
  (at 3251 (not (image_available img7)))
  (at 3530 (image_available img8))
  (at 3538 (not (image_available img8)))
  (at 3536 (image_available img9))
  (at 3544 (not (image_available img9)))
  (at 3582 (image_available img10))
  (at 3590 (not (image_available img10)))
  (at 3552 (image_available img11))
  (at 3560 (not (image_available img11)))
  (at 3491 (image_available img12))
  (at 3499 (not (image_available img12)))
  (at 3382 (image_available img13))
  (at 3390 (not (image_available img13)))
  (at 3475 (image_available img14))
  (at 3483 (not (image_available img14)))
  (at 3288 (image_available img15))
  (at 3296 (not (image_available img15)))
  (at 3479 (image_available img16))
  (at 3487 (not (image_available img16)))
  (at 3311 (image_available img17))
  (at 3319 (not (image_available img17)))
  (at 3587 (image_available img18))
  (at 3595 (not (image_available img18)))
  (at 3267 (image_available img19))
  (at 3275 (not (image_available img19)))
  (at 3434 (image_available img20))
  (at 3442 (not (image_available img20)))
  (at 3648 (image_available img1))
  (at 3656 (not (image_available img1)))
  (at 3730 (image_available img2))
  (at 3738 (not (image_available img2)))
  (at 3806 (image_available img3))
  (at 3814 (not (image_available img3)))
  (at 3664 (image_available img4))
  (at 3672 (not (image_available img4)))
  (at 3775 (image_available img5))
  (at 3783 (not (image_available img5)))
  (at 3882 (image_available img6))
  (at 3890 (not (image_available img6)))
  (at 3603 (image_available img7))
  (at 3611 (not (image_available img7)))
  (at 3890 (image_available img8))
  (at 3898 (not (image_available img8)))
  (at 3896 (image_available img9))
  (at 3904 (not (image_available img9)))
  (at 3942 (image_available img10))
  (at 3950 (not (image_available img10)))
  (at 3912 (image_available img11))
  (at 3920 (not (image_available img11)))
  (at 3851 (image_available img12))
  (at 3859 (not (image_available img12)))
  (at 3742 (image_available img13))
  (at 3750 (not (image_available img13)))
  (at 3835 (image_available img14))
  (at 3843 (not (image_available img14)))
  (at 3648 (image_available img15))
  (at 3656 (not (image_available img15)))
  (at 3839 (image_available img16))
  (at 3847 (not (image_available img16)))
  (at 3671 (image_available img17))
  (at 3679 (not (image_available img17)))
  (at 3947 (image_available img18))
  (at 3955 (not (image_available img18)))
  (at 3627 (image_available img19))
  (at 3635 (not (image_available img19)))
  (at 3794 (image_available img20))
  (at 3802 (not (image_available img20)))
  (at 4008 (image_available img1))
  (at 4016 (not (image_available img1)))
  (at 4090 (image_available img2))
  (at 4098 (not (image_available img2)))
  (at 4166 (image_available img3))
  (at 4174 (not (image_available img3)))
  (at 4024 (image_available img4))
  (at 4032 (not (image_available img4)))
  (at 4135 (image_available img5))
  (at 4143 (not (image_available img5)))
  (at 4242 (image_available img6))
  (at 4250 (not (image_available img6)))
  (at 3963 (image_available img7))
  (at 3971 (not (image_available img7)))
  (at 4250 (image_available img8))
  (at 4258 (not (image_available img8)))
  (at 4256 (image_available img9))
  (at 4264 (not (image_available img9)))
  (at 4302 (image_available img10))
  (at 4310 (not (image_available img10)))
  (at 4272 (image_available img11))
  (at 4280 (not (image_available img11)))
  (at 4211 (image_available img12))
  (at 4219 (not (image_available img12)))
  (at 4102 (image_available img13))
  (at 4110 (not (image_available img13)))
  (at 4195 (image_available img14))
  (at 4203 (not (image_available img14)))
  (at 4008 (image_available img15))
  (at 4016 (not (image_available img15)))
  (at 4199 (image_available img16))
  (at 4207 (not (image_available img16)))
  (at 4031 (image_available img17))
  (at 4039 (not (image_available img17)))
  (at 4307 (image_available img18))
  (at 4315 (not (image_available img18)))
  (at 3987 (image_available img19))
  (at 3995 (not (image_available img19)))
  (at 4154 (image_available img20))
  (at 4162 (not (image_available img20)))
  (at 4368 (image_available img1))
  (at 4376 (not (image_available img1)))
  (at 4450 (image_available img2))
  (at 4458 (not (image_available img2)))
  (at 4526 (image_available img3))
  (at 4534 (not (image_available img3)))
  (at 4384 (image_available img4))
  (at 4392 (not (image_available img4)))
  (at 4495 (image_available img5))
  (at 4503 (not (image_available img5)))
  (at 4602 (image_available img6))
  (at 4610 (not (image_available img6)))
  (at 4323 (image_available img7))
  (at 4331 (not (image_available img7)))
  (at 4610 (image_available img8))
  (at 4618 (not (image_available img8)))
  (at 4616 (image_available img9))
  (at 4624 (not (image_available img9)))
  (at 4662 (image_available img10))
  (at 4670 (not (image_available img10)))
  (at 4632 (image_available img11))
  (at 4640 (not (image_available img11)))
  (at 4571 (image_available img12))
  (at 4579 (not (image_available img12)))
  (at 4462 (image_available img13))
  (at 4470 (not (image_available img13)))
  (at 4555 (image_available img14))
  (at 4563 (not (image_available img14)))
  (at 4368 (image_available img15))
  (at 4376 (not (image_available img15)))
  (at 4559 (image_available img16))
  (at 4567 (not (image_available img16)))
  (at 4391 (image_available img17))
  (at 4399 (not (image_available img17)))
  (at 4667 (image_available img18))
  (at 4675 (not (image_available img18)))
  (at 4347 (image_available img19))
  (at 4355 (not (image_available img19)))
  (at 4514 (image_available img20))
  (at 4522 (not (image_available img20)))
  (at 4728 (image_available img1))
  (at 4736 (not (image_available img1)))
  (at 4810 (image_available img2))
  (at 4818 (not (image_available img2)))
  (at 4886 (image_available img3))
  (at 4894 (not (image_available img3)))
  (at 4744 (image_available img4))
  (at 4752 (not (image_available img4)))
  (at 4855 (image_available img5))
  (at 4863 (not (image_available img5)))
  (at 4962 (image_available img6))
  (at 4970 (not (image_available img6)))
  (at 4683 (image_available img7))
  (at 4691 (not (image_available img7)))
  (at 4970 (image_available img8))
  (at 4978 (not (image_available img8)))
  (at 4976 (image_available img9))
  (at 4984 (not (image_available img9)))
  (at 5022 (image_available img10))
  (at 5030 (not (image_available img10)))
  (at 4992 (image_available img11))
  (at 5000 (not (image_available img11)))
  (at 4931 (image_available img12))
  (at 4939 (not (image_available img12)))
  (at 4822 (image_available img13))
  (at 4830 (not (image_available img13)))
  (at 4915 (image_available img14))
  (at 4923 (not (image_available img14)))
  (at 4728 (image_available img15))
  (at 4736 (not (image_available img15)))
  (at 4919 (image_available img16))
  (at 4927 (not (image_available img16)))
  (at 4751 (image_available img17))
  (at 4759 (not (image_available img17)))
  (at 5027 (image_available img18))
  (at 5035 (not (image_available img18)))
  (at 4707 (image_available img19))
  (at 4715 (not (image_available img19)))
  (at 4874 (image_available img20))
  (at 4882 (not (image_available img20)))
  (at 5088 (image_available img1))
  (at 5096 (not (image_available img1)))
  (at 5170 (image_available img2))
  (at 5178 (not (image_available img2)))
  (at 5246 (image_available img3))
  (at 5254 (not (image_available img3)))
  (at 5104 (image_available img4))
  (at 5112 (not (image_available img4)))
  (at 5215 (image_available img5))
  (at 5223 (not (image_available img5)))
  (at 5322 (image_available img6))
  (at 5330 (not (image_available img6)))
  (at 5043 (image_available img7))
  (at 5051 (not (image_available img7)))
  (at 5330 (image_available img8))
  (at 5338 (not (image_available img8)))
  (at 5336 (image_available img9))
  (at 5344 (not (image_available img9)))
  (at 5382 (image_available img10))
  (at 5390 (not (image_available img10)))
  (at 5352 (image_available img11))
  (at 5360 (not (image_available img11)))
  (at 5291 (image_available img12))
  (at 5299 (not (image_available img12)))
  (at 5182 (image_available img13))
  (at 5190 (not (image_available img13)))
  (at 5275 (image_available img14))
  (at 5283 (not (image_available img14)))
  (at 5088 (image_available img15))
  (at 5096 (not (image_available img15)))
  (at 5279 (image_available img16))
  (at 5287 (not (image_available img16)))
  (at 5111 (image_available img17))
  (at 5119 (not (image_available img17)))
  (at 5387 (image_available img18))
  (at 5395 (not (image_available img18)))
  (at 5067 (image_available img19))
  (at 5075 (not (image_available img19)))
  (at 5234 (image_available img20))
  (at 5242 (not (image_available img20)))
  (at 5448 (image_available img1))
  (at 5456 (not (image_available img1)))
  (at 5530 (image_available img2))
  (at 5538 (not (image_available img2)))
  (at 5606 (image_available img3))
  (at 5614 (not (image_available img3)))
  (at 5464 (image_available img4))
  (at 5472 (not (image_available img4)))
  (at 5575 (image_available img5))
  (at 5583 (not (image_available img5)))
  (at 5682 (image_available img6))
  (at 5690 (not (image_available img6)))
  (at 5403 (image_available img7))
  (at 5411 (not (image_available img7)))
  (at 5690 (image_available img8))
  (at 5698 (not (image_available img8)))
  (at 5696 (image_available img9))
  (at 5704 (not (image_available img9)))
  (at 5742 (image_available img10))
  (at 5750 (not (image_available img10)))
  (at 5712 (image_available img11))
  (at 5720 (not (image_available img11)))
  (at 5651 (image_available img12))
  (at 5659 (not (image_available img12)))
  (at 5542 (image_available img13))
  (at 5550 (not (image_available img13)))
  (at 5635 (image_available img14))
  (at 5643 (not (image_available img14)))
  (at 5448 (image_available img15))
  (at 5456 (not (image_available img15)))
  (at 5639 (image_available img16))
  (at 5647 (not (image_available img16)))
  (at 5471 (image_available img17))
  (at 5479 (not (image_available img17)))
  (at 5747 (image_available img18))
  (at 5755 (not (image_available img18)))
  (at 5427 (image_available img19))
  (at 5435 (not (image_available img19)))
  (at 5594 (image_available img20))
  (at 5602 (not (image_available img20)))
  (at 5808 (image_available img1))
  (at 5816 (not (image_available img1)))
  (at 5890 (image_available img2))
  (at 5898 (not (image_available img2)))
  (at 5966 (image_available img3))
  (at 5974 (not (image_available img3)))
  (at 5824 (image_available img4))
  (at 5832 (not (image_available img4)))
  (at 5935 (image_available img5))
  (at 5943 (not (image_available img5)))
  (at 6042 (image_available img6))
  (at 6050 (not (image_available img6)))
  (at 5763 (image_available img7))
  (at 5771 (not (image_available img7)))
  (at 6050 (image_available img8))
  (at 6058 (not (image_available img8)))
  (at 6056 (image_available img9))
  (at 6064 (not (image_available img9)))
  (at 6102 (image_available img10))
  (at 6110 (not (image_available img10)))
  (at 6072 (image_available img11))
  (at 6080 (not (image_available img11)))
  (at 6011 (image_available img12))
  (at 6019 (not (image_available img12)))
  (at 5902 (image_available img13))
  (at 5910 (not (image_available img13)))
  (at 5995 (image_available img14))
  (at 6003 (not (image_available img14)))
  (at 5808 (image_available img15))
  (at 5816 (not (image_available img15)))
  (at 5999 (image_available img16))
  (at 6007 (not (image_available img16)))
  (at 5831 (image_available img17))
  (at 5839 (not (image_available img17)))
  (at 6107 (image_available img18))
  (at 6115 (not (image_available img18)))
  (at 5787 (image_available img19))
  (at 5795 (not (image_available img19)))
  (at 5954 (image_available img20))
  (at 5962 (not (image_available img20)))
  (at 6168 (image_available img1))
  (at 6176 (not (image_available img1)))
  (at 6250 (image_available img2))
  (at 6258 (not (image_available img2)))
  (at 6326 (image_available img3))
  (at 6334 (not (image_available img3)))
  (at 6184 (image_available img4))
  (at 6192 (not (image_available img4)))
  (at 6295 (image_available img5))
  (at 6303 (not (image_available img5)))
  (at 6402 (image_available img6))
  (at 6410 (not (image_available img6)))
  (at 6123 (image_available img7))
  (at 6131 (not (image_available img7)))
  (at 6410 (image_available img8))
  (at 6418 (not (image_available img8)))
  (at 6416 (image_available img9))
  (at 6424 (not (image_available img9)))
  (at 6462 (image_available img10))
  (at 6470 (not (image_available img10)))
  (at 6432 (image_available img11))
  (at 6440 (not (image_available img11)))
  (at 6371 (image_available img12))
  (at 6379 (not (image_available img12)))
  (at 6262 (image_available img13))
  (at 6270 (not (image_available img13)))
  (at 6355 (image_available img14))
  (at 6363 (not (image_available img14)))
  (at 6168 (image_available img15))
  (at 6176 (not (image_available img15)))
  (at 6359 (image_available img16))
  (at 6367 (not (image_available img16)))
  (at 6191 (image_available img17))
  (at 6199 (not (image_available img17)))
  (at 6467 (image_available img18))
  (at 6475 (not (image_available img18)))
  (at 6147 (image_available img19))
  (at 6155 (not (image_available img19)))
  (at 6314 (image_available img20))
  (at 6322 (not (image_available img20)))
  (at 6528 (image_available img1))
  (at 6536 (not (image_available img1)))
  (at 6610 (image_available img2))
  (at 6618 (not (image_available img2)))
  (at 6686 (image_available img3))
  (at 6694 (not (image_available img3)))
  (at 6544 (image_available img4))
  (at 6552 (not (image_available img4)))
  (at 6655 (image_available img5))
  (at 6663 (not (image_available img5)))
  (at 6762 (image_available img6))
  (at 6770 (not (image_available img6)))
  (at 6483 (image_available img7))
  (at 6491 (not (image_available img7)))
  (at 6770 (image_available img8))
  (at 6778 (not (image_available img8)))
  (at 6776 (image_available img9))
  (at 6784 (not (image_available img9)))
  (at 6822 (image_available img10))
  (at 6830 (not (image_available img10)))
  (at 6792 (image_available img11))
  (at 6800 (not (image_available img11)))
  (at 6731 (image_available img12))
  (at 6739 (not (image_available img12)))
  (at 6622 (image_available img13))
  (at 6630 (not (image_available img13)))
  (at 6715 (image_available img14))
  (at 6723 (not (image_available img14)))
  (at 6528 (image_available img15))
  (at 6536 (not (image_available img15)))
  (at 6719 (image_available img16))
  (at 6727 (not (image_available img16)))
  (at 6551 (image_available img17))
  (at 6559 (not (image_available img17)))
  (at 6827 (image_available img18))
  (at 6835 (not (image_available img18)))
  (at 6507 (image_available img19))
  (at 6515 (not (image_available img19)))
  (at 6674 (image_available img20))
  (at 6682 (not (image_available img20)))
  (at 6888 (image_available img1))
  (at 6896 (not (image_available img1)))
  (at 6970 (image_available img2))
  (at 6978 (not (image_available img2)))
  (at 7046 (image_available img3))
  (at 7054 (not (image_available img3)))
  (at 6904 (image_available img4))
  (at 6912 (not (image_available img4)))
  (at 7015 (image_available img5))
  (at 7023 (not (image_available img5)))
  (at 7122 (image_available img6))
  (at 7130 (not (image_available img6)))
  (at 6843 (image_available img7))
  (at 6851 (not (image_available img7)))
  (at 7130 (image_available img8))
  (at 7138 (not (image_available img8)))
  (at 7136 (image_available img9))
  (at 7144 (not (image_available img9)))
  (at 7182 (image_available img10))
  (at 7190 (not (image_available img10)))
  (at 7152 (image_available img11))
  (at 7160 (not (image_available img11)))
  (at 7091 (image_available img12))
  (at 7099 (not (image_available img12)))
  (at 6982 (image_available img13))
  (at 6990 (not (image_available img13)))
  (at 7075 (image_available img14))
  (at 7083 (not (image_available img14)))
  (at 6888 (image_available img15))
  (at 6896 (not (image_available img15)))
  (at 7079 (image_available img16))
  (at 7087 (not (image_available img16)))
  (at 6911 (image_available img17))
  (at 6919 (not (image_available img17)))
  (at 7187 (image_available img18))
  (at 7195 (not (image_available img18)))
  (at 6867 (image_available img19))
  (at 6875 (not (image_available img19)))
  (at 7034 (image_available img20))
  (at 7042 (not (image_available img20)))
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
  (<= (image_score img1) 8.0)

  (> (image_score img3) 0)
  (<= (image_score img3) 6.0)

  (> (image_score img5) 0)
  (<= (image_score img5) 8.0)

  (> (image_score img8) 0)
  (<= (image_score img8) 6.0)

  (> (image_score img10) 0)
  (<= (image_score img10) 5.0)

  (> (image_score img12) 0)
  (<= (image_score img12) 2.0)

(>= (total_score) 7)
))
(:metric maximize (+
  (image_score img1)
    (+ (image_score img3)
      (+ (image_score img5)
        (+ (image_score img8)
          (+ (image_score img10)
            (image_score img12)
          )
        )
      )
    )
  )
)
)