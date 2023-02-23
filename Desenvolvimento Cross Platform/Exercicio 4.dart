class ContaBancaria{
    double saldo;
    int numero;

    ContaBancaria(this.saldo, this.numero);

    double depositar(double valor){
        saldo += valor;
        return saldo;
    }
}

void main(){
    ContaBancaria  conta1 =  ContaBancaria(1000, 1234);
    double resultado = conta1.depositar(500);
    print(resultado);
}