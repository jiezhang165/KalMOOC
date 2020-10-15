import matplotlib as plt
import numpy as np

# From the data of the table
M = np.array([[9, -3, 1], [1, -1, 1], [0, 0, 0], [4, 2, 1], [9, 3, 1], [36, 6, 1]])
y = np.array([[17], [3], [1], [5], [11], [46]])
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
