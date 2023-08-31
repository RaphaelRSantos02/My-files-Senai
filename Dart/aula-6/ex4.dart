import 'dart:io';

double area(double side){
  return side * side;
}

void main(){
  double side;
  print("Por favor insira o valor do lado de um quadrado: ");
  side = double.parse(stdin.readLineSync()!);
  var valor = area(side);
  print('$valor');
}