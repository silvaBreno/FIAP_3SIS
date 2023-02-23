class Retangulo {
    int largura;
    int altura;

    Retangulo(this.largura, this.altura);

    int calcularArea(largura, altura){
        int area;
        area = (largura*altura);
        return area;
    }
}

void main(){
    Retangulo retangulo1 =  Retangulo(5, 10);
    int resultado = retangulo1.calcularArea(5, 10);
    print(resultado);
}