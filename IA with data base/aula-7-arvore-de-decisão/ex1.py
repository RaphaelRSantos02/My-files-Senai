import numpy as np
import os
import pandas as pd
import matplotlib.pyplot as plt

idade = np.array([1,2,3,4,5,6,7]) # Criar um array numpy
C = np.array([5.6,5.2,4.8,4.5,4.4,2.9,2.7]) # Criar um array numpy

#cria um dataframe
df_ex = pd.DataFrame({
    "idade": idade,
    "conversao alimentar": C
})
print(df_ex.head())#Exibe as prmerias linhas do dataframe

id = [1,2,3,4,5,6,7] #criar uma lista


print(idade.std) #Printa o desvio padrão da idade
print(np.std(C)) # Printao desvio padrão da conversão alimentar

df_corr = df_ex.corr() #Calcula a correlação das variaveis

plt.plot(df_ex["idade"], df_ex["conversao alimentar"])
plt.show()