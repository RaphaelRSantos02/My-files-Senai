// função anonima

void cal_salario(String nome,double sal, Function f){
  print("Nome: $nome");
  print("salario  $sal");
  f();
}

void main(){
  cal_salario("Raphael", 1500, (){
    int a, b, soma;
    a = 5;
    b = 6;
    soma = a+b;
    print("bonus 50");
    print(soma);
  });
  cal_salario("Silvio", 3500, (){
    print("bonus R\$ 100");
  });
}