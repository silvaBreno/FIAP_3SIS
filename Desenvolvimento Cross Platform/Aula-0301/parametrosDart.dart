void main(){
    login("b@b.com", "123", apelido: "brN");
}

void login(String email, String senha, {String? apelido}){
    print("Seu email é $email e apelido é $apelido ");
}

//  Nomeados Obrigatórios: os parâmetros em Dart na função precisam respeitar ordem e tipo da variável
//  Nomeados Opcionais: - podemos utilizar o null safety ou seja podemos utilizar variveis nulas,
//  mas precisamos indicar para o código utilizando um ponto de interrogação dentro das chaves na frente da tipagem.
//  Ex:No código acima -> {String? apelido}


//  Parâmetro Padrão:

void main(){
    login("b@b.com", apelido: "brN");
}

void login(String email, {String apelido = "bre"}){
    print("Seu email é $email e apelido é $apelido ");
}

//Se eu apagar ele dentro do main, ele utilizar o valor que eu declarei na passagem do parametro do metodo
void main(){
    login("b@b.com");
}

void login(String email, {String apelido = "bre"}){
    print("Seu email é $email e apelido é $apelido ");
}

// Modificador Required - O parametro continua sendo nomeado por estar dentro das chaves e agora obrigatório
void main(){
    login("b@b.com", apelido: "brN");
}

void login(String email, {required String apelido}){
    print("Seu email é $email e apelido é $apelido ");
}

//Coloquei todos meu parâmetros como obrigatórios e nomeados
void main(){
    login(email: "b@b.com", apelido: "brN");
}

void login({required String email, required String apelido}){
    print("Email: $email e Apelido: $apelido ");
}

