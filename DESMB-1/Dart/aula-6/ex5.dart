import 'dart:io';
// Como era um codigo de uma linha fica mais bonito fazendo com =>
// Funciona da mesma forma que se tivesse colocado return
double cal_salary(double salary, double bonus) => salary = salary + (salary + 0.1) + bonus;


void main(){
  double salary, bonus;
  print("Digite o seu salario:");
  salary = double.parse(stdin.readLineSync()!);
  print("Digite seu bonus: ");
  bonus = double.parse(stdin.readLineSync()!);
  var money = cal_salary(salary, bonus);
  print('$money reais');
}