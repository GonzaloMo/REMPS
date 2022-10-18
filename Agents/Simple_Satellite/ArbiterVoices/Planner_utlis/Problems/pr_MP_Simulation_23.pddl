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



  (at 316 (image_available img1))
  (at 324 (not (image_available img1)))
  (at 235 (image_available img2))
  (at 243 (not (image_available img2)))
  (at 213 (image_available img3))
  (at 221 (not (image_available img3)))
  (at 159 (image_available img4))
  (at 167 (not (image_available img4)))
  (at 213 (image_available img5))
  (at 221 (not (image_available img5)))
  (at 249 (image_available img6))
  (at 257 (not (image_available img6)))
  (at 139 (image_available img7))
  (at 147 (not (image_available img7)))
  (at 160 (image_available img8))
  (at 168 (not (image_available img8)))
  (at 242 (image_available img9))
  (at 250 (not (image_available img9)))
  (at 116 (image_available img10))
  (at 124 (not (image_available img10)))
  (at 676 (image_available img1))
  (at 684 (not (image_available img1)))
  (at 595 (image_available img2))
  (at 603 (not (image_available img2)))
  (at 573 (image_available img3))
  (at 581 (not (image_available img3)))
  (at 519 (image_available img4))
  (at 527 (not (image_available img4)))
  (at 573 (image_available img5))
  (at 581 (not (image_available img5)))
  (at 609 (image_available img6))
  (at 617 (not (image_available img6)))
  (at 499 (image_available img7))
  (at 507 (not (image_available img7)))
  (at 520 (image_available img8))
  (at 528 (not (image_available img8)))
  (at 602 (image_available img9))
  (at 610 (not (image_available img9)))
  (at 476 (image_available img10))
  (at 484 (not (image_available img10)))
  (at 1036 (image_available img1))
  (at 1044 (not (image_available img1)))
  (at 955 (image_available img2))
  (at 963 (not (image_available img2)))
  (at 933 (image_available img3))
  (at 941 (not (image_available img3)))
  (at 879 (image_available img4))
  (at 887 (not (image_available img4)))
  (at 933 (image_available img5))
  (at 941 (not (image_available img5)))
  (at 969 (image_available img6))
  (at 977 (not (image_available img6)))
  (at 859 (image_available img7))
  (at 867 (not (image_available img7)))
  (at 880 (image_available img8))
  (at 888 (not (image_available img8)))
  (at 962 (image_available img9))
  (at 970 (not (image_available img9)))
  (at 836 (image_available img10))
  (at 844 (not (image_available img10)))
  (at 1396 (image_available img1))
  (at 1404 (not (image_available img1)))
  (at 1315 (image_available img2))
  (at 1323 (not (image_available img2)))
  (at 1293 (image_available img3))
  (at 1301 (not (image_available img3)))
  (at 1239 (image_available img4))
  (at 1247 (not (image_available img4)))
  (at 1293 (image_available img5))
  (at 1301 (not (image_available img5)))
  (at 1329 (image_available img6))
  (at 1337 (not (image_available img6)))
  (at 1219 (image_available img7))
  (at 1227 (not (image_available img7)))
  (at 1240 (image_available img8))
  (at 1248 (not (image_available img8)))
  (at 1322 (image_available img9))
  (at 1330 (not (image_available img9)))
  (at 1196 (image_available img10))
  (at 1204 (not (image_available img10)))
  (at 1756 (image_available img1))
  (at 1764 (not (image_available img1)))
  (at 1675 (image_available img2))
  (at 1683 (not (image_available img2)))
  (at 1653 (image_available img3))
  (at 1661 (not (image_available img3)))
  (at 1599 (image_available img4))
  (at 1607 (not (image_available img4)))
  (at 1653 (image_available img5))
  (at 1661 (not (image_available img5)))
  (at 1689 (image_available img6))
  (at 1697 (not (image_available img6)))
  (at 1579 (image_available img7))
  (at 1587 (not (image_available img7)))
  (at 1600 (image_available img8))
  (at 1608 (not (image_available img8)))
  (at 1682 (image_available img9))
  (at 1690 (not (image_available img9)))
  (at 1556 (image_available img10))
  (at 1564 (not (image_available img10)))
  (at 2116 (image_available img1))
  (at 2124 (not (image_available img1)))
  (at 2035 (image_available img2))
  (at 2043 (not (image_available img2)))
  (at 2013 (image_available img3))
  (at 2021 (not (image_available img3)))
  (at 1959 (image_available img4))
  (at 1967 (not (image_available img4)))
  (at 2013 (image_available img5))
  (at 2021 (not (image_available img5)))
  (at 2049 (image_available img6))
  (at 2057 (not (image_available img6)))
  (at 1939 (image_available img7))
  (at 1947 (not (image_available img7)))
  (at 1960 (image_available img8))
  (at 1968 (not (image_available img8)))
  (at 2042 (image_available img9))
  (at 2050 (not (image_available img9)))
  (at 1916 (image_available img10))
  (at 1924 (not (image_available img10)))
  (at 2476 (image_available img1))
  (at 2484 (not (image_available img1)))
  (at 2395 (image_available img2))
  (at 2403 (not (image_available img2)))
  (at 2373 (image_available img3))
  (at 2381 (not (image_available img3)))
  (at 2319 (image_available img4))
  (at 2327 (not (image_available img4)))
  (at 2373 (image_available img5))
  (at 2381 (not (image_available img5)))
  (at 2409 (image_available img6))
  (at 2417 (not (image_available img6)))
  (at 2299 (image_available img7))
  (at 2307 (not (image_available img7)))
  (at 2320 (image_available img8))
  (at 2328 (not (image_available img8)))
  (at 2402 (image_available img9))
  (at 2410 (not (image_available img9)))
  (at 2276 (image_available img10))
  (at 2284 (not (image_available img10)))
  (at 2836 (image_available img1))
  (at 2844 (not (image_available img1)))
  (at 2755 (image_available img2))
  (at 2763 (not (image_available img2)))
  (at 2733 (image_available img3))
  (at 2741 (not (image_available img3)))
  (at 2679 (image_available img4))
  (at 2687 (not (image_available img4)))
  (at 2733 (image_available img5))
  (at 2741 (not (image_available img5)))
  (at 2769 (image_available img6))
  (at 2777 (not (image_available img6)))
  (at 2659 (image_available img7))
  (at 2667 (not (image_available img7)))
  (at 2680 (image_available img8))
  (at 2688 (not (image_available img8)))
  (at 2762 (image_available img9))
  (at 2770 (not (image_available img9)))
  (at 2636 (image_available img10))
  (at 2644 (not (image_available img10)))
  (at 3196 (image_available img1))
  (at 3204 (not (image_available img1)))
  (at 3115 (image_available img2))
  (at 3123 (not (image_available img2)))
  (at 3093 (image_available img3))
  (at 3101 (not (image_available img3)))
  (at 3039 (image_available img4))
  (at 3047 (not (image_available img4)))
  (at 3093 (image_available img5))
  (at 3101 (not (image_available img5)))
  (at 3129 (image_available img6))
  (at 3137 (not (image_available img6)))
  (at 3019 (image_available img7))
  (at 3027 (not (image_available img7)))
  (at 3040 (image_available img8))
  (at 3048 (not (image_available img8)))
  (at 3122 (image_available img9))
  (at 3130 (not (image_available img9)))
  (at 2996 (image_available img10))
  (at 3004 (not (image_available img10)))
  (at 3556 (image_available img1))
  (at 3564 (not (image_available img1)))
  (at 3475 (image_available img2))
  (at 3483 (not (image_available img2)))
  (at 3453 (image_available img3))
  (at 3461 (not (image_available img3)))
  (at 3399 (image_available img4))
  (at 3407 (not (image_available img4)))
  (at 3453 (image_available img5))
  (at 3461 (not (image_available img5)))
  (at 3489 (image_available img6))
  (at 3497 (not (image_available img6)))
  (at 3379 (image_available img7))
  (at 3387 (not (image_available img7)))
  (at 3400 (image_available img8))
  (at 3408 (not (image_available img8)))
  (at 3482 (image_available img9))
  (at 3490 (not (image_available img9)))
  (at 3356 (image_available img10))
  (at 3364 (not (image_available img10)))
  (at 3916 (image_available img1))
  (at 3924 (not (image_available img1)))
  (at 3835 (image_available img2))
  (at 3843 (not (image_available img2)))
  (at 3813 (image_available img3))
  (at 3821 (not (image_available img3)))
  (at 3759 (image_available img4))
  (at 3767 (not (image_available img4)))
  (at 3813 (image_available img5))
  (at 3821 (not (image_available img5)))
  (at 3849 (image_available img6))
  (at 3857 (not (image_available img6)))
  (at 3739 (image_available img7))
  (at 3747 (not (image_available img7)))
  (at 3760 (image_available img8))
  (at 3768 (not (image_available img8)))
  (at 3842 (image_available img9))
  (at 3850 (not (image_available img9)))
  (at 3716 (image_available img10))
  (at 3724 (not (image_available img10)))
  (at 4276 (image_available img1))
  (at 4284 (not (image_available img1)))
  (at 4195 (image_available img2))
  (at 4203 (not (image_available img2)))
  (at 4173 (image_available img3))
  (at 4181 (not (image_available img3)))
  (at 4119 (image_available img4))
  (at 4127 (not (image_available img4)))
  (at 4173 (image_available img5))
  (at 4181 (not (image_available img5)))
  (at 4209 (image_available img6))
  (at 4217 (not (image_available img6)))
  (at 4099 (image_available img7))
  (at 4107 (not (image_available img7)))
  (at 4120 (image_available img8))
  (at 4128 (not (image_available img8)))
  (at 4202 (image_available img9))
  (at 4210 (not (image_available img9)))
  (at 4076 (image_available img10))
  (at 4084 (not (image_available img10)))
  (at 4636 (image_available img1))
  (at 4644 (not (image_available img1)))
  (at 4555 (image_available img2))
  (at 4563 (not (image_available img2)))
  (at 4533 (image_available img3))
  (at 4541 (not (image_available img3)))
  (at 4479 (image_available img4))
  (at 4487 (not (image_available img4)))
  (at 4533 (image_available img5))
  (at 4541 (not (image_available img5)))
  (at 4569 (image_available img6))
  (at 4577 (not (image_available img6)))
  (at 4459 (image_available img7))
  (at 4467 (not (image_available img7)))
  (at 4480 (image_available img8))
  (at 4488 (not (image_available img8)))
  (at 4562 (image_available img9))
  (at 4570 (not (image_available img9)))
  (at 4436 (image_available img10))
  (at 4444 (not (image_available img10)))
  (at 4996 (image_available img1))
  (at 5004 (not (image_available img1)))
  (at 4915 (image_available img2))
  (at 4923 (not (image_available img2)))
  (at 4893 (image_available img3))
  (at 4901 (not (image_available img3)))
  (at 4839 (image_available img4))
  (at 4847 (not (image_available img4)))
  (at 4893 (image_available img5))
  (at 4901 (not (image_available img5)))
  (at 4929 (image_available img6))
  (at 4937 (not (image_available img6)))
  (at 4819 (image_available img7))
  (at 4827 (not (image_available img7)))
  (at 4840 (image_available img8))
  (at 4848 (not (image_available img8)))
  (at 4922 (image_available img9))
  (at 4930 (not (image_available img9)))
  (at 4796 (image_available img10))
  (at 4804 (not (image_available img10)))
  (at 5356 (image_available img1))
  (at 5364 (not (image_available img1)))
  (at 5275 (image_available img2))
  (at 5283 (not (image_available img2)))
  (at 5253 (image_available img3))
  (at 5261 (not (image_available img3)))
  (at 5199 (image_available img4))
  (at 5207 (not (image_available img4)))
  (at 5253 (image_available img5))
  (at 5261 (not (image_available img5)))
  (at 5289 (image_available img6))
  (at 5297 (not (image_available img6)))
  (at 5179 (image_available img7))
  (at 5187 (not (image_available img7)))
  (at 5200 (image_available img8))
  (at 5208 (not (image_available img8)))
  (at 5282 (image_available img9))
  (at 5290 (not (image_available img9)))
  (at 5156 (image_available img10))
  (at 5164 (not (image_available img10)))
  (at 5716 (image_available img1))
  (at 5724 (not (image_available img1)))
  (at 5635 (image_available img2))
  (at 5643 (not (image_available img2)))
  (at 5613 (image_available img3))
  (at 5621 (not (image_available img3)))
  (at 5559 (image_available img4))
  (at 5567 (not (image_available img4)))
  (at 5613 (image_available img5))
  (at 5621 (not (image_available img5)))
  (at 5649 (image_available img6))
  (at 5657 (not (image_available img6)))
  (at 5539 (image_available img7))
  (at 5547 (not (image_available img7)))
  (at 5560 (image_available img8))
  (at 5568 (not (image_available img8)))
  (at 5642 (image_available img9))
  (at 5650 (not (image_available img9)))
  (at 5516 (image_available img10))
  (at 5524 (not (image_available img10)))
  (at 6076 (image_available img1))
  (at 6084 (not (image_available img1)))
  (at 5995 (image_available img2))
  (at 6003 (not (image_available img2)))
  (at 5973 (image_available img3))
  (at 5981 (not (image_available img3)))
  (at 5919 (image_available img4))
  (at 5927 (not (image_available img4)))
  (at 5973 (image_available img5))
  (at 5981 (not (image_available img5)))
  (at 6009 (image_available img6))
  (at 6017 (not (image_available img6)))
  (at 5899 (image_available img7))
  (at 5907 (not (image_available img7)))
  (at 5920 (image_available img8))
  (at 5928 (not (image_available img8)))
  (at 6002 (image_available img9))
  (at 6010 (not (image_available img9)))
  (at 5876 (image_available img10))
  (at 5884 (not (image_available img10)))
  (at 6436 (image_available img1))
  (at 6444 (not (image_available img1)))
  (at 6355 (image_available img2))
  (at 6363 (not (image_available img2)))
  (at 6333 (image_available img3))
  (at 6341 (not (image_available img3)))
  (at 6279 (image_available img4))
  (at 6287 (not (image_available img4)))
  (at 6333 (image_available img5))
  (at 6341 (not (image_available img5)))
  (at 6369 (image_available img6))
  (at 6377 (not (image_available img6)))
  (at 6259 (image_available img7))
  (at 6267 (not (image_available img7)))
  (at 6280 (image_available img8))
  (at 6288 (not (image_available img8)))
  (at 6362 (image_available img9))
  (at 6370 (not (image_available img9)))
  (at 6236 (image_available img10))
  (at 6244 (not (image_available img10)))
  (at 6796 (image_available img1))
  (at 6804 (not (image_available img1)))
  (at 6715 (image_available img2))
  (at 6723 (not (image_available img2)))
  (at 6693 (image_available img3))
  (at 6701 (not (image_available img3)))
  (at 6639 (image_available img4))
  (at 6647 (not (image_available img4)))
  (at 6693 (image_available img5))
  (at 6701 (not (image_available img5)))
  (at 6729 (image_available img6))
  (at 6737 (not (image_available img6)))
  (at 6619 (image_available img7))
  (at 6627 (not (image_available img7)))
  (at 6640 (image_available img8))
  (at 6648 (not (image_available img8)))
  (at 6722 (image_available img9))
  (at 6730 (not (image_available img9)))
  (at 6596 (image_available img10))
  (at 6604 (not (image_available img10)))
  (at 7156 (image_available img1))
  (at 7164 (not (image_available img1)))
  (at 7075 (image_available img2))
  (at 7083 (not (image_available img2)))
  (at 7053 (image_available img3))
  (at 7061 (not (image_available img3)))
  (at 6999 (image_available img4))
  (at 7007 (not (image_available img4)))
  (at 7053 (image_available img5))
  (at 7061 (not (image_available img5)))
  (at 7089 (image_available img6))
  (at 7097 (not (image_available img6)))
  (at 6979 (image_available img7))
  (at 6987 (not (image_available img7)))
  (at 7000 (image_available img8))
  (at 7008 (not (image_available img8)))
  (at 7082 (image_available img9))
  (at 7090 (not (image_available img9)))
  (at 6956 (image_available img10))
  (at 6964 (not (image_available img10)))
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
  (<= (image_score img1) 1.0)

(>= (total_score) 1)
))
(:metric maximize 
  (image_score img1)
)
)