package com.fiap.aulaseguranca.controller;


import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping("/permissao")
public class PermissaoController {
	
	
	
	//@Autowired
	//private Outra teste; 
	
	@GetMapping("/liberado")
	@PreAuthorize("hasAnyRole('ADMIN','USER')") //verifica se o usario tem a role indicada dentro do parenteses
	public ResponseEntity<String> get() {
	//	float num = 1 / 0;
		return new ResponseEntity<>("endpoint liberado para geral", HttpStatus.OK); 
	}
	
	@GetMapping("/restrito")
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<String> getAllUser() {
		
		return new ResponseEntity<>("endpoint liberado para geral", HttpStatus.OK); 
	}
	
	//@GetMapping
	//public ResponseEntity<Page<Atividade>> get(Pageable page){
	//	Page<Atividade> result = teste.findAll(page);
	//	return new ResponseEntity<Page<Atividade>>(result, HttpStatus.OK);
	//}
}
