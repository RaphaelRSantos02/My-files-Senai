import 'ex5.dart';

void cal_salary(double salary, Function f){
  print('Salary $salary reais');
  cal_bonus();
}
void cal_bonus(){
  print("Bonus: 50 reais");
}
void main(){
  cal_salary(5000, cal_bonus);
}