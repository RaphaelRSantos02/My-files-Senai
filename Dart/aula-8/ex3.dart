class Usuario {
  String? usuario;
  String? senha;
  void autenticar()
  {
    var usuario = "Raphael";
    var senha = "12345";
    if(this.usuario == usuario && this.senha == senha){
         print("Login correto");
    }
    else{
      print("Tente novamente");
    }
  }
}

void main(){
Usuario usuario = Usuario();
usuario.usuario = "Raphael";
usuario.senha = "12345";
usuario.autenticar();
}