#!/usr/bin/python
# -*- coding: utf-8 -*-
# j3nnn1 - 0.0.0 -

import os
import string
import random


def cleanstring(l):
    l[-1] = l[-1].rstrip("\n")
    return([x.strip() for x in l])

def getpercenta(percent, numberlines):
    result = percent * numberlines
    return result
    
f = open("outputtree1.csv", "r")
output = open("output.csv", "w")
numlines = 0

for line in f.readlines():
    numlines = numlines + 1

endlines = int(getpercenta(0.25, numlines))

f.seek(0)
line = f.readline()
i = 0
j = 0
while line:
    i = i + 1
    a = line.split(",")
    aux = cleanstring(a)
    
    if i%2 and j<=endlines:
        j = j +1 
        indice = random.randint(0, (len(aux)-1))
        aux[indice] = ''

    aux[-1] = aux[-1]+"\n"
    newline = ', '.join(aux)
    output.write(newline)
    line = f.readline()

f.close()
output.close()
