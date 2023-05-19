package com.fiap.aulaseguranca;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class AulasegurancaApplication {
	
	@GetMapping("/")
	public String welcome() {
		return "Exemplo de segurança"; 
	}

	public static void main(String[] args) {
		SpringApplication.run(AulasegurancaApplication.class, args);
	}

}
