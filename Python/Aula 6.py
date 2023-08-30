#CRIAÇÃO DE LISTAS
#listas são muito parecidas com a classe str e portanto muitos métodos existentes em um existirão em ambos
listaVazia=[] #lista vazia
num=[1,2,3,4,5] #Somente um tipo
dados=[1.34, "SENAI", True, -100] #tipos diversos
escola=list(["predio", "professores", "alunos", 501, False]) #list é um método construtor de listas
sequencia=list(range(10)) #lista construida pelo metodo construtor e metodo range
listaDentroDeLista = [[0,1]],["fulano","sicrano"],[True, 100, "senai"]

#RETORNAR UM VALOR DE UMA LISTA
print(type(num)) #lista também é uma classe
print(listaVazia)
print(num, dados, escola, sep=" -- ")
print(sequencia)
print(listaDentroDeLista)
print(100*"#")

#TAMANHO DE LISTAS
print(len(listaVazia))
print(len(num))
print(len(dados))
print(len(escola))
print(len(sequencia))
print(len(listaDentroDeLista))
print(100*"#")
'''
'''
# selecionando elementos de uma lista
num=[1,2,3,4,5]
dados=[1.34, "SENAI", True, -100]
escola=list(["predio", "professores", "alunos", 501, False])
sequencia=list(range(10)) #lista construida pelo metodo construtor e metodo range
listaDentroDeLista = [[0,1],["fulano","sicrano"],[True, 100, "senai"]]

## O operador in serve para iterar listas dentro do for e para testar a existencia de itens nela. 
## O operador in retorna True em uma decisão quando encontra o teste na lista 
## Existe o operador not in cujo significado é testar a não existência de algo dentro da lista

for numero in num:
    print(numero, end=" -- ")
    if 4 in num:
        print("pim", end=" -- ")
    else:
        print("pam")
print("")

#Fatiamento ou slicing
print(num[0],num[1],sep=" -- ") #indicação do indice positivo determina a posição da direita pra esquerda
print(num[-1]) #indicação do indice negativo indica a posição da esquerda para a direita
print(num[-5]) #indicação do indice negativo indica a posição da esquerda para a direita
print(dados[2], dados[3], sep=" -- ")
print(escola[0], escola[3], sep=" -- ")
print(listaDentroDeLista[0],listaDentroDeLista[1],listaDentroDeLista[2][2])
print(num[0:len(num)]) #lista[star:stop:step]
print(dados[1:4])
print(escola[-3])
print(num[3:])
print(num[:3])
print(num[::-1]) #Sintaxe que inverte a leitura somente da lista, mas que poderia criar outra variável
print(100*"#")
'''
'''
## Listas com strings
listaStrings=['senai', "Campinas"]
print(listaStrings[0])
print(listaStrings[0][0])

for letra in listaStrings[1]:
    print(letra, end=" - ")
'''

'''
#Manipulação de listas
#Alterando por fatiamento
exemplo1=[1,2,3,4,5,6]
print(exemplo1)
exemplo1[2]="senai"
print(exemplo1)
exemplo1[2:5]=["cfp","alunos",501]
print(exemplo1)

#metodo append
exemplo2=["cachorro", "gato", "peixe"]
print(exemplo2)
exemplo2.append("periquito") #metodo append adiciona um item sempre na última posição
print(exemplo2)

#metodo insert
exemplo3=[0,1,3,4,5]
print(exemplo3)
exemplo3.insert(2,2) #método insert insere um elemento numa posição escolhida - primeiro argumento é a posição e o segundo é o elemento de inserção
print(exemplo3)

#metodo remove
print(exemplo2)
exemplo2.remove("periquito") # metodo remove apaga um item se encontrar na lista 
print(exemplo2)


#comando del
exemplo4 = [0,1,2,3,4,5,6,7,8]
print(exemplo4)
del exemplo4[0]
print(exemplo4)
del exemplo4[6:len(exemplo4)]
print(exemplo4)
'''

'''
# operador in verifica a existencia de um item a lista
paises=["Brasil", "Argentina", "Chile", "Uruguai"]
dado=input("Digite o nome de um país: ")
if (dado in paises): # Se encontrar o país, tem que ser a mesmissima grafia, retorna sim,
                     # caso contrário não
   print("Esse pais existe na lista")
else:
   print("Esse não!")

# metodo index devolve o indice desse item na lista
if (dado in paises): # Se encontrar o país, tem que ser a mesmissima grafia, retorna sim,
                     # caso contrário não
   print(f"Esse pais existe na lista, é o {paises.index(dado)+1:1}º item dessa lista")
else:
   print("Esse não!")
print(100*"#")
'''
'''
# metodo pop também apaga um item da lista porém ele retorna o item apagado
paises=["Brasil", "Argentina", "Chile", "Uruguai"]
#pop()
print(paises.pop(0)) #Também remove porém pela posição do elemento e retorna o elemento removido
print(paises)
print(paises.pop()) #se não por nada apaga o último
print(paises)
#metodo count conta quantos itens existem duplicados na lista 
paises = ["Brasil", "brasil", "Brazil", "Brasil"]
print(paises.count("Brasil")) #retorna a quantidade de vezes que o item aparece na lista
# método copy copia exatamente uma lista (usar esse método para cópias)
numeros=[2,4,5,1,5,10,-100]
numeros1=numeros.copy() #usado para copiar uma lista exsitente
numeros2=numeros.copy()
print(numeros1)
'''

'''
#ordenando listas
numeros1.sort() # ordenação de forma crescente
print(numeros1)
numeros2=numeros1.copy()
numeros2.reverse() # ordenação de forma crescente
print(numeros2)
print(min(numeros1))#retorna o menor item da lista
print(max(numeros2))#retorna o maior item da lista
'''
'''
#EVITAR COPIAR DESSE JEITO
n5=[0,1,2,3]
n6=n5
print(n5)
print(n6)
n5.append("senai")
print(n5)
print(n6)
n6.append("errado")
print(n5)
print(n6)
n7=[0,1,2,3]
n8=n7.copy()
print(n7)
print(n8)
n7.append("senai")
print(n7)
print(n8)
'''
'''
#fazendo operações em listas na sua iteração
num=[0,1,2,3,4]
num1=[]
num2=[]
print(num)
#gerando uma nova lista com o dobro dos itens da lista num
for ind in range(len(num)):
    num1= num.append[ind]*2
print(num1)
#gerando uma nova lista com somente numeros pares da lista num

for ind in range(len(num)):
    if(num[ind]%2 == 0):
        num2=num[ind]
'''
'''
### TUPLAS
##Criando tuplas a partir de entradas
n = int(input("Quantos números terão a tupla: "))
tupla = ()
for i in range(n):
    x = int(input("Entre com um número: "))
    tupla = tupla + tuple([x])
print(tupla)

n = int(input("Quantos números terão a tupla: "))
tupla = ("Senai",[1,2], 0.56, 90)
print(tupla)
for i in range(n):
    x = int(input("Entre com um número: "))
    tupla = tupla + tuple([x])
print(tupla)