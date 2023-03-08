void main() {
  Viajar ilhasMaldivas = Viajar(tipoDeTransporte: Transporte.helicoptero);
  ilhasMaldivas.alterarViagens = 10;
  print(ilhasMaldivas.numeroDeViagens);
  ilhasMaldivas.viajei();
}

class Viajar {
  Transporte? tipoDeTransporte;
  int visitas = 0;
  //colocar o "_" underline você está dizendo que essa variável é privada
  static int _viagens = 0;

  Viajar({required this.tipoDeTransporte});

  void visitarLugar() {
    visitas++;
    _viagens++;
    print("Você fez um total de $_viagens viagens");
  }

  int get numeroDeViagens {
    return _viagens;
  }

  //eu utilzo os metodos set/get para esse caso para conferir maior controle, caso contrario eu poderia deixar a variavel _viagens publica
  void set alterarViagens(int novoValor) {
    if (novoValor > 3) {
      print("valor alto");
    } else {
      _viagens = novoValor;
    }
  }

  void viajei() {
    switch (tipoDeTransporte) {
      case Transporte.aviao:
        print("Você viajou de avião, que dahora");
        break;
      case Transporte.bicicleta:
        print("Você está disposto hein, ta com coragem");
        break;
      case Transporte.carro:
        print("Você viajou de carro, ta caro a gasolina rapaz");
        break;
      case Transporte.helicoptero:
        print("Que rico, voando de helicoptero");
        break;
      case Transporte.moto:
        print("Você viajou de moto, que aventura");
        break;
      case Transporte.onibus:
        print("Você viajou de ônibus, tá economizando hein");
        break;
      case Transporte.patins:
        print("Você viajou de patins.... caramba");
        break;
      case Transporte.skate:
        print("Você viajou de skate, que dahora");
        break;
      default:
        {
          print("veículo não identificado");
        }
    }
  }
}

enum Transporte {
  carro,
  bicicleta,
  onibus,
  aviao,
  helicoptero,
  patins,
  skate,
  moto,
}
