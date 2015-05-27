package br.com.flavio.webos.modelo.repositorios;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import br.com.flavio.webos.modelo.entidades.Cliente;

@Repository
public interface ClienteRepositorio extends CrudRepository<Cliente, Long> {

}
