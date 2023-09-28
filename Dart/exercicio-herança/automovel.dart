class automovel{
  String Cor;
  String Modelo;
  String Combustivel;
  int Rodas;
  automovel(this.Cor, this.Modelo, this.Combustivel, this.Rodas);
  
  void ligar_carro(){
    print("motor ligado");
  }
  void desligar_carro(){
    print("motor desligado");
  }
  void abrir_vidro(){
    print("Janelas desceram");
  }
  void subir_vidro(){
    print("janelas subiram");
  }
}

class carro extends automovel{
  carro(String Cor, String Modelo, String Combustivel, int Rodas):super(Cor, Modelo, Combustivel, Rodas);
  void ligar_carro(){
    super.ligar_carro();
  }
  void desligar_carro(){
    super.desligar_carro();
  }
  void abrir_vidro(){
    super.abrir_vidro();
  }
  void subir_vidro(){
    super.subir_vidro();
  }
}


class Moto extends automovel{
  Moto(String Cor, String Modelo, String Combustivel, int Rodas):super(Cor, Modelo, Combustivel, Rodas);
  void ligar_carro(){
    super.ligar_carro();
  }
  void desligar_carro(){
    super.desligar_carro();
  }
  void abrir_vidro(){
    super.abrir_vidro();
  }
  void subir_vidro(){
    super.subir_vidro();
  }
}


class Caminhao extends automovel{
  Caminhao(String Cor, String Modelo, String Combustivel, int Rodas):super(Cor, Modelo, Combustivel, Rodas);
  void ligar_carro(){
    super.ligar_carro();
  }
  void desligar_carro(){
    super.desligar_carro();
  }
  void abrir_vidro(){
    super.abrir_vidro();
  }
  void subir_vidro(){
    super.subir_vidro();
  }
}

void main(){
  carro HB20 = carro("Prata", "HB20", "Gasolina", 4);
  HB20.ligar_carro();
  HB20.desligar_carro();
  HB20.abrir_vidro();
  HB20.subir_vidro();
  Moto harley =  Moto("Vermelho", "harley davidson", "Etanol", 2);
  harley.ligar_carro();
  harley.desligar_carro();
  harley.abrir_vidro();
  harley.subir_vidro(); 
  Caminhao Carreta = Caminhao("Branco", "Carreta", "Gasolina", 8);
  Carreta.ligar_carro();
  Carreta.desligar_carro();
  Carreta.abrir_vidro();
  Carreta.subir_vidro(); 
}