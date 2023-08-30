
import pandas as pd
import numpy as np
from sklearn.linear_model import LinearRegression
import matplotlib.pyplot as plt
#dados treinamento
vazao = np.array([10,20,30,5,35,40]).reshape(-1,1)
nivel = np.array([50,60,70,45,80,85]).reshape(-1,1)
# criar e treinar o modelo de regressão linear
modelo = LinearRegression()
modelo.fit(vazao,nivel)
# Dados de teste
vazao_test = np.array([5,0.2,15,1,20]).reshape(-1,1)
#Fazer previsões com base na vazão de agua
nivel_previsto = modelo.predict(vazao_test)
#imprimir as previsões 
for i in range(len(vazao_test)):
    print(f"vazão: {vazao_test[i][0]} m3/min - Nivel previsto: {nivel_previsto[i]} metros")
plt.scatter(vazao, nivel, color='blue', label = "dados de treinamento")
plt.plot(vazao_test,nivel_previsto, color='red',label ='Dados de teste')
plt.xlabel('Vazão de agua (m3/min)')
plt.ylabel('Nivel do tanque (metros)')
plt.title('relação entre vazão de agua e nivel do tanque')
plt.legend()
plt.grid(True)
plt.show()