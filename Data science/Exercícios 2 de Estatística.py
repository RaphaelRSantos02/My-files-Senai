import numpy as np
import pandas as pd
import matplotlib.pyplot as plot
import os 
import statistics as st
os.system("cls")

arquivo = "C:\\Users\\rapha\\OneDrive\\Área de Trabalho\\dados_esportes.csv"
dados_originais = pd.read_csv(arquivo)
dados_dict = dados_originais.to_dict("list")


dp_futebol = np.std(dados_dict["futebol"])
dp_basquete = np.std(dados_dict["basquete"])

print(f"Esse é o desvio padrão de lesão do futebol {dp_futebol}")
print(f"Esse é o desvio padrão de lesão do basquete {dp_basquete}")

media_lesao_basquete = np.mean(dados_dict["basquete"])
media_lesao_futebol = np.mean(dados_dict["futebol"])

print(f"Media de lesões do futebol é {media_lesao_futebol}")
print(f"Media de lesões do basquete é {media_lesao_basquete}")

mediana_futebol = st.median(dados_dict["futebol"])
mediana_basquete = st.median(dados_dict["basquete"])

print(f"A mediana das lesões no futebol é {mediana_futebol}")
print(f"A mediana das lesões no basquete é {mediana_basquete}")


Q1 = np.percentile(dados_dict["basquete"], 25, method="averaged_inverted_cdf")
Q2 = np.percentile(dados_dict["basquete"], 50, method="averaged_inverted_cdf")
Q3 = np.percentile(dados_dict["basquete"], 75, method="averaged_inverted_cdf")

Dq = Q3 - Q1

lower_limit_basquete = np.fmax(dados_dict["basquete"], Q1 - 1.5*Dq)
upper_limit_basquete = np.fmin(dados_dict["basquete"], Q3 + 1.5*Dq)

q1 = np.percentile(dados_dict["futebol"], 25, method="averaged_inverted_cdf")
q2 = np.percentile(dados_dict["futebol"], 50, method="averaged_inverted_cdf")
q3 = np.percentile(dados_dict["futebol"], 75, method="averaged_inverted_cdf")

dq = q3 - q1

lower_limit_futebol = np.fmax(dados_dict["futebol"], q1 - 1.5*dq)
upper_limit_futebol = np.fmin(dados_dict["futebol"], q3 + 1.5*dq)

diagrama = plot.boxplot(dados_dict)
plot.show()

