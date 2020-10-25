import matplotlib as plt
import numpy as np

# From the data of the table

U = np.array([2, -1, 1, -1, 1, -1, 1, -1])
print(U)
Y = np.array([0, -1, -2, 3, 7, 11, 16, 36]).T
print(Y)
M = np.array([-Y[1:7], -Y[0:6], U[1:7], U[0:6]]).T
print(M)
y = np.array([Y[2:8]]).reshape(6,1)
print(y)
K = np.dot(np.linalg.inv(np.dot(M.T, M)), M.T)
p_hat = np.dot(K, y)

print("the estimation parameters are:\n", p_hat)
print("\n")

# Filtered measurements and residual vector
y_hat = np.dot(M, p_hat)
r = y_hat - y
print("the filtered measurements are:\n", y_hat)
print("\n")

print("the residual vector is:\n", r)
