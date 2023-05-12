package br.com.fiap.petshop.entity.entities;

import java.util.Date;
import java.util.List;

public class MedicoVeterinario {
	private Long idMedico;
	private String nomeMedico;
	private String crv;
	private List<Especialidade> especialidades;
	private Date dataDisponibilidade;
	private Date horarioDisponibilidade;
}
