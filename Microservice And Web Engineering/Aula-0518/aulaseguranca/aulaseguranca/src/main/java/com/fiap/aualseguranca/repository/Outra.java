package com.fiap.aualseguranca.repository;

import org.springframework.data.mongodb.repository.MongoRepository;

import com.fiap.aualseguranca.model.Atividade;

public interface Outra extends MongoRepository<Atividade, String> {

}
