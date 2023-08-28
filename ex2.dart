import 'dart:io';

void main()
{
  print("Digite seu nome: ");
  String nome = stdin.readLineSync()!;
  print("Digite seu curso: ");
  String curso = stdin.readLineSync()!;
  print("Digite sua idade: ");
  String idade = stdin.readLineSync()!;
  int.parse(idade); // ou  String idade = int.parce(stdin.readLineSync()!);

  print("Nome: $nome, Idade: $idade, Curso: $curso");
}