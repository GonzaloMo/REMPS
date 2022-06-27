Number of literals: 17
Constructing lookup tables: [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%] [110%] [120%]
Post filtering unreachable actions:  [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%] [110%] [120%]
Recognised a monotonic-change-induced limit on -1.000*var0(image_score img1)
- Must be >= -3.000
Pruning (take_image img1 mem0) - never appeared in initial RPG
Pruning (take_image img2 mem0) - never appeared in initial RPG
Pruning (analyse_image img1 mem0) - never appeared in initial RPG
Pruning (analyse_image img2 mem0) - never appeared in initial RPG
Pruning (dump_image img1 mem0) - never appeared in initial RPG
Pruning (dump_image img2 mem0) - never appeared in initial RPG
66% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 8.000

Resorting to best-first search
b (7.000 | 3107.685)b (6.000 | 3156.686)b (4.000 | 3176.687)b (2.000 | 3536.687);;;; Solution Found
; States evaluated: 153
; Cost: 3896.687
; Time 0.08
3087.685: (take_image img1 mem1)  [20.000]
3107.686: (analyse_image img1 mem1)  [49.000]
3182.999: (dump_image img1 mem1)  [20.000]
3447.685: (take_image img1 mem1)  [20.000]
3467.686: (analyse_image img1 mem1)  [49.000]
3542.999: (dump_image img1 mem1)  [20.000]
3807.685: (take_image img1 mem1)  [20.000]
3827.686: (analyse_image img1 mem1)  [49.000]
3876.687: (dump_image img1 mem1)  [20.000]

END