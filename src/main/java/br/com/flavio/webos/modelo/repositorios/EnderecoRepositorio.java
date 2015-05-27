package br.com.flavio.webos.modelo.repositorios;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import br.com.flavio.webos.modelo.entidades.Endereco;

@Repository
public interface EnderecoRepositorio extends CrudRepository<Endereco, Long> {

}
