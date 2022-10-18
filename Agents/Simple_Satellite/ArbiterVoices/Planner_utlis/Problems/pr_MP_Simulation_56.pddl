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



  (at 300 (image_available img1))
  (at 308 (not (image_available img1)))
  (at 53 (image_available img2))
  (at 61 (not (image_available img2)))
  (at 265 (image_available img3))
  (at 273 (not (image_available img3)))
  (at 226 (image_available img4))
  (at 234 (not (image_available img4)))
  (at 207 (image_available img5))
  (at 215 (not (image_available img5)))
  (at 298 (image_available img6))
  (at 306 (not (image_available img6)))
  (at 184 (image_available img7))
  (at 192 (not (image_available img7)))
  (at 334 (image_available img8))
  (at 342 (not (image_available img8)))
  (at 317 (image_available img9))
  (at 325 (not (image_available img9)))
  (at 14 (image_available img10))
  (at 22 (not (image_available img10)))
  (at 248 (image_available img11))
  (at 256 (not (image_available img11)))
  (at 148 (image_available img12))
  (at 156 (not (image_available img12)))
  (at 107 (image_available img13))
  (at 115 (not (image_available img13)))
  (at 19 (image_available img14))
  (at 27 (not (image_available img14)))
  (at 155 (image_available img15))
  (at 163 (not (image_available img15)))
  (at 163 (image_available img16))
  (at 171 (not (image_available img16)))
  (at 39 (image_available img17))
  (at 47 (not (image_available img17)))
  (at 25 (image_available img18))
  (at 33 (not (image_available img18)))
  (at 197 (image_available img19))
  (at 205 (not (image_available img19)))
  (at 267 (image_available img20))
  (at 275 (not (image_available img20)))
  (at 660 (image_available img1))
  (at 668 (not (image_available img1)))
  (at 413 (image_available img2))
  (at 421 (not (image_available img2)))
  (at 625 (image_available img3))
  (at 633 (not (image_available img3)))
  (at 586 (image_available img4))
  (at 594 (not (image_available img4)))
  (at 567 (image_available img5))
  (at 575 (not (image_available img5)))
  (at 658 (image_available img6))
  (at 666 (not (image_available img6)))
  (at 544 (image_available img7))
  (at 552 (not (image_available img7)))
  (at 694 (image_available img8))
  (at 702 (not (image_available img8)))
  (at 677 (image_available img9))
  (at 685 (not (image_available img9)))
  (at 374 (image_available img10))
  (at 382 (not (image_available img10)))
  (at 608 (image_available img11))
  (at 616 (not (image_available img11)))
  (at 508 (image_available img12))
  (at 516 (not (image_available img12)))
  (at 467 (image_available img13))
  (at 475 (not (image_available img13)))
  (at 379 (image_available img14))
  (at 387 (not (image_available img14)))
  (at 515 (image_available img15))
  (at 523 (not (image_available img15)))
  (at 523 (image_available img16))
  (at 531 (not (image_available img16)))
  (at 399 (image_available img17))
  (at 407 (not (image_available img17)))
  (at 385 (image_available img18))
  (at 393 (not (image_available img18)))
  (at 557 (image_available img19))
  (at 565 (not (image_available img19)))
  (at 627 (image_available img20))
  (at 635 (not (image_available img20)))
  (at 1020 (image_available img1))
  (at 1028 (not (image_available img1)))
  (at 773 (image_available img2))
  (at 781 (not (image_available img2)))
  (at 985 (image_available img3))
  (at 993 (not (image_available img3)))
  (at 946 (image_available img4))
  (at 954 (not (image_available img4)))
  (at 927 (image_available img5))
  (at 935 (not (image_available img5)))
  (at 1018 (image_available img6))
  (at 1026 (not (image_available img6)))
  (at 904 (image_available img7))
  (at 912 (not (image_available img7)))
  (at 1054 (image_available img8))
  (at 1062 (not (image_available img8)))
  (at 1037 (image_available img9))
  (at 1045 (not (image_available img9)))
  (at 734 (image_available img10))
  (at 742 (not (image_available img10)))
  (at 968 (image_available img11))
  (at 976 (not (image_available img11)))
  (at 868 (image_available img12))
  (at 876 (not (image_available img12)))
  (at 827 (image_available img13))
  (at 835 (not (image_available img13)))
  (at 739 (image_available img14))
  (at 747 (not (image_available img14)))
  (at 875 (image_available img15))
  (at 883 (not (image_available img15)))
  (at 883 (image_available img16))
  (at 891 (not (image_available img16)))
  (at 759 (image_available img17))
  (at 767 (not (image_available img17)))
  (at 745 (image_available img18))
  (at 753 (not (image_available img18)))
  (at 917 (image_available img19))
  (at 925 (not (image_available img19)))
  (at 987 (image_available img20))
  (at 995 (not (image_available img20)))
  (at 1380 (image_available img1))
  (at 1388 (not (image_available img1)))
  (at 1133 (image_available img2))
  (at 1141 (not (image_available img2)))
  (at 1345 (image_available img3))
  (at 1353 (not (image_available img3)))
  (at 1306 (image_available img4))
  (at 1314 (not (image_available img4)))
  (at 1287 (image_available img5))
  (at 1295 (not (image_available img5)))
  (at 1378 (image_available img6))
  (at 1386 (not (image_available img6)))
  (at 1264 (image_available img7))
  (at 1272 (not (image_available img7)))
  (at 1414 (image_available img8))
  (at 1422 (not (image_available img8)))
  (at 1397 (image_available img9))
  (at 1405 (not (image_available img9)))
  (at 1094 (image_available img10))
  (at 1102 (not (image_available img10)))
  (at 1328 (image_available img11))
  (at 1336 (not (image_available img11)))
  (at 1228 (image_available img12))
  (at 1236 (not (image_available img12)))
  (at 1187 (image_available img13))
  (at 1195 (not (image_available img13)))
  (at 1099 (image_available img14))
  (at 1107 (not (image_available img14)))
  (at 1235 (image_available img15))
  (at 1243 (not (image_available img15)))
  (at 1243 (image_available img16))
  (at 1251 (not (image_available img16)))
  (at 1119 (image_available img17))
  (at 1127 (not (image_available img17)))
  (at 1105 (image_available img18))
  (at 1113 (not (image_available img18)))
  (at 1277 (image_available img19))
  (at 1285 (not (image_available img19)))
  (at 1347 (image_available img20))
  (at 1355 (not (image_available img20)))
  (at 1740 (image_available img1))
  (at 1748 (not (image_available img1)))
  (at 1493 (image_available img2))
  (at 1501 (not (image_available img2)))
  (at 1705 (image_available img3))
  (at 1713 (not (image_available img3)))
  (at 1666 (image_available img4))
  (at 1674 (not (image_available img4)))
  (at 1647 (image_available img5))
  (at 1655 (not (image_available img5)))
  (at 1738 (image_available img6))
  (at 1746 (not (image_available img6)))
  (at 1624 (image_available img7))
  (at 1632 (not (image_available img7)))
  (at 1774 (image_available img8))
  (at 1782 (not (image_available img8)))
  (at 1757 (image_available img9))
  (at 1765 (not (image_available img9)))
  (at 1454 (image_available img10))
  (at 1462 (not (image_available img10)))
  (at 1688 (image_available img11))
  (at 1696 (not (image_available img11)))
  (at 1588 (image_available img12))
  (at 1596 (not (image_available img12)))
  (at 1547 (image_available img13))
  (at 1555 (not (image_available img13)))
  (at 1459 (image_available img14))
  (at 1467 (not (image_available img14)))
  (at 1595 (image_available img15))
  (at 1603 (not (image_available img15)))
  (at 1603 (image_available img16))
  (at 1611 (not (image_available img16)))
  (at 1479 (image_available img17))
  (at 1487 (not (image_available img17)))
  (at 1465 (image_available img18))
  (at 1473 (not (image_available img18)))
  (at 1637 (image_available img19))
  (at 1645 (not (image_available img19)))
  (at 1707 (image_available img20))
  (at 1715 (not (image_available img20)))
  (at 2100 (image_available img1))
  (at 2108 (not (image_available img1)))
  (at 1853 (image_available img2))
  (at 1861 (not (image_available img2)))
  (at 2065 (image_available img3))
  (at 2073 (not (image_available img3)))
  (at 2026 (image_available img4))
  (at 2034 (not (image_available img4)))
  (at 2007 (image_available img5))
  (at 2015 (not (image_available img5)))
  (at 2098 (image_available img6))
  (at 2106 (not (image_available img6)))
  (at 1984 (image_available img7))
  (at 1992 (not (image_available img7)))
  (at 2134 (image_available img8))
  (at 2142 (not (image_available img8)))
  (at 2117 (image_available img9))
  (at 2125 (not (image_available img9)))
  (at 1814 (image_available img10))
  (at 1822 (not (image_available img10)))
  (at 2048 (image_available img11))
  (at 2056 (not (image_available img11)))
  (at 1948 (image_available img12))
  (at 1956 (not (image_available img12)))
  (at 1907 (image_available img13))
  (at 1915 (not (image_available img13)))
  (at 1819 (image_available img14))
  (at 1827 (not (image_available img14)))
  (at 1955 (image_available img15))
  (at 1963 (not (image_available img15)))
  (at 1963 (image_available img16))
  (at 1971 (not (image_available img16)))
  (at 1839 (image_available img17))
  (at 1847 (not (image_available img17)))
  (at 1825 (image_available img18))
  (at 1833 (not (image_available img18)))
  (at 1997 (image_available img19))
  (at 2005 (not (image_available img19)))
  (at 2067 (image_available img20))
  (at 2075 (not (image_available img20)))
  (at 2460 (image_available img1))
  (at 2468 (not (image_available img1)))
  (at 2213 (image_available img2))
  (at 2221 (not (image_available img2)))
  (at 2425 (image_available img3))
  (at 2433 (not (image_available img3)))
  (at 2386 (image_available img4))
  (at 2394 (not (image_available img4)))
  (at 2367 (image_available img5))
  (at 2375 (not (image_available img5)))
  (at 2458 (image_available img6))
  (at 2466 (not (image_available img6)))
  (at 2344 (image_available img7))
  (at 2352 (not (image_available img7)))
  (at 2494 (image_available img8))
  (at 2502 (not (image_available img8)))
  (at 2477 (image_available img9))
  (at 2485 (not (image_available img9)))
  (at 2174 (image_available img10))
  (at 2182 (not (image_available img10)))
  (at 2408 (image_available img11))
  (at 2416 (not (image_available img11)))
  (at 2308 (image_available img12))
  (at 2316 (not (image_available img12)))
  (at 2267 (image_available img13))
  (at 2275 (not (image_available img13)))
  (at 2179 (image_available img14))
  (at 2187 (not (image_available img14)))
  (at 2315 (image_available img15))
  (at 2323 (not (image_available img15)))
  (at 2323 (image_available img16))
  (at 2331 (not (image_available img16)))
  (at 2199 (image_available img17))
  (at 2207 (not (image_available img17)))
  (at 2185 (image_available img18))
  (at 2193 (not (image_available img18)))
  (at 2357 (image_available img19))
  (at 2365 (not (image_available img19)))
  (at 2427 (image_available img20))
  (at 2435 (not (image_available img20)))
  (at 2820 (image_available img1))
  (at 2828 (not (image_available img1)))
  (at 2573 (image_available img2))
  (at 2581 (not (image_available img2)))
  (at 2785 (image_available img3))
  (at 2793 (not (image_available img3)))
  (at 2746 (image_available img4))
  (at 2754 (not (image_available img4)))
  (at 2727 (image_available img5))
  (at 2735 (not (image_available img5)))
  (at 2818 (image_available img6))
  (at 2826 (not (image_available img6)))
  (at 2704 (image_available img7))
  (at 2712 (not (image_available img7)))
  (at 2854 (image_available img8))
  (at 2862 (not (image_available img8)))
  (at 2837 (image_available img9))
  (at 2845 (not (image_available img9)))
  (at 2534 (image_available img10))
  (at 2542 (not (image_available img10)))
  (at 2768 (image_available img11))
  (at 2776 (not (image_available img11)))
  (at 2668 (image_available img12))
  (at 2676 (not (image_available img12)))
  (at 2627 (image_available img13))
  (at 2635 (not (image_available img13)))
  (at 2539 (image_available img14))
  (at 2547 (not (image_available img14)))
  (at 2675 (image_available img15))
  (at 2683 (not (image_available img15)))
  (at 2683 (image_available img16))
  (at 2691 (not (image_available img16)))
  (at 2559 (image_available img17))
  (at 2567 (not (image_available img17)))
  (at 2545 (image_available img18))
  (at 2553 (not (image_available img18)))
  (at 2717 (image_available img19))
  (at 2725 (not (image_available img19)))
  (at 2787 (image_available img20))
  (at 2795 (not (image_available img20)))
  (at 3180 (image_available img1))
  (at 3188 (not (image_available img1)))
  (at 2933 (image_available img2))
  (at 2941 (not (image_available img2)))
  (at 3145 (image_available img3))
  (at 3153 (not (image_available img3)))
  (at 3106 (image_available img4))
  (at 3114 (not (image_available img4)))
  (at 3087 (image_available img5))
  (at 3095 (not (image_available img5)))
  (at 3178 (image_available img6))
  (at 3186 (not (image_available img6)))
  (at 3064 (image_available img7))
  (at 3072 (not (image_available img7)))
  (at 3214 (image_available img8))
  (at 3222 (not (image_available img8)))
  (at 3197 (image_available img9))
  (at 3205 (not (image_available img9)))
  (at 2894 (image_available img10))
  (at 2902 (not (image_available img10)))
  (at 3128 (image_available img11))
  (at 3136 (not (image_available img11)))
  (at 3028 (image_available img12))
  (at 3036 (not (image_available img12)))
  (at 2987 (image_available img13))
  (at 2995 (not (image_available img13)))
  (at 2899 (image_available img14))
  (at 2907 (not (image_available img14)))
  (at 3035 (image_available img15))
  (at 3043 (not (image_available img15)))
  (at 3043 (image_available img16))
  (at 3051 (not (image_available img16)))
  (at 2919 (image_available img17))
  (at 2927 (not (image_available img17)))
  (at 2905 (image_available img18))
  (at 2913 (not (image_available img18)))
  (at 3077 (image_available img19))
  (at 3085 (not (image_available img19)))
  (at 3147 (image_available img20))
  (at 3155 (not (image_available img20)))
  (at 3540 (image_available img1))
  (at 3548 (not (image_available img1)))
  (at 3293 (image_available img2))
  (at 3301 (not (image_available img2)))
  (at 3505 (image_available img3))
  (at 3513 (not (image_available img3)))
  (at 3466 (image_available img4))
  (at 3474 (not (image_available img4)))
  (at 3447 (image_available img5))
  (at 3455 (not (image_available img5)))
  (at 3538 (image_available img6))
  (at 3546 (not (image_available img6)))
  (at 3424 (image_available img7))
  (at 3432 (not (image_available img7)))
  (at 3574 (image_available img8))
  (at 3582 (not (image_available img8)))
  (at 3557 (image_available img9))
  (at 3565 (not (image_available img9)))
  (at 3254 (image_available img10))
  (at 3262 (not (image_available img10)))
  (at 3488 (image_available img11))
  (at 3496 (not (image_available img11)))
  (at 3388 (image_available img12))
  (at 3396 (not (image_available img12)))
  (at 3347 (image_available img13))
  (at 3355 (not (image_available img13)))
  (at 3259 (image_available img14))
  (at 3267 (not (image_available img14)))
  (at 3395 (image_available img15))
  (at 3403 (not (image_available img15)))
  (at 3403 (image_available img16))
  (at 3411 (not (image_available img16)))
  (at 3279 (image_available img17))
  (at 3287 (not (image_available img17)))
  (at 3265 (image_available img18))
  (at 3273 (not (image_available img18)))
  (at 3437 (image_available img19))
  (at 3445 (not (image_available img19)))
  (at 3507 (image_available img20))
  (at 3515 (not (image_available img20)))
  (at 3900 (image_available img1))
  (at 3908 (not (image_available img1)))
  (at 3653 (image_available img2))
  (at 3661 (not (image_available img2)))
  (at 3865 (image_available img3))
  (at 3873 (not (image_available img3)))
  (at 3826 (image_available img4))
  (at 3834 (not (image_available img4)))
  (at 3807 (image_available img5))
  (at 3815 (not (image_available img5)))
  (at 3898 (image_available img6))
  (at 3906 (not (image_available img6)))
  (at 3784 (image_available img7))
  (at 3792 (not (image_available img7)))
  (at 3934 (image_available img8))
  (at 3942 (not (image_available img8)))
  (at 3917 (image_available img9))
  (at 3925 (not (image_available img9)))
  (at 3614 (image_available img10))
  (at 3622 (not (image_available img10)))
  (at 3848 (image_available img11))
  (at 3856 (not (image_available img11)))
  (at 3748 (image_available img12))
  (at 3756 (not (image_available img12)))
  (at 3707 (image_available img13))
  (at 3715 (not (image_available img13)))
  (at 3619 (image_available img14))
  (at 3627 (not (image_available img14)))
  (at 3755 (image_available img15))
  (at 3763 (not (image_available img15)))
  (at 3763 (image_available img16))
  (at 3771 (not (image_available img16)))
  (at 3639 (image_available img17))
  (at 3647 (not (image_available img17)))
  (at 3625 (image_available img18))
  (at 3633 (not (image_available img18)))
  (at 3797 (image_available img19))
  (at 3805 (not (image_available img19)))
  (at 3867 (image_available img20))
  (at 3875 (not (image_available img20)))
  (at 4260 (image_available img1))
  (at 4268 (not (image_available img1)))
  (at 4013 (image_available img2))
  (at 4021 (not (image_available img2)))
  (at 4225 (image_available img3))
  (at 4233 (not (image_available img3)))
  (at 4186 (image_available img4))
  (at 4194 (not (image_available img4)))
  (at 4167 (image_available img5))
  (at 4175 (not (image_available img5)))
  (at 4258 (image_available img6))
  (at 4266 (not (image_available img6)))
  (at 4144 (image_available img7))
  (at 4152 (not (image_available img7)))
  (at 4294 (image_available img8))
  (at 4302 (not (image_available img8)))
  (at 4277 (image_available img9))
  (at 4285 (not (image_available img9)))
  (at 3974 (image_available img10))
  (at 3982 (not (image_available img10)))
  (at 4208 (image_available img11))
  (at 4216 (not (image_available img11)))
  (at 4108 (image_available img12))
  (at 4116 (not (image_available img12)))
  (at 4067 (image_available img13))
  (at 4075 (not (image_available img13)))
  (at 3979 (image_available img14))
  (at 3987 (not (image_available img14)))
  (at 4115 (image_available img15))
  (at 4123 (not (image_available img15)))
  (at 4123 (image_available img16))
  (at 4131 (not (image_available img16)))
  (at 3999 (image_available img17))
  (at 4007 (not (image_available img17)))
  (at 3985 (image_available img18))
  (at 3993 (not (image_available img18)))
  (at 4157 (image_available img19))
  (at 4165 (not (image_available img19)))
  (at 4227 (image_available img20))
  (at 4235 (not (image_available img20)))
  (at 4620 (image_available img1))
  (at 4628 (not (image_available img1)))
  (at 4373 (image_available img2))
  (at 4381 (not (image_available img2)))
  (at 4585 (image_available img3))
  (at 4593 (not (image_available img3)))
  (at 4546 (image_available img4))
  (at 4554 (not (image_available img4)))
  (at 4527 (image_available img5))
  (at 4535 (not (image_available img5)))
  (at 4618 (image_available img6))
  (at 4626 (not (image_available img6)))
  (at 4504 (image_available img7))
  (at 4512 (not (image_available img7)))
  (at 4654 (image_available img8))
  (at 4662 (not (image_available img8)))
  (at 4637 (image_available img9))
  (at 4645 (not (image_available img9)))
  (at 4334 (image_available img10))
  (at 4342 (not (image_available img10)))
  (at 4568 (image_available img11))
  (at 4576 (not (image_available img11)))
  (at 4468 (image_available img12))
  (at 4476 (not (image_available img12)))
  (at 4427 (image_available img13))
  (at 4435 (not (image_available img13)))
  (at 4339 (image_available img14))
  (at 4347 (not (image_available img14)))
  (at 4475 (image_available img15))
  (at 4483 (not (image_available img15)))
  (at 4483 (image_available img16))
  (at 4491 (not (image_available img16)))
  (at 4359 (image_available img17))
  (at 4367 (not (image_available img17)))
  (at 4345 (image_available img18))
  (at 4353 (not (image_available img18)))
  (at 4517 (image_available img19))
  (at 4525 (not (image_available img19)))
  (at 4587 (image_available img20))
  (at 4595 (not (image_available img20)))
  (at 4980 (image_available img1))
  (at 4988 (not (image_available img1)))
  (at 4733 (image_available img2))
  (at 4741 (not (image_available img2)))
  (at 4945 (image_available img3))
  (at 4953 (not (image_available img3)))
  (at 4906 (image_available img4))
  (at 4914 (not (image_available img4)))
  (at 4887 (image_available img5))
  (at 4895 (not (image_available img5)))
  (at 4978 (image_available img6))
  (at 4986 (not (image_available img6)))
  (at 4864 (image_available img7))
  (at 4872 (not (image_available img7)))
  (at 5014 (image_available img8))
  (at 5022 (not (image_available img8)))
  (at 4997 (image_available img9))
  (at 5005 (not (image_available img9)))
  (at 4694 (image_available img10))
  (at 4702 (not (image_available img10)))
  (at 4928 (image_available img11))
  (at 4936 (not (image_available img11)))
  (at 4828 (image_available img12))
  (at 4836 (not (image_available img12)))
  (at 4787 (image_available img13))
  (at 4795 (not (image_available img13)))
  (at 4699 (image_available img14))
  (at 4707 (not (image_available img14)))
  (at 4835 (image_available img15))
  (at 4843 (not (image_available img15)))
  (at 4843 (image_available img16))
  (at 4851 (not (image_available img16)))
  (at 4719 (image_available img17))
  (at 4727 (not (image_available img17)))
  (at 4705 (image_available img18))
  (at 4713 (not (image_available img18)))
  (at 4877 (image_available img19))
  (at 4885 (not (image_available img19)))
  (at 4947 (image_available img20))
  (at 4955 (not (image_available img20)))
  (at 5340 (image_available img1))
  (at 5348 (not (image_available img1)))
  (at 5093 (image_available img2))
  (at 5101 (not (image_available img2)))
  (at 5305 (image_available img3))
  (at 5313 (not (image_available img3)))
  (at 5266 (image_available img4))
  (at 5274 (not (image_available img4)))
  (at 5247 (image_available img5))
  (at 5255 (not (image_available img5)))
  (at 5338 (image_available img6))
  (at 5346 (not (image_available img6)))
  (at 5224 (image_available img7))
  (at 5232 (not (image_available img7)))
  (at 5374 (image_available img8))
  (at 5382 (not (image_available img8)))
  (at 5357 (image_available img9))
  (at 5365 (not (image_available img9)))
  (at 5054 (image_available img10))
  (at 5062 (not (image_available img10)))
  (at 5288 (image_available img11))
  (at 5296 (not (image_available img11)))
  (at 5188 (image_available img12))
  (at 5196 (not (image_available img12)))
  (at 5147 (image_available img13))
  (at 5155 (not (image_available img13)))
  (at 5059 (image_available img14))
  (at 5067 (not (image_available img14)))
  (at 5195 (image_available img15))
  (at 5203 (not (image_available img15)))
  (at 5203 (image_available img16))
  (at 5211 (not (image_available img16)))
  (at 5079 (image_available img17))
  (at 5087 (not (image_available img17)))
  (at 5065 (image_available img18))
  (at 5073 (not (image_available img18)))
  (at 5237 (image_available img19))
  (at 5245 (not (image_available img19)))
  (at 5307 (image_available img20))
  (at 5315 (not (image_available img20)))
  (at 5700 (image_available img1))
  (at 5708 (not (image_available img1)))
  (at 5453 (image_available img2))
  (at 5461 (not (image_available img2)))
  (at 5665 (image_available img3))
  (at 5673 (not (image_available img3)))
  (at 5626 (image_available img4))
  (at 5634 (not (image_available img4)))
  (at 5607 (image_available img5))
  (at 5615 (not (image_available img5)))
  (at 5698 (image_available img6))
  (at 5706 (not (image_available img6)))
  (at 5584 (image_available img7))
  (at 5592 (not (image_available img7)))
  (at 5734 (image_available img8))
  (at 5742 (not (image_available img8)))
  (at 5717 (image_available img9))
  (at 5725 (not (image_available img9)))
  (at 5414 (image_available img10))
  (at 5422 (not (image_available img10)))
  (at 5648 (image_available img11))
  (at 5656 (not (image_available img11)))
  (at 5548 (image_available img12))
  (at 5556 (not (image_available img12)))
  (at 5507 (image_available img13))
  (at 5515 (not (image_available img13)))
  (at 5419 (image_available img14))
  (at 5427 (not (image_available img14)))
  (at 5555 (image_available img15))
  (at 5563 (not (image_available img15)))
  (at 5563 (image_available img16))
  (at 5571 (not (image_available img16)))
  (at 5439 (image_available img17))
  (at 5447 (not (image_available img17)))
  (at 5425 (image_available img18))
  (at 5433 (not (image_available img18)))
  (at 5597 (image_available img19))
  (at 5605 (not (image_available img19)))
  (at 5667 (image_available img20))
  (at 5675 (not (image_available img20)))
  (at 6060 (image_available img1))
  (at 6068 (not (image_available img1)))
  (at 5813 (image_available img2))
  (at 5821 (not (image_available img2)))
  (at 6025 (image_available img3))
  (at 6033 (not (image_available img3)))
  (at 5986 (image_available img4))
  (at 5994 (not (image_available img4)))
  (at 5967 (image_available img5))
  (at 5975 (not (image_available img5)))
  (at 6058 (image_available img6))
  (at 6066 (not (image_available img6)))
  (at 5944 (image_available img7))
  (at 5952 (not (image_available img7)))
  (at 6094 (image_available img8))
  (at 6102 (not (image_available img8)))
  (at 6077 (image_available img9))
  (at 6085 (not (image_available img9)))
  (at 5774 (image_available img10))
  (at 5782 (not (image_available img10)))
  (at 6008 (image_available img11))
  (at 6016 (not (image_available img11)))
  (at 5908 (image_available img12))
  (at 5916 (not (image_available img12)))
  (at 5867 (image_available img13))
  (at 5875 (not (image_available img13)))
  (at 5779 (image_available img14))
  (at 5787 (not (image_available img14)))
  (at 5915 (image_available img15))
  (at 5923 (not (image_available img15)))
  (at 5923 (image_available img16))
  (at 5931 (not (image_available img16)))
  (at 5799 (image_available img17))
  (at 5807 (not (image_available img17)))
  (at 5785 (image_available img18))
  (at 5793 (not (image_available img18)))
  (at 5957 (image_available img19))
  (at 5965 (not (image_available img19)))
  (at 6027 (image_available img20))
  (at 6035 (not (image_available img20)))
  (at 6420 (image_available img1))
  (at 6428 (not (image_available img1)))
  (at 6173 (image_available img2))
  (at 6181 (not (image_available img2)))
  (at 6385 (image_available img3))
  (at 6393 (not (image_available img3)))
  (at 6346 (image_available img4))
  (at 6354 (not (image_available img4)))
  (at 6327 (image_available img5))
  (at 6335 (not (image_available img5)))
  (at 6418 (image_available img6))
  (at 6426 (not (image_available img6)))
  (at 6304 (image_available img7))
  (at 6312 (not (image_available img7)))
  (at 6454 (image_available img8))
  (at 6462 (not (image_available img8)))
  (at 6437 (image_available img9))
  (at 6445 (not (image_available img9)))
  (at 6134 (image_available img10))
  (at 6142 (not (image_available img10)))
  (at 6368 (image_available img11))
  (at 6376 (not (image_available img11)))
  (at 6268 (image_available img12))
  (at 6276 (not (image_available img12)))
  (at 6227 (image_available img13))
  (at 6235 (not (image_available img13)))
  (at 6139 (image_available img14))
  (at 6147 (not (image_available img14)))
  (at 6275 (image_available img15))
  (at 6283 (not (image_available img15)))
  (at 6283 (image_available img16))
  (at 6291 (not (image_available img16)))
  (at 6159 (image_available img17))
  (at 6167 (not (image_available img17)))
  (at 6145 (image_available img18))
  (at 6153 (not (image_available img18)))
  (at 6317 (image_available img19))
  (at 6325 (not (image_available img19)))
  (at 6387 (image_available img20))
  (at 6395 (not (image_available img20)))
  (at 6780 (image_available img1))
  (at 6788 (not (image_available img1)))
  (at 6533 (image_available img2))
  (at 6541 (not (image_available img2)))
  (at 6745 (image_available img3))
  (at 6753 (not (image_available img3)))
  (at 6706 (image_available img4))
  (at 6714 (not (image_available img4)))
  (at 6687 (image_available img5))
  (at 6695 (not (image_available img5)))
  (at 6778 (image_available img6))
  (at 6786 (not (image_available img6)))
  (at 6664 (image_available img7))
  (at 6672 (not (image_available img7)))
  (at 6814 (image_available img8))
  (at 6822 (not (image_available img8)))
  (at 6797 (image_available img9))
  (at 6805 (not (image_available img9)))
  (at 6494 (image_available img10))
  (at 6502 (not (image_available img10)))
  (at 6728 (image_available img11))
  (at 6736 (not (image_available img11)))
  (at 6628 (image_available img12))
  (at 6636 (not (image_available img12)))
  (at 6587 (image_available img13))
  (at 6595 (not (image_available img13)))
  (at 6499 (image_available img14))
  (at 6507 (not (image_available img14)))
  (at 6635 (image_available img15))
  (at 6643 (not (image_available img15)))
  (at 6643 (image_available img16))
  (at 6651 (not (image_available img16)))
  (at 6519 (image_available img17))
  (at 6527 (not (image_available img17)))
  (at 6505 (image_available img18))
  (at 6513 (not (image_available img18)))
  (at 6677 (image_available img19))
  (at 6685 (not (image_available img19)))
  (at 6747 (image_available img20))
  (at 6755 (not (image_available img20)))
  (at 7140 (image_available img1))
  (at 7148 (not (image_available img1)))
  (at 6893 (image_available img2))
  (at 6901 (not (image_available img2)))
  (at 7105 (image_available img3))
  (at 7113 (not (image_available img3)))
  (at 7066 (image_available img4))
  (at 7074 (not (image_available img4)))
  (at 7047 (image_available img5))
  (at 7055 (not (image_available img5)))
  (at 7138 (image_available img6))
  (at 7146 (not (image_available img6)))
  (at 7024 (image_available img7))
  (at 7032 (not (image_available img7)))
  (at 7174 (image_available img8))
  (at 7182 (not (image_available img8)))
  (at 7157 (image_available img9))
  (at 7165 (not (image_available img9)))
  (at 6854 (image_available img10))
  (at 6862 (not (image_available img10)))
  (at 7088 (image_available img11))
  (at 7096 (not (image_available img11)))
  (at 6988 (image_available img12))
  (at 6996 (not (image_available img12)))
  (at 6947 (image_available img13))
  (at 6955 (not (image_available img13)))
  (at 6859 (image_available img14))
  (at 6867 (not (image_available img14)))
  (at 6995 (image_available img15))
  (at 7003 (not (image_available img15)))
  (at 7003 (image_available img16))
  (at 7011 (not (image_available img16)))
  (at 6879 (image_available img17))
  (at 6887 (not (image_available img17)))
  (at 6865 (image_available img18))
  (at 6873 (not (image_available img18)))
  (at 7037 (image_available img19))
  (at 7045 (not (image_available img19)))
  (at 7107 (image_available img20))
  (at 7115 (not (image_available img20)))
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
  (> (image_score img5) 0)
  (<= (image_score img5) 13.0)

(>= (total_score) 3)
))
(:metric maximize 
  (image_score img5)
)
)