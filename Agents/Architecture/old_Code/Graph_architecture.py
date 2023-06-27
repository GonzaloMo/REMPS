from utils.Colors import *
import numpy as np
from random import randint, random
from igraph import Graph, plot, load, drawing
g = Graph()
print(g)

# Construct a graph with a starting node and 22 nodes connected to it

n_of_targets = 5
n_vertices = n_of_targets  + 2

"""
ADD The State Nodes
"""
g.add_vertices("Memory", 
                attributes={"Type": "State",
                            "color": "green"})
g.add_vertices("Power",
                attributes={"Type": "State",
                            "color": "green"})

for i in range(1, n_of_targets+1):
    g.add_vertices("Target {}".format(i),
                   attributes={"Type": "State",
                               "color": "green"})    
        
g.add_vertices("Ground Station",
               attributes={"Type": "State",
                           "color": "green"})
g.vs["label"] = g.vs["name"]


pal = drawing.colors.AdvancedGradientPalette(["red", "yellow",  "green"], n=101)

"""
ADD Action Nodes
"""
g.add_vertices("Idle", 
                attributes={"Type": "Action",
                            "color": "blue"})
g.add_edges([("Memory", "Idle"),
                ("Power", "Idle")],
                attributes={"weight": [0, 0]})
for i in range(1, n_of_targets+1):
    node_picture = "Take Picture img{}".format(i)
    g.add_vertices(node_picture,
                     attributes={"Type": "Action",
                                    "color": "blue"})
    g.add_edges([("Target {}".format(i), node_picture), 
                 ("Memory", node_picture),
                 ("Power", node_picture)],
                 attributes={"weight": [1, -1, -1]})
    
    node_Analyze = "Analyze img{}".format(i)
    g.add_vertices(node_Analyze,
                        attributes={"Type": "Action",
                                    "color": "blue"})
    g.add_edges([("Memory", node_Analyze),
                 ("Power", node_Analyze)],
                attributes={"weight": [0, -1]})
    node_Dump = "Dump img{}".format(i)
    g.add_vertices(node_Dump,
                    attributes={"Type": "Action",
                                "color": "blue"})
    g.add_edges([(node_Dump, "Ground Station"),
                 ("Memory", node_Dump),
                 ("Power", node_Dump)],
                 attributes={"Type": "Action",
                             "weight": [1, 1, -1]})
    
"""
ADD Voices Nodes
"""
n_voices = 3
for i in range(n_voices):
    g.add_vertices("Voice {}".format(i),
                    attributes={"Type": "Voice",
                                "color": "red"})
    g.add_edges([(action_node, "Voice {}".format(i)) for action_node in g.vs.select(Type_eq="Action")],
                 attributes={"weight": [random()*2 - 1 for action_node in g.vs.select(Type_eq="Action")],})
import matplotlib.pyplot as plt
# Plot in matplotlib
# Note that attributes can be set globally (e.g. vertex_size), or set individually using arrays (e.g. vertex_color)
fig, ax = plt.subplots()
layout = g.layout("drl")
plot(
    g,
    margin=20,
    layout=layout,
    target=ax,
    vertex_label=g.vs["name"],
    vertex_color= g.vs["color"],
    edge_color=[pal.get(int((i+1)/2*100)) for i in g.es["weight"]],

)

plt.show()

# # Save the graph as an image file
fig.savefig('DecisionTree.png')



# Export and import a graph as a GML file.
g.save("DecisionTree.gml")
g = load("DecisionTree.gml")