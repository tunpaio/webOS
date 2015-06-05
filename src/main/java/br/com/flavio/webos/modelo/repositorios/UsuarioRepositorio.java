package br.com.flavio.webos.modelo.repositorios;



import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import br.com.flavio.webos.modelo.entidades.Usuario;

@Repository
public interface UsuarioRepositorio extends CrudRepository<Usuario, Long> {

	public Usuario findOneByLogin(String login);

}
