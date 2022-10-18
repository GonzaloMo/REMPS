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



  (at 291 (image_available img1))
  (at 299 (not (image_available img1)))
  (at 313 (image_available img2))
  (at 321 (not (image_available img2)))
  (at 24 (image_available img3))
  (at 32 (not (image_available img3)))
  (at 305 (image_available img4))
  (at 313 (not (image_available img4)))
  (at 285 (image_available img5))
  (at 293 (not (image_available img5)))
  (at 143 (image_available img6))
  (at 151 (not (image_available img6)))
  (at 312 (image_available img7))
  (at 320 (not (image_available img7)))
  (at 223 (image_available img8))
  (at 231 (not (image_available img8)))
  (at 230 (image_available img9))
  (at 238 (not (image_available img9)))
  (at 153 (image_available img10))
  (at 161 (not (image_available img10)))
  (at 124 (image_available img11))
  (at 132 (not (image_available img11)))
  (at 330 (image_available img12))
  (at 338 (not (image_available img12)))
  (at 15 (image_available img13))
  (at 23 (not (image_available img13)))
  (at 207 (image_available img14))
  (at 215 (not (image_available img14)))
  (at 9 (image_available img15))
  (at 17 (not (image_available img15)))
  (at 308 (image_available img16))
  (at 316 (not (image_available img16)))
  (at 305 (image_available img17))
  (at 313 (not (image_available img17)))
  (at 67 (image_available img18))
  (at 75 (not (image_available img18)))
  (at 44 (image_available img19))
  (at 52 (not (image_available img19)))
  (at 117 (image_available img20))
  (at 125 (not (image_available img20)))
  (at 651 (image_available img1))
  (at 659 (not (image_available img1)))
  (at 673 (image_available img2))
  (at 681 (not (image_available img2)))
  (at 384 (image_available img3))
  (at 392 (not (image_available img3)))
  (at 665 (image_available img4))
  (at 673 (not (image_available img4)))
  (at 645 (image_available img5))
  (at 653 (not (image_available img5)))
  (at 503 (image_available img6))
  (at 511 (not (image_available img6)))
  (at 672 (image_available img7))
  (at 680 (not (image_available img7)))
  (at 583 (image_available img8))
  (at 591 (not (image_available img8)))
  (at 590 (image_available img9))
  (at 598 (not (image_available img9)))
  (at 513 (image_available img10))
  (at 521 (not (image_available img10)))
  (at 484 (image_available img11))
  (at 492 (not (image_available img11)))
  (at 690 (image_available img12))
  (at 698 (not (image_available img12)))
  (at 375 (image_available img13))
  (at 383 (not (image_available img13)))
  (at 567 (image_available img14))
  (at 575 (not (image_available img14)))
  (at 369 (image_available img15))
  (at 377 (not (image_available img15)))
  (at 668 (image_available img16))
  (at 676 (not (image_available img16)))
  (at 665 (image_available img17))
  (at 673 (not (image_available img17)))
  (at 427 (image_available img18))
  (at 435 (not (image_available img18)))
  (at 404 (image_available img19))
  (at 412 (not (image_available img19)))
  (at 477 (image_available img20))
  (at 485 (not (image_available img20)))
  (at 1011 (image_available img1))
  (at 1019 (not (image_available img1)))
  (at 1033 (image_available img2))
  (at 1041 (not (image_available img2)))
  (at 744 (image_available img3))
  (at 752 (not (image_available img3)))
  (at 1025 (image_available img4))
  (at 1033 (not (image_available img4)))
  (at 1005 (image_available img5))
  (at 1013 (not (image_available img5)))
  (at 863 (image_available img6))
  (at 871 (not (image_available img6)))
  (at 1032 (image_available img7))
  (at 1040 (not (image_available img7)))
  (at 943 (image_available img8))
  (at 951 (not (image_available img8)))
  (at 950 (image_available img9))
  (at 958 (not (image_available img9)))
  (at 873 (image_available img10))
  (at 881 (not (image_available img10)))
  (at 844 (image_available img11))
  (at 852 (not (image_available img11)))
  (at 1050 (image_available img12))
  (at 1058 (not (image_available img12)))
  (at 735 (image_available img13))
  (at 743 (not (image_available img13)))
  (at 927 (image_available img14))
  (at 935 (not (image_available img14)))
  (at 729 (image_available img15))
  (at 737 (not (image_available img15)))
  (at 1028 (image_available img16))
  (at 1036 (not (image_available img16)))
  (at 1025 (image_available img17))
  (at 1033 (not (image_available img17)))
  (at 787 (image_available img18))
  (at 795 (not (image_available img18)))
  (at 764 (image_available img19))
  (at 772 (not (image_available img19)))
  (at 837 (image_available img20))
  (at 845 (not (image_available img20)))
  (at 1371 (image_available img1))
  (at 1379 (not (image_available img1)))
  (at 1393 (image_available img2))
  (at 1401 (not (image_available img2)))
  (at 1104 (image_available img3))
  (at 1112 (not (image_available img3)))
  (at 1385 (image_available img4))
  (at 1393 (not (image_available img4)))
  (at 1365 (image_available img5))
  (at 1373 (not (image_available img5)))
  (at 1223 (image_available img6))
  (at 1231 (not (image_available img6)))
  (at 1392 (image_available img7))
  (at 1400 (not (image_available img7)))
  (at 1303 (image_available img8))
  (at 1311 (not (image_available img8)))
  (at 1310 (image_available img9))
  (at 1318 (not (image_available img9)))
  (at 1233 (image_available img10))
  (at 1241 (not (image_available img10)))
  (at 1204 (image_available img11))
  (at 1212 (not (image_available img11)))
  (at 1410 (image_available img12))
  (at 1418 (not (image_available img12)))
  (at 1095 (image_available img13))
  (at 1103 (not (image_available img13)))
  (at 1287 (image_available img14))
  (at 1295 (not (image_available img14)))
  (at 1089 (image_available img15))
  (at 1097 (not (image_available img15)))
  (at 1388 (image_available img16))
  (at 1396 (not (image_available img16)))
  (at 1385 (image_available img17))
  (at 1393 (not (image_available img17)))
  (at 1147 (image_available img18))
  (at 1155 (not (image_available img18)))
  (at 1124 (image_available img19))
  (at 1132 (not (image_available img19)))
  (at 1197 (image_available img20))
  (at 1205 (not (image_available img20)))
  (at 1731 (image_available img1))
  (at 1739 (not (image_available img1)))
  (at 1753 (image_available img2))
  (at 1761 (not (image_available img2)))
  (at 1464 (image_available img3))
  (at 1472 (not (image_available img3)))
  (at 1745 (image_available img4))
  (at 1753 (not (image_available img4)))
  (at 1725 (image_available img5))
  (at 1733 (not (image_available img5)))
  (at 1583 (image_available img6))
  (at 1591 (not (image_available img6)))
  (at 1752 (image_available img7))
  (at 1760 (not (image_available img7)))
  (at 1663 (image_available img8))
  (at 1671 (not (image_available img8)))
  (at 1670 (image_available img9))
  (at 1678 (not (image_available img9)))
  (at 1593 (image_available img10))
  (at 1601 (not (image_available img10)))
  (at 1564 (image_available img11))
  (at 1572 (not (image_available img11)))
  (at 1770 (image_available img12))
  (at 1778 (not (image_available img12)))
  (at 1455 (image_available img13))
  (at 1463 (not (image_available img13)))
  (at 1647 (image_available img14))
  (at 1655 (not (image_available img14)))
  (at 1449 (image_available img15))
  (at 1457 (not (image_available img15)))
  (at 1748 (image_available img16))
  (at 1756 (not (image_available img16)))
  (at 1745 (image_available img17))
  (at 1753 (not (image_available img17)))
  (at 1507 (image_available img18))
  (at 1515 (not (image_available img18)))
  (at 1484 (image_available img19))
  (at 1492 (not (image_available img19)))
  (at 1557 (image_available img20))
  (at 1565 (not (image_available img20)))
  (at 2091 (image_available img1))
  (at 2099 (not (image_available img1)))
  (at 2113 (image_available img2))
  (at 2121 (not (image_available img2)))
  (at 1824 (image_available img3))
  (at 1832 (not (image_available img3)))
  (at 2105 (image_available img4))
  (at 2113 (not (image_available img4)))
  (at 2085 (image_available img5))
  (at 2093 (not (image_available img5)))
  (at 1943 (image_available img6))
  (at 1951 (not (image_available img6)))
  (at 2112 (image_available img7))
  (at 2120 (not (image_available img7)))
  (at 2023 (image_available img8))
  (at 2031 (not (image_available img8)))
  (at 2030 (image_available img9))
  (at 2038 (not (image_available img9)))
  (at 1953 (image_available img10))
  (at 1961 (not (image_available img10)))
  (at 1924 (image_available img11))
  (at 1932 (not (image_available img11)))
  (at 2130 (image_available img12))
  (at 2138 (not (image_available img12)))
  (at 1815 (image_available img13))
  (at 1823 (not (image_available img13)))
  (at 2007 (image_available img14))
  (at 2015 (not (image_available img14)))
  (at 1809 (image_available img15))
  (at 1817 (not (image_available img15)))
  (at 2108 (image_available img16))
  (at 2116 (not (image_available img16)))
  (at 2105 (image_available img17))
  (at 2113 (not (image_available img17)))
  (at 1867 (image_available img18))
  (at 1875 (not (image_available img18)))
  (at 1844 (image_available img19))
  (at 1852 (not (image_available img19)))
  (at 1917 (image_available img20))
  (at 1925 (not (image_available img20)))
  (at 2451 (image_available img1))
  (at 2459 (not (image_available img1)))
  (at 2473 (image_available img2))
  (at 2481 (not (image_available img2)))
  (at 2184 (image_available img3))
  (at 2192 (not (image_available img3)))
  (at 2465 (image_available img4))
  (at 2473 (not (image_available img4)))
  (at 2445 (image_available img5))
  (at 2453 (not (image_available img5)))
  (at 2303 (image_available img6))
  (at 2311 (not (image_available img6)))
  (at 2472 (image_available img7))
  (at 2480 (not (image_available img7)))
  (at 2383 (image_available img8))
  (at 2391 (not (image_available img8)))
  (at 2390 (image_available img9))
  (at 2398 (not (image_available img9)))
  (at 2313 (image_available img10))
  (at 2321 (not (image_available img10)))
  (at 2284 (image_available img11))
  (at 2292 (not (image_available img11)))
  (at 2490 (image_available img12))
  (at 2498 (not (image_available img12)))
  (at 2175 (image_available img13))
  (at 2183 (not (image_available img13)))
  (at 2367 (image_available img14))
  (at 2375 (not (image_available img14)))
  (at 2169 (image_available img15))
  (at 2177 (not (image_available img15)))
  (at 2468 (image_available img16))
  (at 2476 (not (image_available img16)))
  (at 2465 (image_available img17))
  (at 2473 (not (image_available img17)))
  (at 2227 (image_available img18))
  (at 2235 (not (image_available img18)))
  (at 2204 (image_available img19))
  (at 2212 (not (image_available img19)))
  (at 2277 (image_available img20))
  (at 2285 (not (image_available img20)))
  (at 2811 (image_available img1))
  (at 2819 (not (image_available img1)))
  (at 2833 (image_available img2))
  (at 2841 (not (image_available img2)))
  (at 2544 (image_available img3))
  (at 2552 (not (image_available img3)))
  (at 2825 (image_available img4))
  (at 2833 (not (image_available img4)))
  (at 2805 (image_available img5))
  (at 2813 (not (image_available img5)))
  (at 2663 (image_available img6))
  (at 2671 (not (image_available img6)))
  (at 2832 (image_available img7))
  (at 2840 (not (image_available img7)))
  (at 2743 (image_available img8))
  (at 2751 (not (image_available img8)))
  (at 2750 (image_available img9))
  (at 2758 (not (image_available img9)))
  (at 2673 (image_available img10))
  (at 2681 (not (image_available img10)))
  (at 2644 (image_available img11))
  (at 2652 (not (image_available img11)))
  (at 2850 (image_available img12))
  (at 2858 (not (image_available img12)))
  (at 2535 (image_available img13))
  (at 2543 (not (image_available img13)))
  (at 2727 (image_available img14))
  (at 2735 (not (image_available img14)))
  (at 2529 (image_available img15))
  (at 2537 (not (image_available img15)))
  (at 2828 (image_available img16))
  (at 2836 (not (image_available img16)))
  (at 2825 (image_available img17))
  (at 2833 (not (image_available img17)))
  (at 2587 (image_available img18))
  (at 2595 (not (image_available img18)))
  (at 2564 (image_available img19))
  (at 2572 (not (image_available img19)))
  (at 2637 (image_available img20))
  (at 2645 (not (image_available img20)))
  (at 3171 (image_available img1))
  (at 3179 (not (image_available img1)))
  (at 3193 (image_available img2))
  (at 3201 (not (image_available img2)))
  (at 2904 (image_available img3))
  (at 2912 (not (image_available img3)))
  (at 3185 (image_available img4))
  (at 3193 (not (image_available img4)))
  (at 3165 (image_available img5))
  (at 3173 (not (image_available img5)))
  (at 3023 (image_available img6))
  (at 3031 (not (image_available img6)))
  (at 3192 (image_available img7))
  (at 3200 (not (image_available img7)))
  (at 3103 (image_available img8))
  (at 3111 (not (image_available img8)))
  (at 3110 (image_available img9))
  (at 3118 (not (image_available img9)))
  (at 3033 (image_available img10))
  (at 3041 (not (image_available img10)))
  (at 3004 (image_available img11))
  (at 3012 (not (image_available img11)))
  (at 3210 (image_available img12))
  (at 3218 (not (image_available img12)))
  (at 2895 (image_available img13))
  (at 2903 (not (image_available img13)))
  (at 3087 (image_available img14))
  (at 3095 (not (image_available img14)))
  (at 2889 (image_available img15))
  (at 2897 (not (image_available img15)))
  (at 3188 (image_available img16))
  (at 3196 (not (image_available img16)))
  (at 3185 (image_available img17))
  (at 3193 (not (image_available img17)))
  (at 2947 (image_available img18))
  (at 2955 (not (image_available img18)))
  (at 2924 (image_available img19))
  (at 2932 (not (image_available img19)))
  (at 2997 (image_available img20))
  (at 3005 (not (image_available img20)))
  (at 3531 (image_available img1))
  (at 3539 (not (image_available img1)))
  (at 3553 (image_available img2))
  (at 3561 (not (image_available img2)))
  (at 3264 (image_available img3))
  (at 3272 (not (image_available img3)))
  (at 3545 (image_available img4))
  (at 3553 (not (image_available img4)))
  (at 3525 (image_available img5))
  (at 3533 (not (image_available img5)))
  (at 3383 (image_available img6))
  (at 3391 (not (image_available img6)))
  (at 3552 (image_available img7))
  (at 3560 (not (image_available img7)))
  (at 3463 (image_available img8))
  (at 3471 (not (image_available img8)))
  (at 3470 (image_available img9))
  (at 3478 (not (image_available img9)))
  (at 3393 (image_available img10))
  (at 3401 (not (image_available img10)))
  (at 3364 (image_available img11))
  (at 3372 (not (image_available img11)))
  (at 3570 (image_available img12))
  (at 3578 (not (image_available img12)))
  (at 3255 (image_available img13))
  (at 3263 (not (image_available img13)))
  (at 3447 (image_available img14))
  (at 3455 (not (image_available img14)))
  (at 3249 (image_available img15))
  (at 3257 (not (image_available img15)))
  (at 3548 (image_available img16))
  (at 3556 (not (image_available img16)))
  (at 3545 (image_available img17))
  (at 3553 (not (image_available img17)))
  (at 3307 (image_available img18))
  (at 3315 (not (image_available img18)))
  (at 3284 (image_available img19))
  (at 3292 (not (image_available img19)))
  (at 3357 (image_available img20))
  (at 3365 (not (image_available img20)))
  (at 3891 (image_available img1))
  (at 3899 (not (image_available img1)))
  (at 3913 (image_available img2))
  (at 3921 (not (image_available img2)))
  (at 3624 (image_available img3))
  (at 3632 (not (image_available img3)))
  (at 3905 (image_available img4))
  (at 3913 (not (image_available img4)))
  (at 3885 (image_available img5))
  (at 3893 (not (image_available img5)))
  (at 3743 (image_available img6))
  (at 3751 (not (image_available img6)))
  (at 3912 (image_available img7))
  (at 3920 (not (image_available img7)))
  (at 3823 (image_available img8))
  (at 3831 (not (image_available img8)))
  (at 3830 (image_available img9))
  (at 3838 (not (image_available img9)))
  (at 3753 (image_available img10))
  (at 3761 (not (image_available img10)))
  (at 3724 (image_available img11))
  (at 3732 (not (image_available img11)))
  (at 3930 (image_available img12))
  (at 3938 (not (image_available img12)))
  (at 3615 (image_available img13))
  (at 3623 (not (image_available img13)))
  (at 3807 (image_available img14))
  (at 3815 (not (image_available img14)))
  (at 3609 (image_available img15))
  (at 3617 (not (image_available img15)))
  (at 3908 (image_available img16))
  (at 3916 (not (image_available img16)))
  (at 3905 (image_available img17))
  (at 3913 (not (image_available img17)))
  (at 3667 (image_available img18))
  (at 3675 (not (image_available img18)))
  (at 3644 (image_available img19))
  (at 3652 (not (image_available img19)))
  (at 3717 (image_available img20))
  (at 3725 (not (image_available img20)))
  (at 4251 (image_available img1))
  (at 4259 (not (image_available img1)))
  (at 4273 (image_available img2))
  (at 4281 (not (image_available img2)))
  (at 3984 (image_available img3))
  (at 3992 (not (image_available img3)))
  (at 4265 (image_available img4))
  (at 4273 (not (image_available img4)))
  (at 4245 (image_available img5))
  (at 4253 (not (image_available img5)))
  (at 4103 (image_available img6))
  (at 4111 (not (image_available img6)))
  (at 4272 (image_available img7))
  (at 4280 (not (image_available img7)))
  (at 4183 (image_available img8))
  (at 4191 (not (image_available img8)))
  (at 4190 (image_available img9))
  (at 4198 (not (image_available img9)))
  (at 4113 (image_available img10))
  (at 4121 (not (image_available img10)))
  (at 4084 (image_available img11))
  (at 4092 (not (image_available img11)))
  (at 4290 (image_available img12))
  (at 4298 (not (image_available img12)))
  (at 3975 (image_available img13))
  (at 3983 (not (image_available img13)))
  (at 4167 (image_available img14))
  (at 4175 (not (image_available img14)))
  (at 3969 (image_available img15))
  (at 3977 (not (image_available img15)))
  (at 4268 (image_available img16))
  (at 4276 (not (image_available img16)))
  (at 4265 (image_available img17))
  (at 4273 (not (image_available img17)))
  (at 4027 (image_available img18))
  (at 4035 (not (image_available img18)))
  (at 4004 (image_available img19))
  (at 4012 (not (image_available img19)))
  (at 4077 (image_available img20))
  (at 4085 (not (image_available img20)))
  (at 4611 (image_available img1))
  (at 4619 (not (image_available img1)))
  (at 4633 (image_available img2))
  (at 4641 (not (image_available img2)))
  (at 4344 (image_available img3))
  (at 4352 (not (image_available img3)))
  (at 4625 (image_available img4))
  (at 4633 (not (image_available img4)))
  (at 4605 (image_available img5))
  (at 4613 (not (image_available img5)))
  (at 4463 (image_available img6))
  (at 4471 (not (image_available img6)))
  (at 4632 (image_available img7))
  (at 4640 (not (image_available img7)))
  (at 4543 (image_available img8))
  (at 4551 (not (image_available img8)))
  (at 4550 (image_available img9))
  (at 4558 (not (image_available img9)))
  (at 4473 (image_available img10))
  (at 4481 (not (image_available img10)))
  (at 4444 (image_available img11))
  (at 4452 (not (image_available img11)))
  (at 4650 (image_available img12))
  (at 4658 (not (image_available img12)))
  (at 4335 (image_available img13))
  (at 4343 (not (image_available img13)))
  (at 4527 (image_available img14))
  (at 4535 (not (image_available img14)))
  (at 4329 (image_available img15))
  (at 4337 (not (image_available img15)))
  (at 4628 (image_available img16))
  (at 4636 (not (image_available img16)))
  (at 4625 (image_available img17))
  (at 4633 (not (image_available img17)))
  (at 4387 (image_available img18))
  (at 4395 (not (image_available img18)))
  (at 4364 (image_available img19))
  (at 4372 (not (image_available img19)))
  (at 4437 (image_available img20))
  (at 4445 (not (image_available img20)))
  (at 4971 (image_available img1))
  (at 4979 (not (image_available img1)))
  (at 4993 (image_available img2))
  (at 5001 (not (image_available img2)))
  (at 4704 (image_available img3))
  (at 4712 (not (image_available img3)))
  (at 4985 (image_available img4))
  (at 4993 (not (image_available img4)))
  (at 4965 (image_available img5))
  (at 4973 (not (image_available img5)))
  (at 4823 (image_available img6))
  (at 4831 (not (image_available img6)))
  (at 4992 (image_available img7))
  (at 5000 (not (image_available img7)))
  (at 4903 (image_available img8))
  (at 4911 (not (image_available img8)))
  (at 4910 (image_available img9))
  (at 4918 (not (image_available img9)))
  (at 4833 (image_available img10))
  (at 4841 (not (image_available img10)))
  (at 4804 (image_available img11))
  (at 4812 (not (image_available img11)))
  (at 5010 (image_available img12))
  (at 5018 (not (image_available img12)))
  (at 4695 (image_available img13))
  (at 4703 (not (image_available img13)))
  (at 4887 (image_available img14))
  (at 4895 (not (image_available img14)))
  (at 4689 (image_available img15))
  (at 4697 (not (image_available img15)))
  (at 4988 (image_available img16))
  (at 4996 (not (image_available img16)))
  (at 4985 (image_available img17))
  (at 4993 (not (image_available img17)))
  (at 4747 (image_available img18))
  (at 4755 (not (image_available img18)))
  (at 4724 (image_available img19))
  (at 4732 (not (image_available img19)))
  (at 4797 (image_available img20))
  (at 4805 (not (image_available img20)))
  (at 5331 (image_available img1))
  (at 5339 (not (image_available img1)))
  (at 5353 (image_available img2))
  (at 5361 (not (image_available img2)))
  (at 5064 (image_available img3))
  (at 5072 (not (image_available img3)))
  (at 5345 (image_available img4))
  (at 5353 (not (image_available img4)))
  (at 5325 (image_available img5))
  (at 5333 (not (image_available img5)))
  (at 5183 (image_available img6))
  (at 5191 (not (image_available img6)))
  (at 5352 (image_available img7))
  (at 5360 (not (image_available img7)))
  (at 5263 (image_available img8))
  (at 5271 (not (image_available img8)))
  (at 5270 (image_available img9))
  (at 5278 (not (image_available img9)))
  (at 5193 (image_available img10))
  (at 5201 (not (image_available img10)))
  (at 5164 (image_available img11))
  (at 5172 (not (image_available img11)))
  (at 5370 (image_available img12))
  (at 5378 (not (image_available img12)))
  (at 5055 (image_available img13))
  (at 5063 (not (image_available img13)))
  (at 5247 (image_available img14))
  (at 5255 (not (image_available img14)))
  (at 5049 (image_available img15))
  (at 5057 (not (image_available img15)))
  (at 5348 (image_available img16))
  (at 5356 (not (image_available img16)))
  (at 5345 (image_available img17))
  (at 5353 (not (image_available img17)))
  (at 5107 (image_available img18))
  (at 5115 (not (image_available img18)))
  (at 5084 (image_available img19))
  (at 5092 (not (image_available img19)))
  (at 5157 (image_available img20))
  (at 5165 (not (image_available img20)))
  (at 5691 (image_available img1))
  (at 5699 (not (image_available img1)))
  (at 5713 (image_available img2))
  (at 5721 (not (image_available img2)))
  (at 5424 (image_available img3))
  (at 5432 (not (image_available img3)))
  (at 5705 (image_available img4))
  (at 5713 (not (image_available img4)))
  (at 5685 (image_available img5))
  (at 5693 (not (image_available img5)))
  (at 5543 (image_available img6))
  (at 5551 (not (image_available img6)))
  (at 5712 (image_available img7))
  (at 5720 (not (image_available img7)))
  (at 5623 (image_available img8))
  (at 5631 (not (image_available img8)))
  (at 5630 (image_available img9))
  (at 5638 (not (image_available img9)))
  (at 5553 (image_available img10))
  (at 5561 (not (image_available img10)))
  (at 5524 (image_available img11))
  (at 5532 (not (image_available img11)))
  (at 5730 (image_available img12))
  (at 5738 (not (image_available img12)))
  (at 5415 (image_available img13))
  (at 5423 (not (image_available img13)))
  (at 5607 (image_available img14))
  (at 5615 (not (image_available img14)))
  (at 5409 (image_available img15))
  (at 5417 (not (image_available img15)))
  (at 5708 (image_available img16))
  (at 5716 (not (image_available img16)))
  (at 5705 (image_available img17))
  (at 5713 (not (image_available img17)))
  (at 5467 (image_available img18))
  (at 5475 (not (image_available img18)))
  (at 5444 (image_available img19))
  (at 5452 (not (image_available img19)))
  (at 5517 (image_available img20))
  (at 5525 (not (image_available img20)))
  (at 6051 (image_available img1))
  (at 6059 (not (image_available img1)))
  (at 6073 (image_available img2))
  (at 6081 (not (image_available img2)))
  (at 5784 (image_available img3))
  (at 5792 (not (image_available img3)))
  (at 6065 (image_available img4))
  (at 6073 (not (image_available img4)))
  (at 6045 (image_available img5))
  (at 6053 (not (image_available img5)))
  (at 5903 (image_available img6))
  (at 5911 (not (image_available img6)))
  (at 6072 (image_available img7))
  (at 6080 (not (image_available img7)))
  (at 5983 (image_available img8))
  (at 5991 (not (image_available img8)))
  (at 5990 (image_available img9))
  (at 5998 (not (image_available img9)))
  (at 5913 (image_available img10))
  (at 5921 (not (image_available img10)))
  (at 5884 (image_available img11))
  (at 5892 (not (image_available img11)))
  (at 6090 (image_available img12))
  (at 6098 (not (image_available img12)))
  (at 5775 (image_available img13))
  (at 5783 (not (image_available img13)))
  (at 5967 (image_available img14))
  (at 5975 (not (image_available img14)))
  (at 5769 (image_available img15))
  (at 5777 (not (image_available img15)))
  (at 6068 (image_available img16))
  (at 6076 (not (image_available img16)))
  (at 6065 (image_available img17))
  (at 6073 (not (image_available img17)))
  (at 5827 (image_available img18))
  (at 5835 (not (image_available img18)))
  (at 5804 (image_available img19))
  (at 5812 (not (image_available img19)))
  (at 5877 (image_available img20))
  (at 5885 (not (image_available img20)))
  (at 6411 (image_available img1))
  (at 6419 (not (image_available img1)))
  (at 6433 (image_available img2))
  (at 6441 (not (image_available img2)))
  (at 6144 (image_available img3))
  (at 6152 (not (image_available img3)))
  (at 6425 (image_available img4))
  (at 6433 (not (image_available img4)))
  (at 6405 (image_available img5))
  (at 6413 (not (image_available img5)))
  (at 6263 (image_available img6))
  (at 6271 (not (image_available img6)))
  (at 6432 (image_available img7))
  (at 6440 (not (image_available img7)))
  (at 6343 (image_available img8))
  (at 6351 (not (image_available img8)))
  (at 6350 (image_available img9))
  (at 6358 (not (image_available img9)))
  (at 6273 (image_available img10))
  (at 6281 (not (image_available img10)))
  (at 6244 (image_available img11))
  (at 6252 (not (image_available img11)))
  (at 6450 (image_available img12))
  (at 6458 (not (image_available img12)))
  (at 6135 (image_available img13))
  (at 6143 (not (image_available img13)))
  (at 6327 (image_available img14))
  (at 6335 (not (image_available img14)))
  (at 6129 (image_available img15))
  (at 6137 (not (image_available img15)))
  (at 6428 (image_available img16))
  (at 6436 (not (image_available img16)))
  (at 6425 (image_available img17))
  (at 6433 (not (image_available img17)))
  (at 6187 (image_available img18))
  (at 6195 (not (image_available img18)))
  (at 6164 (image_available img19))
  (at 6172 (not (image_available img19)))
  (at 6237 (image_available img20))
  (at 6245 (not (image_available img20)))
  (at 6771 (image_available img1))
  (at 6779 (not (image_available img1)))
  (at 6793 (image_available img2))
  (at 6801 (not (image_available img2)))
  (at 6504 (image_available img3))
  (at 6512 (not (image_available img3)))
  (at 6785 (image_available img4))
  (at 6793 (not (image_available img4)))
  (at 6765 (image_available img5))
  (at 6773 (not (image_available img5)))
  (at 6623 (image_available img6))
  (at 6631 (not (image_available img6)))
  (at 6792 (image_available img7))
  (at 6800 (not (image_available img7)))
  (at 6703 (image_available img8))
  (at 6711 (not (image_available img8)))
  (at 6710 (image_available img9))
  (at 6718 (not (image_available img9)))
  (at 6633 (image_available img10))
  (at 6641 (not (image_available img10)))
  (at 6604 (image_available img11))
  (at 6612 (not (image_available img11)))
  (at 6810 (image_available img12))
  (at 6818 (not (image_available img12)))
  (at 6495 (image_available img13))
  (at 6503 (not (image_available img13)))
  (at 6687 (image_available img14))
  (at 6695 (not (image_available img14)))
  (at 6489 (image_available img15))
  (at 6497 (not (image_available img15)))
  (at 6788 (image_available img16))
  (at 6796 (not (image_available img16)))
  (at 6785 (image_available img17))
  (at 6793 (not (image_available img17)))
  (at 6547 (image_available img18))
  (at 6555 (not (image_available img18)))
  (at 6524 (image_available img19))
  (at 6532 (not (image_available img19)))
  (at 6597 (image_available img20))
  (at 6605 (not (image_available img20)))
  (at 7131 (image_available img1))
  (at 7139 (not (image_available img1)))
  (at 7153 (image_available img2))
  (at 7161 (not (image_available img2)))
  (at 6864 (image_available img3))
  (at 6872 (not (image_available img3)))
  (at 7145 (image_available img4))
  (at 7153 (not (image_available img4)))
  (at 7125 (image_available img5))
  (at 7133 (not (image_available img5)))
  (at 6983 (image_available img6))
  (at 6991 (not (image_available img6)))
  (at 7152 (image_available img7))
  (at 7160 (not (image_available img7)))
  (at 7063 (image_available img8))
  (at 7071 (not (image_available img8)))
  (at 7070 (image_available img9))
  (at 7078 (not (image_available img9)))
  (at 6993 (image_available img10))
  (at 7001 (not (image_available img10)))
  (at 6964 (image_available img11))
  (at 6972 (not (image_available img11)))
  (at 7170 (image_available img12))
  (at 7178 (not (image_available img12)))
  (at 6855 (image_available img13))
  (at 6863 (not (image_available img13)))
  (at 7047 (image_available img14))
  (at 7055 (not (image_available img14)))
  (at 6849 (image_available img15))
  (at 6857 (not (image_available img15)))
  (at 7148 (image_available img16))
  (at 7156 (not (image_available img16)))
  (at 7145 (image_available img17))
  (at 7153 (not (image_available img17)))
  (at 6907 (image_available img18))
  (at 6915 (not (image_available img18)))
  (at 6884 (image_available img19))
  (at 6892 (not (image_available img19)))
  (at 6957 (image_available img20))
  (at 6965 (not (image_available img20)))
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
  (<= (image_score img1) 20)

  (> (image_score img2) 0)
  (<= (image_score img2) 11)

  (> (image_score img3) 0)
  (<= (image_score img3) 16)

  (> (image_score img4) 0)
  (<= (image_score img4) 4)

  (> (image_score img5) 0)
  (<= (image_score img5) 5)

  (> (image_score img6) 0)
  (<= (image_score img6) 20)

  (> (image_score img7) 0)
  (<= (image_score img7) 20)

  (> (image_score img8) 0)
  (<= (image_score img8) 15)

  (> (image_score img9) 0)
  (<= (image_score img9) 17)

  (> (image_score img10) 0)
  (<= (image_score img10) 8)

  (> (image_score img11) 0)
  (<= (image_score img11) 18)

  (> (image_score img12) 0)
  (<= (image_score img12) 11)

  (> (image_score img13) 0)
  (<= (image_score img13) 19)

  (> (image_score img14) 0)
  (<= (image_score img14) 1)

  (> (image_score img15) 0)
  (<= (image_score img15) 14)

  (> (image_score img16) 0)
  (<= (image_score img16) 5)

  (> (image_score img17) 0)
  (<= (image_score img17) 14)

  (> (image_score img18) 0)
  (<= (image_score img18) 7)

  (> (image_score img19) 0)
  (<= (image_score img19) 20)

  (> (image_score img20) 0)
  (<= (image_score img20) 17)

(>= (total_score) 53)
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
                    (+ (image_score img10)
                      (+ (image_score img11)
                        (+ (image_score img12)
                          (+ (image_score img13)
                            (+ (image_score img14)
                              (+ (image_score img15)
                                (+ (image_score img16)
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
)
)
