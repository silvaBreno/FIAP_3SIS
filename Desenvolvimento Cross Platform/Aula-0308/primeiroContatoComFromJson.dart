void main() {
  Map<String, dynamic> map = {};
  map["nome"] = 'breno';
  map["idade"] = 27;
  print(map);
}

abstract class BD {
  void cadastro();
  void consulta();
  void edit();
  void excluir();
}

// Para utilzar a classe abstrata eu preciso utilizar o @override
class User implements BD {
  String name;
  int idade;

  User({required this.name, required this.idade});

  User.fromJson(Map<String, dynamic> map)
      : name = map["name"],
        idade = map["idade"];

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
