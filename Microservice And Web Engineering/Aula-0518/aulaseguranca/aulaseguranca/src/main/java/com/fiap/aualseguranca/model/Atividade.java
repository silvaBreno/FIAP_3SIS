package com.fiap.aualseguranca.model;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import lombok.Data;

@Data
@Document
public class Atividade {

	@Id
	private String id;
	private Integer rm; 
	private String nome;
	private String urlGitHub;
	private int numeroAtividade;
}