from random import random

from numpy import mat

from roblib import *  # available at https://www.ensta-bretagne.fr/jaulin/roblib.py

y = array([0, 1, 2.5, 4.1, 5.8, 7.5])
C = array([[1, 1]])
x = array([[0], [0]])
ym = array([0, 0, 0, 0, 0, 0])
epsilon = 0.55

figure(1)
title('Method of Monte Carlo')
for i in range(1000):
    a = 2 * random()
    b = 2 * random()
    A = array([[1, 0], [a, 0.3]])
    B = array([[b], [1 - b]])

    C = array([[1, 1]])
    x = array([[0], [0]])
    for k in range(6):
        x1 = dot(A, x) + B
        ym[k] = dot(C, x)
        x = x1.copy()
    if norm(ym - y, ord=inf) < epsilon:
        scatter(a, b, c='r', marker='o')
    else:
        scatter(a, b, c='b', marker='+')

show()
print(ym)

# Transfer function
'''G(z) = (10*z+b*(1+10*a)-10)/(10*z-9)/(z-1),
When a* = 0.9, b* = 0.75, b*(1+10a) = 7.5,
So b = 7.5/(1+10*a), the pairs of (a,b) who situate on this line can
generate the same transfer function as (a*,b*)
'''

a = linspace(0, 2, 100)
b = 7.5 / (1 + 10 * a)
figure(2)
title('Line of pairs (a,b) who generate the same transfer function')
xlabel('a')
ylabel('b')
plot(a, b, c='r')
show()
