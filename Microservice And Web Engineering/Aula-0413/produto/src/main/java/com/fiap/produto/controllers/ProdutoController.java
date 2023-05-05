package com.fiap.produto.controllers;

import java.math.BigDecimal;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.servlet.ModelAndView;

import com.fiap.produto.entity.entities.Produto;
import com.fiap.produto.entity.repositories.ProdutoRepository;
import com.fiap.produto.modelo.ProdutoModel;

import jakarta.validation.Valid;

//para falar para o spring que essa classe é um controller utilizamos anotações
@Controller
public class ProdutoController {
	
	//dps de ter criado a interface que sabe acessar o banco de dados eu preciso trazer ela para o meu controller
	//a injeção de dependencia vai simular a inserção de algo no banco e utilizamos isso para facilitar a parte de teste
	//precisamos fazer um depara que precisamos de um classe com o mesmo nome e não uma classe que fizemos inicialmente com o nome ProdutoModel
	@Autowired
	private ProdutoRepository produtoRepository;
	
	@GetMapping("/create")
	public ModelAndView index() {
		ModelAndView modelView = new ModelAndView("produtos/create");
		
		ProdutoModel monitor = new ProdutoModel("Monitor", new BigDecimal(300), 100, 1);
		
		List<ProdutoModel> produtos = Arrays.asList(monitor);
		modelView.addObject("produtos", produtos);
		
		return modelView;
	}
	
	@PostMapping("/create")
	public ResponseEntity<ProdutoModel> create(@Valid @RequestBody ProdutoModel model)	{
		
		Produto p = new Produto();
		p.setNome(model.getNome());
		p.setDescricao(model.getDescricao());
		p.setQuantidade(model.getQuantidade());
		p.setStatus(model.getStatus());
		p.setValor(model.getValor());
		p.setCodigo(model.getCodigo());
		
		produtoRepository.save(p);
		
		model.setId(p.getId());
		
		return new ResponseEntity<>(model, HttpStatus.CREATED);
	}
}
