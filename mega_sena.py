import random
from os import system 
from pick import pick
from time import sleep
 
listaMega = []

def generatePick(titulo, opcao):
     option, index = pick( title = titulo, options = opcao, indicator= '-->', default_index=0 )

     return option, index

def aleatorio(n):
    variavel = 0
    listNumber = []
    while variavel < n:
        r = random.randint(1,60)
        if r not in listNumber:
                listNumber.append(r)
                variavel+=1
    return listNumber

def premio():
    global listaMega
    listaMega = aleatorio(6)
    listaMega.sort()

def sorte(a):
    acertos = 0
    luck = aleatorio(a)
    luck.sort()

    for i in range(0, len(luck)):
        if luck[i] in listaMega:
            acertos+=1

    if acertos == 6:
        return "parabens você ganhou"
    else:
        return "Infelizmente você não ganhou"
  

while True:
    system("cls")
    premio()
    acertos = 0
    
    option, index = generatePick("mega sena", ["mega sena", "supresinha", "sair"])

    match index:
        case 0:
            tenta = input("Digite os numeros (de uma virgula entre os numeros e por favor coloque em ordem crescente): ")
            
            tentativa = tenta.split(",")

            for i in range(0, len(tentativa)):
                if int(tentativa[i]) in listaMega:
                    acertos+=1

            if acertos == 6:
                print("parabens você ganhou")
                sleep(3)
            else:
                print("Infelizmente você não ganhou")
                sleep(3)
        case 1:
                option, index = generatePick("Escolha quandos numeros que você está marcando", ["6","7","8", "9", "10", "11", "12", "13", "14", "15", "voltar"])

                if option != 'voltar':
                        print(sorte(int(option)))
                        sleep(3)
        case 2:
                exit()