import 'dart:io';
// para colocar uma variavel como opcional tem que colocar dentro de chaves e
// com ponto de interrogação
void recive_data(String name, int age, {double? height}){
  var new_height = height?? 0;
  print('name: $name');
  print('year: $age');
  print('height: $height');
}

void main(){
  print("write your name: ");
  String name = stdin.readLineSync()!;
  print("write your age: ");
  int age = int.parse(stdin.readLineSync()!);
  print("write your height: ");
  // opcional coloca ponto de interrogação
  double? height = double.parse(stdin.readLineSync()!);
  recive_data(name, age, height:height);

}