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
  (memory_free mem5)
  (memory_free mem6)
  (memory_free mem7)
  (memory_free mem8)
  (memory_free mem9)

   (memory_taken mem2 img3)
   (memory_taken mem3 img18)
   (memory_taken mem4 img5)

(image_analysed mem2 img3)
(image_analysed mem3 img18)
(image_analysed mem4 img5)

  (at 64 (image_available img3))
  (at 72 (not (image_available img3)))
  (at 0 (image_available img8))
  (at 7 (not (image_available img8)))
  (at 0 (image_available img14))
  (at 3 (not (image_available img14)))
  (at 48 (image_available img19))
  (at 56 (not (image_available img19)))
  (at 1 (dump_available))
  (at 9.0 (not (dump_available)))

)
(:goal (and
  (> (image_score img1) 0)
  (<= (image_score img1) 2.0)

  (> (image_score img2) 0)
  (<= (image_score img2) 4.0)

  (> (image_score img3) 0)
  (<= (image_score img3) 6.0)

  (> (image_score img5) 0)
  (<= (image_score img5) 5.0)

  (> (image_score img10) 0)
  (<= (image_score img10) 5.0)

  (> (image_score img16) 0)
  (<= (image_score img16) 7.0)

  (> (image_score img20) 0)
  (<= (image_score img20) 3.0)

(>= (total_score) 7)
))
(:metric maximize (+
  (image_score img1)
    (+ (image_score img2)
      (+ (image_score img3)
        (+ (image_score img5)
          (+ (image_score img10)
            (+ (image_score img16)
              (image_score img20)
            )
          )
        )
      )
    )
  )
)
)
