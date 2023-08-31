import 'dart:io';

void show_msg(String nome, int idade){
print("nome: $nome,idade: $idade");
}

void main(){
  String nome; int idade;
  print("Digite seu nome: ");
  nome = stdin.readLineSync()!;
  print("Digite sua idade: ");
  idade = int.parse(stdin.readLineSync()!);
  show_msg(nome, idade);
}