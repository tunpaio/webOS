package br.com.flavio.webos.controladores;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import br.com.flavio.webos.excecoes.EnderecoInvalidoException;
import br.com.flavio.webos.modelo.entidades.Cliente;
import br.com.flavio.webos.modelo.entidades.Endereco;
import br.com.flavio.webos.modelo.repositorios.ClienteRepositorio;
import br.com.flavio.webos.modelo.repositorios.EnderecoRepositorio;
import br.com.flavio.webos.propertyeditors.EnderecoPropertyEditor;

@Controller
@RequestMapping("/clientes")
public class ClienteController {
	
	@Autowired private EnderecoPropertyEditor enderecoPropertyEditor;
	
	@Autowired private ClienteRepositorio clienteRepositorio;
	@Autowired private EnderecoRepositorio enderecoRepositorio;
	
	@RequestMapping(method=RequestMethod.GET)
	public String listarClientes(Model model){
		
		model.addAttribute("clientes", clienteRepositorio.findAll());
		model.addAttribute("enderecos", enderecoRepositorio.findAll());
		return "cliente/listagem";
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public String salvarCliente(
			Model model,
			@Valid @ModelAttribute Cliente cliente,
			BindingResult bindingResult){
		
		if (bindingResult.hasErrors() ){
			throw new EnderecoInvalidoException();
		} else {
			clienteRepositorio.save(cliente);
		}
		
		model.addAttribute("clientes", clienteRepositorio.findAll());
		return "cliente/tabela-clientes";
		
	}
	
	@RequestMapping(method=RequestMethod.DELETE, value="/{clienteId}")
	public ResponseEntity<String> deletarCliente(@PathVariable Long clienteId){
		try {
			clienteRepositorio.delete(clienteId);
			return new ResponseEntity<String>(HttpStatus.OK);
		} catch (Exception ex) {
			return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
	}
	
	@RequestMapping(method=RequestMethod.GET, value="/{clienteId}")
	public ResponseEntity<Cliente> buscarCliente(@PathVariable Long clienteId){
		Cliente cliente = clienteRepositorio.findOne(clienteId);
		return new ResponseEntity<>(cliente, HttpStatus.OK);
	}
	
	@RequestMapping("/quantos")
	@ResponseBody
	public String quantosClientes(){
			return "Atualmente ha "+clienteRepositorio.count()+" cadastrados";
	}
	@InitBinder
	public void initBinder(WebDataBinder webDataBinder){
		
		webDataBinder.registerCustomEditor(Endereco.class, enderecoPropertyEditor);
		
	}
}
