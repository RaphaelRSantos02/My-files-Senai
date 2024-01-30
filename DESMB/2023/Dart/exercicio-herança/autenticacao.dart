class usuario{
  String login;
  String senha;
  usuario(this.login, this.senha);

  void autenticacao(String login_user, String senha_user){
    if(login == login_user && senha == senha_user){
      print("Login realizado com sucesso!");
    }
    else{
      print("Login ou senha invalida");
    }
  }
}

void main(){
  usuario Raphael = usuario("raphael", "123");
  Raphael.autenticacao("raphael", "123");
}