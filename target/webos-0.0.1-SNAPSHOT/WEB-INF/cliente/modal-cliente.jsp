<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div class="modal fade" id="modal-cliente" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
		<form id="form-cliente" method="post">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">Informações do Cliente</h4>
			</div>
			<div class="modal-body">
				<label for="nome">Nome</label>
				<input id="nome" name="nome" class="form-control">
				
				<label for="detalhe">Detalhe</label>
				<input id="detalhe" name="detalhe" class="form-control"> 
				
				<label for="data">Data</label>
				<input id="data" name="data" class="form-control"> 

				<label for="enderecos">Endereços</label>
				<select id="enderecos" name="enderecos" class="form-control" multiple="multiple">
					<c:forEach items="${enderecos}" var="endereco">
						<option value="${endereco.id}">${endereco.logradouro}</option>
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