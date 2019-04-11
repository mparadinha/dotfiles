import math

sqrt = math.sqrt

# math constants
pi = math.pi
e = math.e

# physics constants
c = 299792458
h = 6.626070150e-34
kB = 1.3806503e-23
NA = 6.022140e23
e0 = 8.854187817e-12
u0 = 4 * pi * 1e-7

# ecla stuff
def kR(w, eps=e0, mu=u0, sig=0):
    return  w * sqrt(eps * mu / 2 * ( 1 + sqrt(1 + (sig / (eps * w)) ** 2)))
def kI(w, eps=e0, mu=u0, sig=0):
    return -w * sqrt(eps * mu / 2 * (-1 + sqrt(1 + (sig / (eps * w)) ** 2)))

def gamma(v): return 1 / sqrt(1 - (v / c) ** 2)
