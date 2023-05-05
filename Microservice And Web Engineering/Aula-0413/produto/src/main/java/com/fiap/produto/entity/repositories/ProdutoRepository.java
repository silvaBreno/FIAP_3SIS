package com.fiap.produto.entity.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.fiap.produto.entity.entities.Produto;

//preciso falar para o JPA que essa classe é um repository, ou seja que ela precisa fazer conexao com o banco
//essa classe é um repository para Produto por isso passamos como parametro e precisamos passar o tipo 

@Repository
public interface ProdutoRepository extends JpaRepository<Produto, Long>{
	
}
