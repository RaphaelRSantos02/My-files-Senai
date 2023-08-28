metros = float(input("Digite o valor em métros: "))
milímetros = metros * 1000
quilometros = metros / 1000
decimetros =  metros * 10
centimetros = metros * 100

print("%10.f metros equivalem a %10.3f milímetros." % (metros, milímetros))
print("%10.f metros equivalem a %10.3f quilometros." % (metros, quilometros))
print("%10.f metros equivalem a %10.3f decimetros." % (metros, decimetros))
print("%10.f metros equivalem a %10.3f centimetros." % (metros, centimetros))

print("###############################################################################################")

quantidade_cigarro = int(input("Digite o n° de cigarros fumados por dia: "))
anos_cigarro = float(input("Digite quantos anos fuma: "))

dias= anos_cigarro * 365
minutos_perdidos = quantidade_cigarro * 10
dias_perdidos = minutos_perdidos / 1440
tempo_perdido = dias_perdidos * dias

print("vc perdeu %10.3f dias de vida" % (tempo_perdido))

print("###############################################################################################")

variavel_A = int(input("digite um valor: "))
variavel_B = int(input("digite outro valor: "))

print("Seu primeiro valor foi ", variavel_A)
print("Seu segundo valor foi ", variavel_B )
print("agora invertendo")

magica = variavel_B
variavel_B = variavel_A
variavel_A = magica

print("seu primeiro valor é ", variavel_A)
print("seu segundo valor é ", variavel_B)
print("ou será que não?")


print("###############################################################################################")

atual_salario =  float(input("Digite seu salario atual: "))
porcentagem = float(input("Digite quantos porcento aumentou o salario: "))

porcentagem = porcentagem / 100
aumento_salario = porcentagem * atual_salario
novo_salario = aumento_salario + atual_salario

print("seu novo salario é de %10.3f reais e seu antigo salario era %10.3f" % (novo_salario, atual_salario))

print("###############################################################################################")

percTot_valido = float(input("quantidade de votos validos:"))
percValido_A = float(input("quantidade de Votos Validos Para Candidato A:"))
percValido_B = float(input("quantidade de Votos Validos Para Candidato B:"))
percValido_C = float(input("quantidade de Votos Validos Para Candidato C:"))
percNulo = float(input("quantidadede Votos:"))
percBranco = float(input("quantidade de Votos em Branco:"))

votoValido = percValido_A + percValido_B + percValido_C
totalEleitor = votoValido + percNulo + percBranco

percTot_valido = (votoValido * 100) / totalEleitor
percValido_A =  (percValido_A * 100) / totalEleitor
percValido_B = (percValido_B * 100) / totalEleitor
percValido_C =  (percValido_C * 100) / totalEleitor
percNulo = (percNulo * 100) / totalEleitor
percBranco = (percBranco * 100) / totalEleitor

print("percentuais do cadidatos a, b, c e votos nulos e brancos respectivamente %10.3f %10.3f %10.3f %10.3f %10.3f" % (percValido_A, percValido_B, percValido_C, percNulo, percBranco))
print("###############################################################################################")

variavel_a = 2
variavel_b = 12
variavel_c =  18

quadrado_a = variavel_a ** 2
quadrado_b =  variavel_b ** 2
quadrado_c = variavel_c ** 2
soma_final = quadrado_a + quadrado_b + quadrado_c

print("A soma final é ", soma_final)

print("###############################################################################################")

numero_sa = int(input("Digite um numero inteiro: "))

numero_sucessor = numero_sa + 1
numero_antecessor = numero_sa - 1

print("o numero sucessor e antecessor é respectivamente: ", numero_sucessor,",", numero_antecessor)

print("###############################################################################################")
