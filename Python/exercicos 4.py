a = float(input("Insira um numero:"))
b = float(input("Insira outro numero:"))
operacoes = input("Insira um operador (+, -, / ou *):")

if operacoes == "+":
    resultado = a + b
elif operacoes == "*":
    resultado = a * b
elif operacoes == "-":
    resultado = a - b
elif operacoes == "/":
    resultado = a / b
else:
    print("Operação invalida!")
    resultado = 0
print("O resultado é ", resultado)
print("#################################################################################")

altura = float(input("Digite sua altura: "))
peso = float(input("Digite seu peso: "))
imc = peso / altura**2

if imc < 18.5:
    print("Você está abaixo do peso")
elif (imc >= 18.5 and imc < 25 ):
    print("Peso normal")
elif (imc >=25 and imc < 30):
    print("pre obesidade")
elif (imc >= 30 and imc < 35):
    print("obesidade grau 1")
elif (imc >= 35 and imc < 40):
    print("obesidade grau 2")
else:
    imc >= 40
    print("obesidade mórbida")
print("#################################################################################")

casa = float(input("Digite o valor da casa: "))
salario = float(input("Digite seu salario: "))
anos = float(input("Quandos anos falta para pagar: "))
meses = anos * 12
prestacao = casa / meses
if prestacao > salario * 0.3:
    print("Infelizmente você não pode obter o empréstimo")
else:
    print(f"Valor da prestação: R$ {prestacao:3.2f} Empréstimo OK")
print("#################################################################################")

a_1 = float(input("Entre com o valor de a: "))
b_1 = float(input("Entre com o valor de b: "))
c_1 = float(input("Entre com o valor de c: "))

delta = (b_1 ** 2) - 4 * a_1 * c_1

if a_1 == 0:
    print("O valor de a, deve ser diferente de 0")
elif delta < 0:
    print("Sem raízes reais")
else:
    x1 = (-b_1 + delta ** (1 / 2)) / (2 * a_1)
    x2 = (-b_1 - delta ** (1 / 2)) / (2 * a_1)

print("#################################################################################")

codigo = "a"

while codigo != "":
    codigo = input("Digite o valor codificado: ")

    if codigo.isdecimal():
        if len(codigo) == 10:
            zona = int(codigo[0:2])

            match zona:
                case 1: zona = "Sul"
                case 2: zona = "Norte"
                case 3: zona = "Leste"
                case 4: zona = "Oeste"

            temp = int(codigo[2:6])
            temp = str(temp)

            if len(temp) == 4:
                if temp[0:1] == 1:
                    temp = f"-{temp[1:3]},{temp[3:4]}ºC"
                else:
                    temp = f"{temp[0:3]},{temp[3:4]}ºC"
            else:
                temp = f"{temp[0:2]},{temp[2:3]}ºC"

            pluv = int(codigo[6:10])

            print(f"\nRegião: {zona}\nTemperatura: {temp}\nIndice pluviométrico: {pluv}mm\n")
        else:
            print("\nFavor inserir o código com 10 caracteres apenas!\n")
    else:
        print("\nFavor Inserir apenas números!\n")

