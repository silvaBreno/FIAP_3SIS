package br.fiap.app.exemplo.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import br.fiap.app.exemplo.models.Produto;

@Repository
public interface ProdutoRepository extends JpaRepository<Produto, Long> {
	
	@Query(value="select id, id_categoria, nome, id_fornecedor from produto where id_categoria = ?;", nativeQuery = true)
	List<Produto> findByIdCategoria(Integer idCategoria);
}


