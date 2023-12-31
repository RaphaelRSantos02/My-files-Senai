import 'dart:ffi';

abstract class maquinaIndustrial{
  void nome();
  void potencia();
  void status(bool st);
  void ligar();
  void desligar();
}
class Prensa implements maquinaIndustrial{
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
class Robo implements maquinaIndustrial {
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

class Transportadora implements maquinaIndustrial{
  Float velocidade;
  Transportadora(this.velocidade);
  @override
  void nome(){
    print("Transportadora");
  }

  @override
  void potencia(){
    print("a potencia de $nome() é de 20 ");
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
    print("Aperte o botão Rosa");
  }
  
  @override 
  void desligar(){
    print("Aperte o botão branco");
  }
}

