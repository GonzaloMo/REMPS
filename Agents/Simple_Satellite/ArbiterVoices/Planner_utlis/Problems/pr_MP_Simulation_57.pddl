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



  (at 26 (image_available img1))
  (at 34 (not (image_available img1)))
  (at 124 (image_available img2))
  (at 132 (not (image_available img2)))
  (at 199 (image_available img3))
  (at 207 (not (image_available img3)))
  (at 302 (image_available img4))
  (at 310 (not (image_available img4)))
  (at 49 (image_available img5))
  (at 57 (not (image_available img5)))
  (at 343 (image_available img6))
  (at 351 (not (image_available img6)))
  (at 70 (image_available img7))
  (at 78 (not (image_available img7)))
  (at 92 (image_available img8))
  (at 100 (not (image_available img8)))
  (at 285 (image_available img9))
  (at 293 (not (image_available img9)))
  (at 329 (image_available img10))
  (at 337 (not (image_available img10)))
  (at 334 (image_available img11))
  (at 342 (not (image_available img11)))
  (at 125 (image_available img12))
  (at 133 (not (image_available img12)))
  (at 221 (image_available img13))
  (at 229 (not (image_available img13)))
  (at 309 (image_available img14))
  (at 317 (not (image_available img14)))
  (at 147 (image_available img15))
  (at 155 (not (image_available img15)))
  (at 29 (image_available img16))
  (at 37 (not (image_available img16)))
  (at 270 (image_available img17))
  (at 278 (not (image_available img17)))
  (at 106 (image_available img18))
  (at 114 (not (image_available img18)))
  (at 267 (image_available img19))
  (at 275 (not (image_available img19)))
  (at 11 (image_available img20))
  (at 19 (not (image_available img20)))
  (at 386 (image_available img1))
  (at 394 (not (image_available img1)))
  (at 484 (image_available img2))
  (at 492 (not (image_available img2)))
  (at 559 (image_available img3))
  (at 567 (not (image_available img3)))
  (at 662 (image_available img4))
  (at 670 (not (image_available img4)))
  (at 409 (image_available img5))
  (at 417 (not (image_available img5)))
  (at 703 (image_available img6))
  (at 711 (not (image_available img6)))
  (at 430 (image_available img7))
  (at 438 (not (image_available img7)))
  (at 452 (image_available img8))
  (at 460 (not (image_available img8)))
  (at 645 (image_available img9))
  (at 653 (not (image_available img9)))
  (at 689 (image_available img10))
  (at 697 (not (image_available img10)))
  (at 694 (image_available img11))
  (at 702 (not (image_available img11)))
  (at 485 (image_available img12))
  (at 493 (not (image_available img12)))
  (at 581 (image_available img13))
  (at 589 (not (image_available img13)))
  (at 669 (image_available img14))
  (at 677 (not (image_available img14)))
  (at 507 (image_available img15))
  (at 515 (not (image_available img15)))
  (at 389 (image_available img16))
  (at 397 (not (image_available img16)))
  (at 630 (image_available img17))
  (at 638 (not (image_available img17)))
  (at 466 (image_available img18))
  (at 474 (not (image_available img18)))
  (at 627 (image_available img19))
  (at 635 (not (image_available img19)))
  (at 371 (image_available img20))
  (at 379 (not (image_available img20)))
  (at 746 (image_available img1))
  (at 754 (not (image_available img1)))
  (at 844 (image_available img2))
  (at 852 (not (image_available img2)))
  (at 919 (image_available img3))
  (at 927 (not (image_available img3)))
  (at 1022 (image_available img4))
  (at 1030 (not (image_available img4)))
  (at 769 (image_available img5))
  (at 777 (not (image_available img5)))
  (at 1063 (image_available img6))
  (at 1071 (not (image_available img6)))
  (at 790 (image_available img7))
  (at 798 (not (image_available img7)))
  (at 812 (image_available img8))
  (at 820 (not (image_available img8)))
  (at 1005 (image_available img9))
  (at 1013 (not (image_available img9)))
  (at 1049 (image_available img10))
  (at 1057 (not (image_available img10)))
  (at 1054 (image_available img11))
  (at 1062 (not (image_available img11)))
  (at 845 (image_available img12))
  (at 853 (not (image_available img12)))
  (at 941 (image_available img13))
  (at 949 (not (image_available img13)))
  (at 1029 (image_available img14))
  (at 1037 (not (image_available img14)))
  (at 867 (image_available img15))
  (at 875 (not (image_available img15)))
  (at 749 (image_available img16))
  (at 757 (not (image_available img16)))
  (at 990 (image_available img17))
  (at 998 (not (image_available img17)))
  (at 826 (image_available img18))
  (at 834 (not (image_available img18)))
  (at 987 (image_available img19))
  (at 995 (not (image_available img19)))
  (at 731 (image_available img20))
  (at 739 (not (image_available img20)))
  (at 1106 (image_available img1))
  (at 1114 (not (image_available img1)))
  (at 1204 (image_available img2))
  (at 1212 (not (image_available img2)))
  (at 1279 (image_available img3))
  (at 1287 (not (image_available img3)))
  (at 1382 (image_available img4))
  (at 1390 (not (image_available img4)))
  (at 1129 (image_available img5))
  (at 1137 (not (image_available img5)))
  (at 1423 (image_available img6))
  (at 1431 (not (image_available img6)))
  (at 1150 (image_available img7))
  (at 1158 (not (image_available img7)))
  (at 1172 (image_available img8))
  (at 1180 (not (image_available img8)))
  (at 1365 (image_available img9))
  (at 1373 (not (image_available img9)))
  (at 1409 (image_available img10))
  (at 1417 (not (image_available img10)))
  (at 1414 (image_available img11))
  (at 1422 (not (image_available img11)))
  (at 1205 (image_available img12))
  (at 1213 (not (image_available img12)))
  (at 1301 (image_available img13))
  (at 1309 (not (image_available img13)))
  (at 1389 (image_available img14))
  (at 1397 (not (image_available img14)))
  (at 1227 (image_available img15))
  (at 1235 (not (image_available img15)))
  (at 1109 (image_available img16))
  (at 1117 (not (image_available img16)))
  (at 1350 (image_available img17))
  (at 1358 (not (image_available img17)))
  (at 1186 (image_available img18))
  (at 1194 (not (image_available img18)))
  (at 1347 (image_available img19))
  (at 1355 (not (image_available img19)))
  (at 1091 (image_available img20))
  (at 1099 (not (image_available img20)))
  (at 1466 (image_available img1))
  (at 1474 (not (image_available img1)))
  (at 1564 (image_available img2))
  (at 1572 (not (image_available img2)))
  (at 1639 (image_available img3))
  (at 1647 (not (image_available img3)))
  (at 1742 (image_available img4))
  (at 1750 (not (image_available img4)))
  (at 1489 (image_available img5))
  (at 1497 (not (image_available img5)))
  (at 1783 (image_available img6))
  (at 1791 (not (image_available img6)))
  (at 1510 (image_available img7))
  (at 1518 (not (image_available img7)))
  (at 1532 (image_available img8))
  (at 1540 (not (image_available img8)))
  (at 1725 (image_available img9))
  (at 1733 (not (image_available img9)))
  (at 1769 (image_available img10))
  (at 1777 (not (image_available img10)))
  (at 1774 (image_available img11))
  (at 1782 (not (image_available img11)))
  (at 1565 (image_available img12))
  (at 1573 (not (image_available img12)))
  (at 1661 (image_available img13))
  (at 1669 (not (image_available img13)))
  (at 1749 (image_available img14))
  (at 1757 (not (image_available img14)))
  (at 1587 (image_available img15))
  (at 1595 (not (image_available img15)))
  (at 1469 (image_available img16))
  (at 1477 (not (image_available img16)))
  (at 1710 (image_available img17))
  (at 1718 (not (image_available img17)))
  (at 1546 (image_available img18))
  (at 1554 (not (image_available img18)))
  (at 1707 (image_available img19))
  (at 1715 (not (image_available img19)))
  (at 1451 (image_available img20))
  (at 1459 (not (image_available img20)))
  (at 1826 (image_available img1))
  (at 1834 (not (image_available img1)))
  (at 1924 (image_available img2))
  (at 1932 (not (image_available img2)))
  (at 1999 (image_available img3))
  (at 2007 (not (image_available img3)))
  (at 2102 (image_available img4))
  (at 2110 (not (image_available img4)))
  (at 1849 (image_available img5))
  (at 1857 (not (image_available img5)))
  (at 2143 (image_available img6))
  (at 2151 (not (image_available img6)))
  (at 1870 (image_available img7))
  (at 1878 (not (image_available img7)))
  (at 1892 (image_available img8))
  (at 1900 (not (image_available img8)))
  (at 2085 (image_available img9))
  (at 2093 (not (image_available img9)))
  (at 2129 (image_available img10))
  (at 2137 (not (image_available img10)))
  (at 2134 (image_available img11))
  (at 2142 (not (image_available img11)))
  (at 1925 (image_available img12))
  (at 1933 (not (image_available img12)))
  (at 2021 (image_available img13))
  (at 2029 (not (image_available img13)))
  (at 2109 (image_available img14))
  (at 2117 (not (image_available img14)))
  (at 1947 (image_available img15))
  (at 1955 (not (image_available img15)))
  (at 1829 (image_available img16))
  (at 1837 (not (image_available img16)))
  (at 2070 (image_available img17))
  (at 2078 (not (image_available img17)))
  (at 1906 (image_available img18))
  (at 1914 (not (image_available img18)))
  (at 2067 (image_available img19))
  (at 2075 (not (image_available img19)))
  (at 1811 (image_available img20))
  (at 1819 (not (image_available img20)))
  (at 2186 (image_available img1))
  (at 2194 (not (image_available img1)))
  (at 2284 (image_available img2))
  (at 2292 (not (image_available img2)))
  (at 2359 (image_available img3))
  (at 2367 (not (image_available img3)))
  (at 2462 (image_available img4))
  (at 2470 (not (image_available img4)))
  (at 2209 (image_available img5))
  (at 2217 (not (image_available img5)))
  (at 2503 (image_available img6))
  (at 2511 (not (image_available img6)))
  (at 2230 (image_available img7))
  (at 2238 (not (image_available img7)))
  (at 2252 (image_available img8))
  (at 2260 (not (image_available img8)))
  (at 2445 (image_available img9))
  (at 2453 (not (image_available img9)))
  (at 2489 (image_available img10))
  (at 2497 (not (image_available img10)))
  (at 2494 (image_available img11))
  (at 2502 (not (image_available img11)))
  (at 2285 (image_available img12))
  (at 2293 (not (image_available img12)))
  (at 2381 (image_available img13))
  (at 2389 (not (image_available img13)))
  (at 2469 (image_available img14))
  (at 2477 (not (image_available img14)))
  (at 2307 (image_available img15))
  (at 2315 (not (image_available img15)))
  (at 2189 (image_available img16))
  (at 2197 (not (image_available img16)))
  (at 2430 (image_available img17))
  (at 2438 (not (image_available img17)))
  (at 2266 (image_available img18))
  (at 2274 (not (image_available img18)))
  (at 2427 (image_available img19))
  (at 2435 (not (image_available img19)))
  (at 2171 (image_available img20))
  (at 2179 (not (image_available img20)))
  (at 2546 (image_available img1))
  (at 2554 (not (image_available img1)))
  (at 2644 (image_available img2))
  (at 2652 (not (image_available img2)))
  (at 2719 (image_available img3))
  (at 2727 (not (image_available img3)))
  (at 2822 (image_available img4))
  (at 2830 (not (image_available img4)))
  (at 2569 (image_available img5))
  (at 2577 (not (image_available img5)))
  (at 2863 (image_available img6))
  (at 2871 (not (image_available img6)))
  (at 2590 (image_available img7))
  (at 2598 (not (image_available img7)))
  (at 2612 (image_available img8))
  (at 2620 (not (image_available img8)))
  (at 2805 (image_available img9))
  (at 2813 (not (image_available img9)))
  (at 2849 (image_available img10))
  (at 2857 (not (image_available img10)))
  (at 2854 (image_available img11))
  (at 2862 (not (image_available img11)))
  (at 2645 (image_available img12))
  (at 2653 (not (image_available img12)))
  (at 2741 (image_available img13))
  (at 2749 (not (image_available img13)))
  (at 2829 (image_available img14))
  (at 2837 (not (image_available img14)))
  (at 2667 (image_available img15))
  (at 2675 (not (image_available img15)))
  (at 2549 (image_available img16))
  (at 2557 (not (image_available img16)))
  (at 2790 (image_available img17))
  (at 2798 (not (image_available img17)))
  (at 2626 (image_available img18))
  (at 2634 (not (image_available img18)))
  (at 2787 (image_available img19))
  (at 2795 (not (image_available img19)))
  (at 2531 (image_available img20))
  (at 2539 (not (image_available img20)))
  (at 2906 (image_available img1))
  (at 2914 (not (image_available img1)))
  (at 3004 (image_available img2))
  (at 3012 (not (image_available img2)))
  (at 3079 (image_available img3))
  (at 3087 (not (image_available img3)))
  (at 3182 (image_available img4))
  (at 3190 (not (image_available img4)))
  (at 2929 (image_available img5))
  (at 2937 (not (image_available img5)))
  (at 3223 (image_available img6))
  (at 3231 (not (image_available img6)))
  (at 2950 (image_available img7))
  (at 2958 (not (image_available img7)))
  (at 2972 (image_available img8))
  (at 2980 (not (image_available img8)))
  (at 3165 (image_available img9))
  (at 3173 (not (image_available img9)))
  (at 3209 (image_available img10))
  (at 3217 (not (image_available img10)))
  (at 3214 (image_available img11))
  (at 3222 (not (image_available img11)))
  (at 3005 (image_available img12))
  (at 3013 (not (image_available img12)))
  (at 3101 (image_available img13))
  (at 3109 (not (image_available img13)))
  (at 3189 (image_available img14))
  (at 3197 (not (image_available img14)))
  (at 3027 (image_available img15))
  (at 3035 (not (image_available img15)))
  (at 2909 (image_available img16))
  (at 2917 (not (image_available img16)))
  (at 3150 (image_available img17))
  (at 3158 (not (image_available img17)))
  (at 2986 (image_available img18))
  (at 2994 (not (image_available img18)))
  (at 3147 (image_available img19))
  (at 3155 (not (image_available img19)))
  (at 2891 (image_available img20))
  (at 2899 (not (image_available img20)))
  (at 3266 (image_available img1))
  (at 3274 (not (image_available img1)))
  (at 3364 (image_available img2))
  (at 3372 (not (image_available img2)))
  (at 3439 (image_available img3))
  (at 3447 (not (image_available img3)))
  (at 3542 (image_available img4))
  (at 3550 (not (image_available img4)))
  (at 3289 (image_available img5))
  (at 3297 (not (image_available img5)))
  (at 3583 (image_available img6))
  (at 3591 (not (image_available img6)))
  (at 3310 (image_available img7))
  (at 3318 (not (image_available img7)))
  (at 3332 (image_available img8))
  (at 3340 (not (image_available img8)))
  (at 3525 (image_available img9))
  (at 3533 (not (image_available img9)))
  (at 3569 (image_available img10))
  (at 3577 (not (image_available img10)))
  (at 3574 (image_available img11))
  (at 3582 (not (image_available img11)))
  (at 3365 (image_available img12))
  (at 3373 (not (image_available img12)))
  (at 3461 (image_available img13))
  (at 3469 (not (image_available img13)))
  (at 3549 (image_available img14))
  (at 3557 (not (image_available img14)))
  (at 3387 (image_available img15))
  (at 3395 (not (image_available img15)))
  (at 3269 (image_available img16))
  (at 3277 (not (image_available img16)))
  (at 3510 (image_available img17))
  (at 3518 (not (image_available img17)))
  (at 3346 (image_available img18))
  (at 3354 (not (image_available img18)))
  (at 3507 (image_available img19))
  (at 3515 (not (image_available img19)))
  (at 3251 (image_available img20))
  (at 3259 (not (image_available img20)))
  (at 3626 (image_available img1))
  (at 3634 (not (image_available img1)))
  (at 3724 (image_available img2))
  (at 3732 (not (image_available img2)))
  (at 3799 (image_available img3))
  (at 3807 (not (image_available img3)))
  (at 3902 (image_available img4))
  (at 3910 (not (image_available img4)))
  (at 3649 (image_available img5))
  (at 3657 (not (image_available img5)))
  (at 3943 (image_available img6))
  (at 3951 (not (image_available img6)))
  (at 3670 (image_available img7))
  (at 3678 (not (image_available img7)))
  (at 3692 (image_available img8))
  (at 3700 (not (image_available img8)))
  (at 3885 (image_available img9))
  (at 3893 (not (image_available img9)))
  (at 3929 (image_available img10))
  (at 3937 (not (image_available img10)))
  (at 3934 (image_available img11))
  (at 3942 (not (image_available img11)))
  (at 3725 (image_available img12))
  (at 3733 (not (image_available img12)))
  (at 3821 (image_available img13))
  (at 3829 (not (image_available img13)))
  (at 3909 (image_available img14))
  (at 3917 (not (image_available img14)))
  (at 3747 (image_available img15))
  (at 3755 (not (image_available img15)))
  (at 3629 (image_available img16))
  (at 3637 (not (image_available img16)))
  (at 3870 (image_available img17))
  (at 3878 (not (image_available img17)))
  (at 3706 (image_available img18))
  (at 3714 (not (image_available img18)))
  (at 3867 (image_available img19))
  (at 3875 (not (image_available img19)))
  (at 3611 (image_available img20))
  (at 3619 (not (image_available img20)))
  (at 3986 (image_available img1))
  (at 3994 (not (image_available img1)))
  (at 4084 (image_available img2))
  (at 4092 (not (image_available img2)))
  (at 4159 (image_available img3))
  (at 4167 (not (image_available img3)))
  (at 4262 (image_available img4))
  (at 4270 (not (image_available img4)))
  (at 4009 (image_available img5))
  (at 4017 (not (image_available img5)))
  (at 4303 (image_available img6))
  (at 4311 (not (image_available img6)))
  (at 4030 (image_available img7))
  (at 4038 (not (image_available img7)))
  (at 4052 (image_available img8))
  (at 4060 (not (image_available img8)))
  (at 4245 (image_available img9))
  (at 4253 (not (image_available img9)))
  (at 4289 (image_available img10))
  (at 4297 (not (image_available img10)))
  (at 4294 (image_available img11))
  (at 4302 (not (image_available img11)))
  (at 4085 (image_available img12))
  (at 4093 (not (image_available img12)))
  (at 4181 (image_available img13))
  (at 4189 (not (image_available img13)))
  (at 4269 (image_available img14))
  (at 4277 (not (image_available img14)))
  (at 4107 (image_available img15))
  (at 4115 (not (image_available img15)))
  (at 3989 (image_available img16))
  (at 3997 (not (image_available img16)))
  (at 4230 (image_available img17))
  (at 4238 (not (image_available img17)))
  (at 4066 (image_available img18))
  (at 4074 (not (image_available img18)))
  (at 4227 (image_available img19))
  (at 4235 (not (image_available img19)))
  (at 3971 (image_available img20))
  (at 3979 (not (image_available img20)))
  (at 4346 (image_available img1))
  (at 4354 (not (image_available img1)))
  (at 4444 (image_available img2))
  (at 4452 (not (image_available img2)))
  (at 4519 (image_available img3))
  (at 4527 (not (image_available img3)))
  (at 4622 (image_available img4))
  (at 4630 (not (image_available img4)))
  (at 4369 (image_available img5))
  (at 4377 (not (image_available img5)))
  (at 4663 (image_available img6))
  (at 4671 (not (image_available img6)))
  (at 4390 (image_available img7))
  (at 4398 (not (image_available img7)))
  (at 4412 (image_available img8))
  (at 4420 (not (image_available img8)))
  (at 4605 (image_available img9))
  (at 4613 (not (image_available img9)))
  (at 4649 (image_available img10))
  (at 4657 (not (image_available img10)))
  (at 4654 (image_available img11))
  (at 4662 (not (image_available img11)))
  (at 4445 (image_available img12))
  (at 4453 (not (image_available img12)))
  (at 4541 (image_available img13))
  (at 4549 (not (image_available img13)))
  (at 4629 (image_available img14))
  (at 4637 (not (image_available img14)))
  (at 4467 (image_available img15))
  (at 4475 (not (image_available img15)))
  (at 4349 (image_available img16))
  (at 4357 (not (image_available img16)))
  (at 4590 (image_available img17))
  (at 4598 (not (image_available img17)))
  (at 4426 (image_available img18))
  (at 4434 (not (image_available img18)))
  (at 4587 (image_available img19))
  (at 4595 (not (image_available img19)))
  (at 4331 (image_available img20))
  (at 4339 (not (image_available img20)))
  (at 4706 (image_available img1))
  (at 4714 (not (image_available img1)))
  (at 4804 (image_available img2))
  (at 4812 (not (image_available img2)))
  (at 4879 (image_available img3))
  (at 4887 (not (image_available img3)))
  (at 4982 (image_available img4))
  (at 4990 (not (image_available img4)))
  (at 4729 (image_available img5))
  (at 4737 (not (image_available img5)))
  (at 5023 (image_available img6))
  (at 5031 (not (image_available img6)))
  (at 4750 (image_available img7))
  (at 4758 (not (image_available img7)))
  (at 4772 (image_available img8))
  (at 4780 (not (image_available img8)))
  (at 4965 (image_available img9))
  (at 4973 (not (image_available img9)))
  (at 5009 (image_available img10))
  (at 5017 (not (image_available img10)))
  (at 5014 (image_available img11))
  (at 5022 (not (image_available img11)))
  (at 4805 (image_available img12))
  (at 4813 (not (image_available img12)))
  (at 4901 (image_available img13))
  (at 4909 (not (image_available img13)))
  (at 4989 (image_available img14))
  (at 4997 (not (image_available img14)))
  (at 4827 (image_available img15))
  (at 4835 (not (image_available img15)))
  (at 4709 (image_available img16))
  (at 4717 (not (image_available img16)))
  (at 4950 (image_available img17))
  (at 4958 (not (image_available img17)))
  (at 4786 (image_available img18))
  (at 4794 (not (image_available img18)))
  (at 4947 (image_available img19))
  (at 4955 (not (image_available img19)))
  (at 4691 (image_available img20))
  (at 4699 (not (image_available img20)))
  (at 5066 (image_available img1))
  (at 5074 (not (image_available img1)))
  (at 5164 (image_available img2))
  (at 5172 (not (image_available img2)))
  (at 5239 (image_available img3))
  (at 5247 (not (image_available img3)))
  (at 5342 (image_available img4))
  (at 5350 (not (image_available img4)))
  (at 5089 (image_available img5))
  (at 5097 (not (image_available img5)))
  (at 5383 (image_available img6))
  (at 5391 (not (image_available img6)))
  (at 5110 (image_available img7))
  (at 5118 (not (image_available img7)))
  (at 5132 (image_available img8))
  (at 5140 (not (image_available img8)))
  (at 5325 (image_available img9))
  (at 5333 (not (image_available img9)))
  (at 5369 (image_available img10))
  (at 5377 (not (image_available img10)))
  (at 5374 (image_available img11))
  (at 5382 (not (image_available img11)))
  (at 5165 (image_available img12))
  (at 5173 (not (image_available img12)))
  (at 5261 (image_available img13))
  (at 5269 (not (image_available img13)))
  (at 5349 (image_available img14))
  (at 5357 (not (image_available img14)))
  (at 5187 (image_available img15))
  (at 5195 (not (image_available img15)))
  (at 5069 (image_available img16))
  (at 5077 (not (image_available img16)))
  (at 5310 (image_available img17))
  (at 5318 (not (image_available img17)))
  (at 5146 (image_available img18))
  (at 5154 (not (image_available img18)))
  (at 5307 (image_available img19))
  (at 5315 (not (image_available img19)))
  (at 5051 (image_available img20))
  (at 5059 (not (image_available img20)))
  (at 5426 (image_available img1))
  (at 5434 (not (image_available img1)))
  (at 5524 (image_available img2))
  (at 5532 (not (image_available img2)))
  (at 5599 (image_available img3))
  (at 5607 (not (image_available img3)))
  (at 5702 (image_available img4))
  (at 5710 (not (image_available img4)))
  (at 5449 (image_available img5))
  (at 5457 (not (image_available img5)))
  (at 5743 (image_available img6))
  (at 5751 (not (image_available img6)))
  (at 5470 (image_available img7))
  (at 5478 (not (image_available img7)))
  (at 5492 (image_available img8))
  (at 5500 (not (image_available img8)))
  (at 5685 (image_available img9))
  (at 5693 (not (image_available img9)))
  (at 5729 (image_available img10))
  (at 5737 (not (image_available img10)))
  (at 5734 (image_available img11))
  (at 5742 (not (image_available img11)))
  (at 5525 (image_available img12))
  (at 5533 (not (image_available img12)))
  (at 5621 (image_available img13))
  (at 5629 (not (image_available img13)))
  (at 5709 (image_available img14))
  (at 5717 (not (image_available img14)))
  (at 5547 (image_available img15))
  (at 5555 (not (image_available img15)))
  (at 5429 (image_available img16))
  (at 5437 (not (image_available img16)))
  (at 5670 (image_available img17))
  (at 5678 (not (image_available img17)))
  (at 5506 (image_available img18))
  (at 5514 (not (image_available img18)))
  (at 5667 (image_available img19))
  (at 5675 (not (image_available img19)))
  (at 5411 (image_available img20))
  (at 5419 (not (image_available img20)))
  (at 5786 (image_available img1))
  (at 5794 (not (image_available img1)))
  (at 5884 (image_available img2))
  (at 5892 (not (image_available img2)))
  (at 5959 (image_available img3))
  (at 5967 (not (image_available img3)))
  (at 6062 (image_available img4))
  (at 6070 (not (image_available img4)))
  (at 5809 (image_available img5))
  (at 5817 (not (image_available img5)))
  (at 6103 (image_available img6))
  (at 6111 (not (image_available img6)))
  (at 5830 (image_available img7))
  (at 5838 (not (image_available img7)))
  (at 5852 (image_available img8))
  (at 5860 (not (image_available img8)))
  (at 6045 (image_available img9))
  (at 6053 (not (image_available img9)))
  (at 6089 (image_available img10))
  (at 6097 (not (image_available img10)))
  (at 6094 (image_available img11))
  (at 6102 (not (image_available img11)))
  (at 5885 (image_available img12))
  (at 5893 (not (image_available img12)))
  (at 5981 (image_available img13))
  (at 5989 (not (image_available img13)))
  (at 6069 (image_available img14))
  (at 6077 (not (image_available img14)))
  (at 5907 (image_available img15))
  (at 5915 (not (image_available img15)))
  (at 5789 (image_available img16))
  (at 5797 (not (image_available img16)))
  (at 6030 (image_available img17))
  (at 6038 (not (image_available img17)))
  (at 5866 (image_available img18))
  (at 5874 (not (image_available img18)))
  (at 6027 (image_available img19))
  (at 6035 (not (image_available img19)))
  (at 5771 (image_available img20))
  (at 5779 (not (image_available img20)))
  (at 6146 (image_available img1))
  (at 6154 (not (image_available img1)))
  (at 6244 (image_available img2))
  (at 6252 (not (image_available img2)))
  (at 6319 (image_available img3))
  (at 6327 (not (image_available img3)))
  (at 6422 (image_available img4))
  (at 6430 (not (image_available img4)))
  (at 6169 (image_available img5))
  (at 6177 (not (image_available img5)))
  (at 6463 (image_available img6))
  (at 6471 (not (image_available img6)))
  (at 6190 (image_available img7))
  (at 6198 (not (image_available img7)))
  (at 6212 (image_available img8))
  (at 6220 (not (image_available img8)))
  (at 6405 (image_available img9))
  (at 6413 (not (image_available img9)))
  (at 6449 (image_available img10))
  (at 6457 (not (image_available img10)))
  (at 6454 (image_available img11))
  (at 6462 (not (image_available img11)))
  (at 6245 (image_available img12))
  (at 6253 (not (image_available img12)))
  (at 6341 (image_available img13))
  (at 6349 (not (image_available img13)))
  (at 6429 (image_available img14))
  (at 6437 (not (image_available img14)))
  (at 6267 (image_available img15))
  (at 6275 (not (image_available img15)))
  (at 6149 (image_available img16))
  (at 6157 (not (image_available img16)))
  (at 6390 (image_available img17))
  (at 6398 (not (image_available img17)))
  (at 6226 (image_available img18))
  (at 6234 (not (image_available img18)))
  (at 6387 (image_available img19))
  (at 6395 (not (image_available img19)))
  (at 6131 (image_available img20))
  (at 6139 (not (image_available img20)))
  (at 6506 (image_available img1))
  (at 6514 (not (image_available img1)))
  (at 6604 (image_available img2))
  (at 6612 (not (image_available img2)))
  (at 6679 (image_available img3))
  (at 6687 (not (image_available img3)))
  (at 6782 (image_available img4))
  (at 6790 (not (image_available img4)))
  (at 6529 (image_available img5))
  (at 6537 (not (image_available img5)))
  (at 6823 (image_available img6))
  (at 6831 (not (image_available img6)))
  (at 6550 (image_available img7))
  (at 6558 (not (image_available img7)))
  (at 6572 (image_available img8))
  (at 6580 (not (image_available img8)))
  (at 6765 (image_available img9))
  (at 6773 (not (image_available img9)))
  (at 6809 (image_available img10))
  (at 6817 (not (image_available img10)))
  (at 6814 (image_available img11))
  (at 6822 (not (image_available img11)))
  (at 6605 (image_available img12))
  (at 6613 (not (image_available img12)))
  (at 6701 (image_available img13))
  (at 6709 (not (image_available img13)))
  (at 6789 (image_available img14))
  (at 6797 (not (image_available img14)))
  (at 6627 (image_available img15))
  (at 6635 (not (image_available img15)))
  (at 6509 (image_available img16))
  (at 6517 (not (image_available img16)))
  (at 6750 (image_available img17))
  (at 6758 (not (image_available img17)))
  (at 6586 (image_available img18))
  (at 6594 (not (image_available img18)))
  (at 6747 (image_available img19))
  (at 6755 (not (image_available img19)))
  (at 6491 (image_available img20))
  (at 6499 (not (image_available img20)))
  (at 6866 (image_available img1))
  (at 6874 (not (image_available img1)))
  (at 6964 (image_available img2))
  (at 6972 (not (image_available img2)))
  (at 7039 (image_available img3))
  (at 7047 (not (image_available img3)))
  (at 7142 (image_available img4))
  (at 7150 (not (image_available img4)))
  (at 6889 (image_available img5))
  (at 6897 (not (image_available img5)))
  (at 7183 (image_available img6))
  (at 7191 (not (image_available img6)))
  (at 6910 (image_available img7))
  (at 6918 (not (image_available img7)))
  (at 6932 (image_available img8))
  (at 6940 (not (image_available img8)))
  (at 7125 (image_available img9))
  (at 7133 (not (image_available img9)))
  (at 7169 (image_available img10))
  (at 7177 (not (image_available img10)))
  (at 7174 (image_available img11))
  (at 7182 (not (image_available img11)))
  (at 6965 (image_available img12))
  (at 6973 (not (image_available img12)))
  (at 7061 (image_available img13))
  (at 7069 (not (image_available img13)))
  (at 7149 (image_available img14))
  (at 7157 (not (image_available img14)))
  (at 6987 (image_available img15))
  (at 6995 (not (image_available img15)))
  (at 6869 (image_available img16))
  (at 6877 (not (image_available img16)))
  (at 7110 (image_available img17))
  (at 7118 (not (image_available img17)))
  (at 6946 (image_available img18))
  (at 6954 (not (image_available img18)))
  (at 7107 (image_available img19))
  (at 7115 (not (image_available img19)))
  (at 6851 (image_available img20))
  (at 6859 (not (image_available img20)))
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
  (<= (image_score img1) 5)

  (> (image_score img2) 0)
  (<= (image_score img2) 4)

  (> (image_score img3) 0)
  (<= (image_score img3) 2)

  (> (image_score img4) 0)
  (<= (image_score img4) 1)

  (> (image_score img5) 0)
  (<= (image_score img5) 3)

  (> (image_score img6) 0)
  (<= (image_score img6) 5)

  (> (image_score img7) 0)
  (<= (image_score img7) 5)

  (> (image_score img8) 0)
  (<= (image_score img8) 5)

  (> (image_score img9) 0)
  (<= (image_score img9) 5)

  (> (image_score img11) 0)
  (<= (image_score img11) 4)

  (> (image_score img12) 0)
  (<= (image_score img12) 2)

  (> (image_score img13) 0)
  (<= (image_score img13) 1)

  (> (image_score img14) 0)
  (<= (image_score img14) 5)

  (> (image_score img15) 0)
  (<= (image_score img15) 4)

  (> (image_score img17) 0)
  (<= (image_score img17) 3)

  (> (image_score img18) 0)
  (<= (image_score img18) 4)

  (> (image_score img19) 0)
  (<= (image_score img19) 3)

  (> (image_score img20) 0)
  (<= (image_score img20) 1)

(>= (total_score) 13)
))
(:metric maximize (+
  (image_score img1)
    (+ (image_score img2)
      (+ (image_score img3)
        (+ (image_score img4)
          (+ (image_score img5)
            (+ (image_score img6)
              (+ (image_score img7)
                (+ (image_score img8)
                  (+ (image_score img9)
                    (+ (image_score img11)
                      (+ (image_score img12)
                        (+ (image_score img13)
                          (+ (image_score img14)
                            (+ (image_score img15)
                              (+ (image_score img17)
                                (+ (image_score img18)
                                  (+ (image_score img19)
                                    (image_score img20)
                                  )
                                )
                              )
                            )
                          )
                        )
                      )
                    )
                  )
                )
              )
            )
          )
        )
      )
    )
  )
)
)