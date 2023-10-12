abstract class automovel{
  void nome();
  void cor();
  void ano();
  void cinto(bool st);
  void ligar(bool st);
}

class carro implements automovel{
  void nome(){
    print("HB20");
  }
  void cor(){
    print("prata");
  }
  void ano(){
    print(2020);
  }
  void cinto(bool st){
    if(st == true){
      print("Está com cinto");
    }
    else{
      print("Não está com o cinto");
    }
  }
  void ligar(bool st){
    if(st == true){
      print("O carro está ligado");
    }
    else{
      print("O carro não está ligado");
    }
  }
}


void main(){
  carro HB20 = carro();
  HB20.nome();
  HB20.cor();
  HB20.ano();
  HB20.cinto(true);
  HB20.ligar(true); 
}