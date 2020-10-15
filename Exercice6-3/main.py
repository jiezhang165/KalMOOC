import numpy as np

# From the datas of the table
M = np.array([[4, 0], [10, 1], [10, 5], [13, 5], [15, 3]])
y = np.array([[5], [10], [8], [14], [17]])
print(y)
K = np.dot(np.linalg.inv(np.dot(M.T, M)), M.T)
p_hat = np.dot(K, y)
print(p_hat)

# Deduce an estimation of speed, U = 20V and Tr =10 Nm
U = 20
Tr = 10
Omega_e = p_hat[0] * U + p_hat[1] * Tr
print(Omega_e)
