import 'dart:io';

void main(){
  int tabuada,n, a = 1;
  print("Digite o numero que você quer saber a tabuada: ");
  n = int.parse(stdin.readLineSync()!);
  for(int i = 0; i <=9; i++){
    tabuada = n * a;
    a ++;
    print("Tabuada: $tabuada");

  }
}