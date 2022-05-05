Number of literals: 47
Constructing lookup tables: [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%] [110%] [120%]
Post filtering unreachable actions:  [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%] [110%] [120%]
Recognised a monotonic-change-induced limit on -1.000*var0(image_score img1)
- Must be >= -1.000
Recognised a monotonic-change-induced limit on -1.000*var3(image_score img4)
- Must be >= -2.000
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
Initial heuristic = 10.000

Resorting to best-first search
b (9.000 | 244.225)b (8.000 | 274.226)b (6.000 | 286.227)b (4.000 | 340.230)b (3.000 | 658.228)b (2.000 | 688.229);;;; Solution Found
; States evaluated: 258
; Cost: 700.230
; Time 0.08
232.225: (take_image img4 mem3)  [12.000]
244.226: (analyse_image img4 mem3)  [30.000]
302.999: (dump_image img4 mem3)  [12.000]
592.225: (take_image img4 mem3)  [12.000]
604.226: (analyse_image img4 mem3)  [30.000]
634.227: (dump_image img4 mem3)  [12.000]
646.228: (take_image img1 mem3)  [12.000]
658.229: (analyse_image img1 mem3)  [30.000]
688.230: (dump_image img1 mem3)  [12.000]

END