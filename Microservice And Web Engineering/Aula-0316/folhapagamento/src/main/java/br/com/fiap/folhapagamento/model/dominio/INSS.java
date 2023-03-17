package br.com.fiap.folhapagamento.model.dominio;

public class INSS extends Imposto<INSS> {
	
	public INSS(){
		
	}
	
	public INSS(float faixaInical, float faixaFinal, float aliquota) {
		super.setFaixaInicial(faixaInical);
		super.setFaixaFinal(faixaFinal);
		super.setAliquota(aliquota);
	}
	
	
	@Override
	Imposto obterFaixa(float valor) {
		for (Imposto item: super.tabela) {
			
			
			if(item.valorPertenceAFaixa(valor)) {
				return item;
			}
		}
		return null;
	}

	@Override
	float calcularDesconto(float valor, Imposto faixaDesconto) {
		return valor*faixaDesconto.getAliquota();
	}
	

}
