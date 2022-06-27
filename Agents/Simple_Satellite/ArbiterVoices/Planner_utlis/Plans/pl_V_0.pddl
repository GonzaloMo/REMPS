Number of literals: 17
Constructing lookup tables: [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%] [110%] [120%]
Post filtering unreachable actions:  [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%] [110%] [120%]
Recognised a monotonic-change-induced limit on -1.000*var0(image_score img1)
- Must be >= -1.000
Recognised a monotonic-change-induced limit on -1.000*var1(image_score img2)
- Must be >= -3.000
Pruning (take_image img1 mem0) - never appeared in initial RPG
Pruning (take_image img2 mem0) - never appeared in initial RPG
Pruning (analyse_image img1 mem0) - never appeared in initial RPG
Pruning (analyse_image img2 mem0) - never appeared in initial RPG
Pruning (dump_image img1 mem0) - never appeared in initial RPG
Pruning (dump_image img2 mem0) - never appeared in initial RPG
66% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 12.000

Resorting to best-first search
b (11.000 | 159.448)b (10.000 | 285.001)b (8.000 | 285.001)b (7.000 | 621.691)b (6.000 | 651.692)b (4.000 | 663.693)b (2.000 | 1023.693);;;; Solution Found
; States evaluated: 178
; Cost: 1383.693
; Time 0.10
117.447: (take_image img1 mem1)  [12.000]
129.448: (analyse_image img1 mem1)  [30.000]
302.999: (dump_image img1 mem1)  [12.000]
609.691: (take_image img2 mem1)  [12.000]
621.692: (analyse_image img2 mem1)  [30.000]
662.999: (dump_image img2 mem1)  [12.000]
969.691: (take_image img2 mem1)  [12.000]
981.692: (analyse_image img2 mem1)  [30.000]
1022.999: (dump_image img2 mem1)  [12.000]
1329.691: (take_image img2 mem1)  [12.000]
1341.692: (analyse_image img2 mem1)  [30.000]
1371.693: (dump_image img2 mem1)  [12.000]

END