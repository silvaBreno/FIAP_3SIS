//Classe que faz c�lculos aritm�ticos simples sobre n�meros inteiros
public class Calculadora {

	//atributo de resultado de c�lculos
	private int valorResultado = 0;
	
	//m�todo que realiza a soma de dois n�meros
	public int somar(int variavel1, int variavel2) {
		valorResultado = variavel1 + variavel2;
		return valorResultado;
	}
	
	//m�todo que realiza a subtra��o de dois n�meros
	public int subtrair(int variavel1, int variavel2) {
		valorResultado = variavel2 - variavel1;
		return valorResultado;
	}

	//m�todo que realiza a multiplica��o de dois n�meros
	public int dividir(int variavel1, int variavel2) {
		valorResultado = variavel1 / variavel2; 
		return valorResultado;
	}
	
	//m�todo que realiza a divis�o de dois n�meros
	public int multiplicar(int variavel1, int variavel2) {
		valorResultado = variavel1 * variavel2;
		return valorResultado;
	}
	
}
