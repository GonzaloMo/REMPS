Number of literals: 17
Constructing lookup tables: [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%] [110%] [120%]
Post filtering unreachable actions:  [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%] [110%] [120%]
Recognised a monotonic-change-induced limit on -1.000*var0(image_score img1)
- Must be >= -1.000
Pruning (take_image img1 mem0) - never appeared in initial RPG
Pruning (take_image img2 mem0) - never appeared in initial RPG
Pruning (analyse_image img1 mem0) - never appeared in initial RPG
Pruning (analyse_image img2 mem0) - never appeared in initial RPG
Pruning (dump_image img1 mem0) - never appeared in initial RPG
Pruning (dump_image img2 mem0) - never appeared in initial RPG
66% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 4.000

Resorting to best-first search
b (3.000 | 3066.898)b (2.000 | 3115.899);;;; Solution Found
; States evaluated: 17
; Cost: 3173.001
; Time 0.00
3046.898: (take_image img1 mem1)  [20.000]
3066.899: (analyse_image img1 mem1)  [49.000]
3153.001: (dump_image img1 mem1)  [20.000]

END