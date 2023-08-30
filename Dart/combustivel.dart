import 'dart:io';

void main(){
  double litro, preco_final, desconto, reais;
  String escolha;

  print("Digite qual combustivel você irá comprar [G], [E], [D]: ");
  escolha = stdin.readLineSync()!;
  if(escolha == "G"){
    print("Quandos litros você irá comprar:");
    litro = double.parse(stdin.readLineSync()!);
    if(litro >= 20){
      desconto = 4.50 * litro * 0.3;
      preco_final = 4.50 * litro - desconto;
      print("O valor a ser pago é $preco_final reais");
    }
    else{
      preco_final = 4.50 * litro;
      print("O valor a ser pago é $preco_final reais");
    }
  }
  else if(escolha == "E"){
      print("Quandos litros você irá comprar:");
      litro = double.parse(stdin.readLineSync()!);
      if(litro >= 15){
      desconto = 1.7 * litro * 0.4;
      preco_final = 1.7 * litro - desconto;
      print("O valor a ser pago é $preco_final reais");
      }
      else{
      desconto = 1.7 * litro * 0.3;
      preco_final = 1.7 * litro - desconto;
      print("O valor a ser pago é $preco_final reais");
      }
  }
  else if(escolha == "D"){
      print("Quandos litros você irá comprar:");
      litro = double.parse(stdin.readLineSync()!);
      if(litro >=15 ){
      desconto = 2 * litro * 0.5;
      preco_final = 2 * litro - desconto;
      print("O valor a ser pago é $preco_final reais");
      }
      else{
      desconto = 2 * litro * 0.3;
      preco_final = 2 * litro - desconto;
      print("O valor a ser pago é $preco_final reais");
      }
    }

  }
