Number of literals: 47
Constructing lookup tables: [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%] [110%] [120%]
Post filtering unreachable actions:  [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%] [110%] [120%]
Recognised a monotonic-change-induced limit on -1.000*var1(image_score img1)
- Must be >= -1.000
66% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 4.000

Resorting to best-first search
b (3.000 | 79.001)b (2.000 | 109.002);;;; Solution Found
; States evaluated: 717
; Cost: 285.001
; Time 0.22
67.001: (take_image img1 mem0)  [12.000]
79.002: (analyse_image img1 mem0)  [30.000]
273.001: (dump_image img1 mem0)  [12.000]

END