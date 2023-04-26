package br.fiap.app.exemplo.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import br.fiap.app.exemplo.models.Fornecedor;

@Repository
public interface FornecedoRepository extends JpaRepository<Fornecedor, Long> {
	


}
