import matplotlib.pyplot as plt
import numpy as np
import pylab

MX = np.linspace(-1, 1, 21)
MY = np.linspace(-1, 1, 21)

X, Y = np.meshgrid(MX, MY)

# f = xy
GX = Y
GY = X
plt.figure(1)
plt.title('Vector field')
plt.quiver(X, Y, GX, GY)
plt.show()

F = X * Y
GX, GY = np.gradient(F)

Q_Z = np.array([[0, 0.5], [0.5, 0]])
L_Z = np.array([[0, 0]])

plt.figure(2)
plt.title('Contour lines')
plt.contour(X, Y, F)
plt.show()
plt.figure(3)
plt.title('Form of f=x*y')
ax3 = plt.axes(projection='3d')
ax3.plot_surface(X, Y, F)
plt.show()

# z = 2x^2+xy+4y^2+y-x+3
Z = 2 * X ** 2 + X * Y + 4 * Y ** 2 - X + 3
GX_Z, GY_Z = np.gradient(Z)
Q_Z = np.array([[2, 0.5], [0.5, 4]])
L_Z = np.array([-1, 1])
plt.figure(4)
plt.contour(X, Y, Z)
plt.show()
plt.figure(5)
plt.title('Form of f=2x^2+xy+4y^2+y-x+3')
ax3 = plt.axes(projection='3d')
ax3.plot_surface(X, Y, Z)
plt.show()
