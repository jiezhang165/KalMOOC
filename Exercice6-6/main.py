# https://www.ensta-bretagne.fr/jaulin/robmooc.html
from roblib import *  # available at https://www.ensta-bretagne.fr/jaulin/roblib.py


def draw_room():
    for j in range(A.shape[1]):
        plot(array([A[0, j], B[0, j]]), array([A[1, j], B[1, j]]), color='blue')


def draw(p, y, col):
    draw_tank(p, 'darkblue', 0.1)
    p = p.flatten()
    y = y.flatten()
    for i in arange(0, 8):
        plot(p[0] + array([0, y[i] * cos(p[2] + i * pi / 4)]), p[1] + array([0, y[i] * sin(p[2] + i * pi / 4)]),
             color=col)

def f(p):
    """ Simulator """
    global A
    global B
    A_s = A.shape
    y = inf * ones([8, 1])
    print(f)
    for i in range(8):
        u = array([cos(p[2] + pi / 4 * i), sin(p[2] + pi / 4 * i)]).reshape(2, 1)
        m = array([p[0], p[1]]).reshape(2, 1)
        for j in range(A_s[1]):
            a = A[:, j]
            b = B[:, j]
            a = array([a]).T
            b = array([b]).T
            if det(hstack((a - m, u))) * det(hstack((b - m, u))) < 0:
                alpha = -det(hstack((b - a, m - a))) / det(hstack((b - a, u)))
                if alpha > 0:
                    y[i] = min(alpha, y[i])
      return y


A = array([[0, 7, 7, 9, 9, 7, 7, 4, 2, 0, 5, 6, 6, 5],
           [0, 0, 2, 2, 4, 4, 7, 7, 5, 5, 2, 2, 3, 3]])

B = array([[7, 7, 9, 9, 7, 7, 4, 2, 0, 0, 6, 6, 5, 5],
           [0, 2, 2, 4, 4, 7, 7, 5, 5, 0, 2, 3, 3, 2]])
y = array([[6.4], [3.6], [2.3], [2.1], [1.7], [1.6], [3.0], [3.1]])

ax = init_figure(-2, 10, -2, 10)

p0 = array([[1], [2], [3]])  # initial guess
draw_room()
draw(p0, y, 'red')
pause(1)
