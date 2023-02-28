import static org.junit.Assert.assertEquals;
import org.junit.Test;
import org.junit.FixMethodOrder;
import org.junit.runners.MethodSorters;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)

public class MensagemBoasVinhasTeste {

	@Test
	//Simular a mensagem inicial exibida
	public void ExibeMensagem(){
		MensagemBoasVindas aux = new MensagemBoasVindas("Breno Silva");
		assertEquals("Seja bem vindo à calculadora digital", aux.exibirMensagemInicial());
	}
	
	
	@Test
	//Simular a mensagem complementar do Nome do Usuário
	public void ExibeMensagemUsuario(){
		MensagemBoasVindas aux = new MensagemBoasVindas("Breno Silva");
		assertEquals("Breno Silva! Confira os resultados dos testes no painel da JUNIT!", aux.exibirNomeMsg());
	}
}
