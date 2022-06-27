Number of literals: 17
Constructing lookup tables: [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%] [110%] [120%]
Post filtering unreachable actions:  [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%] [110%] [120%]
Recognised a monotonic-change-induced limit on -1.000*var0(image_score img1)
- Must be >= -3.000
Recognised a monotonic-change-induced limit on -1.000*var1(image_score img2)
- Must be >= -2.000
Pruning (take_image img1 mem0) - never appeared in initial RPG
Pruning (take_image img2 mem0) - never appeared in initial RPG
Pruning (analyse_image img1 mem0) - never appeared in initial RPG
Pruning (analyse_image img2 mem0) - never appeared in initial RPG
Pruning (dump_image img1 mem0) - never appeared in initial RPG
Pruning (dump_image img2 mem0) - never appeared in initial RPG
66% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 14.000

Resorting to best-first search
b (13.000 | 31.373)b (12.000 | 61.374)b (10.000 | 285.001)b (8.000 | 645.001)b (7.000 | 959.565)b (6.000 | 989.566)b (4.000 | 1005.001)b (2.000 | 1365.001);;;; Solution Found
; States evaluated: 238
; Cost: 1725.001
; Time 0.16
19.373: (take_image img2 mem1)  [12.000]
31.374: (analyse_image img2 mem1)  [30.000]
302.999: (dump_image img2 mem1)  [12.000]
379.373: (take_image img2 mem1)  [12.000]
391.374: (analyse_image img2 mem1)  [30.000]
662.999: (dump_image img2 mem1)  [12.000]
947.565: (take_image img1 mem1)  [12.000]
959.566: (analyse_image img1 mem1)  [30.000]
1022.999: (dump_image img1 mem1)  [12.000]
1307.565: (take_image img1 mem1)  [12.000]
1319.566: (analyse_image img1 mem1)  [30.000]
1382.999: (dump_image img1 mem1)  [12.000]
1667.565: (take_image img1 mem1)  [12.000]
1679.566: (analyse_image img1 mem1)  [30.000]
1713.001: (dump_image img1 mem1)  [12.000]

END