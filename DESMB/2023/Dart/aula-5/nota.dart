import 'dart:io';

void main(){
  double media = 0, nota = 0;

  for(int i = 0; i < 10; i++){
    print("Digite a nota do aluno ${i+1}: ");
    nota = double.parse(stdin.readLineSync()!);
    media += nota;
  }
  media = media/10;
  print("A media dos 10 alunos é [$media]");
}