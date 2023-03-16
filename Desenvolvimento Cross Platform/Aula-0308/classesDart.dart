//Aprimorando os conceitos de Classe em Dart
void main(){
    User breno = User("b@b.com", "Breno", 27);
    int newAge = breno.sumAge();
    print(newAge);
}

class User{
    String email;
    String name;
    int age;
    User(this.email, this.name, this.age);

    int sumAge(){
        return (age + 1);
    }
}

//Agora vou dizer que os parametros da minha classe são opcionais
void main(){
    User breno = User("b@b.com", "Breno", 27);
    int newAge = breno.sumAge();
    print(newAge);
}

class User{
    String? email;
    String? name;
    int age;
    User({this.email, this.name, required this.age});

    int sumAge(){
        age += 1;
        return age;
    }
}

// Adicionando mais uma classe

void main(){
    User breno = User("Breno", 1.85, email:"b@b.com", age: 27);
    int newAge = breno.sumAge();
    print(newAge);
}

class User extends People{
    String? email; 
    int age;
    User(String name, double height, {this.email, required this.age}): super(name, height);

    int sumAge(){
        age += 1;
        return age;
    }
}

class People{
    String name;
    double height;
    People(this.name, this.height);
}
