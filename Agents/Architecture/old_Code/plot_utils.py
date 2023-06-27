import numpy as np
import matplotlib.pyplot as plt

def scalability_per_plot(results, color='ob'):
    init_g = np.array(results)[:,0]
    achi_g = np.array(results)[:,1]  
    xmax = (round(max(init_g)+5)/10)*10
    limmax = int(xmax)
    per_g = np.zeros(np.size(achi_g))
    
    for i in range(np.size(achi_g)):
        per_g[i] = min((achi_g[i]/init_g[i]) * 100,100) 
        if per_g[i] > 100:
            per_g[i] = 100
    plt.plot(init_g, per_g, color)

    return xmax, limmax

def scalability_plot(results, color='ob'):
    init_g = np.array(results)[:,0]
    achi_g = np.array(results)[:,1]  
    for i in range(np.size(achi_g)):
        if achi_g[i] > init_g[i]:
            achi_g[i] = init_g[i]
    plt.plot(init_g, achi_g, color)