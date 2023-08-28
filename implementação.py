import matplotlib.pyplot as plot
import pandas as pd
import numpy as np
import seaborn as snb
from os import system
system("cls")
#a)
arquivo = "C:\\Users\\rapha\\OneDrive\\Área de Trabalho\\Raphael py\\CIDA\\dados_motor.csv"
dados_originais = pd.read_csv(arquivo)
dados = dados_originais.to_dict('list')

#b)
k = 1.0 + 3.32*np.log10(len(dados["Pressão Combustível"])) 
k_inteiro = np.rint(k)
print("numero de classes", k_inteiro)
tamanho_das_classes = (max(dados["Pressão Combustível"]) - min(dados["Pressão Combustível"])) /k_inteiro
diagrama = plot.hist(dados["Pressão Combustível"], bins=int(k_inteiro))
plot.show()

def boxplot(list, label, pos):

    list.sort()

    Q1 = np.percentile(list, 25, method="averaged_inverted_cdf")
    Q2 = np.percentile(list, 50, method="averaged_inverted_cdf")
    Q3 = np.percentile(list, 75, method="averaged_inverted_cdf")

    dq = Q3 - Q1

    lower_limit = np.fmax(list[0], Q1 - 1.5*dq)
    upper_limit = np.fmin(list[-1], Q3 + 1.5*dq)

    diagram = plot.boxplot(list, labels=[label], positions=[pos])
#c)
boxplot(dados["Temperatura Arref"], "", 1)
plot.show()

#d)
rotação_motor_OK = [700,520,473,716,729,538,1187,609]
rotação_motor_ruim = [876,619,1221,845,824,1230,]

boxplot(rotação_motor_OK, "Motor ok", 1)
boxplot(rotação_motor_ruim, "Motor ruim", 2)
plot.show()

#e)
k2 = 1.0 + 3.32*np.log10(len(dados["Rotação"]))
k_inteiro2 = np.rint(k2)
print("numero de classes", k_inteiro2)
tamanho_das_classes = (max(dados["Rotação"]) - min(dados["Rotação"])) /k_inteiro2
diagrama = plot.hist(dados["Rotação"], bins=int(k_inteiro2))
plot.show()

valor = np.percentile(dados["Rotação"], 68, method="averaged_inverted_cdf")    
print(f"A faixa de valor q esperamos encontrar 68% é {valor}")

#f)
correlation = dados_originais.corr()
print(correlation)
