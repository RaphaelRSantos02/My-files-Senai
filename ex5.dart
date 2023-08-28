import 'dart:io';

void main(){
  double nota_1, nota_2, media;
  print("Digite a primeira nota: ");
  nota_1 = double.parse(stdin.readLineSync()!);
  print("Digite sua segunda nota: ");
  nota_2 = double.parse(stdin.readLineSync()!);

media = (nota_1 + nota_2) / 2;
print("Média: $media");
  if(media >= 7 ){
    print('Parabens você passou');
  }
  else if(media >=4 && media <7){
    print('Você que fazer recuperação');
  }
  else{
    print('infelizmente você não passou');
  }
  
}