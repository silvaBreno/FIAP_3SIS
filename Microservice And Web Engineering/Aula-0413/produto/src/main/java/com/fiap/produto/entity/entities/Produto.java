package com.fiap.produto.entity.entities;

import java.math.BigDecimal;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.SequenceGenerator;

@Entity
public class Produto {
	//precisamos dizer que o id é uma primary key / campo identificador --> @Id
	//preciso dizer tb como eu quero gerar esse valor --> @GeneratedValue
	// preciso de um campo que faz o autoincremento e por isso usamos o GenerationType.AUTO
	@Id	
	//@GeneratedValue(strategy = GenerationType.AUTO)
	//para utilizarmos uma sequencia utilizamos outra estrutura de Generation
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "produtoSequence")
	//precisamos utilizar o mesmo name que usamos no generator e o sequenceName é o nome da sequencia no banco
	@SequenceGenerator(name = "produtoSequence", sequenceName = "produtoSequence")
	private Long id;
	
	
	private String nome;
	
	//imagina que eu quero que o campo descrição possa ser nulo e ele vai virar uma coluna la no banco
	@Column(nullable = true)
	private String descricao;
	
	@Column(precision = 2)
	private BigDecimal valor;
	
	@Column(length = 9, unique = true)
	private String codigo;
	private Integer quantidade;
	private Integer status;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	public BigDecimal getValor() {
		return valor;
	}
	public void setValor(BigDecimal valor) {
		this.valor = valor;
	}
	public String getCodigo() {
		return codigo;
	}
	public void setCodigo(String codigo) {
		this.codigo = codigo;
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
