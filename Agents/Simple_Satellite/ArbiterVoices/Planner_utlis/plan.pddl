Number of literals: 47
Constructing lookup tables: [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%] [110%] [120%]
Post filtering unreachable actions:  [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%] [110%] [120%]
Recognised a monotonic-change-induced limit on -1.000*var0(image_score img0)
- Must be >= -2.000
Recognised a monotonic-change-induced limit on -1.000*var1(image_score img1)
- Must be >= -2.000
66% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 12.000

Resorting to best-first search
b (11.000 | 13.001)b (10.000 | 43.002)b (9.000 | 79.001)b (8.000 | 109.002)b (6.000 | 285.001)b (5.000 | 439.001)b (4.000 | 469.002)b (2.000 | 645.001);;;; Solution Found
; States evaluated: 7161
; Cost: 657.002
; Time 3.04
1.001: (take_image img0 mem0)  [12.000]
13.002: (analyse_image img0 mem0)  [30.000]
67.001: (take_image img1 mem1)  [12.000]
79.002: (analyse_image img1 mem1)  [30.000]
290.998: (dump_image img1 mem1)  [12.000]
302.999: (dump_image img0 mem0)  [12.000]
361.001: (take_image img0 mem0)  [12.000]
373.002: (analyse_image img0 mem0)  [30.000]
427.001: (take_image img1 mem1)  [12.000]
439.002: (analyse_image img1 mem1)  [30.000]
633.001: (dump_image img0 mem0)  [12.000]
645.002: (dump_image img1 mem1)  [12.000]
END