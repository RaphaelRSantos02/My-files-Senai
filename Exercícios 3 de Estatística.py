import numpy as np
import pandas as pd
import matplotlib.pyplot as plot
import os 
import statistics as st
os.system("cls")

arquivo = "C:\\Users\\rapha\\OneDrive\\Área de Trabalho\\notas.csv"
dados_originais = pd.read_csv(arquivo)
dados_dict = dados_originais.to_dict("list")

media_nota_alunas = np.mean(dados_dict["alunas"])
media_nota_alunos = np.mean(dados_dict["alunos"])

print(f"Media de notas dos alunos é {media_nota_alunos}")
print(f"Media de notas das alunas é {media_nota_alunas}")

mediana_alunos = st.median(dados_dict["alunos"])
mediana_alunas = st.median(dados_dict["alunas"])

print(f"A mediana das notas dos alunos é {mediana_alunos}")
print(f"A mediana das notas das alunas é {media_nota_alunas}")

print("Resposta  para letra a: a media é maior porque a mediana pega o numero que está exatamente no meio")

Q1 = np.percentile(dados_dict["alunas"], 25, method="averaged_inverted_cdf")
Q2 = np.percentile(dados_dict["alunas"], 50, method="averaged_inverted_cdf")
Q3 = np.percentile(dados_dict["alunas"], 75, method="averaged_inverted_cdf")

dq = Q3 - Q1

lower_limit = np.fmax(dados_dict["alunas"], Q1 - 1.5*dq)
upper_limit = np.fmin(dados_dict["alunas"], Q3 + 1.5*dq)

for i in dados_dict["alunas"]:
    if i < all(lower_limit) or i > all(upper_limit):
        dados_dict["alunas"].remove(i)

diagram = plot.boxplot(dados_dict["alunas"])

plot.title("Nota das alunas")
plot.show()