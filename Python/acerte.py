import random
from os import system 
system("cls")

numero_secreto = random.randint(1, 10)

i = 0
tentativas = 5
while True:
    if i != 5:
        try:
            chute = int(input("Digite um número se acertar ganhará um premio: "))
        except ValueError:
            print("Por favor digite apenas numeros")
        else:
            if chute == numero_secreto:
             print(f"Parabens vc acertou o numero que era [{numero_secreto}]")
             break
            else: 
                tentativas -= 1
                if tentativas == 0:
                    print(f"Acabou suas tentativas, o numero secreto era [{numero_secreto}]")
                    break
                else:
                    print(f"Voce errou o número tente novemente, você tem [{tentativas}] tentativas restantes ")
                    i += 1
