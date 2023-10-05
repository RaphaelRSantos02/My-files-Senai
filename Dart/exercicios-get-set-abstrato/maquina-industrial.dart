
abstract class maquina{
  void nome();
  void potencia();
  void status(bool st);
  void ligar();
  void desligar();
}
class Prensa implements maquina{
  double pressao;
  Prensa(this.pressao);
  void nome(){
    print("Presa dois mil");
  }
  void potencia(){
    print("A potencia de $nome() é de 100 ");
  }
  void status(bool st){
    if(st = true){
      print("A maquina esta ligada");
    }
    else{
      print("A maquina esta desligada");
    }

  }
  void ligar(){
    print("Pressione o botão azul e o vermelho ao mesmo tempo");
  }
  void desligar(){
    print("Pressione o botão vermelho");
  }
}
class Robo implements maquina {
  String solda;
  Robo(this.solda);

  @override
  void nome(){
    print("Robo brasa");
  }

  @override
  void potencia(){
    print("a potencia de $nome() é de 50 ");
  }
  @override
  void status(bool st){
    if(st = true){
      print("A maquina esta ligada");
    }
    else{
      print("A maquina esta desligada");
    }
  }

  @override
  void ligar(){
    print("puxe a alavanca");
  }
  
  @override 
  void desligar(){
    print("empurre a alavanca");
  }
}


