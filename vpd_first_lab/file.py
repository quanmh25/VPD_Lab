
import csv
import math

with open('file.csv', 'w') as csvfile:
    for val in range(100):
        t = 0.1*val
        y = math.sin(2*t)
        csvfile.write('{}, {}\n'.format(t, y))
