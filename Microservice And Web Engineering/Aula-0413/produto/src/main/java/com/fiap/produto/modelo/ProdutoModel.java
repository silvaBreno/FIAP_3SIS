package com.fiap.produto.modelo;

import java.math.BigDecimal;

import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;

public class ProdutoModel {

	private Long id;

	@NotNull(message = "O campo nome é obrigatório")
	private String nome;

	@NotBlank(message = "É necessário informar a descrição")
	private String descricao;

	private BigDecimal valor;

	// AAAA0000A
	@Pattern(regexp = "[A-Z]{4}[0-9]{4}[A-Z]{1}", message = "Padrão Inválido")
	private String codigo;

	@Min(value = 1, message = "É necessário ter ao menos uma unidade")
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

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public String getCodigo() {
		return codigo;
	}

	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}

	public void setId(Long id) {
		this.id = id;
	}

}
