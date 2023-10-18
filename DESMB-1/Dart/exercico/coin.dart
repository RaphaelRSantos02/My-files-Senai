import 'dart:io';

void main(){
  double moeda, valor;
  String escolha;
  print("Digite o valor que deseja converter: ");
  moeda = double.parse(stdin.readLineSync()!);
  print("Digite para que moeda deseja converter [dolar], [Euro] ou [francos suíços]: ");
  escolha = stdin.readLineSync()!;
  if(['dolar', 'euro', 'francos suiços'].contains(escolha)){
    switch(escolha){
      case 'dolar': valor = moeda / 4.97; print("O valor é de $valor \$"); break; 
      case 'euro': valor = moeda / 5.27;  print("O valor é de $valor €"); break;
      case 'francos suiços': valor =  moeda / 5.47; print("O valor é de $valor CHF"); break;
    }
  }
  else {
    print("Por favor digite corretamente");
  }

}