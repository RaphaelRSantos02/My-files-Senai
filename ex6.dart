import 'dart:io';

void main(){
  double idade1, idade2;
  print("Digite a idade da primeira pessoa: ");
  idade1 = double.parse(stdin.readLineSync()!);
  print("Digite a idade da segunda pessoa: ");
  idade2 = double.parse(stdin.readLineSync()!);

  if (idade1>idade2){
    print("A primeira pessoa é mais velha que a da segunda");
  }
  else if(idade2<idade1){
    print("A segunda pessoa é mais velha que a da primeira ");
  }
else {
  print("As idades não iguais");
}
}