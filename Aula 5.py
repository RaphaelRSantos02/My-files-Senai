'''
Aula 05 - Estruturas de Repetição em Python
'''
import time

# repetição simples

#exemplo 1
i = 0
while i <= 10:
    print(i, end="-")
    i = i + 1
    time.sleep(1)
print("\n","Fim do programa!", f"O último valor de i foi: {i:02d}")
'''
'''
#exemplo 2
n = int(input("Digite um número inteiro positivo: "))
i=0
while i <= n:
    i = i + 1
    print(i , end="-")
    time.sleep(1)
print("Fim do programa!", f"O último valor de i foi: {i:02d}")
'''
'''
#exemplo 3
n = int(input("Digite um número inteiro positivo: "))
while n >= 0:
    print(n, end="-")
    n = n - 1
    time.sleep(1)
print("FIM DO PROGRAMA!")
'''

'''
#exemplo 4
n1 = int(input(("Digite um número inteiro entre 1 e 10 ou sair para sair do sistema: ")))
while (n1 >= 1 and n1 <= 10):

    n1 = int(input(("Digite um número interiro entre 1 e 10: "))) # início do bloco de repetição


print("Fim da linha, você digitou um numero fora desse range!!")
'''

'''
#exemplo 5
texto = input("Digite um número inteiro: ")
while(not texto.isdecimal()):
    texto = input("Você não digitou um numero inteiro! Digite um numero inteiro: ")
print("Você digitou um número inteiro!")
'''

'''
#exemplo 6 deve se tomar cuidado com essas duas situações
a = 0
while a > 0:   # AQUI ESSA REPETIÇÃO NUNCA SERÁ VERDADEIRA
    a = a + 1
    print(a)
print("NUNCA SERÃO!")

a=int(input("Digite um valor para a: "))
while a >= 0: #AQUI VIROU UM LOOP INFINITO
    a = a + 1
    print(a)
    if (a > 99):
        print("chegaa")
        break
'''
'''
#repetição com else
texto = input("Digite um número inteiro entre 1 e 10: ")
while(not texto.isdecimal()):
    texto = input("Você não digitou um numero inteiro! Digite um numero inteiro: ")
else:
    print("Você digitou o numero correto!")
'''

'''
# repetição aninhada ou recursiva com outros comandos ou repetições
#exemplo 7
texto=input("Digite um número inteiro entre 1 e 10: ")
cont=0
while(not texto.isdecimal()):
    texto = input("ATENÇÃO: Digite apenas numeros inteiros de 1 a 10: ")
    cont += 1
    if(cont>3):
        print("APRENDA A USAR O PROGRAMA PRIMEIRO E LER AS ORIENTAÇÕES!")
        print(cont, "A")
        break   # o camondo break arranca o programa de uma repetição
else:
    while (texto.isdecimal()):
        cont=0
        n1 = int(texto)
        if (n1 >= 1 and n1 <= 10):
            print("Número dentro do range!")
            texto = input("Digite um número inteiro entre 1 e 10: ")
            while (not texto.isdecimal()):
                texto = input("ATENÇÃO: Digite apenas numeros inteiros de 1 a 10: ")
                cont += 1
                print(cont, "B")
                if (cont > 3):
                    print("APRENDA A USAR O PROGRAMA PRIMEIRO E LER AS ORIENTAÇÕES!")
                    break
        else:
            cont=0
            print("Número fora do range")
            texto = input("Digite um número inteiro entre 1 e 10: ")
            while (not texto.isdecimal()):
                texto = input("ATENÇÃO: Digite apenas numeros inteiros de 1 a 10: ")
                cont += 1
                print(cont, "C")
                if (cont > 3):
                    print("APRENDA A USAR O PROGRAMA PRIMEIRO E LER AS ORIENTAÇÕES!")
                    break

'''

'''
# comando repetição for (mais usado em repetições limitadas ou com uma quantidade de vezes previamente desejada)
# o for só pode ser usado em iterações vamos usar por enquanto só com o comando range
# veremos depois o for em listas, conjuntos, matrizes
for numero in range(0,10,1):     #### sintaxe do range(inicio, parada, incremento)
    print(numero, "- ", end="")  ### A PARADA NÃO É ATRIBUIDA A VARIÁVEL com o range
    time.sleep(0.5)
'''

'''
# comando continue
for numero in range(0,10,1):
    if(numero == 5):
        continue
    print(numero, "- ", end="")

# comando break
for numero in range(0, 10, 1):
    if (numero == 5):
        break
    print(numero, "- ", end="")

# Também pode ser usado para gerar sequencias decrescentes
for numero in range(10, 0, -1):
    print(numero, "- ", end="")