Number of literals: 47
Constructing lookup tables: [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%] [110%] [120%]
Post filtering unreachable actions:  [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%] [110%] [120%]
Recognised a monotonic-change-induced limit on -1.000*var0(image_score img1)
- Must be >= -1.000
Recognised a monotonic-change-induced limit on -1.000*var2(image_score img3)
- Must be >= -1.000
Recognised a monotonic-change-induced limit on -1.000*var3(image_score img4)
- Must be >= -1.000
Pruning (take_image img1 mem0) - never appeared in initial RPG
Pruning (take_image img2 mem0) - never appeared in initial RPG
Pruning (take_image img3 mem0) - never appeared in initial RPG
Pruning (take_image img4 mem0) - never appeared in initial RPG
Pruning (take_image img1 mem1) - never appeared in initial RPG
Pruning (take_image img2 mem1) - never appeared in initial RPG
Pruning (take_image img3 mem1) - never appeared in initial RPG
Pruning (take_image img4 mem1) - never appeared in initial RPG
Pruning (take_image img1 mem2) - never appeared in initial RPG
Pruning (take_image img2 mem2) - never appeared in initial RPG
Pruning (take_image img3 mem2) - never appeared in initial RPG
Pruning (take_image img4 mem2) - never appeared in initial RPG
Pruning (analyse_image img1 mem0) - never appeared in initial RPG
Pruning (analyse_image img2 mem0) - never appeared in initial RPG
Pruning (analyse_image img3 mem0) - never appeared in initial RPG
Pruning (analyse_image img4 mem0) - never appeared in initial RPG
Pruning (analyse_image img1 mem1) - never appeared in initial RPG
Pruning (analyse_image img2 mem1) - never appeared in initial RPG
Pruning (analyse_image img3 mem1) - never appeared in initial RPG
Pruning (analyse_image img4 mem1) - never appeared in initial RPG
Pruning (analyse_image img1 mem2) - never appeared in initial RPG
Pruning (analyse_image img2 mem2) - never appeared in initial RPG
Pruning (analyse_image img3 mem2) - never appeared in initial RPG
Pruning (analyse_image img4 mem2) - never appeared in initial RPG
Pruning (dump_image img1 mem0) - never appeared in initial RPG
Pruning (dump_image img2 mem0) - never appeared in initial RPG
Pruning (dump_image img3 mem0) - never appeared in initial RPG
Pruning (dump_image img4 mem0) - never appeared in initial RPG
Pruning (dump_image img1 mem1) - never appeared in initial RPG
Pruning (dump_image img2 mem1) - never appeared in initial RPG
Pruning (dump_image img3 mem1) - never appeared in initial RPG
Pruning (dump_image img4 mem1) - never appeared in initial RPG
Pruning (dump_image img1 mem2) - never appeared in initial RPG
Pruning (dump_image img2 mem2) - never appeared in initial RPG
Pruning (dump_image img3 mem2) - never appeared in initial RPG
Pruning (dump_image img4 mem2) - never appeared in initial RPG
66% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 12.000

Resorting to best-first search
b (11.000 | 77.994)b (10.000 | 285.001)b (8.000 | 285.001)b (7.000 | 469.145)b (6.000 | 645.001)b (4.000 | 645.001)b (3.000 | 915.025)b (2.000 | 945.026);;;; Solution Found
; States evaluated: 93
; Cost: 1005.001
; Time 0.08
35.993: (take_image img3 mem3)  [12.000]
47.994: (analyse_image img3 mem3)  [30.000]
302.999: (dump_image img3 mem3)  [12.000]
427.144: (take_image img1 mem3)  [12.000]
439.145: (analyse_image img1 mem3)  [30.000]
662.999: (dump_image img1 mem3)  [12.000]
903.025: (take_image img4 mem3)  [12.000]
915.026: (analyse_image img4 mem3)  [30.000]
993.001: (dump_image img4 mem3)  [12.000]

END