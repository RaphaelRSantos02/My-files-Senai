import matplotlib.pyplot as plt
import numpy as np
from os import system

#exemplo do plot pelo matplotlib
def parabola():
    system('cls')
    a = float(input("Informe um valor para a: "))
    b = float(input("Informe um valor para b: "))
    c = float(input("Informe um valor para c: "))

    delta = (b**2) - (4 * a * c)
    
    if delta >= 0:
        x1 = (-b + ((delta **0.5))) / (2* a)
        x2 = (-b - ((delta **0.5))) / (2* a)

        if x1 == x2:
            print("As raizes são iguais, a raiz: ", x1 )
        else: 
            print(f"As raizes são diferentes e são especificamente: {round(x1,2)} e {round(x2,2)}" )

        xv = []
        yv = []

        for x in range(-10, 11, 1):
            xv.append(x)
            yv.append((a *(x**2)) + (b * x) + c)

        #tamanho da figura
        plt.figure(figsize = (10,6))
        #define X, Y, tipo de marcador(nenhum nesse caso) e cor

        plt.plot(xv, yv, marker='', color='red')
        #define título
        plt.title('Gráfico f(x)')
        #define nome a mostrar no eixo x
        plt.xlabel('Eixo x')
        #define nome a mostrar no eixo y
        plt.ylabel('Eixo y')
        #faz a plotagem
        plt.show()
    else:
        print('delta negativo')
    
parabola()