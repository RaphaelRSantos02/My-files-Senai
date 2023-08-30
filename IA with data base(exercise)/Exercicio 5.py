import pandas as pd
import numpy as np
from sklearn.linear_model import LinearRegression
import matplotlib.pyplot as plt

demanda = np.array([50,140,30,75,123]).reshape(-1,1)
consumo = np.array([100,200,80,100,160]).reshape(-1,1)
modelo = LinearRegression()
modelo.fit(demanda,consumo)
demanda_test = np.array([300,100,20,60,200]).reshape(-1,1)
consumo_previsto = modelo.predict(demanda_test)
for i in range(len(demanda_test)):
    print(f"demanda: {demanda_test[i][0]} R$ - consumo previsto: {consumo_previsto[i]} ")
plt.scatter(demanda, consumo, color='blue', label = "dados de treinamento")
plt.plot(demanda_test,consumo_previsto, color='red',label ='Dados de teste')
plt.xlabel('demanda')
plt.ylabel('gasto')
plt.title('relação entre demanda e gasto')
plt.legend()
plt.grid(True)
plt.show()