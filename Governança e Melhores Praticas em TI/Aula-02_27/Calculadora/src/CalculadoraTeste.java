import static org.junit.Assert.*;

import org.junit.Test;

public class CalculadoraTeste {

	@Test
	//simula��o da soma de 1 com 1, retornando 2
	public void testeSoma1Com1() {
		//variaveis de calculo
		int varInputA = 1;
		int varInputB = 1;
		int varOutputEsperado = 2;
		
		//chamada da fun��o de soma
		Calculadora calc = new Calculadora();
		int varOutputReal = calc.somar(varInputA, varInputB);
		
		//validar o resultado do teste
		assertEquals(varOutputEsperado, varOutputReal);
	}
	
	@Test
	//simula��o da multiplica��o de 2 com 2, retornando 4
	public void testeMultiplica2Com2() {
		Calculadora c = new Calculadora();
		assertEquals(c.multiplicar(2, 2), 4);
	}
	
	@Test
	//simula��o da subtra��o de 58 em 8, dando 50
	public void testeSubtrai8De58() {
		Calculadora c = new Calculadora();
		assertEquals(c.subtrair(8, 58), 50);
	}
	
	@Test
	//simula��o da divis�o de 50 por 5, dando 10
	public void testeDivide50Por5() {
		Calculadora c = new Calculadora();
		assertEquals(c.dividir(50, 5), 10);
	}
	
	@Test(expected = ArithmeticException.class)
	//simula��o da divis�o de 50 por 0, falhando
	public void testeDivide50Por0() {
		Calculadora c = new Calculadora();
		assertEquals(c.dividir(50, 0), 50);
	}

}
