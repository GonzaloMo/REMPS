(define(problem satprob)
(:domain SimpleSatellite)
(:objects
  mem0 mem1 mem2 mem3 - memory
 img1 img2 img3 img4 - image
)
(:init
  (sat_free)
  (= (image_score img1) 0)
  (= (image_score img2) 0)
  (= (image_score img3) 0)
  (= (image_score img4) 0)
  (= (total_score) 0)

  (memory_free mem3)
  (memory_free mem3)
  (memory_free mem3)
  (memory_free mem3)
  (memory_free mem3)
  (memory_free mem3)
  (memory_free mem3)
  (memory_free mem3)
  (memory_free mem3)
  (memory_free mem3)

  (at 67.143 (image_available img1))
  (at 72.143 (not (image_available img1)))
  (at 12.218 (image_available img2))
  (at 17.218 (not (image_available img2)))
  (at 35.992 (image_available img3))
  (at 40.992 (not (image_available img3)))
  (at 183.024 (image_available img4))
  (at 188.024 (not (image_available img4)))
  (at 427.143 (image_available img1))
  (at 432.143 (not (image_available img1)))
  (at 372.218 (image_available img2))
  (at 377.218 (not (image_available img2)))
  (at 395.992 (image_available img3))
  (at 400.992 (not (image_available img3)))
  (at 543.024 (image_available img4))
  (at 548.024 (not (image_available img4)))
  (at 787.143 (image_available img1))
  (at 792.143 (not (image_available img1)))
  (at 732.218 (image_available img2))
  (at 737.218 (not (image_available img2)))
  (at 755.992 (image_available img3))
  (at 760.992 (not (image_available img3)))
  (at 903.024 (image_available img4))
  (at 908.024 (not (image_available img4)))
  (at 1147.143 (image_available img1))
  (at 1152.143 (not (image_available img1)))
  (at 1092.218 (image_available img2))
  (at 1097.218 (not (image_available img2)))
  (at 1115.992 (image_available img3))
  (at 1120.992 (not (image_available img3)))
  (at 1263.024 (image_available img4))
  (at 1268.024 (not (image_available img4)))
  (at 1507.143 (image_available img1))
  (at 1512.143 (not (image_available img1)))
  (at 1452.218 (image_available img2))
  (at 1457.218 (not (image_available img2)))
  (at 1475.992 (image_available img3))
  (at 1480.992 (not (image_available img3)))
  (at 1623.024 (image_available img4))
  (at 1628.024 (not (image_available img4)))
  (at 1867.143 (image_available img1))
  (at 1872.143 (not (image_available img1)))
  (at 1812.218 (image_available img2))
  (at 1817.218 (not (image_available img2)))
  (at 1835.992 (image_available img3))
  (at 1840.992 (not (image_available img3)))
  (at 1983.024 (image_available img4))
  (at 1988.024 (not (image_available img4)))
  (at 2227.143 (image_available img1))
  (at 2232.143 (not (image_available img1)))
  (at 2172.218 (image_available img2))
  (at 2177.218 (not (image_available img2)))
  (at 2195.992 (image_available img3))
  (at 2200.992 (not (image_available img3)))
  (at 2343.024 (image_available img4))
  (at 2348.024 (not (image_available img4)))
  (at 2587.143 (image_available img1))
  (at 2592.143 (not (image_available img1)))
  (at 2532.218 (image_available img2))
  (at 2537.218 (not (image_available img2)))
  (at 2555.992 (image_available img3))
  (at 2560.992 (not (image_available img3)))
  (at 2703.024 (image_available img4))
  (at 2708.024 (not (image_available img4)))
  (at 273.0 (dump_available))
  (at 303.0 (not (dump_available)))
  (at 633.0 (dump_available))
  (at 663.0 (not (dump_available)))
  (at 993.0 (dump_available))
  (at 1023.0 (not (dump_available)))
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

)
(:goal (and
  (= (image_score img1) 1)
  (= (image_score img3) 1)
  (= (image_score img4) 1)
)))
