import os
import time
os.system("cls")

#Exercicio 1
# tentativas = 0
# while tentativas < 3:
#     inicio = input("deseja iniciar? (sim ou não):")
#     if inicio == 'não':
#         print("você não quis iniciar o programa de calculos!!")
#         break

#     a = input("Insira um numero:")
#     if not a.isdecimal():
#             tentativas += 1
#             print('Digite novamente um numero')
#             continue 
#     b = input("Insira outro numero:")
#     if not b.isdecimal():
#         tentativas += 1
#         print('Digite novamente um numero')
#         continue 
#     operacoes = input("Insira um operador (+, -, / ou *):")
#     if not operacoes.isdecimal():
#         tentativas += 1
#         print('Insira uma operação valida')
#         continue 

#     if operacoes == "+":
#         resultado = float(a) + float(b)
#     elif operacoes == "*":
#         resultado = float(a) * float(b)
#     elif operacoes == "-":
#         resultado = float(a) - float(b)
#     elif operacoes == "/":
#         resultado = float(a) / float(b)
#     else:
#         print("Operação invalida!")
#         resultado = 0
#     print("O resultado é ", resultado)


# #exercicio 2
# tentativas = 0
# while tentativas < 3:
#     inicio_imc = input("deseja saber seu imc? (sim ou não): ")
    
#     if inicio_imc == 'não':
#         print("você não quis iniciar o programa de imc!!")
#         break

#     altura = input("Digite sua altura: ")
#     aux = altura.replace('.', '')
#     if not aux.isdecimal():
#         tentativas += 1
#         print('Insira uma altura valida')
#         continue 

#     peso = input("Digite seu peso: ")
#     aux = peso.replace(".", "")
#     if not aux.isdecimal():
#         tentativas += 1
#         print('Insira um peso valido')
#         continue 

#     imc = float(peso) / float(altura)**2

#     if imc < 18.5:
#         print("Você está abaixo do peso")
#     elif (imc >= 18.5 and imc < 25 ):
#         print("Peso normal")
#     elif (imc >=25 and imc < 30):
#         print("pre obesidade")
#     elif (imc >= 30 and imc < 35):
#         print("obesidade grau 1")
#     elif (imc >= 35 and imc < 40):
#         print("obesidade grau 2")
#     else:
#         imc >= 40
#         print("obesidade mórbida")

# #Exercicio 3
# tentativas = 0
# while tentativas < 3:
#     inicio_casa = input("Deseja saber se consegue um empréstimo? (sim ou não): ")
#     if inicio_casa == 'não':
#         print("você não quis iniciar o programa para emprestimo!!")
#         break

#     casa = input("Digite o valor da casa: ")
#     aux = casa.replace(".", "")
#     if not aux.isdecimal():
#         tentativas += 1
#         print('Insira um valor da casa')
#         continue 
#     salario = input("Digite seu salario: ")
#     aux = salario.replace(".","")
#     if not aux.isdecimal():
#         tentativas += 1
#         print('Insira um salario valido')
#         continue 
#     anos = input("Quantos anos falta para pagar: ")
#     if not aux.isdecimal():
#         tentativas += 1
#         print('Inisira um ano valido')
#         continue 
#     meses = int(anos) * 12
#     prestacao = float(casa) / meses
#     if prestacao > float(salario) * 0.3:
#         print("Infelizmente você não pode obter o empréstimo")
#     else:
#         print(f"Valor da prestação: R$ {prestacao:.2f} Empréstimo OK")
    
    

# # #Exercicio 4 
# tentativas = 0
# while tentativas < 3:
#     inicio_bhaskara = input("deseja fazer um calculo de bhaskara? (sim ou não):")
#     if inicio_bhaskara == 'não':
#         print("você não quis iniciar o programa para calculo bhaskara!!")
#         break

#     a_1 = input("Entre com o valor de a: ")
#     aux = a_1.replace(".", "")
#     if not aux.isdecimal():
#         tentativas += 1
#         print('Insira um valor valido')
#         continue 
#     b_1 = input("Entre com o valor de b: ")
#     aux = b_1.replace(".", "")
#     if not aux.isdecimal():
#         tentativas += 1
#         print('Insira um valor valido')
#         continue 
#     c_1 = input("Entre com o valor de c: ")
#     aux = c_1.replace(".", "")
#     if not aux.isdecimal():
#         tentativas += 1
#         print('Insira um valor valido')
#         continue 

#     delta = (float(b_1) ** 2) - 4 * float(a_1) * float(c_1)

#     if float(a_1) == 0:
#         print("O valor de a, deve ser diferente de 0")
#     elif delta < 0:
#         print("Sem raízes reais")
#     else:
#         x1 = (-float(b_1) + delta ** (1 / 2)) / (2 * float(a_1))
#         x2 = (-float(b_1) - delta ** (1 / 2)) / (2 * float(a_1))
    

# # #Exercicio 5 
# tentativas = 0
# while tentativas < 3:
#     inicio_pesquisa = input("Deseja saber sobre a pesquisa? (sim ou não)")
#     if inicio_pesquisa == 'não':
#         print("você não quis iniciar o programa para calculo bhaskara!!")
#         break
#     codigo = "a"

#     while codigo != "":
#         codigo = input("Digite o valor codificado: ")

#         if codigo.isdecimal():
#             if len(codigo) == 10:
#                 zona = int(codigo[0:2])

#                 match zona:
#                     case 1: zona = "Sul"
#                     case 2: zona = "Norte"
#                     case 3: zona = "Leste"
#                     case 4: zona = "Oeste"

#                 temp = int(codigo[2:6])
#                 temp = str(temp)

#                 if len(temp) == 4:
#                     if temp[0:1] == 1:
#                         temp = f"-{temp[1:3]},{temp[3:4]}ºC"
#                     else:
#                         temp = f"{temp[0:3]},{temp[3:4]}ºC"
#                 else:
#                     temp = f"{temp[0:2]},{temp[2:3]}ºC"

#                 pluv = int(codigo[6:10])

#                 print(f"\nRegião: {zona}\nTemperatura: {temp}\nIndice pluviométrico: {pluv}mm\n")
#             else:
#                 print("\nFavor inserir o código com 10 caracteres apenas!\n")
#         else:
#             print("\nFavor Inserir apenas números!\n")
    

  
# #Exercicio 6
# n1 = int(input("Digite um numero: "))
# n2 = int(input("Digite outro numero: "))

# if (n1 >= n2):
#     while (n2<=n1):
#         print(n1,end="-")
#         n1 = n1 - 1
        
# else:
#     while(n1<=n2):
#         print(n1, end="-")
#         n1 = n1 + 1

# print("FIM DO PROGRAMA")

#Exercicio 7
num_1 = int(input("Digite um numero: "))
num_2 = int(input("Digite um numero: "))
num_3 = int(input("Digite um numero: "))
num_4 = int(input("Digite um numero: "))

ordem = input("Você deseja que seja ordenado de forma [c]resente ou [d]ecresene: ")
if ordem == "c":
    while(num_1 > num_4 or num_1 > num_2 or num_2 > num_3 or num_3 > num_4):
        if(num_1 > num_4):
            troca = num_1
            num_1 = num_4
            num_4 = troca
        elif(num_1 > num_2):
            troca = num_1
            num_1 = num_2
            num_2 = troca
        elif(num_2 > num_3):
            troca = num_2
            num_2 = num_3
            num_3 = troca
        else:
            troca = num_3
            num_3 = num_4
            num_4 = troca
elif ordem == "d":
    while(num_1 < num_4 or num_1 < num_2 or num_2 < num_3 or num_3 < num_4):
        if(num_1 < num_4):
            troca = num_1
            num_1 = num_4
            num_4 = troca
        elif(num_1 < num_2):
            troca = num_1
            num_1 = num_2
            num_2 = troca
        elif(num_2 < num_3):
            troca = num_2
            num_2 = num_3
            num_3 = troca
        else:
            troca = num_3
            num_3 = num_4
            num_4 = troca
else:
    print("Você não escolheu a ordem")
print(f"Os valores em ordem é {num_1, num_2, num_3, num_4}")
time.sleep(10)




#Exeercicio 9
segundos = 0

while True:
    os.system('cls') # limpa o console

    if segundos < 60:
        if segundos < 10:
            print(f'00:0{segundos}') 
        else:
            print(f'00:{segundos}')
    else:

        minutos = segundos//60 #Dois barras serve para fazer com q a divisão não tenha resto
        segundos_2 = segundos%60 # porcentagem serve para pegar o resto da divisão

        string = ''

        if minutos < 10:
            string += f'0{minutos}:'
        else:
            string += f'{minutos}:'

        if segundos_2 < 10:
            string += f'0{segundos_2}'
        else:
            string += f'{segundos_2}'

        print(string)

    time.sleep(1)
    segundos+=1
