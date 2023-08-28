import os


os.system("cls")

# lista = []

# while True:
#     numero = input("insira um numero positivo e interiro: ")
#     x = numero.replace("."," ")
#     if x.isnumeric():
#         numero = float(numero)
#         if numero >= 0:
#             lista.append(numero)
#         else:
#             break
#     else:
#         break
# if len(lista) > 0:
#     print("Esses são os numeros da lista: ", lista)
# else:
#     print("infelizmente não há nenhum numero na lista")

#Exercicio 2
lista_2 = []

i = 0

while i < 5:
    numero = input("insira um numero: ")
    x  = numero.replace("-", " ")
    x = x.replace(".", " ")

    if x.isdecimal():
        numero = float(numero)
        lista_2.append(numero)
        i+=1        
    else:
        print("Favor inserir apenas números")

while True: 
    x = input("Você deseja que seja ordenado de forma [c]resente ou [d]ecresene: ")
    if x == "c" or x =="cresente" or x =="Cresente":

        print("Lista em ordem cresente: ", sorted(lista_2))
        break
    elif x == "d" or x == "descresente" or x == "Descresente":
        
        print("Lista em ordem decresente: ", sorted(lista_2, reverse=True))
        break

    else: 
        print("Escolha um das opções")
        break

#Exercicio 3

lista2, lista3  = [], []

while True:
    numero = input(f"Insira um número para a {1 if len(lista2) < 5 else 2}ª lista: ")
    x = numero.replace("-", " ")
    x = x.replace(".", " ")

    if x.isdecimal():
        numero = float(numero)
        if len(lista2) < 5:
            lista2.append(numero)

        elif len(lista3) < 5:
            lista3.append(numero)
            
            if len(lista3) == 5:
                break
    else:
        print("Favor inserir apenas números")

listaSoma, listaMaior, listaMenor = [],[],[]

for i in range(len(lista2)):
    listaSoma.append((lista2[i]+lista3[i]))

    if lista2[i] >= lista3[i]: listaMaior.append(lista2[i])
    else: listaMaior.append(lista3[i])

    if lista2[i] <= lista3[i]: listaMenor.append(lista2[i])
    else: listaMenor.append(lista3[i])

listaDuplicados = []

def verificarContem(num):
    if not num in listaDuplicados:
        listaDuplicados.append(num)

for i in range(len(lista2)):
    if lista2[i] == lista3[i] or lista2[i] == listaSoma[i] or lista2[i] == listaMaior[i] or lista2[i] == listaMenor[i]:
        verificarContem(lista2[i])

    elif lista3[i] == listaSoma[i] or lista3[i] == listaMaior[i] or lista3[i] == listaMenor[i]:
        verificarContem(lista3[i])

    elif listaSoma[i] == listaMaior[i] or listaSoma[i] == listaMenor[i]: 
        verificarContem(listaSoma[i])

    elif listaMaior[i] == listaMenor[i]: 
        verificarContem(listaMaior[i])

if len(listaDuplicados) > 0:
    print(f"Total de repetições: {len(listaDuplicados)} e os números repetidos são: {listaDuplicados}")
else: 
    print("Não há repetições em nenhuma tabela")