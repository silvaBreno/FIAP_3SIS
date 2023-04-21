package com.fiap.produto.controllers;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;

@ControllerAdvice
public class ValidationHandler extends ResponseEntityExceptionHandler{	
	
	//se chegar uma requisicao essa classe tem q validar
	//caso tenha problema ela precisa devolver um erro 500
	//para interceptar usamos a anotação ControllerAdvice
	
	@Override
	protected ResponseEntity<Object> handleMethodArgumentNotValid(MethodArgumentNotValidException ex,
			HttpHeaders headers, HttpStatusCode status, WebRequest request) {

		Map<String, String> erros = new HashMap<>();
		
		ex.getBindingResult().getAllErrors().forEach((erro)-> {
			String nomeCampo = ((FieldError)erro).getField();
			String mensagem = erro.getDefaultMessage();
			
			erros.put(nomeCampo, mensagem);
			
		});
		
		return new ResponseEntity<Object>(erros, HttpStatus.BAD_REQUEST); 
		//bad request -> retorna um erro do tipo 400 que é quando é um erro de usuario, 
		//ou seja, o usuario provavelmente enviou alguma informação errada
	}
	
	

}
