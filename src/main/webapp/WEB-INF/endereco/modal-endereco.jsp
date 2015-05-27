<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div class="modal fade" id="modal-endereco" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
		<form id="form-endereco" method="post">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">Informações do endereço</h4>
			</div>
			<div class="modal-body">
				<label for="logradouro">Logradouro</label>
				<input id="logradouro" name="logradouro" class="form-control">
				
				<label for="cep">Cep</label>
				<input id="cep" name="cep" class="form-control"> 
				
				<label for="numero">Numero</label>
				<input id="numero" name="numero" class="form-control"> 

				<label for="bairro">Bairro</label>
				<input id="bairro" name="bairro" class="form-control">
				
				<label for="cidade">Cidade</label>
				<input id="cidade" name="cidade" class="form-control"> 
				
				<label for="categoria">Categoria</label>
				<select id="categoria" name="categoria" class="form-control">
					<c:forEach items="${categorias}" var="categoria">
						<option value="${categoria}">${categoria}</option>
					</c:forEach>
				</select>
				
				<input id="id" name="id" type="hidden">
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
				<button id="btn-salvar" type="button" class="btn btn-primary">Salvar</button>
			</div>
		</form>
		</div>
	</div>
</div>