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
  (memory_free mem3)
  (memory_free mem4)
  (memory_free mem5)
  (memory_free mem6)
  (memory_free mem7)
  (memory_free mem8)
  (memory_free mem9)

   (memory_taken mem2 img1)

(image_analysed mem2 img1)

  (at 4 (image_available img3))
  (at 12 (not (image_available img3)))
  (at 3 (image_available img8))
  (at 11 (not (image_available img8)))
  (at 31 (image_available img9))
  (at 39 (not (image_available img9)))
  (at 2 (image_available img10))
  (at 10 (not (image_available img10)))
  (at 137 (image_available img1))
  (at 145 (not (image_available img1)))
  (at 317 (image_available img2))
  (at 325 (not (image_available img2)))
  (at 364 (image_available img3))
  (at 372 (not (image_available img3)))
  (at 183 (image_available img4))
  (at 191 (not (image_available img4)))
  (at 121 (image_available img5))
  (at 129 (not (image_available img5)))
  (at 274 (image_available img6))
  (at 282 (not (image_available img6)))
  (at 201 (image_available img7))
  (at 209 (not (image_available img7)))
  (at 363 (image_available img8))
  (at 371 (not (image_available img8)))
  (at 391 (image_available img9))
  (at 399 (not (image_available img9)))
  (at 362 (image_available img10))
  (at 370 (not (image_available img10)))
  (at 497 (image_available img1))
  (at 505 (not (image_available img1)))
  (at 677 (image_available img2))
  (at 685 (not (image_available img2)))
  (at 724 (image_available img3))
  (at 732 (not (image_available img3)))
  (at 543 (image_available img4))
  (at 551 (not (image_available img4)))
  (at 481 (image_available img5))
  (at 489 (not (image_available img5)))
  (at 634 (image_available img6))
  (at 642 (not (image_available img6)))
  (at 561 (image_available img7))
  (at 569 (not (image_available img7)))
  (at 723 (image_available img8))
  (at 731 (not (image_available img8)))
  (at 751 (image_available img9))
  (at 759 (not (image_available img9)))
  (at 722 (image_available img10))
  (at 730 (not (image_available img10)))
  (at 857 (image_available img1))
  (at 865 (not (image_available img1)))
  (at 1037 (image_available img2))
  (at 1045 (not (image_available img2)))
  (at 1084 (image_available img3))
  (at 1092 (not (image_available img3)))
  (at 903 (image_available img4))
  (at 911 (not (image_available img4)))
  (at 841 (image_available img5))
  (at 849 (not (image_available img5)))
  (at 994 (image_available img6))
  (at 1002 (not (image_available img6)))
  (at 921 (image_available img7))
  (at 929 (not (image_available img7)))
  (at 1083 (image_available img8))
  (at 1091 (not (image_available img8)))
  (at 1111 (image_available img9))
  (at 1119 (not (image_available img9)))
  (at 1082 (image_available img10))
  (at 1090 (not (image_available img10)))
  (at 1217 (image_available img1))
  (at 1225 (not (image_available img1)))
  (at 1397 (image_available img2))
  (at 1405 (not (image_available img2)))
  (at 1444 (image_available img3))
  (at 1452 (not (image_available img3)))
  (at 1263 (image_available img4))
  (at 1271 (not (image_available img4)))
  (at 1201 (image_available img5))
  (at 1209 (not (image_available img5)))
  (at 1354 (image_available img6))
  (at 1362 (not (image_available img6)))
  (at 1281 (image_available img7))
  (at 1289 (not (image_available img7)))
  (at 1443 (image_available img8))
  (at 1451 (not (image_available img8)))
  (at 1471 (image_available img9))
  (at 1479 (not (image_available img9)))
  (at 1442 (image_available img10))
  (at 1450 (not (image_available img10)))
  (at 1 (dump_available))
  (at 21.0 (not (dump_available)))
  (at 163.0 (dump_available))
  (at 201.0 (not (dump_available)))
  (at 343.0 (dump_available))
  (at 381.0 (not (dump_available)))
  (at 523.0 (dump_available))
  (at 561.0 (not (dump_available)))
  (at 703.0 (dump_available))
  (at 741.0 (not (dump_available)))
  (at 883.0 (dump_available))
  (at 921.0 (not (dump_available)))
  (at 1063.0 (dump_available))
  (at 1101.0 (not (dump_available)))
  (at 1243.0 (dump_available))
  (at 1281.0 (not (dump_available)))
  (at 1423.0 (dump_available))
  (at 1461.0 (not (dump_available)))

)
(:goal (and
  (> (image_score img8) 0)
  (<= (image_score img8) 1)

(>= (total_score) 1)
))
(:metric maximize 
  (image_score img8)
)
)
