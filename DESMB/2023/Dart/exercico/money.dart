import 'dart:io';

void main() {
  double sal;
  double bonus = 1.2;
  double imposto = 0.1;
  print("Digite seu salario: ");
  sal = double.parse(stdin.readLineSync()!);
  double real_salario = sal * bonus - (sal * imposto);

print("Seu salario é $real_salario");

}