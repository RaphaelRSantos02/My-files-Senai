import 'dart:io';

void main(){
  double b, altura, area;

  print("Digite quando mete a base do triangulo:");
  b = double.parse(stdin.readLineSync()!);
  print("Digite a altura do triangulo: ");
  altura = double.parse(stdin.readLineSync()!);
  
  area = b*altura/2;
  print("a area do triangulo é $area");
}