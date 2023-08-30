import matplotlib.pyplot as plot
import numpy as np

data = {
    'salario': [13876, 11608, 18701, 11283, 11767, 20872, 11772, 10535, 12195, 12313, 14975, 21371, 19800, 11417, 20263, 13231, 12884, 13245, 15965, 12336, 21352, 13839, 16978, 14803, 
               22184, 13548, 14467, 15942, 23174, 23780],
    'Experiencia': [1,1,1,1,1,2,2,2,2,3,3,3,3,4,4,4,4,5,5,6,6,6,7,8,8,8,10,10,10,10],
    'Nivel_de_educação': ['Bacharel', 'Doutorado', 'Doutorado', 'Mestrado', 'Doutorado', 'Mestrado', 'Mestrado', 'Bacharel', 'Doutorado', 'Mestrado', 'Bacharel', 'Mestrado', 'Doutorado', 'Bacharel', 
                  'Doutorado', 'Doutorado', 'Mestrado', 'Mestrado', 'Bacharel', 'Bacharel', 'Doutorado', 'Mestrado', 'Bacharel', 'Mestrado', 'Doutorado', 'Bacharel', 'Bacharel', 'Mestrado', 
                  'Doutorado', 'Mestrado'],
    'gerenciamento': ['Sim', 'Não', 'Sim', 'Não', 'Não', 'Sim', 'Não', 'Não', 'Não', 'Não', 'Sim', 'Sim', 'Sim', 'Não', 'Sim', 'Não', 'Não', 'Não', 'Sim', 'Não', 'Sim', 'Não', 'Sim', 'Não', 'Sim',
                    'Não', 'Não', 'Não', 'Sim', 'Sim']
}

listaBacharel, listaDoutorado, listaMestrado = [], [], []
listaBacharelS, listaBacharelN, listaDoutoradoS, listaDoutoradoN, listaMestradoS, listaMestradoN = [], [], [], [], [], []
 #Thiago me ajudou nessa parte
def organizeListas():
    for x in range(len(data['salario'])):

        if data['Nivel_de_educação'][x] == 'Bacharel':
            listaBacharel.append(data['salario'][x])
            if data['gerenciamento'][x] == 'Sim':
                listaBacharelS.append(data['salario'][x])
            else:
                listaBacharelN.append(data['salario'][x])

        elif data['Nivel_de_educação'][x] == 'Doutorado':
            listaDoutorado.append(data['salario'][x])
            if data['gerenciamento'][x] == 'Sim':
                listaDoutoradoS.append(data['salario'][x])
            else:
                listaDoutoradoN.append(data['salario'][x])
        
        else:
            listaMestrado.append(data['salario'][x])
            if data['gerenciamento'][x] == 'Sim':
                listaMestradoS.append(data['salario'][x])
            else:
                listaMestradoN.append(data['salario'][x])


def boxplot(lista, label, pos):

    list.sort()

    Q1 = np.percentile(lista, 25, method="averaged_inverted_cdf")
    Q2 = np.percentile(lista, 50, method="averaged_inverted_cdf")
    Q3 = np.percentile(lista, 75, method="averaged_inverted_cdf")

    dq = Q3 - Q1

    lower_limit = np.fmax(lista[0], Q1 - 1.5*dq)
    upper_limit = np.fmin(lista[-1], Q3 + 1.5*dq)

    diagram = plot.boxplot(lista, labels=[label], positions=[pos])

organizeListas()

plot.figure(figsize=(18,8))

boxplot(listaBacharel, 'todos Bacharel', 1)
boxplot(listaBacharelS, 'todos Bacharel Sim', 2)
boxplot(listaBacharelN, 'todos Bacharel Não', 3)

boxplot(listaDoutorado, 'todos Doutorado', 4)
boxplot(listaDoutoradoS, 'todos Doutorado Sim', 5)
boxplot(listaDoutoradoN, 'todos Doutorado Não', 6)

boxplot(listaMestrado, 'todos Mestrado', 7)
boxplot(listaMestradoS, 'todos Mestrado Sim', 8)
boxplot(listaMestradoN, 'todos Mestrado Não', 9)

plot.title("Salario dos Funcionários")
plot.ylabel("salario")
plot.show()