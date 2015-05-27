package br.com.flavio.webos.controladores;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import br.com.flavio.webos.excecoes.EnderecoInvalidoException;
import br.com.flavio.webos.modelo.entidades.Endereco;
import br.com.flavio.webos.modelo.enumeracoes.CategoriaDeEndereco;
import br.com.flavio.webos.modelo.repositorios.EnderecoRepositorio;



@Controller
@RequestMapping("/enderecos")
public class EnderecoController {
	
	@Autowired private EnderecoRepositorio enderecoRepositorio;

	@RequestMapping(method=RequestMethod.GET)
	public String listarEnderecos(Model model){
		Iterable<Endereco> enderecos = enderecoRepositorio.findAll();
		
		model.addAttribute("titulo", "Listagem de Endereços");
		model.addAttribute("enderecos", enderecos);
		model.addAttribute("categorias", CategoriaDeEndereco.values());
		return "endereco/listagem";
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public String salvarEndereco(
			@Valid @ModelAttribute Endereco endereco,
			BindingResult bindingResult,
			Model model){
		
				if (bindingResult.hasErrors() ){
					throw new EnderecoInvalidoException();
				} else {
					enderecoRepositorio.save(endereco);
				}
				
		model.addAttribute("enderecos", enderecoRepositorio.findAll());
		model.addAttribute("categorias", CategoriaDeEndereco.values());
		return "endereco/tabela-enderecos";
		}
	@RequestMapping(method=RequestMethod.DELETE, value="/{id}")
	public ResponseEntity<String> deletarEndereco(@PathVariable Long id){
		try {
			enderecoRepositorio.delete(id);
			return new ResponseEntity<String>(HttpStatus.OK);
			
		}catch(Exception ex){
			return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		
	}


@RequestMapping(method=RequestMethod.GET, value="/{id}")
@ResponseBody
public Endereco buscarEndereco(@PathVariable Long id){
	Endereco endereco = enderecoRepositorio.findOne(id);
	return endereco;
}

}