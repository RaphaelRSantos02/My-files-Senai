#### AULA 03 - FUNÇÃO PRINT , FORMATAÇÃO DE ESCRITA, INPUT E CONVERSÃO DE STRINGS

##### FUNÇÃO PRINT método sobrecarregado

print("SENAI")
print("SENAI", "LIP", sep="-")  ## usando separodor do método
print("SENAI", "LIP", sep="-", end=" ")  ## finalizador agrega alguma sequencia de finalização da escrita,
                                        ## o default é '/n' feed line, significa pula uma linha e vai pro inicio
                                        ## veja que nem precisamos escrever nas anteriores pra ele fazer isso,
                                        ## sem uma sequencia como foi mostrado ele continua na mesma linha
                                        ## pesquise caracteres de escape
print("1SEM2023")
print("######################################################################################################")

##  MANIPULAÇÃO DE STRINGS
texto = "SENAI ROBERTO MANGE"
print(len(texto))  ## objeto len retorna a quantidade de caracteres de algo.
                   ## poderá ser usado em outras funções que manipulem string
print("######################################################################################################")
## particionar
print(texto[0:19])  ## o primeiro parâmetro é de onde deseja iniciar a escrita e o segundo é
                    ## até quando deseja-se printar

print(texto[14:19])
print(texto[6:13])
print(texto[4])
print(texto[4:])
print(texto[:13])
print("######################################################################################################")

## concatenar
print(texto, 2 * texto, sep='-')
print(texto + 2 * texto, sep='-')
print("######################################################################################################")

## formatação de textos
idade = 5
altura = 1.8912321458999998421
nome = "Leônidas"
numero = -110

print("O rei ", nome, " tem ", idade, " anos e mede  ", altura, " metros.")
print("O rei %s tem %02d anos e mede %4.2f metros." %(nome, idade, altura)) # É uma forma muito usada em outras linguagens
print("O rei %20s tem %02d anos e mede %4.2f metros." %(nome, idade, altura)) # É uma forma muito usada em outras linguagens
print("O rei %-20s tem %02d anos e mede %4.2f metros." %(nome, idade, altura)) # É uma forma muito usada em outras linguagens
print("O número é %3d" %numero)
print("##############################################################################################")
print("O rei {} tem {} anos e mede {} metros".format(nome,idade,altura))
print("O rei {:20} tem {:02} anos e mede {:4.2f} metros".format(nome,idade,altura)) # Talvez a mais usual hoje
print("O rei {:>20} tem {:02} anos e mede {:4.2f} metros".format(nome,idade,altura))
print("O rei {:*>20} tem {:02} anos e mede {:4.2f} metros".format(nome,idade,altura))
print(f"O rei {nome:8} tem {idade:02} anos e mede {altura:4.2f} metros.") # acrescente o f antes da string
print(f"O número é {numero:4}")
print("######################################################################################################")

## Entrada de dados
variavel = float(input("Digite uma variável do teclado: ")) #inpunt é uma entrada que a varivel vai receber.
print("O tipo da variável é : ", type(variavel))

#ESCREVA UM PROGRAMA QUE CONVERTA UMA TEMPERATURA DIGITADA EM º CELSIUS EM FARENNHEIT e KELVIN
#F=(9*ºC)/5 + 32     K = ºC + 273,15 . MOSTRE OS RESULTADOS COM UMA CASA DECIMAL

tempCelsius = float(input("DIGITE A TEMPERATURA EM GRAUS CELSIUS= "))  # tudo que a função input trouxer será literal e
                                                                       # portanto sendo um número deverá ser convertido

tempFar = ((tempCelsius * 9) / 5) + 32
tempKel = tempCelsius + 273.15
print("Temperatura Farenheit = %5.1f ºF." % tempFar)
print(f"Temperatura Farenheit = {tempFar:5.1f} ºF.")
print("Temperatura Kelvin = %5.1f K." % tempKel)
print(f"Temperatura Kelvin = {tempKel:5.1f} K.")
print("######################################################################################################")