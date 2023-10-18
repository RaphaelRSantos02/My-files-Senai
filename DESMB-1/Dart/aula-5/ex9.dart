import 'dart:io';

// void main(){
//   List lista =["Pomme","Richalison", "Dapper"];
//   print(lista);
//   print("Acesso indice 1 " + lista[1]);
//   //print(lista[1]);
//   List<int> numero = [1,2,3,4,5,6];
//   print(numero);
// }

void main(){
  List<int> valores = [];
  int n;
  for (int i = 0;  i< 4; i++){
    print("Digite o valor para lista, numero de objetos na lista atualmente -->[$i]: ");
    n = int.parse(stdin.readLineSync()!);
    valores.add(n);
    // ou valores.add(int.parse(stdin.readLineSync()!));
  }
  print(valores);
}