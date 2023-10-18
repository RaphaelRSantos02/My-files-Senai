
class alimentos{
  String nome;
  String sabor;
  String cor;
  double peso;
  alimentos(this.nome, this.sabor, this.cor, this.peso);
}

class fruta extends alimentos implements Descascar{
  bool? isMadura;
   fruta(String nome, String sabor,String cor , double peso):super(nome,sabor, cor, peso);

  void madura(isMadura){
    if(isMadura == true){
      print("A fruta $nome esta madura");
    }
    else {
      print("A fruta $nome não está madura");
    }
  }
@override
 void separarTalheres(){
  print("Pegando a faca para descascar a fruta $nome");
 }

 @override
  void pegarVasilha(){
    print("Pegando vasilha");
  }

  @override
  void comerFruta(){
    print("Comendo a fruta $nome");
  }
}
class Uva extends alimentos implements Descascar{
   Uva(String nome, String sabor,String cor , double peso):super(nome,sabor, cor, peso);
   
  @override
  void separarTalheres(){
    print("Não precisa pegar talher para descascar a fruta $nome");
  }
  @override 
  void pegarVasilha(){
        print("Não precisa pegar vasilha a fruta $nome");
  }
  @override
  void comerFruta(){
    print("Pronta para comer a fruta $nome");

  }
}

abstract class Descascar{
  void separarTalheres();
  void pegarVasilha();
  void comerFruta();
}

void main(){

  fruta Laranja = fruta("laranja", "Doce", "laranja", 2);
  Laranja.madura(true);
  Laranja.separarTalheres();
  Laranja.pegarVasilha();
  Laranja.comerFruta();
  Uva uva = Uva("uva", "uva", "roxa", 20);
  uva.separarTalheres();
  uva.pegarVasilha();
  uva.comerFruta();
}