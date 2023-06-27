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
  (memory_free mem5)
  (memory_free mem6)
  (memory_free mem7)
  (memory_free mem8)
  (memory_free mem9)

   (memory_taken mem4 img5)

(image_analysed mem4 img5)

  (at 0 (image_available img6))
  (at 7 (not (image_available img6)))
  (at 0 (image_available img7))
  (at 1 (not (image_available img7)))
  (at 23 (image_available img10))
  (at 31 (not (image_available img10)))
  (at 290 (image_available img1))
  (at 298 (not (image_available img1)))
  (at 111 (image_available img2))
  (at 119 (not (image_available img2)))
  (at 162 (image_available img3))
  (at 170 (not (image_available img3)))
  (at 220 (image_available img4))
  (at 228 (not (image_available img4)))
  (at 315 (image_available img5))
  (at 323 (not (image_available img5)))
  (at 359 (image_available img6))
  (at 367 (not (image_available img6)))
  (at 353 (image_available img7))
  (at 361 (not (image_available img7)))
  (at 159 (image_available img8))
  (at 167 (not (image_available img8)))
  (at 161 (image_available img9))
  (at 169 (not (image_available img9)))
  (at 383 (image_available img10))
  (at 391 (not (image_available img10)))
  (at 650 (image_available img1))
  (at 658 (not (image_available img1)))
  (at 471 (image_available img2))
  (at 479 (not (image_available img2)))
  (at 522 (image_available img3))
  (at 530 (not (image_available img3)))
  (at 580 (image_available img4))
  (at 588 (not (image_available img4)))
  (at 675 (image_available img5))
  (at 683 (not (image_available img5)))
  (at 719 (image_available img6))
  (at 727 (not (image_available img6)))
  (at 713 (image_available img7))
  (at 721 (not (image_available img7)))
  (at 519 (image_available img8))
  (at 527 (not (image_available img8)))
  (at 521 (image_available img9))
  (at 529 (not (image_available img9)))
  (at 743 (image_available img10))
  (at 751 (not (image_available img10)))
  (at 1 (dump_available))
  (at 11.0 (not (dump_available)))
  (at 153.0 (dump_available))
  (at 191.0 (not (dump_available)))
  (at 333.0 (dump_available))
  (at 371.0 (not (dump_available)))
  (at 513.0 (dump_available))
  (at 551.0 (not (dump_available)))
  (at 693.0 (dump_available))
  (at 731.0 (not (dump_available)))

)
(:goal (and
  (> (image_score img5) 0)
  (<= (image_score img5) 1)

(>= (total_score) 1)
))
(:metric maximize 
  (image_score img5)
)
)