package br.com.fiap.folhapagamento.model.dominio;

public class IRRF extends Imposto<IRRF> {
	
	
	float parcelaDeducao() {
		
		return 0;
	}
	
	@Override
	Imposto obterFaixa(float valor) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	float calcularDesconto(float valor) {
		// TODO Auto-generated method stub
		return 0;
	}

}
