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



  (at 203 (image_available img1))
  (at 211 (not (image_available img1)))
  (at 149 (image_available img2))
  (at 157 (not (image_available img2)))
  (at 186 (image_available img3))
  (at 194 (not (image_available img3)))
  (at 101 (image_available img4))
  (at 109 (not (image_available img4)))
  (at 218 (image_available img5))
  (at 226 (not (image_available img5)))
  (at 151 (image_available img6))
  (at 159 (not (image_available img6)))
  (at 343 (image_available img7))
  (at 351 (not (image_available img7)))
  (at 325 (image_available img8))
  (at 333 (not (image_available img8)))
  (at 31 (image_available img9))
  (at 39 (not (image_available img9)))
  (at 59 (image_available img10))
  (at 67 (not (image_available img10)))
  (at 216 (image_available img11))
  (at 224 (not (image_available img11)))
  (at 52 (image_available img12))
  (at 60 (not (image_available img12)))
  (at 330 (image_available img13))
  (at 338 (not (image_available img13)))
  (at 329 (image_available img14))
  (at 337 (not (image_available img14)))
  (at 260 (image_available img15))
  (at 268 (not (image_available img15)))
  (at 563 (image_available img1))
  (at 571 (not (image_available img1)))
  (at 509 (image_available img2))
  (at 517 (not (image_available img2)))
  (at 546 (image_available img3))
  (at 554 (not (image_available img3)))
  (at 461 (image_available img4))
  (at 469 (not (image_available img4)))
  (at 578 (image_available img5))
  (at 586 (not (image_available img5)))
  (at 511 (image_available img6))
  (at 519 (not (image_available img6)))
  (at 703 (image_available img7))
  (at 711 (not (image_available img7)))
  (at 685 (image_available img8))
  (at 693 (not (image_available img8)))
  (at 391 (image_available img9))
  (at 399 (not (image_available img9)))
  (at 419 (image_available img10))
  (at 427 (not (image_available img10)))
  (at 576 (image_available img11))
  (at 584 (not (image_available img11)))
  (at 412 (image_available img12))
  (at 420 (not (image_available img12)))
  (at 690 (image_available img13))
  (at 698 (not (image_available img13)))
  (at 689 (image_available img14))
  (at 697 (not (image_available img14)))
  (at 620 (image_available img15))
  (at 628 (not (image_available img15)))
  (at 923 (image_available img1))
  (at 931 (not (image_available img1)))
  (at 869 (image_available img2))
  (at 877 (not (image_available img2)))
  (at 906 (image_available img3))
  (at 914 (not (image_available img3)))
  (at 821 (image_available img4))
  (at 829 (not (image_available img4)))
  (at 938 (image_available img5))
  (at 946 (not (image_available img5)))
  (at 871 (image_available img6))
  (at 879 (not (image_available img6)))
  (at 1063 (image_available img7))
  (at 1071 (not (image_available img7)))
  (at 1045 (image_available img8))
  (at 1053 (not (image_available img8)))
  (at 751 (image_available img9))
  (at 759 (not (image_available img9)))
  (at 779 (image_available img10))
  (at 787 (not (image_available img10)))
  (at 936 (image_available img11))
  (at 944 (not (image_available img11)))
  (at 772 (image_available img12))
  (at 780 (not (image_available img12)))
  (at 1050 (image_available img13))
  (at 1058 (not (image_available img13)))
  (at 1049 (image_available img14))
  (at 1057 (not (image_available img14)))
  (at 980 (image_available img15))
  (at 988 (not (image_available img15)))
  (at 1283 (image_available img1))
  (at 1291 (not (image_available img1)))
  (at 1229 (image_available img2))
  (at 1237 (not (image_available img2)))
  (at 1266 (image_available img3))
  (at 1274 (not (image_available img3)))
  (at 1181 (image_available img4))
  (at 1189 (not (image_available img4)))
  (at 1298 (image_available img5))
  (at 1306 (not (image_available img5)))
  (at 1231 (image_available img6))
  (at 1239 (not (image_available img6)))
  (at 1423 (image_available img7))
  (at 1431 (not (image_available img7)))
  (at 1405 (image_available img8))
  (at 1413 (not (image_available img8)))
  (at 1111 (image_available img9))
  (at 1119 (not (image_available img9)))
  (at 1139 (image_available img10))
  (at 1147 (not (image_available img10)))
  (at 1296 (image_available img11))
  (at 1304 (not (image_available img11)))
  (at 1132 (image_available img12))
  (at 1140 (not (image_available img12)))
  (at 1410 (image_available img13))
  (at 1418 (not (image_available img13)))
  (at 1409 (image_available img14))
  (at 1417 (not (image_available img14)))
  (at 1340 (image_available img15))
  (at 1348 (not (image_available img15)))
  (at 1643 (image_available img1))
  (at 1651 (not (image_available img1)))
  (at 1589 (image_available img2))
  (at 1597 (not (image_available img2)))
  (at 1626 (image_available img3))
  (at 1634 (not (image_available img3)))
  (at 1541 (image_available img4))
  (at 1549 (not (image_available img4)))
  (at 1658 (image_available img5))
  (at 1666 (not (image_available img5)))
  (at 1591 (image_available img6))
  (at 1599 (not (image_available img6)))
  (at 1783 (image_available img7))
  (at 1791 (not (image_available img7)))
  (at 1765 (image_available img8))
  (at 1773 (not (image_available img8)))
  (at 1471 (image_available img9))
  (at 1479 (not (image_available img9)))
  (at 1499 (image_available img10))
  (at 1507 (not (image_available img10)))
  (at 1656 (image_available img11))
  (at 1664 (not (image_available img11)))
  (at 1492 (image_available img12))
  (at 1500 (not (image_available img12)))
  (at 1770 (image_available img13))
  (at 1778 (not (image_available img13)))
  (at 1769 (image_available img14))
  (at 1777 (not (image_available img14)))
  (at 1700 (image_available img15))
  (at 1708 (not (image_available img15)))
  (at 2003 (image_available img1))
  (at 2011 (not (image_available img1)))
  (at 1949 (image_available img2))
  (at 1957 (not (image_available img2)))
  (at 1986 (image_available img3))
  (at 1994 (not (image_available img3)))
  (at 1901 (image_available img4))
  (at 1909 (not (image_available img4)))
  (at 2018 (image_available img5))
  (at 2026 (not (image_available img5)))
  (at 1951 (image_available img6))
  (at 1959 (not (image_available img6)))
  (at 2143 (image_available img7))
  (at 2151 (not (image_available img7)))
  (at 2125 (image_available img8))
  (at 2133 (not (image_available img8)))
  (at 1831 (image_available img9))
  (at 1839 (not (image_available img9)))
  (at 1859 (image_available img10))
  (at 1867 (not (image_available img10)))
  (at 2016 (image_available img11))
  (at 2024 (not (image_available img11)))
  (at 1852 (image_available img12))
  (at 1860 (not (image_available img12)))
  (at 2130 (image_available img13))
  (at 2138 (not (image_available img13)))
  (at 2129 (image_available img14))
  (at 2137 (not (image_available img14)))
  (at 2060 (image_available img15))
  (at 2068 (not (image_available img15)))
  (at 2363 (image_available img1))
  (at 2371 (not (image_available img1)))
  (at 2309 (image_available img2))
  (at 2317 (not (image_available img2)))
  (at 2346 (image_available img3))
  (at 2354 (not (image_available img3)))
  (at 2261 (image_available img4))
  (at 2269 (not (image_available img4)))
  (at 2378 (image_available img5))
  (at 2386 (not (image_available img5)))
  (at 2311 (image_available img6))
  (at 2319 (not (image_available img6)))
  (at 2503 (image_available img7))
  (at 2511 (not (image_available img7)))
  (at 2485 (image_available img8))
  (at 2493 (not (image_available img8)))
  (at 2191 (image_available img9))
  (at 2199 (not (image_available img9)))
  (at 2219 (image_available img10))
  (at 2227 (not (image_available img10)))
  (at 2376 (image_available img11))
  (at 2384 (not (image_available img11)))
  (at 2212 (image_available img12))
  (at 2220 (not (image_available img12)))
  (at 2490 (image_available img13))
  (at 2498 (not (image_available img13)))
  (at 2489 (image_available img14))
  (at 2497 (not (image_available img14)))
  (at 2420 (image_available img15))
  (at 2428 (not (image_available img15)))
  (at 2723 (image_available img1))
  (at 2731 (not (image_available img1)))
  (at 2669 (image_available img2))
  (at 2677 (not (image_available img2)))
  (at 2706 (image_available img3))
  (at 2714 (not (image_available img3)))
  (at 2621 (image_available img4))
  (at 2629 (not (image_available img4)))
  (at 2738 (image_available img5))
  (at 2746 (not (image_available img5)))
  (at 2671 (image_available img6))
  (at 2679 (not (image_available img6)))
  (at 2863 (image_available img7))
  (at 2871 (not (image_available img7)))
  (at 2845 (image_available img8))
  (at 2853 (not (image_available img8)))
  (at 2551 (image_available img9))
  (at 2559 (not (image_available img9)))
  (at 2579 (image_available img10))
  (at 2587 (not (image_available img10)))
  (at 2736 (image_available img11))
  (at 2744 (not (image_available img11)))
  (at 2572 (image_available img12))
  (at 2580 (not (image_available img12)))
  (at 2850 (image_available img13))
  (at 2858 (not (image_available img13)))
  (at 2849 (image_available img14))
  (at 2857 (not (image_available img14)))
  (at 2780 (image_available img15))
  (at 2788 (not (image_available img15)))
  (at 3083 (image_available img1))
  (at 3091 (not (image_available img1)))
  (at 3029 (image_available img2))
  (at 3037 (not (image_available img2)))
  (at 3066 (image_available img3))
  (at 3074 (not (image_available img3)))
  (at 2981 (image_available img4))
  (at 2989 (not (image_available img4)))
  (at 3098 (image_available img5))
  (at 3106 (not (image_available img5)))
  (at 3031 (image_available img6))
  (at 3039 (not (image_available img6)))
  (at 3223 (image_available img7))
  (at 3231 (not (image_available img7)))
  (at 3205 (image_available img8))
  (at 3213 (not (image_available img8)))
  (at 2911 (image_available img9))
  (at 2919 (not (image_available img9)))
  (at 2939 (image_available img10))
  (at 2947 (not (image_available img10)))
  (at 3096 (image_available img11))
  (at 3104 (not (image_available img11)))
  (at 2932 (image_available img12))
  (at 2940 (not (image_available img12)))
  (at 3210 (image_available img13))
  (at 3218 (not (image_available img13)))
  (at 3209 (image_available img14))
  (at 3217 (not (image_available img14)))
  (at 3140 (image_available img15))
  (at 3148 (not (image_available img15)))
  (at 3443 (image_available img1))
  (at 3451 (not (image_available img1)))
  (at 3389 (image_available img2))
  (at 3397 (not (image_available img2)))
  (at 3426 (image_available img3))
  (at 3434 (not (image_available img3)))
  (at 3341 (image_available img4))
  (at 3349 (not (image_available img4)))
  (at 3458 (image_available img5))
  (at 3466 (not (image_available img5)))
  (at 3391 (image_available img6))
  (at 3399 (not (image_available img6)))
  (at 3583 (image_available img7))
  (at 3591 (not (image_available img7)))
  (at 3565 (image_available img8))
  (at 3573 (not (image_available img8)))
  (at 3271 (image_available img9))
  (at 3279 (not (image_available img9)))
  (at 3299 (image_available img10))
  (at 3307 (not (image_available img10)))
  (at 3456 (image_available img11))
  (at 3464 (not (image_available img11)))
  (at 3292 (image_available img12))
  (at 3300 (not (image_available img12)))
  (at 3570 (image_available img13))
  (at 3578 (not (image_available img13)))
  (at 3569 (image_available img14))
  (at 3577 (not (image_available img14)))
  (at 3500 (image_available img15))
  (at 3508 (not (image_available img15)))
  (at 3803 (image_available img1))
  (at 3811 (not (image_available img1)))
  (at 3749 (image_available img2))
  (at 3757 (not (image_available img2)))
  (at 3786 (image_available img3))
  (at 3794 (not (image_available img3)))
  (at 3701 (image_available img4))
  (at 3709 (not (image_available img4)))
  (at 3818 (image_available img5))
  (at 3826 (not (image_available img5)))
  (at 3751 (image_available img6))
  (at 3759 (not (image_available img6)))
  (at 3943 (image_available img7))
  (at 3951 (not (image_available img7)))
  (at 3925 (image_available img8))
  (at 3933 (not (image_available img8)))
  (at 3631 (image_available img9))
  (at 3639 (not (image_available img9)))
  (at 3659 (image_available img10))
  (at 3667 (not (image_available img10)))
  (at 3816 (image_available img11))
  (at 3824 (not (image_available img11)))
  (at 3652 (image_available img12))
  (at 3660 (not (image_available img12)))
  (at 3930 (image_available img13))
  (at 3938 (not (image_available img13)))
  (at 3929 (image_available img14))
  (at 3937 (not (image_available img14)))
  (at 3860 (image_available img15))
  (at 3868 (not (image_available img15)))
  (at 4163 (image_available img1))
  (at 4171 (not (image_available img1)))
  (at 4109 (image_available img2))
  (at 4117 (not (image_available img2)))
  (at 4146 (image_available img3))
  (at 4154 (not (image_available img3)))
  (at 4061 (image_available img4))
  (at 4069 (not (image_available img4)))
  (at 4178 (image_available img5))
  (at 4186 (not (image_available img5)))
  (at 4111 (image_available img6))
  (at 4119 (not (image_available img6)))
  (at 4303 (image_available img7))
  (at 4311 (not (image_available img7)))
  (at 4285 (image_available img8))
  (at 4293 (not (image_available img8)))
  (at 3991 (image_available img9))
  (at 3999 (not (image_available img9)))
  (at 4019 (image_available img10))
  (at 4027 (not (image_available img10)))
  (at 4176 (image_available img11))
  (at 4184 (not (image_available img11)))
  (at 4012 (image_available img12))
  (at 4020 (not (image_available img12)))
  (at 4290 (image_available img13))
  (at 4298 (not (image_available img13)))
  (at 4289 (image_available img14))
  (at 4297 (not (image_available img14)))
  (at 4220 (image_available img15))
  (at 4228 (not (image_available img15)))
  (at 4523 (image_available img1))
  (at 4531 (not (image_available img1)))
  (at 4469 (image_available img2))
  (at 4477 (not (image_available img2)))
  (at 4506 (image_available img3))
  (at 4514 (not (image_available img3)))
  (at 4421 (image_available img4))
  (at 4429 (not (image_available img4)))
  (at 4538 (image_available img5))
  (at 4546 (not (image_available img5)))
  (at 4471 (image_available img6))
  (at 4479 (not (image_available img6)))
  (at 4663 (image_available img7))
  (at 4671 (not (image_available img7)))
  (at 4645 (image_available img8))
  (at 4653 (not (image_available img8)))
  (at 4351 (image_available img9))
  (at 4359 (not (image_available img9)))
  (at 4379 (image_available img10))
  (at 4387 (not (image_available img10)))
  (at 4536 (image_available img11))
  (at 4544 (not (image_available img11)))
  (at 4372 (image_available img12))
  (at 4380 (not (image_available img12)))
  (at 4650 (image_available img13))
  (at 4658 (not (image_available img13)))
  (at 4649 (image_available img14))
  (at 4657 (not (image_available img14)))
  (at 4580 (image_available img15))
  (at 4588 (not (image_available img15)))
  (at 4883 (image_available img1))
  (at 4891 (not (image_available img1)))
  (at 4829 (image_available img2))
  (at 4837 (not (image_available img2)))
  (at 4866 (image_available img3))
  (at 4874 (not (image_available img3)))
  (at 4781 (image_available img4))
  (at 4789 (not (image_available img4)))
  (at 4898 (image_available img5))
  (at 4906 (not (image_available img5)))
  (at 4831 (image_available img6))
  (at 4839 (not (image_available img6)))
  (at 5023 (image_available img7))
  (at 5031 (not (image_available img7)))
  (at 5005 (image_available img8))
  (at 5013 (not (image_available img8)))
  (at 4711 (image_available img9))
  (at 4719 (not (image_available img9)))
  (at 4739 (image_available img10))
  (at 4747 (not (image_available img10)))
  (at 4896 (image_available img11))
  (at 4904 (not (image_available img11)))
  (at 4732 (image_available img12))
  (at 4740 (not (image_available img12)))
  (at 5010 (image_available img13))
  (at 5018 (not (image_available img13)))
  (at 5009 (image_available img14))
  (at 5017 (not (image_available img14)))
  (at 4940 (image_available img15))
  (at 4948 (not (image_available img15)))
  (at 5243 (image_available img1))
  (at 5251 (not (image_available img1)))
  (at 5189 (image_available img2))
  (at 5197 (not (image_available img2)))
  (at 5226 (image_available img3))
  (at 5234 (not (image_available img3)))
  (at 5141 (image_available img4))
  (at 5149 (not (image_available img4)))
  (at 5258 (image_available img5))
  (at 5266 (not (image_available img5)))
  (at 5191 (image_available img6))
  (at 5199 (not (image_available img6)))
  (at 5383 (image_available img7))
  (at 5391 (not (image_available img7)))
  (at 5365 (image_available img8))
  (at 5373 (not (image_available img8)))
  (at 5071 (image_available img9))
  (at 5079 (not (image_available img9)))
  (at 5099 (image_available img10))
  (at 5107 (not (image_available img10)))
  (at 5256 (image_available img11))
  (at 5264 (not (image_available img11)))
  (at 5092 (image_available img12))
  (at 5100 (not (image_available img12)))
  (at 5370 (image_available img13))
  (at 5378 (not (image_available img13)))
  (at 5369 (image_available img14))
  (at 5377 (not (image_available img14)))
  (at 5300 (image_available img15))
  (at 5308 (not (image_available img15)))
  (at 5603 (image_available img1))
  (at 5611 (not (image_available img1)))
  (at 5549 (image_available img2))
  (at 5557 (not (image_available img2)))
  (at 5586 (image_available img3))
  (at 5594 (not (image_available img3)))
  (at 5501 (image_available img4))
  (at 5509 (not (image_available img4)))
  (at 5618 (image_available img5))
  (at 5626 (not (image_available img5)))
  (at 5551 (image_available img6))
  (at 5559 (not (image_available img6)))
  (at 5743 (image_available img7))
  (at 5751 (not (image_available img7)))
  (at 5725 (image_available img8))
  (at 5733 (not (image_available img8)))
  (at 5431 (image_available img9))
  (at 5439 (not (image_available img9)))
  (at 5459 (image_available img10))
  (at 5467 (not (image_available img10)))
  (at 5616 (image_available img11))
  (at 5624 (not (image_available img11)))
  (at 5452 (image_available img12))
  (at 5460 (not (image_available img12)))
  (at 5730 (image_available img13))
  (at 5738 (not (image_available img13)))
  (at 5729 (image_available img14))
  (at 5737 (not (image_available img14)))
  (at 5660 (image_available img15))
  (at 5668 (not (image_available img15)))
  (at 5963 (image_available img1))
  (at 5971 (not (image_available img1)))
  (at 5909 (image_available img2))
  (at 5917 (not (image_available img2)))
  (at 5946 (image_available img3))
  (at 5954 (not (image_available img3)))
  (at 5861 (image_available img4))
  (at 5869 (not (image_available img4)))
  (at 5978 (image_available img5))
  (at 5986 (not (image_available img5)))
  (at 5911 (image_available img6))
  (at 5919 (not (image_available img6)))
  (at 6103 (image_available img7))
  (at 6111 (not (image_available img7)))
  (at 6085 (image_available img8))
  (at 6093 (not (image_available img8)))
  (at 5791 (image_available img9))
  (at 5799 (not (image_available img9)))
  (at 5819 (image_available img10))
  (at 5827 (not (image_available img10)))
  (at 5976 (image_available img11))
  (at 5984 (not (image_available img11)))
  (at 5812 (image_available img12))
  (at 5820 (not (image_available img12)))
  (at 6090 (image_available img13))
  (at 6098 (not (image_available img13)))
  (at 6089 (image_available img14))
  (at 6097 (not (image_available img14)))
  (at 6020 (image_available img15))
  (at 6028 (not (image_available img15)))
  (at 6323 (image_available img1))
  (at 6331 (not (image_available img1)))
  (at 6269 (image_available img2))
  (at 6277 (not (image_available img2)))
  (at 6306 (image_available img3))
  (at 6314 (not (image_available img3)))
  (at 6221 (image_available img4))
  (at 6229 (not (image_available img4)))
  (at 6338 (image_available img5))
  (at 6346 (not (image_available img5)))
  (at 6271 (image_available img6))
  (at 6279 (not (image_available img6)))
  (at 6463 (image_available img7))
  (at 6471 (not (image_available img7)))
  (at 6445 (image_available img8))
  (at 6453 (not (image_available img8)))
  (at 6151 (image_available img9))
  (at 6159 (not (image_available img9)))
  (at 6179 (image_available img10))
  (at 6187 (not (image_available img10)))
  (at 6336 (image_available img11))
  (at 6344 (not (image_available img11)))
  (at 6172 (image_available img12))
  (at 6180 (not (image_available img12)))
  (at 6450 (image_available img13))
  (at 6458 (not (image_available img13)))
  (at 6449 (image_available img14))
  (at 6457 (not (image_available img14)))
  (at 6380 (image_available img15))
  (at 6388 (not (image_available img15)))
  (at 6683 (image_available img1))
  (at 6691 (not (image_available img1)))
  (at 6629 (image_available img2))
  (at 6637 (not (image_available img2)))
  (at 6666 (image_available img3))
  (at 6674 (not (image_available img3)))
  (at 6581 (image_available img4))
  (at 6589 (not (image_available img4)))
  (at 6698 (image_available img5))
  (at 6706 (not (image_available img5)))
  (at 6631 (image_available img6))
  (at 6639 (not (image_available img6)))
  (at 6823 (image_available img7))
  (at 6831 (not (image_available img7)))
  (at 6805 (image_available img8))
  (at 6813 (not (image_available img8)))
  (at 6511 (image_available img9))
  (at 6519 (not (image_available img9)))
  (at 6539 (image_available img10))
  (at 6547 (not (image_available img10)))
  (at 6696 (image_available img11))
  (at 6704 (not (image_available img11)))
  (at 6532 (image_available img12))
  (at 6540 (not (image_available img12)))
  (at 6810 (image_available img13))
  (at 6818 (not (image_available img13)))
  (at 6809 (image_available img14))
  (at 6817 (not (image_available img14)))
  (at 6740 (image_available img15))
  (at 6748 (not (image_available img15)))
  (at 7043 (image_available img1))
  (at 7051 (not (image_available img1)))
  (at 6989 (image_available img2))
  (at 6997 (not (image_available img2)))
  (at 7026 (image_available img3))
  (at 7034 (not (image_available img3)))
  (at 6941 (image_available img4))
  (at 6949 (not (image_available img4)))
  (at 7058 (image_available img5))
  (at 7066 (not (image_available img5)))
  (at 6991 (image_available img6))
  (at 6999 (not (image_available img6)))
  (at 7183 (image_available img7))
  (at 7191 (not (image_available img7)))
  (at 7165 (image_available img8))
  (at 7173 (not (image_available img8)))
  (at 6871 (image_available img9))
  (at 6879 (not (image_available img9)))
  (at 6899 (image_available img10))
  (at 6907 (not (image_available img10)))
  (at 7056 (image_available img11))
  (at 7064 (not (image_available img11)))
  (at 6892 (image_available img12))
  (at 6900 (not (image_available img12)))
  (at 7170 (image_available img13))
  (at 7178 (not (image_available img13)))
  (at 7169 (image_available img14))
  (at 7177 (not (image_available img14)))
  (at 7100 (image_available img15))
  (at 7108 (not (image_available img15)))
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
  (<= (image_score img5) 4.0)

  (> (image_score img8) 0)
  (<= (image_score img8) 1.0)

  (> (image_score img10) 0)
  (<= (image_score img10) 12.0)

  (> (image_score img13) 0)
  (<= (image_score img13) 9.0)

  (> (image_score img15) 0)
  (<= (image_score img15) 11.0)

(>= (total_score) 8)
))
(:metric maximize (+
  (image_score img5)
    (+ (image_score img8)
      (+ (image_score img10)
        (+ (image_score img13)
          (image_score img15)
        )
      )
    )
  )
)
)