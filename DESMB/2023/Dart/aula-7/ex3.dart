double cal_salario(double sal,double desc, Function f){
  f();
  return sal = sal - (sal * desc);
}

void exibir_mgs(){
  print("DIa de pagamento");
}
void main()
{
  double salario = cal_salario(5000, 0.1, exibir_mgs);
  print("O salario foi de R\$ $salario");
}