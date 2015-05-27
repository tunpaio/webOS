package br.com.flavio.webos.excecoes;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(value=HttpStatus.BAD_REQUEST)
public class EnderecoInvalidoException extends RuntimeException{

	private static final long serialVersionUID = -5653760658663558081L;

}
