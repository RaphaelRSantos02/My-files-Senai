import 'dart:io';

void main(){
  double kwh,reais;
  String escolha, saida;
  saida = "sim";

  while(saida =="s" || saida =="sim"){
    print("Digite que tipo de instalação[R], [I] ou [C]: ");
    escolha = stdin.readLineSync()!;
    if(escolha == "R"){
      print("Informe a quantidade de KWh consumida: ");
      kwh = double.parse(stdin.readLineSync()!);
      if(kwh <= 500){
        reais = kwh * 0.5;
        print("O valor que devera pagar é de: [$reais]");
      }
      else{
        reais = kwh * 0.7;
        print("O valor que devera pagar é de: [$reais]");
      }
    }
    else if(escolha == "I"){
      print("Informe a quantidade de KWh consumida: ");
      kwh = double.parse(stdin.readLineSync()!);
      if(kwh <= 1000){
        reais = kwh * 0.65;
        print("O valor que devera pagar é de: [$reais]");
      }
      else{
        reais = kwh * 0.6;
        print("O valor que devera pagar é de: [$reais]");
      }
    }
    else if(escolha == "C"){
      print("Informe a quantidade de KWh consumida: ");
      kwh = double.parse(stdin.readLineSync()!);
      if(kwh<= 5000){
        reais = kwh * 0.55;
        print("O valor que devera pagar é de: [$reais]");
      }
      else{
        reais = kwh * 0.5;
        print("O valor que devera pagar é de: [$reais]");
      }
    }
    else{
      print("Digite uma das escolhas validas");
    }
    print("Deseja rever os valores?: ");
  saida = stdin.readLineSync()!;
  }
}