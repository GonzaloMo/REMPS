(define(problem satprob)
(:domain SimpleSatellite)
(:objects
  mem0 mem1 mem2 mem3 mem4 mem5 mem6 mem7 mem8 mem9 - memory
 img1 img2 img3 img4 img5 - image
)
(:init
  (sat_free)
  (= (image_score img1) 0)
  (= (image_score img2) 0)
  (= (image_score img3) 0)
  (= (image_score img4) 0)
  (= (image_score img5) 0)
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



  (at 0 (image_available img2))
  (at 2 (not (image_available img2)))
  (at 193 (image_available img1))
  (at 201 (not (image_available img1)))
  (at 354 (image_available img2))
  (at 362 (not (image_available img2)))
  (at 255 (image_available img3))
  (at 263 (not (image_available img3)))
  (at 328 (image_available img4))
  (at 336 (not (image_available img4)))
  (at 90 (image_available img5))
  (at 98 (not (image_available img5)))
  (at 553 (image_available img1))
  (at 561 (not (image_available img1)))
  (at 714 (image_available img2))
  (at 722 (not (image_available img2)))
  (at 615 (image_available img3))
  (at 623 (not (image_available img3)))
  (at 688 (image_available img4))
  (at 696 (not (image_available img4)))
  (at 450 (image_available img5))
  (at 458 (not (image_available img5)))
  (at 913 (image_available img1))
  (at 921 (not (image_available img1)))
  (at 1074 (image_available img2))
  (at 1082 (not (image_available img2)))
  (at 975 (image_available img3))
  (at 983 (not (image_available img3)))
  (at 1048 (image_available img4))
  (at 1056 (not (image_available img4)))
  (at 810 (image_available img5))
  (at 818 (not (image_available img5)))
  (at 1273 (image_available img1))
  (at 1281 (not (image_available img1)))
  (at 1434 (image_available img2))
  (at 1442 (not (image_available img2)))
  (at 1335 (image_available img3))
  (at 1343 (not (image_available img3)))
  (at 1408 (image_available img4))
  (at 1416 (not (image_available img4)))
  (at 1170 (image_available img5))
  (at 1178 (not (image_available img5)))
  (at 1633 (image_available img1))
  (at 1641 (not (image_available img1)))
  (at 1794 (image_available img2))
  (at 1802 (not (image_available img2)))
  (at 1695 (image_available img3))
  (at 1703 (not (image_available img3)))
  (at 1768 (image_available img4))
  (at 1776 (not (image_available img4)))
  (at 1530 (image_available img5))
  (at 1538 (not (image_available img5)))
  (at 1993 (image_available img1))
  (at 2001 (not (image_available img1)))
  (at 2154 (image_available img2))
  (at 2162 (not (image_available img2)))
  (at 2055 (image_available img3))
  (at 2063 (not (image_available img3)))
  (at 2128 (image_available img4))
  (at 2136 (not (image_available img4)))
  (at 1890 (image_available img5))
  (at 1898 (not (image_available img5)))
  (at 2353 (image_available img1))
  (at 2361 (not (image_available img1)))
  (at 2514 (image_available img2))
  (at 2522 (not (image_available img2)))
  (at 2415 (image_available img3))
  (at 2423 (not (image_available img3)))
  (at 2488 (image_available img4))
  (at 2496 (not (image_available img4)))
  (at 2250 (image_available img5))
  (at 2258 (not (image_available img5)))
  (at 2713 (image_available img1))
  (at 2721 (not (image_available img1)))
  (at 2874 (image_available img2))
  (at 2882 (not (image_available img2)))
  (at 2775 (image_available img3))
  (at 2783 (not (image_available img3)))
  (at 2848 (image_available img4))
  (at 2856 (not (image_available img4)))
  (at 2610 (image_available img5))
  (at 2618 (not (image_available img5)))
  (at 3073 (image_available img1))
  (at 3081 (not (image_available img1)))
  (at 3234 (image_available img2))
  (at 3242 (not (image_available img2)))
  (at 3135 (image_available img3))
  (at 3143 (not (image_available img3)))
  (at 3208 (image_available img4))
  (at 3216 (not (image_available img4)))
  (at 2970 (image_available img5))
  (at 2978 (not (image_available img5)))
  (at 3433 (image_available img1))
  (at 3441 (not (image_available img1)))
  (at 3594 (image_available img2))
  (at 3602 (not (image_available img2)))
  (at 3495 (image_available img3))
  (at 3503 (not (image_available img3)))
  (at 3568 (image_available img4))
  (at 3576 (not (image_available img4)))
  (at 3330 (image_available img5))
  (at 3338 (not (image_available img5)))
  (at 3793 (image_available img1))
  (at 3801 (not (image_available img1)))
  (at 3954 (image_available img2))
  (at 3962 (not (image_available img2)))
  (at 3855 (image_available img3))
  (at 3863 (not (image_available img3)))
  (at 3928 (image_available img4))
  (at 3936 (not (image_available img4)))
  (at 3690 (image_available img5))
  (at 3698 (not (image_available img5)))
  (at 4153 (image_available img1))
  (at 4161 (not (image_available img1)))
  (at 4314 (image_available img2))
  (at 4322 (not (image_available img2)))
  (at 4215 (image_available img3))
  (at 4223 (not (image_available img3)))
  (at 4288 (image_available img4))
  (at 4296 (not (image_available img4)))
  (at 4050 (image_available img5))
  (at 4058 (not (image_available img5)))
  (at 4513 (image_available img1))
  (at 4521 (not (image_available img1)))
  (at 4674 (image_available img2))
  (at 4682 (not (image_available img2)))
  (at 4575 (image_available img3))
  (at 4583 (not (image_available img3)))
  (at 4648 (image_available img4))
  (at 4656 (not (image_available img4)))
  (at 4410 (image_available img5))
  (at 4418 (not (image_available img5)))
  (at 4873 (image_available img1))
  (at 4881 (not (image_available img1)))
  (at 5034 (image_available img2))
  (at 5042 (not (image_available img2)))
  (at 4935 (image_available img3))
  (at 4943 (not (image_available img3)))
  (at 5008 (image_available img4))
  (at 5016 (not (image_available img4)))
  (at 4770 (image_available img5))
  (at 4778 (not (image_available img5)))
  (at 5233 (image_available img1))
  (at 5241 (not (image_available img1)))
  (at 5394 (image_available img2))
  (at 5402 (not (image_available img2)))
  (at 5295 (image_available img3))
  (at 5303 (not (image_available img3)))
  (at 5368 (image_available img4))
  (at 5376 (not (image_available img4)))
  (at 5130 (image_available img5))
  (at 5138 (not (image_available img5)))
  (at 5593 (image_available img1))
  (at 5601 (not (image_available img1)))
  (at 5754 (image_available img2))
  (at 5762 (not (image_available img2)))
  (at 5655 (image_available img3))
  (at 5663 (not (image_available img3)))
  (at 5728 (image_available img4))
  (at 5736 (not (image_available img4)))
  (at 5490 (image_available img5))
  (at 5498 (not (image_available img5)))
  (at 5953 (image_available img1))
  (at 5961 (not (image_available img1)))
  (at 6114 (image_available img2))
  (at 6122 (not (image_available img2)))
  (at 6015 (image_available img3))
  (at 6023 (not (image_available img3)))
  (at 6088 (image_available img4))
  (at 6096 (not (image_available img4)))
  (at 5850 (image_available img5))
  (at 5858 (not (image_available img5)))
  (at 6313 (image_available img1))
  (at 6321 (not (image_available img1)))
  (at 6474 (image_available img2))
  (at 6482 (not (image_available img2)))
  (at 6375 (image_available img3))
  (at 6383 (not (image_available img3)))
  (at 6448 (image_available img4))
  (at 6456 (not (image_available img4)))
  (at 6210 (image_available img5))
  (at 6218 (not (image_available img5)))
  (at 1 (dump_available))
  (at 23.0 (not (dump_available)))
  (at 165.0 (dump_available))
  (at 203.0 (not (dump_available)))
  (at 345.0 (dump_available))
  (at 383.0 (not (dump_available)))
  (at 525.0 (dump_available))
  (at 563.0 (not (dump_available)))
  (at 705.0 (dump_available))
  (at 743.0 (not (dump_available)))
  (at 885.0 (dump_available))
  (at 923.0 (not (dump_available)))
  (at 1065.0 (dump_available))
  (at 1103.0 (not (dump_available)))
  (at 1245.0 (dump_available))
  (at 1283.0 (not (dump_available)))
  (at 1425.0 (dump_available))
  (at 1463.0 (not (dump_available)))
  (at 1605.0 (dump_available))
  (at 1643.0 (not (dump_available)))
  (at 1785.0 (dump_available))
  (at 1823.0 (not (dump_available)))
  (at 1965.0 (dump_available))
  (at 2003.0 (not (dump_available)))
  (at 2145.0 (dump_available))
  (at 2183.0 (not (dump_available)))
  (at 2325.0 (dump_available))
  (at 2363.0 (not (dump_available)))
  (at 2505.0 (dump_available))
  (at 2543.0 (not (dump_available)))
  (at 2685.0 (dump_available))
  (at 2723.0 (not (dump_available)))
  (at 2865.0 (dump_available))
  (at 2903.0 (not (dump_available)))
  (at 3045.0 (dump_available))
  (at 3083.0 (not (dump_available)))
  (at 3225.0 (dump_available))
  (at 3263.0 (not (dump_available)))
  (at 3405.0 (dump_available))
  (at 3443.0 (not (dump_available)))
  (at 3585.0 (dump_available))
  (at 3623.0 (not (dump_available)))
  (at 3765.0 (dump_available))
  (at 3803.0 (not (dump_available)))
  (at 3945.0 (dump_available))
  (at 3983.0 (not (dump_available)))
  (at 4125.0 (dump_available))
  (at 4163.0 (not (dump_available)))
  (at 4305.0 (dump_available))
  (at 4343.0 (not (dump_available)))
  (at 4485.0 (dump_available))
  (at 4523.0 (not (dump_available)))
  (at 4665.0 (dump_available))
  (at 4703.0 (not (dump_available)))
  (at 4845.0 (dump_available))
  (at 4883.0 (not (dump_available)))
  (at 5025.0 (dump_available))
  (at 5063.0 (not (dump_available)))
  (at 5205.0 (dump_available))
  (at 5243.0 (not (dump_available)))
  (at 5385.0 (dump_available))
  (at 5423.0 (not (dump_available)))
  (at 5565.0 (dump_available))
  (at 5603.0 (not (dump_available)))
  (at 5745.0 (dump_available))
  (at 5783.0 (not (dump_available)))
  (at 5925.0 (dump_available))
  (at 5963.0 (not (dump_available)))
  (at 6105.0 (dump_available))
  (at 6143.0 (not (dump_available)))
  (at 6285.0 (dump_available))
  (at 6323.0 (not (dump_available)))
  (at 6465.0 (dump_available))
  (at 6503.0 (not (dump_available)))

)
(:goal (and
  (> (image_score img1) 0)
  (<= (image_score img1) 1)

(>= (total_score) 1)
))
(:metric maximize 
  (image_score img1)
)
)
