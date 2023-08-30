import pandas as pd
import numpy as np
from sklearn.linear_model import LinearRegression
import matplotlib.pyplot as plt

A = np.array([50,100,120,300]).reshape(-1,1)
valor = np.array([180000,300000,375000000000]).reshape(-1,1)
modelo = LinearRegression()
modelo.fit(A,valor)
A_test = np.array([250, 30, 460,650, 300 ]).reshape(-1,1)
valor_previsto = modelo.predict(A_test)
for i in range(len(A_test)):
    print(f"Area: {A_test[i][0]} - valor previsto: {valor_previsto[i]}")
plt.scatter(A, valor, color='blue', label = "dados de treinamento")
plt.plot(A_test,valor_previsto, color='red',label ='Dados de teste')
plt.xlabel('Area')
plt.ylabel('Valor ')
plt.title('relação entre Area e valor')
plt.legend()
plt.grid(True)
plt.show()