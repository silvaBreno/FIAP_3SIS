package com.fiap.aulaseguranca.config;

import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;

@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {

		 http
		    .cors() //liberar acesso do CORS
		 	.and()
		 	.csrf().disable() // utilizado para não permitir que alguem execute um script na nossa API
		 	.authorizeRequests() // precisamos que a pessoa tenha uma role que eu estou solicitando
			.anyRequest() // aqui estamos liberando post,e etc..
			.authenticated() // liberamos aqui o http basico, poderiamos colocar algum protocolo caso necessario
			.and()
			.httpBasic();
	}
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		PasswordEncoder password = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		
		//aqui ele configura como a autenticação vai funcionar e dps configura os usuários
		auth.inMemoryAuthentication()
		.withUser("thiago.xavier")
		.password(password.encode("fiapsecurity"))
		.roles("USER", "ADMIN")
		.and()
		.withUser("joao")
		.password(password.encode("fiapsecurity"))
		.roles("USER")
		.and()
		.withUser("thiago")
		.password(password.encode("1234"))
		.roles("USER", "ADMIN");
		
	}
}
