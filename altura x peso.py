import matplotlib.pyplot as plt
import numpy as np
import pandas as pd

arquivo = "C:\\Users\\dsadm\\Desktop\\nao abra\\dados_altura.csv"
dados_originais = pd.read_csv(arquivo)
dados_dict = dados_originais.to_dict("list")


print(dados_dict)
dispersao = plt.scatter(dados_dict["peso(kg)"], dados_dict["altura(cm)"], s=30, c ="r") # s é tamanho e c é cor
                                                                                        # e marker para mudar  a forma dos pontos

matriz_dados = (dados_dict["peso(kg)"] , dados_dict["altura(cm)"])
rho = np.corrcoef(matriz_dados)

media_peso = np.mean(dados_dict["peso(kg)"])
media_altura = np.mean(dados_dict["altura(cm)"])

dp_peso = np.std(dados_dict["peso(kg)"])
dp_altura = np.std(dados_dict["altura(cm)"])

print(dp_peso)
print(dp_altura)

print("Media do peso", media_peso)
print("Media da altura", media_altura)

plt.title("Estudo de correlação de peso e altura")
plt.xlabel("peso")
plt.ylabel("Altura")
plt.show()