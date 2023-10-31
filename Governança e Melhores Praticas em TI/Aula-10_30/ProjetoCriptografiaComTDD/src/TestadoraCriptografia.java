import static org.junit.Assert.*;

import org.junit.Test;

public class TestadoraCriptografia {
	
	
	@Test
	public void testeConversaoA() {
		Criptografadora cripta = new Criptografadora();
		
		int valorRetorno = cripta.criptografar('A');

		assertEquals(valorRetorno, 19);		
	}
	
	@Test
	public void testeConversaoB() {
		Criptografadora cripta = new Criptografadora();
		
		int valorRetorno = cripta.criptografar('B');

		assertEquals(valorRetorno, 11);		
	}
	
	@Test
	public void testeConversaoC() {
		Criptografadora cripta = new Criptografadora();
		
		int valorRetorno = cripta.criptografar('C');

		assertEquals(valorRetorno, 71);		
	}
	
	//Teste de conversão de valor não previsto em 0
	@Test
	public void testeConversaoOutro() {
		Criptografadora cripta = new Criptografadora();
		
		int valorRetorno = cripta.criptografar('X');

		assertEquals(valorRetorno, 0);		
	}
	
	
}
