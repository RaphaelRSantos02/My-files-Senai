import 'dart:io';

// void main (){
//   int n1, n2, soma; //Declara variaveis do tipo interia
//   print("Digite seu primeiro numero: "); //Exibe mensagem no terminal
//   n1 = int.parse(stdin.readLineSync()!); //Armazena numero digitado
//   //pelo usuario e converte para inteiro

//   print("Digite seu segundo numero: ");
//   n2 = int.parse(stdin.readLineSync()!);

//   soma = n1 + n2;

//   print("A soma dos seus numeros é [$soma]");
  
// }

//Esse é com if e else, switch e while:
void main(){
  double n1, n2, soma, menos, multiplicacao, divisao;
  String  escolha, saida;

  saida = "sim";

  while(saida =="s" || saida =="sim"){

  print("Digite seu numero: ");
  n1 = double.parse(stdin.readLineSync()!);

  print("Digite seu segundo numero: ");
  n2 = double.parse(stdin.readLineSync()!);

  print("Digite [-], [+], [*] ou [/] (não precisa colocar conchetes): ");
  escolha = stdin.readLineSync()!;
  if (['-', '+', '*', '/'].contains(escolha)) {
    switch(escolha){
    case '-': menos = n1 - n2; print('O resultado é $menos'); break;
    case '+': soma = n1 + n2; print('O reseultado é $soma'); break;
    case '*': multiplicacao = n1 * n2; print('O resultado é $multiplicacao'); break;
    case '/': divisao = n1 / n2; print('O resultado é $divisao'); break;
  };
  }
  else{
    print("Coloque uma operação matematica valida");
  }
  
  print("deseja realizar uma operação? ");
  saida = stdin.readLineSync()!;
  }
}