// get serve para pegar
class conta{
  double _saque = 0;
  double _saldo = 500;
  double get saque{
    return this._saque;
  }
  
  double get saldo{
    return this. _saldo - this._saque;
  }
// set para setar parametro

set saque(double valor){
  if(valor > 0 && valor<this._saldo){
    this._saque = valor;
  }
  else{
    print("saldo insuficiente");
    }
  }
}

void main(){
  conta Rocky = conta();
  Rocky.saldo;
  Rocky.saque  = 300;
  print("Saldo conta Rocky ${Rocky.saldo}");
  print("Saque conta Rocky ${Rocky.saque}");
}