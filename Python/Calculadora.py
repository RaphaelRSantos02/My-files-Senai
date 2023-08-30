from pick import pick
from os import system
import time


#Função que realiza a soma de dois numeros(somente numeros)
def somar():
    a = float(input("Digite o primeiro numero: "))
    b = float(input("Digite O segundo numero: "))
    return a + b

#Função que realiza a subtrair de dois numeros(somente numeros)
def subtrair():
    a = float(input("Digite o primeiro numero: "))
    b = float(input("Digite O segundo numero: "))
    return a - b

#Função que realiza a multiplicar de dois numeros(somente numeros)
def dividir():
    a = float(input("Digite o primeiro numero: "))
    b = float(input("Digite O segundo numero: "))
    if b == "0":
        print("impossivel dividir por zero, Por favor tente de novo: ")
        
    else:
        return a / b  

#Função que realiza a dividir de dois numeros(somente numeros)
def multiplicar():
    a = float(input("Digite o primeiro numero: "))
    b = float(input("Digite O segundo numero: "))
    return a * b

while True:
    system('cls')
    

    title = "Selecione operador que deseja fazer a conta"
    option = ['somar (+)', 'subtrair (-)', 'multiplicar (*)', 'dividir (/)', 'Sair']

    option, index = pick(options=option, title= title, indicator= '-->', default_index=0)

    match index:
        #Opção para somar dois numeros
        case 0:
            print("O resultado é", somar())
            time.sleep(1,5)

        #Opção para subtrair dois numeros
        case 1:
            print("O resultado é ", subtrair())
            time.sleep(1,5)

        #Opção para multiplicar dois numeros
        case 2:
            print("O resultado é ", multiplicar())
            time.sleep(1,5)

        #Opção para dividir dois numeros
        case 3:
            print("O resultado é ", dividir())
            time.sleep(1,5)
           
        case 4:
            exit()