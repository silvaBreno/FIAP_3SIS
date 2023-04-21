package com.fiap.produto.controllers;

import java.math.BigDecimal;
import java.util.Arrays;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fiap.produto.modelo.ProdutoModel;

@Controller
public class ProdutoController {
	
	@RequestMapping("/produtos")
	public ModelAndView index() {
		ModelAndView modelView = new ModelAndView("produtos/index");
		
		ProdutoModel monitor = new ProdutoModel("Monitor", new BigDecimal(300), 100, 1 );
		
		List<ProdutoModel> produtos = Arrays.asList(monitor);
		modelView.addObject("produtos", produtos);
			
		return modelView;		
	}
	
	@PostMapping("/create")
	public ResponseEntity<ProdutoModel> create(@RequestBody ProdutoModel model){
		return new ResponseEntity(model, HttpStatus.CREATED);
	}
}
