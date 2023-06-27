import colorsys
import numpy as np
class Color:
    def __init__(self, color_rgb):
        self.rgb = color_rgb
        self.hsv = colorsys.rgb_to_hsv(*self.rgb)
        self.hls = colorsys.rgb_to_hls(*self.rgb)
    
    def __repr__(self):
        return str(self.rgb)
    
    def __str__(self):
        return str(self.rgb)
    
    def getRGB(self):
        return "rgb({})".format(self.rgb)
    
    def getHSV(self):
        return "hsv({})".format(self.hsv)

    def getLightRange(self, n):
        return [Color(colorsys.hls_to_rgb(self.hls[0], self.hls[1], i)) for i in np.linspace(self.hls[1], 1, n)]
    
    

Red = Color((255,0,0))
Green = Color((0,255,0))
Blue = Color((0,0,255))
White = Color((255,255,255))
Black = Color((0,0,0))
Gray = Color((128,128,128))
    