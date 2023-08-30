import matplotlib.pyplot as plt
import numpy as np
import pandas as pd

durezas = [53.0, 70.2, 84.3, 69.5, 77.8, 87.5, 53.4,82.5, 67.3, 54.1, 70.5, 71.4, 95.4, 51.1,
            74.4, 55.7, 63.5, 85.8, 53.5,64.3,82.7,78.5, 55.7,69.1, 72.3, 59.5,73,52.4,50.7]

durezas.sort()
print(durezas)

Q1 = np.percentile(durezas, 25, method="averaged_inverted_cdf")
Q2 = np.percentile(durezas, 50, method="averaged_inverted_cdf")
Q3 = np.percentile(durezas, 75, method="averaged_inverted_cdf")
Q4 = np.percentile(durezas, 95, method="averaged_inverted_cdf")


dq = Q3 - Q1

lower_limit = np.fmax(durezas[0], Q1 - 1.5*dq)
upper_limit = np.fmin(durezas[- 1], Q3 + 1.5*dq)

diagrama = plt.boxplot(durezas)

#plt.show()

valor_baixo = np.percentile(durezas, 10, method="averaged_inverted_cdf")
valor_alto = np.percentile(durezas, 90, method="averaged_inverted_cdf")

for i in durezas:
    if i > valor_baixo and i < valor_alto:
        print(i)

print(f"esses valores dos 80% com melhor dureza {i} ")

print(f"valores menores que {Q4} são os que aqueles 95% com menor valor de dureza")

