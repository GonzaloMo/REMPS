Number of literals: 17
Constructing lookup tables: [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%] [110%] [120%]
Post filtering unreachable actions:  [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%] [110%] [120%]
Recognised a monotonic-change-induced limit on -1.000*var1(image_score img2)
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
b (7.000 | 9879.822)b (6.000 | 9909.823)b (4.000 | 10005.001)b (2.000 | 10365.001);;;; Solution Found
; States evaluated: 156
; Cost: 10725.001
; Time 0.06
9867.822: (take_image img2 mem1)  [12.000]
9879.823: (analyse_image img2 mem1)  [30.000]
10022.999: (dump_image img2 mem1)  [12.000]
10227.822: (take_image img2 mem1)  [12.000]
10239.823: (analyse_image img2 mem1)  [30.000]
10382.999: (dump_image img2 mem1)  [12.000]
10587.822: (take_image img2 mem1)  [12.000]
10599.823: (analyse_image img2 mem1)  [30.000]
10713.001: (dump_image img2 mem1)  [12.000]

END