class Animal{
  String name;
  String color;
  double age;
  Animal(this.name, this.color,this.age);
  void alimentar(bool alimento){
    if(alimento == true){
      print("$name ja foi alimentado");
    }
    else{
      print("$name ainda não foi alimentado");
    }
  }

  void dormir(bool dormindo){
    if(dormindo == true){
      print("$name está dormindo");
    }
    else{
      print("$name está acordado");
    }
  }
  void bravo(bool isbravo){
    if(isbravo == false){
      print("$name é bravo, tome cuidado");
    }
    else{
      print("$name não é bravo, pode ficar de boa");
    }
  }
}

class Dog extends Animal{
  Dog(String name, String color, double age): super(name, color, age);
  void alimentar(bool alimento) {
    //herda o void alimentar do animal
    super.alimentar(alimento);
  }
  void dormir(bool dormindo){
    super.dormir(dormindo);
  }
  void bravo(bool isbravo){
    super.bravo(isbravo);
  }
}
class Cat extends Animal{
  Cat(String name, String color, double age): super(name, color, age);
    void alimentar(bool alimento) {
    //herda o void alimentar do animal
    super.alimentar(alimento);
  }
    void dormir(bool dormindo){
    super.dormir(dormindo);
  }
  void bravo(bool isbravo){
    super.bravo(isbravo);
  }
}
class Tiger extends Animal{
  Tiger(String name, String color, double age): super(name, color, age);
    void alimentar(bool alimento) {
    //herda o void alimentar do animal
    super.alimentar(alimento);
  }
    void dormir(bool dormindo){
    super.dormir(dormindo);
  }
  void bravo(bool isbravo){
    super.bravo(isbravo);
  }
}

void main(){
  Dog yorkshire = Dog("Zoe","Black", 3);
  yorkshire.alimentar(true);
  yorkshire.dormir(true);
  yorkshire.bravo(false);
  Cat siames  = Cat("vergil", "white", 1.5);
  siames.alimentar(false);
  siames.dormir(true);
  siames.bravo(true);
  Tiger tiger = Tiger("Gatinho", "yellow", 3.5);
  tiger.alimentar(false);
  tiger.dormir(false);
  tiger.bravo(true);
}

