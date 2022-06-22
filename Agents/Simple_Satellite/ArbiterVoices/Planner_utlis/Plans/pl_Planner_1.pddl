Number of literals: 17
Constructing lookup tables: [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%] [110%] [120%]
Post filtering unreachable actions:  [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%] [110%] [120%]
Recognised a monotonic-change-induced limit on -1.000*var0(image_score img1)
- Must be >= -3.000
Recognised a monotonic-change-induced limit on -1.000*var1(image_score img2)
- Must be >= -1.000
Pruning (take_image img1 mem0) - never appeared in initial RPG
Pruning (take_image img2 mem0) - never appeared in initial RPG
Pruning (analyse_image img1 mem0) - never appeared in initial RPG
Pruning (analyse_image img2 mem0) - never appeared in initial RPG
Pruning (dump_image img1 mem0) - never appeared in initial RPG
Pruning (dump_image img2 mem0) - never appeared in initial RPG
66% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 12.000

Resorting to best-first search
b (11.000 | 82.897)b (10.000 | 285.001)b (8.000 | 285.001)b (7.000 | 297.002)b (6.000 | 327.003)b (4.000 | 339.004)b (2.000 | 393.007);;;; Solution Found
; States evaluated: 43
; Cost: 447.010
; Time 0.02
40.896: (take_image img2 mem1)  [12.000]
52.897: (analyse_image img2 mem1)  [30.000]
273.001: (dump_image img2 mem1)  [12.000]
285.002: (take_image img1 mem1)  [12.000]
297.003: (analyse_image img1 mem1)  [30.000]
327.004: (dump_image img1 mem1)  [12.000]
339.005: (take_image img1 mem1)  [12.000]
351.006: (analyse_image img1 mem1)  [30.000]
381.007: (dump_image img1 mem1)  [12.000]
393.008: (take_image img1 mem1)  [12.000]
405.009: (analyse_image img1 mem1)  [30.000]
435.010: (dump_image img1 mem1)  [12.000]

END