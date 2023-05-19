package com.fiap.aualseguranca.repository;

import org.springframework.data.mongodb.repository.MongoRepository;
import com.fiap.aualseguranca.model.Atividade;

public interface AtividadesRespository extends MongoRepository<Atividade, String> {

}
