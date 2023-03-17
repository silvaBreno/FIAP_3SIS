package br.com.fiap.folhapagamento.model.dominio;

import java.util.List;

public abstract class Imposto<Impostos> {
	
	private float faixaInicial;
	private float faixaFinal;
	private float aliquota;
	protected List<Impostos> faixas;
	
	public List<Impostos> getFaixas() {
		return faixas;
	}
	public void setFaixas(List<Impostos> faixas) {
		this.faixas = faixas;
	}
	public float getFaixaInicial() {
		return faixaInicial;
	}
	public void setFaixaInicial(float faixaInicial) {
		this.faixaInicial = faixaInicial;
	}
	public float getFaixaFinal() {
		return faixaFinal;
	}
	public void setFaixaFinal(float faixaFinal) {
		this.faixaFinal = faixaFinal;
	}
	public float getAliquota() {
		return aliquota;
	}
	public void setAliquota(float aliquota) {
		this.aliquota = aliquota;
	}
	
	abstract Imposto<Impostos> obterFaixa(float valor);
	abstract float calcularDesconto(float valor);
	
	abstract void popularTabela();
	
	protected boolean valorPertenceAFaixa(float valor) {
		return valor >= faixaInicial && valor <= faixaFinal;
	}
}
