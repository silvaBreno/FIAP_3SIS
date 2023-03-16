enum Cor { PRETO, PRATA, AMARELO, AZUL, VERDE }

abstract class Veiculo {
  String _modelo;
  String _ano;
  Cor _cor;

  Veiculo(this._modelo, this._ano, this._cor);

  String get modelo {
    return _modelo;
  }

  String get ano {
    return _ano;
  }

  Cor get cor {
    return _cor;
  }

  void mover();
  void buzinar();
}

class Carro extends Veiculo {
  int _numPortas;

  Carro(String modelo, String ano, Cor cor, int this._numPortas)
      : super(modelo, ano, cor);

  int get numeroPortas {
    return _numPortas;
  }

  void set numeroPortas(int novoNumeroPortas) {
    _numPortas = novoNumeroPortas;
  }

  @override
  void mover() {
    print("O motorista está dirigindo");
  }

  @override
  void buzinar() {
    print("Bora aceletar!! ");
  }
}

class Moto extends Veiculo {
  Moto(modelo, ano, cor) : super(modelo, ano, cor);

  @override
  void mover() {
    print("O motoca se encontra em movimento");
  }

  @override
  void buzinar() {
    print("Bora de motoca! ! Vruuummmmm");
  }
}

void main() {
  Carro carro1 = Carro("Fusca", "ano 1960", Cor.AMARELO, 2);
  Moto moto1 = Moto("Harley Davidson", "ano 2022", Cor.VERDE);
  
  print(carro1.modelo + " " + carro1._ano + " " + "${carro1.cor}" + " "+ carro1.numeroPortas.toString());
  print(moto1.modelo + " " + moto1.ano + " " + "${moto1.cor}");
  
  carro1.buzinar();
  carro1.mover();
  moto1.buzinar();
  moto1.mover();
}
