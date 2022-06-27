(define(problem satprob)
(:domain SimpleSatellite)
(:objects
  mem0 mem1 - memory
 img1 img2 - image
)
(:init
  (sat_free)
  (= (image_score img1) 0)
  (= (image_score img2) 0)
  (= (total_score) 0)

  (memory_free mem1)
  (memory_free mem1)
  (memory_free mem1)
  (memory_free mem1)

  (at 1298.997 (image_available img1))
  (at 1303.997 (not (image_available img1)))
  (at 1368.065 (image_available img2))
  (at 1373.065 (not (image_available img2)))
  (at 1658.997 (image_available img1))
  (at 1663.997 (not (image_available img1)))
  (at 1728.065 (image_available img2))
  (at 1733.065 (not (image_available img2)))
  (at 2018.997 (image_available img1))
  (at 2023.997 (not (image_available img1)))
  (at 2088.065 (image_available img2))
  (at 2093.065 (not (image_available img2)))
  (at 2378.997 (image_available img1))
  (at 2383.997 (not (image_available img1)))
  (at 2448.065 (image_available img2))
  (at 2453.065 (not (image_available img2)))
  (at 2738.997 (image_available img1))
  (at 2743.997 (not (image_available img1)))
  (at 2808.065 (image_available img2))
  (at 2813.065 (not (image_available img2)))
  (at 3098.997 (image_available img1))
  (at 3103.997 (not (image_available img1)))
  (at 3168.065 (image_available img2))
  (at 3173.065 (not (image_available img2)))
  (at 3458.997 (image_available img1))
  (at 3463.997 (not (image_available img1)))
  (at 3528.065 (image_available img2))
  (at 3533.065 (not (image_available img2)))
  (at 3818.997 (image_available img1))
  (at 3823.997 (not (image_available img1)))
  (at 3888.065 (image_available img2))
  (at 3893.065 (not (image_available img2)))
  (at 1353.0 (dump_available))
  (at 1383.0 (not (dump_available)))
  (at 1713.0 (dump_available))
  (at 1743.0 (not (dump_available)))
  (at 2073.0 (dump_available))
  (at 2103.0 (not (dump_available)))
  (at 2433.0 (dump_available))
  (at 2463.0 (not (dump_available)))
  (at 2793.0 (dump_available))
  (at 2823.0 (not (dump_available)))
  (at 3153.0 (dump_available))
  (at 3183.0 (not (dump_available)))
  (at 3513.0 (dump_available))
  (at 3543.0 (not (dump_available)))
  (at 3873.0 (dump_available))
  (at 3903.0 (not (dump_available)))

)
(:goal (and
  (= (image_score img1) 1)
)))
