package com.fiap.produto.modelo;

import java.math.BigDecimal;

public class ProdutoModel {
	private long id;
	private String nome;
	private BigDecimal valor;
	private Integer quantidade;
	private Integer status;
		
	public ProdutoModel(String nome, BigDecimal valor, Integer quantidade, Integer status) {
		super();
		this.nome = nome;
		this.valor = valor;
		this.quantidade = quantidade;
		this.status = status;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public BigDecimal getValor() {
		return valor;
	}
	public void setValor(BigDecimal valor) {
		this.valor = valor;
	}
	public Integer getQuantidade() {
		return quantidade;
	}
	public void setQuantidade(Integer quantidade) {
		this.quantidade = quantidade;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	
	
	
}
