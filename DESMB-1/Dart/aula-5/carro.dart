import 'dart:io';

void main(){
List<int> carros = [];
  int n;
  for (int i = 0;  i< 3; i++){
    print("Digite o valor do carro: ");
    n = int.parse(stdin.readLineSync()!);
    carros.add(n);
  }
  
   carros.sort((a, b) => b.compareTo(a));
   print("Ordem do mais caro para o mais barato");
}