Number of literals: 17
Constructing lookup tables: [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%] [110%] [120%]
Post filtering unreachable actions:  [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%] [110%] [120%]
Recognised a monotonic-change-induced limit on -1.000*var0(image_score img1)
- Must be >= -1.000
Recognised a monotonic-change-induced limit on -1.000*var1(image_score img2)
- Must be >= -1.000
Pruning (take_image img1 mem0) - never appeared in initial RPG
Pruning (take_image img2 mem0) - never appeared in initial RPG
Pruning (analyse_image img1 mem0) - never appeared in initial RPG
Pruning (analyse_image img2 mem0) - never appeared in initial RPG
Pruning (dump_image img1 mem0) - never appeared in initial RPG
Pruning (dump_image img2 mem0) - never appeared in initial RPG
66% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 8.000

Resorting to best-first search
b (7.000 | 1386.922)b (6.000 | 1398.923)b (4.000 | 1398.923)b (3.000 | 1410.924)b (2.000 | 1440.925);;;; Solution Found
; States evaluated: 23
; Cost: 1452.926
; Time 0.00
1344.921: (take_image img2 mem1)  [12.000]
1356.922: (analyse_image img2 mem1)  [30.000]
1386.923: (dump_image img2 mem1)  [12.000]
1398.924: (take_image img1 mem1)  [12.000]
1410.925: (analyse_image img1 mem1)  [30.000]
1440.926: (dump_image img1 mem1)  [12.000]

END