
import pandas as pd
import numpy as np
from sklearn.linear_model import LinearRegression
import matplotlib.pyplot as plt

q = np.array([100,200,300,400,500,600,700]).reshape(-1,1)
t = np.array([30,35,40,45,60,100, 150]).reshape(-1,1)
modelo = LinearRegression()
modelo.fit(q,t)
q_test = np.array([310, 200, 60,450, 800 ]).reshape(-1,1)
t_previsto = modelo.predict(q_test)
for i in range(len(q_test)):
    print(f" {q_test[i][0]}, {t_previsto[i]} ")
plt.scatter(q, t, color='blue', label = "dados de treinamento")
plt.plot(q_test,t_previsto, color='red',label ='Dados de teste')
plt.xlabel('Q')
plt.ylabel('T')
plt.title('relação entre Q e T')
plt.legend()
plt.grid(True)
plt.show()
