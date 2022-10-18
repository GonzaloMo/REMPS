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
  (memory_free mem1)
  (memory_free mem2)
  (memory_free mem3)
  (memory_free mem4)
  (memory_free mem5)
  (memory_free mem6)
  (memory_free mem7)
  (memory_free mem8)
  (memory_free mem9)



  (at 47 (image_available img1))
  (at 55 (not (image_available img1)))
  (at 45 (image_available img2))
  (at 53 (not (image_available img2)))
  (at 186 (image_available img3))
  (at 194 (not (image_available img3)))
  (at 244 (image_available img4))
  (at 252 (not (image_available img4)))
  (at 347 (image_available img5))
  (at 355 (not (image_available img5)))
  (at 348 (image_available img6))
  (at 356 (not (image_available img6)))
  (at 194 (image_available img7))
  (at 202 (not (image_available img7)))
  (at 191 (image_available img8))
  (at 199 (not (image_available img8)))
  (at 124 (image_available img9))
  (at 132 (not (image_available img9)))
  (at 348 (image_available img10))
  (at 356 (not (image_available img10)))
  (at 109 (image_available img11))
  (at 117 (not (image_available img11)))
  (at 233 (image_available img12))
  (at 241 (not (image_available img12)))
  (at 300 (image_available img13))
  (at 308 (not (image_available img13)))
  (at 278 (image_available img14))
  (at 286 (not (image_available img14)))
  (at 129 (image_available img15))
  (at 137 (not (image_available img15)))
  (at 407 (image_available img1))
  (at 415 (not (image_available img1)))
  (at 405 (image_available img2))
  (at 413 (not (image_available img2)))
  (at 546 (image_available img3))
  (at 554 (not (image_available img3)))
  (at 604 (image_available img4))
  (at 612 (not (image_available img4)))
  (at 707 (image_available img5))
  (at 715 (not (image_available img5)))
  (at 708 (image_available img6))
  (at 716 (not (image_available img6)))
  (at 554 (image_available img7))
  (at 562 (not (image_available img7)))
  (at 551 (image_available img8))
  (at 559 (not (image_available img8)))
  (at 484 (image_available img9))
  (at 492 (not (image_available img9)))
  (at 708 (image_available img10))
  (at 716 (not (image_available img10)))
  (at 469 (image_available img11))
  (at 477 (not (image_available img11)))
  (at 593 (image_available img12))
  (at 601 (not (image_available img12)))
  (at 660 (image_available img13))
  (at 668 (not (image_available img13)))
  (at 638 (image_available img14))
  (at 646 (not (image_available img14)))
  (at 489 (image_available img15))
  (at 497 (not (image_available img15)))
  (at 767 (image_available img1))
  (at 775 (not (image_available img1)))
  (at 765 (image_available img2))
  (at 773 (not (image_available img2)))
  (at 906 (image_available img3))
  (at 914 (not (image_available img3)))
  (at 964 (image_available img4))
  (at 972 (not (image_available img4)))
  (at 1067 (image_available img5))
  (at 1075 (not (image_available img5)))
  (at 1068 (image_available img6))
  (at 1076 (not (image_available img6)))
  (at 914 (image_available img7))
  (at 922 (not (image_available img7)))
  (at 911 (image_available img8))
  (at 919 (not (image_available img8)))
  (at 844 (image_available img9))
  (at 852 (not (image_available img9)))
  (at 1068 (image_available img10))
  (at 1076 (not (image_available img10)))
  (at 829 (image_available img11))
  (at 837 (not (image_available img11)))
  (at 953 (image_available img12))
  (at 961 (not (image_available img12)))
  (at 1020 (image_available img13))
  (at 1028 (not (image_available img13)))
  (at 998 (image_available img14))
  (at 1006 (not (image_available img14)))
  (at 849 (image_available img15))
  (at 857 (not (image_available img15)))
  (at 1127 (image_available img1))
  (at 1135 (not (image_available img1)))
  (at 1125 (image_available img2))
  (at 1133 (not (image_available img2)))
  (at 1266 (image_available img3))
  (at 1274 (not (image_available img3)))
  (at 1324 (image_available img4))
  (at 1332 (not (image_available img4)))
  (at 1427 (image_available img5))
  (at 1435 (not (image_available img5)))
  (at 1428 (image_available img6))
  (at 1436 (not (image_available img6)))
  (at 1274 (image_available img7))
  (at 1282 (not (image_available img7)))
  (at 1271 (image_available img8))
  (at 1279 (not (image_available img8)))
  (at 1204 (image_available img9))
  (at 1212 (not (image_available img9)))
  (at 1428 (image_available img10))
  (at 1436 (not (image_available img10)))
  (at 1189 (image_available img11))
  (at 1197 (not (image_available img11)))
  (at 1313 (image_available img12))
  (at 1321 (not (image_available img12)))
  (at 1380 (image_available img13))
  (at 1388 (not (image_available img13)))
  (at 1358 (image_available img14))
  (at 1366 (not (image_available img14)))
  (at 1209 (image_available img15))
  (at 1217 (not (image_available img15)))
  (at 1487 (image_available img1))
  (at 1495 (not (image_available img1)))
  (at 1485 (image_available img2))
  (at 1493 (not (image_available img2)))
  (at 1626 (image_available img3))
  (at 1634 (not (image_available img3)))
  (at 1684 (image_available img4))
  (at 1692 (not (image_available img4)))
  (at 1787 (image_available img5))
  (at 1795 (not (image_available img5)))
  (at 1788 (image_available img6))
  (at 1796 (not (image_available img6)))
  (at 1634 (image_available img7))
  (at 1642 (not (image_available img7)))
  (at 1631 (image_available img8))
  (at 1639 (not (image_available img8)))
  (at 1564 (image_available img9))
  (at 1572 (not (image_available img9)))
  (at 1788 (image_available img10))
  (at 1796 (not (image_available img10)))
  (at 1549 (image_available img11))
  (at 1557 (not (image_available img11)))
  (at 1673 (image_available img12))
  (at 1681 (not (image_available img12)))
  (at 1740 (image_available img13))
  (at 1748 (not (image_available img13)))
  (at 1718 (image_available img14))
  (at 1726 (not (image_available img14)))
  (at 1569 (image_available img15))
  (at 1577 (not (image_available img15)))
  (at 1847 (image_available img1))
  (at 1855 (not (image_available img1)))
  (at 1845 (image_available img2))
  (at 1853 (not (image_available img2)))
  (at 1986 (image_available img3))
  (at 1994 (not (image_available img3)))
  (at 2044 (image_available img4))
  (at 2052 (not (image_available img4)))
  (at 2147 (image_available img5))
  (at 2155 (not (image_available img5)))
  (at 2148 (image_available img6))
  (at 2156 (not (image_available img6)))
  (at 1994 (image_available img7))
  (at 2002 (not (image_available img7)))
  (at 1991 (image_available img8))
  (at 1999 (not (image_available img8)))
  (at 1924 (image_available img9))
  (at 1932 (not (image_available img9)))
  (at 2148 (image_available img10))
  (at 2156 (not (image_available img10)))
  (at 1909 (image_available img11))
  (at 1917 (not (image_available img11)))
  (at 2033 (image_available img12))
  (at 2041 (not (image_available img12)))
  (at 2100 (image_available img13))
  (at 2108 (not (image_available img13)))
  (at 2078 (image_available img14))
  (at 2086 (not (image_available img14)))
  (at 1929 (image_available img15))
  (at 1937 (not (image_available img15)))
  (at 2207 (image_available img1))
  (at 2215 (not (image_available img1)))
  (at 2205 (image_available img2))
  (at 2213 (not (image_available img2)))
  (at 2346 (image_available img3))
  (at 2354 (not (image_available img3)))
  (at 2404 (image_available img4))
  (at 2412 (not (image_available img4)))
  (at 2507 (image_available img5))
  (at 2515 (not (image_available img5)))
  (at 2508 (image_available img6))
  (at 2516 (not (image_available img6)))
  (at 2354 (image_available img7))
  (at 2362 (not (image_available img7)))
  (at 2351 (image_available img8))
  (at 2359 (not (image_available img8)))
  (at 2284 (image_available img9))
  (at 2292 (not (image_available img9)))
  (at 2508 (image_available img10))
  (at 2516 (not (image_available img10)))
  (at 2269 (image_available img11))
  (at 2277 (not (image_available img11)))
  (at 2393 (image_available img12))
  (at 2401 (not (image_available img12)))
  (at 2460 (image_available img13))
  (at 2468 (not (image_available img13)))
  (at 2438 (image_available img14))
  (at 2446 (not (image_available img14)))
  (at 2289 (image_available img15))
  (at 2297 (not (image_available img15)))
  (at 2567 (image_available img1))
  (at 2575 (not (image_available img1)))
  (at 2565 (image_available img2))
  (at 2573 (not (image_available img2)))
  (at 2706 (image_available img3))
  (at 2714 (not (image_available img3)))
  (at 2764 (image_available img4))
  (at 2772 (not (image_available img4)))
  (at 2867 (image_available img5))
  (at 2875 (not (image_available img5)))
  (at 2868 (image_available img6))
  (at 2876 (not (image_available img6)))
  (at 2714 (image_available img7))
  (at 2722 (not (image_available img7)))
  (at 2711 (image_available img8))
  (at 2719 (not (image_available img8)))
  (at 2644 (image_available img9))
  (at 2652 (not (image_available img9)))
  (at 2868 (image_available img10))
  (at 2876 (not (image_available img10)))
  (at 2629 (image_available img11))
  (at 2637 (not (image_available img11)))
  (at 2753 (image_available img12))
  (at 2761 (not (image_available img12)))
  (at 2820 (image_available img13))
  (at 2828 (not (image_available img13)))
  (at 2798 (image_available img14))
  (at 2806 (not (image_available img14)))
  (at 2649 (image_available img15))
  (at 2657 (not (image_available img15)))
  (at 2927 (image_available img1))
  (at 2935 (not (image_available img1)))
  (at 2925 (image_available img2))
  (at 2933 (not (image_available img2)))
  (at 3066 (image_available img3))
  (at 3074 (not (image_available img3)))
  (at 3124 (image_available img4))
  (at 3132 (not (image_available img4)))
  (at 3227 (image_available img5))
  (at 3235 (not (image_available img5)))
  (at 3228 (image_available img6))
  (at 3236 (not (image_available img6)))
  (at 3074 (image_available img7))
  (at 3082 (not (image_available img7)))
  (at 3071 (image_available img8))
  (at 3079 (not (image_available img8)))
  (at 3004 (image_available img9))
  (at 3012 (not (image_available img9)))
  (at 3228 (image_available img10))
  (at 3236 (not (image_available img10)))
  (at 2989 (image_available img11))
  (at 2997 (not (image_available img11)))
  (at 3113 (image_available img12))
  (at 3121 (not (image_available img12)))
  (at 3180 (image_available img13))
  (at 3188 (not (image_available img13)))
  (at 3158 (image_available img14))
  (at 3166 (not (image_available img14)))
  (at 3009 (image_available img15))
  (at 3017 (not (image_available img15)))
  (at 3287 (image_available img1))
  (at 3295 (not (image_available img1)))
  (at 3285 (image_available img2))
  (at 3293 (not (image_available img2)))
  (at 3426 (image_available img3))
  (at 3434 (not (image_available img3)))
  (at 3484 (image_available img4))
  (at 3492 (not (image_available img4)))
  (at 3587 (image_available img5))
  (at 3595 (not (image_available img5)))
  (at 3588 (image_available img6))
  (at 3596 (not (image_available img6)))
  (at 3434 (image_available img7))
  (at 3442 (not (image_available img7)))
  (at 3431 (image_available img8))
  (at 3439 (not (image_available img8)))
  (at 3364 (image_available img9))
  (at 3372 (not (image_available img9)))
  (at 3588 (image_available img10))
  (at 3596 (not (image_available img10)))
  (at 3349 (image_available img11))
  (at 3357 (not (image_available img11)))
  (at 3473 (image_available img12))
  (at 3481 (not (image_available img12)))
  (at 3540 (image_available img13))
  (at 3548 (not (image_available img13)))
  (at 3518 (image_available img14))
  (at 3526 (not (image_available img14)))
  (at 3369 (image_available img15))
  (at 3377 (not (image_available img15)))
  (at 3647 (image_available img1))
  (at 3655 (not (image_available img1)))
  (at 3645 (image_available img2))
  (at 3653 (not (image_available img2)))
  (at 3786 (image_available img3))
  (at 3794 (not (image_available img3)))
  (at 3844 (image_available img4))
  (at 3852 (not (image_available img4)))
  (at 3947 (image_available img5))
  (at 3955 (not (image_available img5)))
  (at 3948 (image_available img6))
  (at 3956 (not (image_available img6)))
  (at 3794 (image_available img7))
  (at 3802 (not (image_available img7)))
  (at 3791 (image_available img8))
  (at 3799 (not (image_available img8)))
  (at 3724 (image_available img9))
  (at 3732 (not (image_available img9)))
  (at 3948 (image_available img10))
  (at 3956 (not (image_available img10)))
  (at 3709 (image_available img11))
  (at 3717 (not (image_available img11)))
  (at 3833 (image_available img12))
  (at 3841 (not (image_available img12)))
  (at 3900 (image_available img13))
  (at 3908 (not (image_available img13)))
  (at 3878 (image_available img14))
  (at 3886 (not (image_available img14)))
  (at 3729 (image_available img15))
  (at 3737 (not (image_available img15)))
  (at 4007 (image_available img1))
  (at 4015 (not (image_available img1)))
  (at 4005 (image_available img2))
  (at 4013 (not (image_available img2)))
  (at 4146 (image_available img3))
  (at 4154 (not (image_available img3)))
  (at 4204 (image_available img4))
  (at 4212 (not (image_available img4)))
  (at 4307 (image_available img5))
  (at 4315 (not (image_available img5)))
  (at 4308 (image_available img6))
  (at 4316 (not (image_available img6)))
  (at 4154 (image_available img7))
  (at 4162 (not (image_available img7)))
  (at 4151 (image_available img8))
  (at 4159 (not (image_available img8)))
  (at 4084 (image_available img9))
  (at 4092 (not (image_available img9)))
  (at 4308 (image_available img10))
  (at 4316 (not (image_available img10)))
  (at 4069 (image_available img11))
  (at 4077 (not (image_available img11)))
  (at 4193 (image_available img12))
  (at 4201 (not (image_available img12)))
  (at 4260 (image_available img13))
  (at 4268 (not (image_available img13)))
  (at 4238 (image_available img14))
  (at 4246 (not (image_available img14)))
  (at 4089 (image_available img15))
  (at 4097 (not (image_available img15)))
  (at 4367 (image_available img1))
  (at 4375 (not (image_available img1)))
  (at 4365 (image_available img2))
  (at 4373 (not (image_available img2)))
  (at 4506 (image_available img3))
  (at 4514 (not (image_available img3)))
  (at 4564 (image_available img4))
  (at 4572 (not (image_available img4)))
  (at 4667 (image_available img5))
  (at 4675 (not (image_available img5)))
  (at 4668 (image_available img6))
  (at 4676 (not (image_available img6)))
  (at 4514 (image_available img7))
  (at 4522 (not (image_available img7)))
  (at 4511 (image_available img8))
  (at 4519 (not (image_available img8)))
  (at 4444 (image_available img9))
  (at 4452 (not (image_available img9)))
  (at 4668 (image_available img10))
  (at 4676 (not (image_available img10)))
  (at 4429 (image_available img11))
  (at 4437 (not (image_available img11)))
  (at 4553 (image_available img12))
  (at 4561 (not (image_available img12)))
  (at 4620 (image_available img13))
  (at 4628 (not (image_available img13)))
  (at 4598 (image_available img14))
  (at 4606 (not (image_available img14)))
  (at 4449 (image_available img15))
  (at 4457 (not (image_available img15)))
  (at 4727 (image_available img1))
  (at 4735 (not (image_available img1)))
  (at 4725 (image_available img2))
  (at 4733 (not (image_available img2)))
  (at 4866 (image_available img3))
  (at 4874 (not (image_available img3)))
  (at 4924 (image_available img4))
  (at 4932 (not (image_available img4)))
  (at 5027 (image_available img5))
  (at 5035 (not (image_available img5)))
  (at 5028 (image_available img6))
  (at 5036 (not (image_available img6)))
  (at 4874 (image_available img7))
  (at 4882 (not (image_available img7)))
  (at 4871 (image_available img8))
  (at 4879 (not (image_available img8)))
  (at 4804 (image_available img9))
  (at 4812 (not (image_available img9)))
  (at 5028 (image_available img10))
  (at 5036 (not (image_available img10)))
  (at 4789 (image_available img11))
  (at 4797 (not (image_available img11)))
  (at 4913 (image_available img12))
  (at 4921 (not (image_available img12)))
  (at 4980 (image_available img13))
  (at 4988 (not (image_available img13)))
  (at 4958 (image_available img14))
  (at 4966 (not (image_available img14)))
  (at 4809 (image_available img15))
  (at 4817 (not (image_available img15)))
  (at 5087 (image_available img1))
  (at 5095 (not (image_available img1)))
  (at 5085 (image_available img2))
  (at 5093 (not (image_available img2)))
  (at 5226 (image_available img3))
  (at 5234 (not (image_available img3)))
  (at 5284 (image_available img4))
  (at 5292 (not (image_available img4)))
  (at 5387 (image_available img5))
  (at 5395 (not (image_available img5)))
  (at 5388 (image_available img6))
  (at 5396 (not (image_available img6)))
  (at 5234 (image_available img7))
  (at 5242 (not (image_available img7)))
  (at 5231 (image_available img8))
  (at 5239 (not (image_available img8)))
  (at 5164 (image_available img9))
  (at 5172 (not (image_available img9)))
  (at 5388 (image_available img10))
  (at 5396 (not (image_available img10)))
  (at 5149 (image_available img11))
  (at 5157 (not (image_available img11)))
  (at 5273 (image_available img12))
  (at 5281 (not (image_available img12)))
  (at 5340 (image_available img13))
  (at 5348 (not (image_available img13)))
  (at 5318 (image_available img14))
  (at 5326 (not (image_available img14)))
  (at 5169 (image_available img15))
  (at 5177 (not (image_available img15)))
  (at 5447 (image_available img1))
  (at 5455 (not (image_available img1)))
  (at 5445 (image_available img2))
  (at 5453 (not (image_available img2)))
  (at 5586 (image_available img3))
  (at 5594 (not (image_available img3)))
  (at 5644 (image_available img4))
  (at 5652 (not (image_available img4)))
  (at 5747 (image_available img5))
  (at 5755 (not (image_available img5)))
  (at 5748 (image_available img6))
  (at 5756 (not (image_available img6)))
  (at 5594 (image_available img7))
  (at 5602 (not (image_available img7)))
  (at 5591 (image_available img8))
  (at 5599 (not (image_available img8)))
  (at 5524 (image_available img9))
  (at 5532 (not (image_available img9)))
  (at 5748 (image_available img10))
  (at 5756 (not (image_available img10)))
  (at 5509 (image_available img11))
  (at 5517 (not (image_available img11)))
  (at 5633 (image_available img12))
  (at 5641 (not (image_available img12)))
  (at 5700 (image_available img13))
  (at 5708 (not (image_available img13)))
  (at 5678 (image_available img14))
  (at 5686 (not (image_available img14)))
  (at 5529 (image_available img15))
  (at 5537 (not (image_available img15)))
  (at 5807 (image_available img1))
  (at 5815 (not (image_available img1)))
  (at 5805 (image_available img2))
  (at 5813 (not (image_available img2)))
  (at 5946 (image_available img3))
  (at 5954 (not (image_available img3)))
  (at 6004 (image_available img4))
  (at 6012 (not (image_available img4)))
  (at 6107 (image_available img5))
  (at 6115 (not (image_available img5)))
  (at 6108 (image_available img6))
  (at 6116 (not (image_available img6)))
  (at 5954 (image_available img7))
  (at 5962 (not (image_available img7)))
  (at 5951 (image_available img8))
  (at 5959 (not (image_available img8)))
  (at 5884 (image_available img9))
  (at 5892 (not (image_available img9)))
  (at 6108 (image_available img10))
  (at 6116 (not (image_available img10)))
  (at 5869 (image_available img11))
  (at 5877 (not (image_available img11)))
  (at 5993 (image_available img12))
  (at 6001 (not (image_available img12)))
  (at 6060 (image_available img13))
  (at 6068 (not (image_available img13)))
  (at 6038 (image_available img14))
  (at 6046 (not (image_available img14)))
  (at 5889 (image_available img15))
  (at 5897 (not (image_available img15)))
  (at 6167 (image_available img1))
  (at 6175 (not (image_available img1)))
  (at 6165 (image_available img2))
  (at 6173 (not (image_available img2)))
  (at 6306 (image_available img3))
  (at 6314 (not (image_available img3)))
  (at 6364 (image_available img4))
  (at 6372 (not (image_available img4)))
  (at 6467 (image_available img5))
  (at 6475 (not (image_available img5)))
  (at 6468 (image_available img6))
  (at 6476 (not (image_available img6)))
  (at 6314 (image_available img7))
  (at 6322 (not (image_available img7)))
  (at 6311 (image_available img8))
  (at 6319 (not (image_available img8)))
  (at 6244 (image_available img9))
  (at 6252 (not (image_available img9)))
  (at 6468 (image_available img10))
  (at 6476 (not (image_available img10)))
  (at 6229 (image_available img11))
  (at 6237 (not (image_available img11)))
  (at 6353 (image_available img12))
  (at 6361 (not (image_available img12)))
  (at 6420 (image_available img13))
  (at 6428 (not (image_available img13)))
  (at 6398 (image_available img14))
  (at 6406 (not (image_available img14)))
  (at 6249 (image_available img15))
  (at 6257 (not (image_available img15)))
  (at 6527 (image_available img1))
  (at 6535 (not (image_available img1)))
  (at 6525 (image_available img2))
  (at 6533 (not (image_available img2)))
  (at 6666 (image_available img3))
  (at 6674 (not (image_available img3)))
  (at 6724 (image_available img4))
  (at 6732 (not (image_available img4)))
  (at 6827 (image_available img5))
  (at 6835 (not (image_available img5)))
  (at 6828 (image_available img6))
  (at 6836 (not (image_available img6)))
  (at 6674 (image_available img7))
  (at 6682 (not (image_available img7)))
  (at 6671 (image_available img8))
  (at 6679 (not (image_available img8)))
  (at 6604 (image_available img9))
  (at 6612 (not (image_available img9)))
  (at 6828 (image_available img10))
  (at 6836 (not (image_available img10)))
  (at 6589 (image_available img11))
  (at 6597 (not (image_available img11)))
  (at 6713 (image_available img12))
  (at 6721 (not (image_available img12)))
  (at 6780 (image_available img13))
  (at 6788 (not (image_available img13)))
  (at 6758 (image_available img14))
  (at 6766 (not (image_available img14)))
  (at 6609 (image_available img15))
  (at 6617 (not (image_available img15)))
  (at 6887 (image_available img1))
  (at 6895 (not (image_available img1)))
  (at 6885 (image_available img2))
  (at 6893 (not (image_available img2)))
  (at 7026 (image_available img3))
  (at 7034 (not (image_available img3)))
  (at 7084 (image_available img4))
  (at 7092 (not (image_available img4)))
  (at 7187 (image_available img5))
  (at 7195 (not (image_available img5)))
  (at 7188 (image_available img6))
  (at 7196 (not (image_available img6)))
  (at 7034 (image_available img7))
  (at 7042 (not (image_available img7)))
  (at 7031 (image_available img8))
  (at 7039 (not (image_available img8)))
  (at 6964 (image_available img9))
  (at 6972 (not (image_available img9)))
  (at 7188 (image_available img10))
  (at 7196 (not (image_available img10)))
  (at 6949 (image_available img11))
  (at 6957 (not (image_available img11)))
  (at 7073 (image_available img12))
  (at 7081 (not (image_available img12)))
  (at 7140 (image_available img13))
  (at 7148 (not (image_available img13)))
  (at 7118 (image_available img14))
  (at 7126 (not (image_available img14)))
  (at 6969 (image_available img15))
  (at 6977 (not (image_available img15)))
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
  (<= (image_score img5) 3.0)

(>= (total_score) 1)
))
(:metric maximize 
  (image_score img5)
)
)