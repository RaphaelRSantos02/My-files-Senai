class Componentes{
  String nome;
  double valor;
  int quantidade;
  Componentes(this.nome, this.valor, this.quantidade);
 void exibir(){
  print("Essas são aos informações do componente. Nome: $nome, valor: $valor, Quantidade: $quantidade");
 } 
 void associar(){
  double soma;
  soma = valor * quantidade;
  print("O valor dos componentes é $soma");
 }
}

class Resistor extends Componentes{
  Resistor(String nome, double valor, int quantidade): super(nome, valor, quantidade);
  void exibir(){
    super.exibir();
  }
  void associar(){
    super.associar();
  }
}

class Capacitor extends Componentes{
  Capacitor(String nome, double valor, int quantidade): super(nome, valor, quantidade);
  void exibir(){
    super.exibir();
  }
  void associar(){
    super.associar();
  }
}

class Indutor extends Componentes{
  Indutor(String nome, double valor, int quantidade): super(nome, valor, quantidade);
  void exibir(){
    super.exibir();
  }
  void associar(){
    super.associar();
  }
}

class Diodo extends Componentes{
  Diodo(String nome, double valor, int quantidade): super(nome, valor, quantidade);
  void exibir(){
    super.exibir();
  }
  void associar(){
    super.associar();
  }
}

class Led extends Componentes{
  Led(String nome, double valor, int quantidade): super(nome, valor, quantidade);
  void exibir(){
    super.exibir();
  }
  void associar(){
    super.associar();
  }
}

void main(){
  Resistor R200 = Resistor("200R", 20, 10);
  R200.exibir();
  R200.associar();
  Capacitor uF10 = Capacitor("10uF", 10, 40);
  uF10.exibir();
  uF10.associar();
}

