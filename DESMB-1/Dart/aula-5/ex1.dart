// Primeira exercicio, digitar um valor e fazer ele aparecer
// void main()
// {
//   int valor = 2;
//   print("Gear $valor ~~Luffy's voice~~");
// }

// Segunda exercicio, Fazer com que interagá com o terminal
import 'dart:io'; // Precisa importar a biblioteca

void main()
{
  print("Digite seu nome: ");
  String nome = stdin.readLineSync()!;
  print("Ola $nome"); 
}