
public class MensagemBoasVindas {
	//atributo com o nome do usuario
	private String nome;
	//construtor de objeto na classe
	public MensagemBoasVindas(String nome) {
		super();
		this.nome = nome;
	}
	//exibição da parte fixa da mensagem
	public String exibirMensagemInicial(){
		String msg = "Seja bem vindo à calculadora digital";
		System.out.println(msg);
		return msg;
	}
	//exibição da mensagem
	public String exibirNomeMsg(){
		String aux = nome + "! Confira os resultados dos testes no painel da JUNIT!";	
		System.out.println(aux);
		return aux;
	}
	
}
