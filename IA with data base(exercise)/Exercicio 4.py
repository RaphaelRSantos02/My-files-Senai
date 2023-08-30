import pandas as pd
import numpy as np
from sklearn.linear_model import LinearRegression
import matplotlib.pyplot as plt

renda = np.array([1200,5000,8000,10000,30000]).reshape(-1,1)
Gastos = np.array([750,1500,4000,6000,18000]).reshape(-1,1)
modelo = LinearRegression()
modelo.fit(renda,Gastos)
renda_test = np.array([1000,2030,510,893]).reshape(-1,1)
Gastos_previsto = modelo.predict(renda_test)
for i in range(len(renda_test)):
    print(f"renda: {renda_test[i][0]} R$ - Gastos previsto: {Gastos_previsto[i]} ")
plt.scatter(renda, Gastos, color='blue', label = "dados de treinamento")
plt.plot(renda_test,Gastos_previsto, color='red',label ='Dados de teste')
plt.xlabel('renda')
plt.ylabel('gasto')
plt.title('relação entre renda e gasto')
plt.legend()
plt.grid(True)
plt.show()