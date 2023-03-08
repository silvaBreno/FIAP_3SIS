void main() {
  User usuario = User();
  usuario.cadastro();
  User.name;
}

abstract class BD {
  void cadastro();
  void consulta();
  void edit();
  void excluir();
}

// Para utilzar a classe abstrata eu preciso utilizar o @override
class User implements BD {
  // a palavra static você não precisa instanciar, você pode utilizar direto a variável - vide exemplo de utilizar a variável no próprio método main
  static String? name;
  int? idade;

  @override
  void cadastro() {
    print("cadastrando usuário");
  }

  @override
  void consulta() {}

  @override
  void edit() {}

  @override
  void excluir() {}
}
