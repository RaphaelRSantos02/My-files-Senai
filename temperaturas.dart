import 'dart:io';

void main(){
  double media = 0;
  int n;
  for (int i = 0;  i < 21; i++){
      print("Digite a temperatura: ");
      n = int.parse(stdin.readLineSync()!);
      media += n;
  }

  print('Média: ${media/20}');
}