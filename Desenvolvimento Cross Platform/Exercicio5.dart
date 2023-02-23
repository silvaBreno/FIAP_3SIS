class Personagem{
    String nome;
    int vida;
    int forca;

    Personagem(this.nome, this.vida, this.forca);

    double atacar(Personagem alvo){
        Random r = Random();
        double resultadoAtaque = forca * r.nextDouble() + 0,5;
        return (alvo.vida - resultadoAtaque);
    }

    bool verificaVida(){
        if(vida > 0){
             return true;
        } else
            return false;
    }
}

class Heroi extends Personagem{
    Heroi(String nome, int vida, int forca): super(nome, vida);
   
    int curar(int pontos){
        return  (this.vida + pontos);
    }
}

class Vilao extends Personagem{

    Vilao(String nome, int vida, int forca): super(nome, vida);
    roubarVida(Personagem alvo){
        int vidaVilao = (alvo.vida/2);
        return vida += vidaVilao;
    }
}

void main(){
    
}