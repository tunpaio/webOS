package br.com.flavio.webos.propertyeditors;

import java.beans.PropertyEditorSupport;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import br.com.flavio.webos.modelo.entidades.Endereco;
import br.com.flavio.webos.modelo.repositorios.EnderecoRepositorio;

@Component
public class EnderecoPropertyEditor extends PropertyEditorSupport {

	@Autowired private EnderecoRepositorio enderecoRepositorio;
	
	@Override
	public void setAsText(String text) throws IllegalArgumentException {
		long idEndereco = Long.parseLong(text);
		Endereco endereco = enderecoRepositorio.findOne(idEndereco);
		setValue(endereco);
	}
	
}
